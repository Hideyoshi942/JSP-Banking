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
    <title>Thông Tin Cá Nhân</title>
    <link rel="stylesheet" href="../assets/css/userCss/thongtincanhan.css">
</head>
<body>
<div class="profile-container">
    <h2>Thông Tin Cá Nhân</h2>
    <div class="profile-info">
        <div class="info-item">
            <label for="username">Username:</label>
            <span id="username">your_username</span>
        </div>
        <div class="info-item">
            <label for="email">Email:</label>
            <span id="email">your_email@example.com</span>
        </div>
        <div class="info-item">
            <label for="phone_number">Số Điện Thoại:</label>
            <span id="phone_number">123-456-7890</span>
        </div>
        <button type="button"">Sửa</button>
        <button style="margin-top: 10px; background-color: orange;" onclick="window.location.href='privatePage.jsp'">Quay lại</button>
    </div>
</div>
</body>
</html>
