<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/28/2024
  Time: 8:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Giao dịch thất bại</title>
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<p>Giao dịch thất bại</p>
<a href="<%=url%>/userPage/homePageUser.jsp">Về trang chủ</a>
</body>
</html>
