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
</head>

<body>
<%@include file="headerUserPage.jsp"%>
<div class="loan-form-container">
    <h1>Loan Application</h1>
    <form action="#" method="post">
        <label for="loan-amount">Số tiền vay</label>
        <input type="text" id="loan-amount" name="loan-amount" placeholder="Enter loan amount" required>

        <label for="start-date">Ngày bắt đầu</label>
        <input type="date" id="start-date" name="start-date" onchange="calculateInterestRate()" required>

        <label for="end-date">Ngày kết thúc</label>
        <input type="date" id="end-date" name="end-date" onchange="calculateInterestRate()" required>

        <label for="interest-rate">Lãi suất (%)</label>
        <input type="number" id="interest-rate" name="interest-rate" placeholder="Interest rate" step="0.01" readonly required>

        <input type="submit" value="Vay tiền">
    </form>
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

