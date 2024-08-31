package controller;

import dao.accountDAO;
import dao.beneficiariesDAO;
import dao.transactionsDAO;
import dao.userDAO;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Objects;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import model.account;
import model.beneficiaries;
import model.transactions;
import model.user;
import until.Email;
import until.MaHoa;
import until.SoNgauNhien;
import until.passwordGenerate;

@WebServlet("/khach-hang")
public class homeController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String hanhDong = request.getParameter("hanhDong") + "";
    if (hanhDong.equals("dang-ky")) {
      dangKy(request, response);
    } else if (hanhDong.equals("dang-nhap")) {
      dangNhap(request, response);
    } else if (hanhDong.equals("xac-thuc")) {
      xacThuc(request, response);
    } else if (hanhDong.equals("quen-mat-khau")) {
      quenMatKhau(request, response);
    } else if (hanhDong.equals("dang-xuat")) {
      dangXuat(request, response);
    } else if (hanhDong.equals("doi-mat-khau")) {
      guiMaDoiMatKhau(request, response);
    } else if(hanhDong.equals("xac-nhan-doi-mat-khau")){
      doiMatKhau(request, response);
    } else if (hanhDong.equals("doi-thong-tin-ca-nhan")) {
      doiThongTinCaNhan(request, response);
    } else if (hanhDong.equals("giao-dich")) {
      giaoDich(request, response);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

  private void  dangNhap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      String soDienThoai = request.getParameter("phone_number");
      String matKhau = request.getParameter("password");
      matKhau = MaHoa.toSHA1(matKhau);

      user u = new user();
      u.setPhone_number(soDienThoai);
      u.setPassword(matKhau);

      userDAO uDAO = new userDAO();
      accountDAO accountDAO = new accountDAO();
      beneficiariesDAO beneficiariesDAO = new beneficiariesDAO();
      transactionsDAO tDAO = new transactionsDAO();
      user us = uDAO.selectByPhonenumberAndPassword(u);
      String url = "";
      if (us != null && us.getType_user().equals("user")) {
        account ac = accountDAO.getAccountByUserId(String.valueOf(us.getUser_id()));
        beneficiaries be = beneficiariesDAO.getAccountByUserId(String.valueOf(us.getUser_id()));
        ArrayList<transactions> tr = tDAO.getAccountByUserId(String.valueOf((ac.getAccount_id())));
        HttpSession session = request.getSession();
        session.setAttribute("us", us);
        session.setAttribute("ac", ac);
        session.setAttribute("be", be);
        session.setAttribute("tr", tr);
        url = "/userPage/homePageUser.jsp";
      } else  if (us != null && us.getType_user().equals("admin")) {
          HttpSession session = request.getSession();
          session.setAttribute("us", us);
          url = "/adminPage/homePageAdmin.jsp";
      }else {
        request.setAttribute("baoLoi",
            "Tên đăng nhập hoặc mật khẩu không đúng hoặc Tài khoản chưa xác thực!");
        url = "/loginAndsignup/signIn.jsp";
      }
      RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
      rd.forward(request, response);
    } catch (ServletException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void dangKy(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      String tenDangNhap = request.getParameter("username");
      String matKhau = request.getParameter("password");
      String email = request.getParameter("email");
      String phone_number = request.getParameter("phone_number");
      String comfirm_password = request.getParameter("comfirm_password");
      boolean agree_term = Boolean.parseBoolean(request.getParameter("agree_term"));

      request.setAttribute("username", tenDangNhap);
      request.setAttribute("email", email);
      request.setAttribute("phone_number", phone_number);
      request.setAttribute("password", matKhau);
      request.setAttribute("comfirm_password", comfirm_password);
      request.setAttribute("agree_term", agree_term);

      String url = "";
      String baoLoi = "";
      userDAO uDAO = new userDAO();
      if(uDAO.kiemTraSoDienThoai(phone_number)) {
        baoLoi += "So dien thoai da ton tai, vui long chon so dien thoai khac<br/>";
      }

      if (!matKhau.equals(comfirm_password)) {
        baoLoi += "Mật khẩu xác nhận không khớp.<br/>";
      } else  {
        matKhau = MaHoa.toSHA1(matKhau);
        comfirm_password = MaHoa.toSHA1(comfirm_password);
      }
      request.setAttribute("baoLoi", baoLoi);

      if (baoLoi.length() > 0) {
        url = "/loginAndsignup/signUp.jsp";
      } else {
        Random rd = new Random();
        int user_id = 100000000 + rd.nextInt(900000000);
        String created_at = LocalDateTime.now().toString();
        String type_user = "user";
        user u = new user(user_id, tenDangNhap, matKhau, email, phone_number, created_at, type_user , comfirm_password, agree_term);
        if (uDAO.insert(u) > 0) {
          String soNgauNhien = SoNgauNhien.getSoNgauNhien();

          Date todayDate = new Date(new java.util.Date().getTime());
          Calendar c = Calendar.getInstance();
          c.setTime(todayDate);
          c.add(Calendar.MINUTE,5);
          Date thoiGianHieuLucXacThuc = new Date(c.getTimeInMillis());

          boolean trangThaiXacThuc = false;

          u.setVerification_code(soNgauNhien);
          u.setCode_validity_period(thoiGianHieuLucXacThuc.toString());
          u.setAuthentication_status(trangThaiXacThuc);

          if (uDAO.updateverifyInformation(u) > 0) {
            Email.sendEmail(u.getEmail(), "Xac thuc tai khoan JSP-Banking", getNoiDungEmailXacThuc(u));
          }
        }
        url = "/loginAndsignup/notification.jsp";
      }
      RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
      rd.forward(request, response);

    } catch (ServletException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void dangXuat(HttpServletRequest request, HttpServletResponse response) {
    try {
      HttpSession session = request.getSession();
      // Huy bo session
      session.invalidate();

      String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
          + request.getContextPath();

      response.sendRedirect(url + "/index.jsp");
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void xacThuc(HttpServletRequest request, HttpServletResponse response) {
    try {
      int user_id = Integer.parseInt(request.getParameter("user_id"));
      String verification_code = request.getParameter("verification_code");

      userDAO uDAO = new userDAO();

      user u = new user();
      u.setUser_id(user_id);
      user us = uDAO.selectById(u);
      account ac = new account();
      accountDAO aDAO = new accountDAO();
      beneficiaries be = new beneficiaries();
      beneficiariesDAO beDAO = new beneficiariesDAO();
      String msg = "";
      if (us != null) {
        if (us.getVerification_code().equals(verification_code)) {
          us.setAuthentication_status(true);
          uDAO.updateverifyInformation(us);
          Random rd = new Random();
          int account_id = 100000000 + rd.nextInt(900000000);
          long account_number = 1000000000000000L + (long)(rd.nextDouble() * 9000000000000000L);
          ac.setUser_id_account(user_id);
          ac.setAccount_id(account_id);
          ac.setAccount_number(String.valueOf(account_number));
          ac.setAccount_type("Thanh toán");
          ac.setBalance("0");
          ac.setCreated_at(LocalDateTime.now().toString());
          ac.setState(true);
          be.setBeneficiary_id(account_id);
          be.setUser_id_beneficiari(user_id);
          be.setName(us.getUsername());
          be.setAccount_number(String.valueOf(account_number));
          be.setBank_name("JSP-Banking");
          aDAO.insert(ac);
          beDAO.insert(be);
          msg = "Xac thuc thanh cong!";
        } else {
          msg = "Ma xac thuc khong dung!";
        }
      } else {
        msg = "Tai khoan khong ton tai!";
      }
      String url = "/userPage/congratulation.jsp";
      request.setAttribute("baoLoi", msg);
      RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
      rd.forward(request, response);
    } catch (ServletException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void quenMatKhau(HttpServletRequest request, HttpServletResponse response) {
    try {
      String phone_number = request.getParameter("phone_number");
      request.setAttribute("phone_number", phone_number);
      String url = "";
      String baoLoi = "";
      userDAO uDAO = new userDAO();
      user u = new user();
      if (!uDAO.kiemTraSoDienThoai(phone_number)) {
        baoLoi = "So dien thoai khong ton tai";
      }
      request.setAttribute("baoLoi", baoLoi);
      if (baoLoi.length() > 0) {
        url = "/loginAndsignup/forgetPassword.jsp";
      } else {
        u.setPhone_number(phone_number);
        user us  = uDAO.selectByPhoneNumber(u);
        Email.sendEmail(us.getEmail(), "Cap lai mat khau", getNoiDungCapLaiMatKhau(us));

        url = "/loginAndsignup/notifyPassword.jsp";
      }
      RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
      rd.forward(request, response);
    } catch (ServletException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }

  }

  private void guiMaDoiMatKhau(HttpServletRequest request, HttpServletResponse response) {
    try {
      String old_password = request.getParameter("current-password");
      String new_password = request.getParameter("new-password");
      String confirm_password = request.getParameter("confirm-password");

      old_password = MaHoa.toSHA1(old_password);

      String baoLoi = "";

      HttpSession session = request.getSession();
      Object obj = session.getAttribute("us");
      user us = null;
      if (obj != null) {
        us = (user) obj;
      }

      if (us == null) {
        baoLoi = "Vui lòng đăng nhập.";
      } else {
        if (!old_password.equals(us.getPassword())) {
          baoLoi = "Mật khẩu hiện tại không đúng.";
        } else if (!new_password.equals(confirm_password)) {
          baoLoi = "Xác nhận mật khẩu không đúng.";
        }

        if (baoLoi.isEmpty()) {
          String soNgauNhien = SoNgauNhien.getSoNgauNhien();
          Date todayDate = new Date(new java.util.Date().getTime());
          Calendar c = Calendar.getInstance();
          c.setTime(todayDate);
          c.add(Calendar.MINUTE,5);
          Date thoiGianHieuLucXacThuc = new Date(c.getTimeInMillis());

          session.setAttribute("us", us);
          user u = new user(us.getUser_id());
          userDAO uDAO = new userDAO();
          u.setVerification_code(soNgauNhien);
          u.setCode_validity_period(thoiGianHieuLucXacThuc.toString());
          if (uDAO.updateverifyInformation2(u) > 0) {
            Email.sendEmail(us.getEmail(), "Mã Xác Thực", getMaDoiMatKhau(us));
          }
          baoLoi = "Mã xác thực đã được gửi qua email.";

          session.setAttribute("new-password", new_password);
          session.setAttribute("confirm-password", confirm_password);
        }
      }

      request.setAttribute("baoLoi", baoLoi);
      RequestDispatcher rd = getServletContext().getRequestDispatcher("/userPage/maXacThuc.jsp");
      rd.forward(request, response);
    } catch (IOException e) {
      e.printStackTrace();
    } catch (ServletException e) {
      e.printStackTrace();
    }
  }

  private void doiMatKhau(HttpServletRequest request, HttpServletResponse response) {
    try {
      String verification_code = request.getParameter("verification-code");

      String baoLoi = "";
      HttpSession session = request.getSession();
      user us = (user) session.getAttribute("us");

      if (us == null) {
        baoLoi = "Vui lòng đăng nhập.";
      } else if (verification_code == null || !verification_code.equals(us.getVerification_code())) {
        baoLoi = "Mã xác nhận không đúng.";
      }
      if (baoLoi.isEmpty()) {
        String newpassword = (String) session.getAttribute("new-password");
        String confirmpassword = (String) session.getAttribute("confirm-password");

        if (newpassword == null || confirmpassword == null || !newpassword.equals(confirmpassword)) {
          baoLoi = "Mật khẩu xác nhận không khớp.";
        } else {
          us.setPassword(MaHoa.toSHA1(newpassword));
          us.setComfirm_password(MaHoa.toSHA1(confirmpassword));
          userDAO uDAO = new userDAO();
          uDAO.updatePassword(us);
          baoLoi = "Đổi mật khẩu thành công";

          // Xóa dữ liệu nhạy cảm khỏi session
          session.removeAttribute("new-password");
          session.removeAttribute("confirm-password");
          session.removeAttribute("verification-code");

        }
      }
      request.setAttribute("baoLoi", baoLoi);
      RequestDispatcher rd = getServletContext().getRequestDispatcher("/userPage/privatePage.jsp");
      rd.forward(request, response);
      System.out.println(baoLoi);
    } catch (IOException | ServletException e) {
      e.printStackTrace();
    }
  }

  private void doiThongTinCaNhan(HttpServletRequest request, HttpServletResponse response) {
    try {
      String userName = request.getParameter("username");
      String email = request.getParameter("email");
      String phoneNumber = request.getParameter("phone_number");

      String baoLoi = "";
      HttpSession session = request.getSession();
      user us = (user) session.getAttribute("us");

      if (us == null) {
        baoLoi = "Vui lòng đăng nhập.";
      } else if (userName == null && email == null && phoneNumber == null) {
        baoLoi = "Vui lòng điền đầy đủ thông tin.";
      }

      if (baoLoi.isEmpty()) {
        userDAO uDAO = new userDAO();
        boolean success = true;

        if (userName != null && !userName.isEmpty()) {
          us.setUsername(userName);
          success &= uDAO.updateThongTinCaNhan1(us);
        }
        if (email != null && !email.isEmpty()) {
          us.setEmail(email);
          success &= uDAO.updateThongTinCaNhan2(us);
        }
        if (phoneNumber != null && !phoneNumber.isEmpty()) {
          us.setPhone_number(phoneNumber);
          success &= uDAO.updateThongTinCaNhan3(us);
        }

        if (success) {
          baoLoi = "Thay đổi thông tin thành công.";
        } else {
          baoLoi = "Có lỗi xảy ra khi thay đổi thông tin. Vui lòng thử lại.";
        }
      }

      request.setAttribute("baoLoi", baoLoi);
      RequestDispatcher rd = getServletContext().getRequestDispatcher("/userPage/privatePage.jsp");
      rd.forward(request, response);

    } catch (ServletException | IOException e) {
      e.printStackTrace();
      request.setAttribute("baoLoi", "Đã xảy ra lỗi không mong muốn. Vui lòng thử lại sau.");
      try {
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/userPage/privatePage.jsp");
        rd.forward(request, response);
      } catch (ServletException | IOException ex) {
        ex.printStackTrace();
      }
    }
  }

  private void giaoDich(HttpServletRequest request, HttpServletResponse response) {
    try {
      String account_number = request.getParameter("account_number");
      String account_name = request.getParameter("account_name");
      String account_amount = request.getParameter("account_amount");
      String description = request.getParameter("description");

      String baoLoi = "";
      if (account_number == null || account_number.isEmpty() ||
          account_name == null || account_name.isEmpty() ||
          account_amount == null || account_amount.isEmpty()) {
        baoLoi = "Vui lòng điền đầy đủ thông tin giao dịch";
      }

      HttpSession session = request.getSession();
      account ac = (account) session.getAttribute("ac");
      beneficiaries be = (beneficiaries) session.getAttribute("be");
      accountDAO aDAO = new accountDAO();
      transactionsDAO tDAO = new transactionsDAO();
      transactions tran, tran2;
      Random random = new Random();
      System.out.println(ac.getAccount_id());
      System.out.println(be.getBeneficiary_id());
      account objacc = aDAO.getAccountByAccountNumber(account_number);
      int transaction_id = 100000000 + random.nextInt(900000000);
      int transaction_id2 = 100000000 + random.nextInt(900000000);
      if (baoLoi.isEmpty()) {
          if (aDAO.checkBalance(ac.getAccount_id(), account_amount)) {
            aDAO.updateBalanceMinius(ac.getAccount_number(), account_amount);
            aDAO.updateBalancePlus(account_number, account_amount);
            tran = new transactions(transaction_id, ac.getAccount_id(), "Giao dịch", account_amount, String.valueOf(LocalDateTime.now()) ,be.getBeneficiary_id(), true, description, false);
            tran2 = new transactions(transaction_id2, objacc.getAccount_id(), "Giao dịch", account_amount, String.valueOf(LocalDateTime.now()) ,be.getBeneficiary_id(), true, description, true);
            tDAO.insert(tran);
            tDAO.insert(tran2);
            baoLoi = "Giao dịch thành công";
          } else {
            tran = new transactions(transaction_id, ac.getAccount_id(), "Giao dịch", account_amount, String.valueOf(LocalDateTime.now()) ,be.getBeneficiary_id(), false, description, false);
            tDAO.insert(tran);
            baoLoi = "Số dư không đủ";
          }
      }
      System.out.println(baoLoi);
      request.setAttribute("baoLoi", baoLoi);
      String destinationPage = "/userPage/thanhCong.jsp";
      if (!baoLoi.equals("Giao dịch thành công")) {
        destinationPage = "/userPage/thatBai.jsp";
      }
      RequestDispatcher rd = getServletContext().getRequestDispatcher(destinationPage);
      rd.forward(request, response);
    } catch (ServletException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public static String getNoiDungEmailXacThuc(user u) {
    String link = "http://localhost:8080/JSP_Banking_war/khach-hang?hanhDong=xac-thuc&user_id=" + u.getUser_id() + "&verification_code=" + u.getVerification_code();
    String noiDung = "Xin chao, <b>" + u.getUsername() + "</b> <br/>"
        + "Bạn đã đăng ký tài khoản JSP-Banking, vui lòng nhấp vào đây để xác thực tài khoản: <br/>"
        + "<p><a href=\"" + link + "\">Xác thực tài khoản</a></p>"
        + "<p>Day la email tu dong vui long khong phan hoi lai email nay</p>"
        + "<p> Xin tran trong cam on. </p>";
    return noiDung;
  }

  public static String getNoiDungCapLaiMatKhau(user u) {
    passwordGenerate pg = new passwordGenerate();
    String matKhauMoi = pg.generatePassword(8);
    u.setPassword(MaHoa.toSHA1(matKhauMoi));
    u.setComfirm_password(MaHoa.toSHA1(matKhauMoi));
    userDAO uDAO = new userDAO();
    uDAO.updatePassword(u);
    String noiDung = "Xin chao, <b>" + u.getUsername() + "</b> <br/>"
        + "Yeu cau cap lai mat khau cua ban da duoc chap thuan <br/>"
        + "Day la mat khau moi cua ban: " + matKhauMoi + "<br/>"
        + "Xin tran trong cam on";
    return noiDung;
  }

  public static String getMaDoiMatKhau(user u) {
    String noiDung = "Xin chao, <b>" + u.getUsername() + "</b> <br/>"
        + "Ma xac nhan cua ban la: " + u.getVerification_code() + "<br/>"
        + "Xin tran trong cam on";
    return noiDung;
  }
}