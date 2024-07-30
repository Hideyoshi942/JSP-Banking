<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/28/2024
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thong bao</title>
</head>
<body>
    <div class="container">Tài khoản của bạn đã được tạo vui lòng đọc mail để hoàn thiện xác thực</div>
    <script>
      setTimeout(function(){
        window.location.href = '/JSP_Banking_war/loginAndsignup/signIn.jsp';
      }, 10000);
    </script>
</body>
</html>
