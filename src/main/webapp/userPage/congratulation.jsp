<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/28/2024
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xac thuc thanh cong</title>
</head>
<body>
<%=request.getAttribute("baoLoi")+"" %>
<script>
  setTimeout(function(){
    window.location.href = '/JSP_Banking_war/userPage/homePageUser.jsp';
  }, 10000);
</script>
</body>
</html>
