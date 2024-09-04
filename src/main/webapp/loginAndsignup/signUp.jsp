<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đăng ký</title>
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/signUp.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <style>
      .red {
        color: red;
      }
    </style>
</head>
<body>
<%
    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

    String username = request.getAttribute("username") + "";
    username = (username.equals("null")) ? "" : username;

    String email = request.getAttribute("email") + "";
    email = (email.equals("null")) ? "" : email;

    String phone_number = request.getAttribute("phone_number") + "";
    phone_number = (phone_number.equals("null")) ? "" : phone_number;

    String password = request.getAttribute("password") + "";
    password = (password.equals("null")) ? "" : password;

    String comfirm_password = request.getAttribute("comfirm_password") + "";
    comfirm_password = (comfirm_password.equals("null")) ? "" : comfirm_password;

    String agree_term = request.getAttribute("agree_term") + "";
    agree_term = (agree_term.equals("null")) ? "" : agree_term;
%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<section class="vh-100" style="background-color: #eee;">
    <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
                <div class="card text-black" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Đăng ký</p>
                                <div class="red d-flex flex-row align-items-center mb-4" id="baoLoi"><%=baoLoi%></div>
                                <form class="mx-1 mx-md-4" action="<%=url%>/khach-hang" method="post">
                                    <input type="hidden" name="hanhDong" value="dang-ky"/>
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                            <i class="fa-solid fa-user"></i>
                                            <label class="form-label" for="username">Họ và tên</label>
                                            <input type="text" id="username" class="form-control" name="username" required="required" value="<%=username%>"/>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                            <i class="fa-solid fa-envelope"></i>
                                            <label class="form-label" for="email">Email</label>
                                            <input type="email" id="email" class="form-control" name="email" required="required" value="<%=email%>" onkeyup="kiemTraEmail()"/>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                            <i class="fa-solid fa-phone"></i>
                                            <label class="form-label" for="phone_number">Số điện thoại</label>
                                            <input type="text" id="phone_number" class="form-control" name="phone_number" required="required" value="<%=phone_number%>" onkeyup="kiemTraSoDienThoai()"/>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                            <i class="fa-solid fa-lock"></i>
                                            <label class="form-label" for="password">Mật khẩu</label>
                                            <input type="password" id="password" class="form-control" name="password" required="required" value="<%=password%>" onkeyup="kiemTraMatKhau()"/>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div data-mdb-input-init class="form-outline flex-fill mb-0">
                                            <i class="fa-solid fa-unlock"></i>
                                            <label class="form-label" for="comfirm_password">Xác nhận mật khẩu
                                                <br/><span id="msg" class="red"></span></label>
                                            <input type="password" id="comfirm_password" class="form-control" name="comfirm_password" required="required" value="<%=comfirm_password%>" onkeyup="kiemTraMatKhauXacNhan()"/>
                                        </div>
                                    </div>

                                    <div class="form-check d-flex justify-content-center mb-2">
                                        <input class="form-check-input me-2" type="checkbox" value="<%=agree_term%>" id="agree_term" required="required" name="agree_term" onchange="xuLyChon()"/>
                                        <label class="form-check-label" for="agree_term">
                                            Tôi đồng ý với tất cả điều khoản trong<a href="#!">Terms of service</a>
                                        </label>
                                    </div>
                                    <div class="d-flex">
                                        <p>Bạn đã có tài khoản?</p>
                                        <a href='/JSP_Banking_war/loginAndsignup/signIn.jsp'>Đăng nhập</a>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg">
                                            Đăng ký
                                        </button>
                                    </div>

                                </form>

                            </div>
                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp" class="img-fluid" alt="Sample image">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript" src="/JSP_Banking_war/assets/js/signUp.js">
</script>
</html>
