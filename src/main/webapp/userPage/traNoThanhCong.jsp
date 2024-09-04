<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/4/2024
  Time: 7:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tra no ngan hàng</title>
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<p>Tra no thành công</p>
<a href="<%=url%>/userPage/homePageUser.jsp">Về trang chủ</a>
</body>
</html>
