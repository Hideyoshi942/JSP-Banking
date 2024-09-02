<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/2/2024
  Time: 9:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vay Tien</title>
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<p>Vay tien thành công</p>
<a href="<%=url%>/userPage/homePageUser.jsp">Về trang chủ</a>
</body>
</html>
