<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/26/2024
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.math.BigDecimal" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Transaction</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userCss/transaction.css"/>
    <style>
        .red {
          color: red;
        }
    </style>
</head>

<body>
<%@include file="headerUserPage.jsp"%>
<%
    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi != null) ? "" : baoLoi;

    String account_number = request.getAttribute("account_number") + "";
    account_number = (account_number != null) ? "" : account_number;

    String account_name = request.getAttribute("account_name") + "";
    account_name = (account_name != null) ? "" : account_name;

    String account_amount = request.getAttribute("account_amount") + "";
    account_amount = (account_amount != null) ? "" : account_amount;

    String description = request.getAttribute("description") + "";
    description = (description != null) ? "" : description;
%>
<div class="transaction-container">
    <h2>Bank Transaction</h2>
    <%
        if (a != null && a.getBalance() != null && !a.getBalance().trim().isEmpty()) {
            try {
                BigDecimal balance = new BigDecimal(a.getBalance().trim());

                NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                String formattedBalance = currencyFormatter.format(balance);
    %>
    <div class="form-group">
        <label>Số Tài Khoản Nguồn: <%=a.getAccount_number()%></label>
    </div>

    <div class="form-group">
        <label>Số Dư: <%=formattedBalance%> </label>
    </div>
    <form action="<%=url%>/khach-hang" method="post">
        <input type="hidden" name="hanhDong" value="giao-dich">
        <div class="red"><%=baoLoi%></div>
        <div class="form-group">
            <label for="bankName"><i class="fa-solid fa-building"></i>Tên Ngân Hàng</label>
            <label class="form-control" id="bankName">JSP-Banking</label>
        </div>
        <div class="form-group">
            <label for="accountNumber"><i class="fa-solid fa-hashtag"></i>Số Tài Khoản</label>
            <input type="text" class="form-control" id="accountNumber" name="account_number" placeholder="Enter account number" required value="<%=account_number%>">
        </div>
        <div class="form-group">
            <label for="recipientName"><i class="fa-solid fa-user"></i>Tên Người Hưởng Thụ</label>
            <input type="text" class="form-control" id="recipientName" name="account_name" placeholder="Enter recipient name" required value="<%=account_name%>">
        </div>
        <div class="form-group">
            <label for="amount"><i class="fa-solid fa-dollar-sign"></i>Số Tiền</label>
            <input type="text" class="form-control" id="amount" name="account_amount" placeholder="Enter amount" required value="<%=account_amount%>">
        </div>
        <div class="form-group">
            <label for="description"><i class="fa-solid fa-comments"></i>Nội dung</label>
            <input type="text" class="form-control" id="description" name="description" placeholder="Enter description" required value="<%=description%>">
        </div>
        <button type="submit" class="btn btn-primary"><i class="fa-solid fa-paper-plane"></i> Giao Dịch</button>
    </form>
    <%
            } catch (NumberFormatException e) {
                System.out.println("Số dư không hợp lệ");
            }
        } else {
            System.out.println("Không tìm thấy thông tin tài khoản. Vui lòng đăng nhập lại.");
        }
    %>
</div>

</body>

</html>

