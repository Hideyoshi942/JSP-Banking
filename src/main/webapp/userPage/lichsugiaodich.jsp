<%@ page import="java.util.List" %>
<%@ page import="model.loans" %>
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
        Object objtr = session.getAttribute("tr");
        List<transactions> transactionList = null;
        if(objtr != null) {
            transactionList = (List<transactions>) objtr;
        }
        if (transactionList != null && !transactionList.isEmpty()) {
    %>
    <div class="transaction-list">
        <%
            for (transactions t : transactionList) {
        %>
        <div class="transaction-item">
            <div class="transaction-details">
                <div class="transaction-amount"><%=t.isAmount_type() ? "+" : "-"%> <%= t.getAmount() %></div>
                <div class="transaction-type"><%= t.getTransaction_type() %></div>
                <div class="transaction-type"><%= t.getDescription()%></div>
                <div class="transaction-date"><%= t.getTransaction_date() %></div>
            </div>
            <div class="transaction-status <%= t.isState() ? "status-success" : "status-failed" %>">
                <%= t.isState() ? "Thành công" : "Thất bại" %>
            </div>
        </div>
        <% } %>
    </div>
    <%
    } else {
    %>
    <div class="no-transactions">Không có giao dịch nào.</div>
    <%
        }
    %>
</div>
</body>
</html>
