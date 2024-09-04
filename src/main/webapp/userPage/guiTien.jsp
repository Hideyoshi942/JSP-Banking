<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/4/2024
  Time: 8:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gửi Tiền Tiết Kiệm</title>
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userCss/guiTien.css">
</head>
<body>
<%@include file="headerUserPage.jsp"%>
<%
    BigDecimal balance = new BigDecimal(a.getBalance().trim());

    NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
    String formattedBalance = currencyFormatter.format(balance);

    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi != null) ? "" : baoLoi;

    String depositAmount = request.getAttribute("depositAmount") + "";
    depositAmount = (depositAmount != null) ? "" : depositAmount;

    String monthAmount = request.getAttribute("monthAmount") + "";
    monthAmount = (monthAmount != null) ? "" : monthAmount;

    String interestRateAmount = request.getAttribute("interestRateAmount") + "";
    interestRateAmount = (interestRateAmount != null) ? "" : interestRateAmount;
%>
<div class="saving-form-wrapper">
<div class="saving-container">
    <h2>Gửi Tiền Tiết Kiệm</h2>
    <form id="depositForm" action="<%=url%>/khach-hang" method="post">
        <input type="hidden" name="hanhDong" value="gui-tiet-kiem">
        <div class="red"><%=baoLoi%></div>
        <div class="form-group">
            <label for="accountNumber">Số Tài Khoản:</label>
            <label style="font-weight: bold" id="accountNumber" name="accountNumber"><%=a.getAccount_number()%></label>
        </div>
        <div class="form-group">
            <label for="accountName">Tên Chủ Tài Khoản:</label>
            <label style="font-weight: bold" id="accountName" name="accountName"><%=u.getUsername()%></label>
        </div>
        <div class="form-group">
            <label for="accountBalance">Số dư thanh toán:</label>
            <label style="font-weight: bold" id="accountBalance" name="accountBalance"><%=formattedBalance%></label>
        </div>
        <div class="form-group">
            <label for="depositAmount">Số Tiền Gửi:</label>
            <input type="text" id="depositAmount" name="depositAmount" placeholder="Nhập số tiền gửi" required value="<%=depositAmount%>">
        </div>
        <div class="form-group">
            <label for="term">Kỳ Hạn:</label>
            <select id="term" name="term" required>
                <option value="1">1 tháng - 4.5%</option>
                <option value="3">3 tháng - 5.0%</option>
                <option value="6">6 tháng - 5.5%</option>
                <option value="12">1 năm - 6.0%</option>
                <option value="36">3 năm - 6.5%</option>
                <option value="60">5 năm - 7.0%</option>
            </select>
            <input type="hidden" name="monthAmount" value="30">
            <input type="hidden" name="interestRateAmount" value="4.5">
            <div class="interest-rate" id="interestRate">Lãi suất: 4.5%</div>
        </div>
        <div class="form-group">
            <button type="submit">Gửi Tiền</button>
        </div>
    </form>
</div>
</div>


<script>
  const termSelect = document.getElementById('term');
  const interestRateDiv = document.getElementById('interestRate');
  const monthAmountInput = document.querySelector('input[name="monthAmount"]');
  const interestRateInput = document.querySelector('input[name="interestRateAmount"]');

  termSelect.addEventListener('change', function () {
    const selectedOption = termSelect.options[termSelect.selectedIndex].text;
    const value = parseInt(selectedOption.split(' ')[0], 10);
    let days = 0;

    if (isNaN(value)) {
      return;
    }

    if (selectedOption.includes('năm')) {
      days = value * 365;
    } else {
      days = value * 30;
    }

    const interestRateText = selectedOption.split(' - ')[1].trim();
    const interestRateValue = parseFloat(interestRateText.replace('%', ''));

    interestRateDiv.textContent = `Lãi suất: ${interestRateText}`;
    monthAmountInput.value = days;
    interestRateInput.value = interestRateValue;
  });
</script>

</body>
</html>
