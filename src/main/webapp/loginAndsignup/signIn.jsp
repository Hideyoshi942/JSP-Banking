<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/signIn.css">
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

    String phone_number = request.getAttribute("phone_number") + "";
    phone_number = (phone_number.equals("null")) ? "" : phone_number;

    String password = request.getAttribute("password") + "";
    password = (password.equals("null")) ? "" : password;
%>
<%
    String url =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath();
%>
<form action="<%=url%>/khach-hang" method="post">
    <input type="hidden" name="hanhDong" value="dang-nhap">
    <div class="login-background">
        <div class="login-form">
            <div class="login-form_design">
                <div class="login-title"><p>Đăng nhập</p></div>
                <div class="red d-flex flex-row align-items-center mb-4" id="baoLoi"><%=baoLoi%>
                </div>
                <div class="mb-3 login-phone">
                    <label for="phone_number" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="phone_number" name="phone_number"
                           aria-describedby="phoneHelp" required="required" value="<%=phone_number%>">
                    <div id="phoneHelp" class="form-text">Chúng tôi sẽ không tiết lộ cho bất kì
                        ai.
                    </div>
                </div>
                <div class="mb-3 login-password">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" required="required" id="password" name="password" value="<%=password%>">
                </div>
                <div class="mb-3 forget-password">
                    <a href="/JSP_Banking_war/loginAndsignup/forgetPassword.jsp">Quên mật khẩu</a>
                </div>
                <button type="submit" class="btn btn-primary btn-login">Đăng nhập</button>
                <div class="mb-3 mt-3 signup-account">
                    <p>Bạn chưa có tài khoản ?</p>
                </div>
                <button type="button" class="btn btn-warning btn-login"
                        onclick="location.href='/JSP_Banking_war/loginAndsignup/signUp.jsp'">Đăng ký
                </button>
            </div>
        </div>
    </div>
</form>
</body>
</html>