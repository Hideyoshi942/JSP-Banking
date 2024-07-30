<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/29/2024
  Time: 11:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/forgetPassword.css">
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
%>
<%
    String url =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath();
%>
    <form action="<%=url%>/khach-hang" method="post">
        <input type="hidden" value="quen-mat-khau" name="hanhDong">
        <div class="card text-center forget-password" style="width: 300px;">
            <div class="card-header h5 text-white bg-primary">Lấy lại mật khẩu</div>
            <div class="card-body px-5">
                <p class="card-text py-2">
                    Vui lòng cung cấp số điện thoại để lấy lại mật khẩu
                </p>
                <div data-mdb-input-init class="form-outline">
                    <div class="red d-flex flex-row align-items-center mb-4" id="baoLoi"><%=baoLoi%></div>
                    <input type="text" id="phone_number" class="form-control my-3" name="phone_number" value="<%=phone_number%>" required="required" onkeyup="kiemTraSoDienThoai()"/>
                    <label class="form-label" for="phone_number">Số điện thoại</label>
                </div>
                <button type="submit" class="btn btn-primary w-100">Cấp lại mật khẩu</button>
                <div class="d-flex justify-content-between mt-4">
                    <a class="" href="/JSP_Banking_war/loginAndsignup/signIn.jsp">Đăng nhập</a>
                    <a class="" href="/JSP_Banking_war/loginAndsignup/signUp.jsp">Đăng ký</a>
                </div>
            </div>
        </div>

    </form>
</body>
<script type="text/javascript" src="/JSP_Banking_war/assets/js/signUp.js"></script>
</html>