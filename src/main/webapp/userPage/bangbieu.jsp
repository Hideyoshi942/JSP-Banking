<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.Objects" %>
<%@ page import="model.loans" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/21/2024
  Time: 9:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Thông Tin Tài Khoản Ngân Hàng</title>
  <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userCss/bangbieu.css">
</head>
<body>
<%@include file="headerUserPage.jsp"%>

<div class="account-info-container">
  <h2>Thông Tin Tài Khoản Ngân Hàng</h2>
  <%
    if (a != null && a.getBalance() != null && !a.getBalance().trim().isEmpty()) {
      try {
        BigDecimal balance = new BigDecimal(a.getBalance().trim());

        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedBalance = currencyFormatter.format(balance);
        String statusClass = a.isState() ? "status-active" : "status-inactive";
  %>
  <table>
    <tr>
      <th>Số Tài Khoản</th>
      <td><%=a.getAccount_number()%></td>
    </tr>
    <tr>
      <th>Chủ Tài Khoản</th>
      <td><%=u.getUsername()%></td>
    </tr>
    <tr>
      <th>Số Dư</th>
      <td class="balance"><%=formattedBalance%></td>
    </tr>
    <tr>
      <th>Trạng Thái</th>
      <td class="<%=statusClass%>"><%=a.isState() ? "Hoạt Động" : "Đóng"%></td>
    </tr>
    <tr>
      <th>Loại Tài Khoản</th>
      <td><%=a.getAccount_type()%></td>
    </tr>
    <tr>
      <th>Chi Nhánh</th>
      <td>Việt Nam</td>
    </tr>
    <tr>
      <th>Ngày Mở Tài Khoản</th>
      <td><%=a.getCreated_at()%></td>
    </tr>
  </table>
  <div class="footer">
    <a href="<%=url%>/userPage/lichsugiaodich.jsp">Xem lịch sử giao dịch</a>
  </div>
</div>
<%
    } catch (NumberFormatException e) {
      System.out.println("Số dư không hợp lệ");
    }
  } else {
      System.out.println("Không tìm thấy thông tin tài khoản. Vui lòng đăng nhập lại.");
  }
%>

  <%
    response.setIntHeader("Refresh", 5);
    Object objl = session.getAttribute("l");
    List<loans> loansList = null;
    if(objl != null) {
      loansList = (List<loans>) objl;
    }
    if (loansList != null && !loansList.isEmpty()) {
        for (loans loan : loansList) {
          try {
            BigDecimal loanAmount = new BigDecimal(loan.getLoan_amount().trim());
            BigDecimal interestRate = new BigDecimal(loan.getInterest_rate());

            // Chuyển lãi suất từ phần trăm sang số thập phân
            BigDecimal interestRateDecimal = interestRate.divide(new BigDecimal("100"));

            // Tính tổng số tiền phải trả
            BigDecimal totalPayment = loanAmount.add(loanAmount.multiply(interestRateDecimal));

            // Định dạng số tiền thành dạng tiền tệ
            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
            String formattedTotalPayment = currencyFormatter.format(totalPayment);
  %>
<form action="<%=url%>/khach-hang" method="post">
  <input type="hidden" name="hanhDong" value="tra-no">
  <div class="account-info-container">
    <h2>Vay nợ ngân hàng</h2>
    <table>
      <tr>
        <th>Số Tài Khoản</th>
        <td><%=a.getAccount_number()%></td>
      </tr>
      <tr>
        <th>Chủ Tài Khoản</th>
        <td><%=u.getUsername()%></td>
      </tr>
      <tr>
        <th>Mã số vay</th>
        <td><%=loan.getLoan_id()%></td>
      </tr>
      <tr>
        <th>Số tiền vay</th>
        <td class="balance"><%=currencyFormatter.format(loanAmount)%></td>
      </tr>
      <tr>
        <th>Thời gian bắt đầu vay</th>
        <td><%=loan.getStart_date()%></td>
      </tr>
      <tr>
        <th>Thời gian kết thúc vay</th>
        <td><%=loan.getEnd_date()%></td>
      </tr>
      <tr>
        <th>Lãi suất (%)</th>
        <td><%=loan.getInterest_rate()%></td>
      </tr>
      <tr>
        <th>Tổng tiền phải trả</th>
        <td class="balance"><%=formattedTotalPayment%></td>
      </tr>
    </table>
    <button type="submit" class="btn-loans">Thanh toán tiền</button>
  </div>
</form>
<%
      } catch (NumberFormatException e) {
        System.out.println("Dữ liệu không hợp lệ");
      }
    }
  } else {
    System.out.println("Không tìm thấy thông tin khoản vay. Vui lòng đăng nhập lại.");
  }
%>
</body>
</html>
