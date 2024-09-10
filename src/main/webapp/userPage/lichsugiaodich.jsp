<%@ page import="java.util.List" %>
<%@ page import="model.transactions" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.transactionsDAO" %>
<%@ page import="dao.accountDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="refresh" content="5">
    <title>Lịch Sử Giao Dịch</title>
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userCss/lichsugiaodich.css">
</head>
<body>
<%@include file="headerUserPage.jsp"%>

<div class="container transaction-history-container">
    <div class="header">Lịch Sử Giao Dịch</div>
    <%
        response.setIntHeader("Refresh", 5);
        transactionsDAO tDAO = new transactionsDAO();
        ArrayList<transactions> tr = tDAO.getAccountByUserId(String.valueOf((a.getAccount_id())));
        session.setAttribute("tr", tr);


        Object objtr = session.getAttribute("tr");
        List<transactions> transactionList = null;

        if (objtr != null) {
            transactionList = (List<transactions>) objtr;
        }

        if (transactionList != null && !transactionList.isEmpty()) {
            Collections.sort(transactionList, new Comparator<transactions>() {
                @Override
                public int compare(transactions t1, transactions t2) {
                    return t2.getTransaction_date().compareTo(t1.getTransaction_date());
                }
            });
    %>
    <div class="transaction-list">
        <%
            for (transactions t : transactionList) {
        %>
        <div class="transaction-item">
            <div class="transaction-details">
                <div class="transaction-amount"><%=t.isAmount_type() ? "+" : "-"%> <%= t.getAmount() %></div>
                <div class="transaction-type"><%= t.getTransaction_type() %></div>
                <div class="transaction-description"><%= t.getDescription()%></div>
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
