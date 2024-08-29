<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/27/2024
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Giao dịch thành công</title>
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<p>Giao dịch thành công</p>
<a href="<%=url%>/userPage/homePageUser.jsp">Về trang chủ</a>
</body>
</html>
