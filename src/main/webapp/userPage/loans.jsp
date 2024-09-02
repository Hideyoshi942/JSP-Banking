<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/31/2024
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vay tiền online</title>
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userCss/loans.css">
    <style>
        .red {
          color: red;
        }
    </style>
</head>

<body>
<%
    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi != null) ? "" : baoLoi;

    String loan_amount = request.getAttribute("loan-amount") + "";
    loan_amount = (loan_amount != null) ? "" : loan_amount;

    String start_date = request.getAttribute("start-date") + "";
    start_date = (start_date != null) ? "" : start_date;

    String end_date = request.getAttribute("end-date") + "";
    end_date = (end_date != null) ? "" : end_date;

    String interest_rate = request.getAttribute("interest-rate") + "";
    interest_rate = (interest_rate != null) ? "" : interest_rate;
%>

<%@include file="headerUserPage.jsp"%>
<div class="loan-form-wrapper">
    <div class="loan-form-container">
        <h1>Loan Application</h1>
        <form action="<%=url%>/khach-hang" method="post">
            <input type="hidden" name="hanhDong" value="vay-tien">
            <div class="red"><%=baoLoi%></div>
            <label for="loan-amount">Số tiền vay</label>
            <input type="text" id="loan-amount" name="loan-amount" placeholder="Enter loan amount" required value="<%=loan_amount%>">

            <label for="start-date">Ngày bắt đầu</label>
            <input type="date" id="start-date" name="start-date" onchange="calculateInterestRate()" required value="<%=start_date%>">

            <label for="end-date">Ngày kết thúc</label>
            <input type="date" id="end-date" name="end-date" onchange="calculateInterestRate()" required value="<%=end_date%>">

            <label for="interest-rate">Lãi suất (%)</label>
            <input type="number" id="interest-rate" name="interest-rate" placeholder="Interest rate" step="0.01" readonly required value="<%=interest_rate%>">

            <input type="submit" value="Vay tiền">
        </form>
    </div>
</div>
<script>
  function calculateInterestRate() {
    const startDate = new Date(document.getElementById('start-date').value);
    const endDate = new Date(document.getElementById('end-date').value);
    const interestRateInput = document.getElementById('interest-rate');

    if (startDate && endDate) {
      const timeDiff = Math.abs(endDate.getTime() - startDate.getTime());
      const diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
      const diffMonths = diffDays / 30;

      if (diffMonths <= 6) {
        interestRateInput.value = 5;
      } else if (diffMonths > 6 && diffMonths <= 12) {
        interestRateInput.value = 7.5;
      } else if (diffMonths > 12) {
        interestRateInput.value = 10;
      }
    }
  }
</script>
</body>
</html>

