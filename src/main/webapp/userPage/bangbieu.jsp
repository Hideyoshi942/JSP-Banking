<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.math.BigDecimal" %>
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
  <title>Thông Tin Tài Khoản Ngân Hàng</title>
  <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userCss/bangbieu.css">
</head>
<body>
<%@include file="headerUserPage.jsp"%>

<div class="account-info-container">
  <h2>Thông Tin Tài Khoản Ngân Hàng</h2>
  <%
    if (a != null && a.getBalance() != null && !a.getBalance().trim().isEmpty()) {
      try {
        BigDecimal balance = new BigDecimal(a.getBalance().trim());

        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedBalance = currencyFormatter.format(balance);
        String statusClass = a.isState() ? "status-active" : "status-inactive";
  %>
  <table>
    <tr>
      <th>Số Tài Khoản</th>
      <td><%=a.getAccount_number()%></td>
    </tr>
    <tr>
      <th>Chủ Tài Khoản</th>
      <td><%=u.getUsername()%></td>
    </tr>
    <tr>
      <th>Số Dư</th>
      <td class="balance"><%=formattedBalance%></td>
    </tr>
    <tr>
      <th>Trạng Thái</th>
      <td class="<%=statusClass%>"><%=a.isState() ? "Hoạt Động" : "Đóng"%></td>
    </tr>
    <tr>
      <th>Loại Tài Khoản</th>
      <td><%=a.getAccount_type()%></td>
    </tr>
    <tr>
      <th>Chi Nhánh</th>
      <td>Việt Nam</td>
    </tr>
    <tr>
      <th>Ngày Mở Tài Khoản</th>
      <td><%=a.getCreated_at()%></td>
    </tr>
  </table>
  <div class="footer">
    <a href="<%=url%>/userPage/lichsugiaodich.jsp">Xem lịch sử giao dịch</a>
  </div>
</div>
<%
    } catch (NumberFormatException e) {
      System.out.println("Số dư không hợp lệ");
    }
  } else {
      System.out.println("Không tìm thấy thông tin tài khoản. Vui lòng đăng nhập lại.");
  }
%>
</body>
</html>
