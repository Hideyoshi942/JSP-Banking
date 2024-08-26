<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/21/2024
  Time: 9:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lịch Sử Giao Dịch</title>
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userCss/lichsugiaodich.css">
</head>
<body>
<%@include file="headerUserPage.jsp"%>

<div class="container transaction-history-container">
    <div class="header">Lịch Sử Giao Dịch</div>
    <%
        if (t != null) {
    %>
    <div class="transaction-list">
        <div class="transaction-item">
            <div class="transaction-details">
                <div class="transaction-amount">-<%=t.getAmount()%></div>
                <div class="transaction-type"><%=t.getTransaction_type()%></div>
                <div class="transaction-date"><%=t.getTransaction_date()%></div>
            </div>
            <div class="transaction-status status-success"><%=t.isState()%></div>
        </div>
        <div class="transaction-item">
            <div class="transaction-details">
                <div class="transaction-amount">+3,000,000 VND</div>
                <div class="transaction-type">Chuyển khoản nhận</div>
                <div class="transaction-date">17/08/2024</div>
            </div>
            <div class="transaction-status status-success">Thành công</div>
        </div>
        <div class="transaction-item">
            <div class="transaction-details">
                <div class="transaction-amount">-500,000 VND</div>
                <div class="transaction-type">Thanh toán hóa đơn</div>
                <div class="transaction-date">16/08/2024</div>
            </div>
            <div class="transaction-status status-pending">Đang xử lý</div>
        </div>
        <div class="transaction-item">
            <div class="transaction-details">
                <div class="transaction-amount">+1,000,000 VND</div>
                <div class="transaction-type">Nạp tiền</div>
                <div class="transaction-date">15/08/2024</div>
            </div>
            <div class="transaction-status status-success">Thành công</div>
        </div>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
