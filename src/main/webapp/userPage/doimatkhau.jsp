<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/16/2024
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đổi Mật Khẩu</title>
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userCss/doimatkhau.css">
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

    String current_password = request.getAttribute("current-password") + "";
    current_password = (current_password.equals("null")) ? "" : current_password;

    String new_password = request.getAttribute("new-password") + "";
    new_password = (new_password.equals("null")) ? "" : new_password;

    String comfirm_password = request.getAttribute("confirm-password") + "";
    comfirm_password = (comfirm_password.equals("null")) ? "" : comfirm_password;

    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<div class="password-change-container">
    <h2>Đổi Mật Khẩu</h2>
    <div class="red" id="baoLoi"><%=baoLoi%></div>
    <form id="passwordForm" action="<%=url%>/khach-hang" method="POST">
        <input type="hidden" name="hanhDong" value="doi-mat-khau"/>
        <div class="form-group">
            <label for="current-password">Mật khẩu cũ</label>
            <input type="password" id="current-password" name="current-password" required onkeyup="kiemTraMatKhau()" value="<%=current_password%>">
        </div>
        <div class="form-group">
            <label for="new-password">Mật khẩu mới</label>
            <input type="password" id="new-password" name="new-password" required onkeyup="kiemTraMatKhau2()" value="<%=new_password%>">
        </div>
        <div class="form-group">
            <label for="confirm-password">Nhập lại mật khẩu mới</label>
            <input type="password" id="confirm-password" name="confirm-password" required onkeyup="kiemTraMatKhauXacNhan()" value="<%=comfirm_password%>">
        </div>
        <button type="submit">Xác nhận</button>
        <button style="margin-top: 10px; background-color: orange;" onclick="window.location.href='privatePage.jsp'">Quay lại</button>
    </form>
</div>

<script type="text/javascript" src="/JSP_Banking_war/assets/js/doimatkhau.js"></script>
</body>
</html>
