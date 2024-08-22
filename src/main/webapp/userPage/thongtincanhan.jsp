<%@ page import="model.user" %><%--
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
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userCss/thongtincanhan.css">
    <style>
        .red {
          color: red;
        }
    </style>
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();

    String username = request.getAttribute("username") + "";
    username = (username.equals("null")) ? "" : username;

    String email = request.getAttribute("email") + "";
    email = (email.equals("null")) ? "" : email;

    String phone_number = request.getAttribute("phone_number") + "";
    phone_number = (phone_number.equals("null")) ? "" : phone_number;

    String baoLoi = request.getAttribute("baiLoi") + "";
    baoLoi = (baoLoi != null) ? "" : baoLoi;
%>
<div class="profile-container">
    <h2>Thông Tin Cá Nhân</h2>
    <%
        Object obj = session.getAttribute("us");
        user u = null;
        if (obj!=null)
            u = (user) obj;

        if(u!=null){
    %>
    <div class="red"><%=baoLoi%></div>
    <form action="<%=url%>/khach-hang" method="post">
        <input type="hidden" name="hanhDong" value="doi-thong-tin-ca-nhan">
        <div class="profile-info">
            <div class="info-item">
                <label for="username">Username:</label>
                <input type="text" id="username" placeholder="<%=u.getUsername()%>" name="username" value="<%=username%>"/>
            </div>
            <div class="info-item">
                <label for="email">Email:</label>
                <input type="text" id="email" placeholder="<%=u.getEmail()%>" name="email" value="<%=email%>"/>
            </div>
            <div class="info-item">
                <label for="phone_number">Số Điện Thoại:</label>
                <input type="text" id="phone_number" placeholder="<%=u.getPhone_number()%>" name="phone_number" value="<%=phone_number%>"/>
            </div>
            <button type="submit">Sửa</button>
            <button style="margin-top: 10px; background-color: orange;" onclick="window.location.href='privatePage.jsp'">Quay lại</button>
        </div>
    </form>
    <% } %>
</div>
</body>
</html>
