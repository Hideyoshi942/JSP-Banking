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
    <title>Cá nhân</title>
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userCss/privatePage.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
</head>
<body>
<div class="privatePage">
    <div class="container">
        <div class="boxPrivate">
            <div class="boxItems">
                <button onclick="window.location.href='/JSP_Banking_war/userPage/thongtincanhan.jsp'"><i
                        class="fa-solid fa-user"></i> Thông tin cá nhân
                </button>
            </div>
            <div class="boxItems">
                <button onclick="window.location.href='/JSP_Banking_war/userPage/doimatkhau.jsp'"><i
                        class="fa-solid fa-lock"></i> Đổi mật khẩu
                </button>
            </div>
            <div class="boxItems">
                <button onclick="window.location.href='/JSP_Banking_war/userPage/homePageUser.jsp'"><i
                        class="fa-solid fa-arrow-left"></i> Quay lại
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
