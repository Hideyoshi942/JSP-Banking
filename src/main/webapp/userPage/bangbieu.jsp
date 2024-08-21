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
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 20px;
    }

    .account-info-container {
      max-width: 600px;
      margin: 0 auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }

    .account-info-container h2 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }

    .account-info-container table {
      width: 100%;
      border-collapse: collapse;
    }

    .account-info-container th,
    .account-info-container td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .account-info-container th {
      background-color: #007bff;
      color: #fff;
    }

    .account-info-container td {
      background-color: #f9f9f9;
    }

    .status-active {
      color: green;
      font-weight: bold;
    }

    .status-inactive {
      color: red;
      font-weight: bold;
    }

    .balance {
      font-size: 1.2em;
      font-weight: bold;
    }

    .account-info-container .footer {
      margin-top: 20px;
      text-align: center;
    }

    .account-info-container .footer a {
      color: #007bff;
      text-decoration: none;
    }

    .account-info-container .footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<%
  String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
          + request.getContextPath();
%>
<div class="account-info-container">
  <h2>Thông Tin Tài Khoản Ngân Hàng</h2>
  <table>
    <tr>
      <th>Số Tài Khoản</th>
      <td>123456789</td>
    </tr>
    <tr>
      <th>Chủ Tài Khoản</th>
      <td>Chu Tuấn Kiệt</td>
    </tr>
    <tr>
      <th>Số Dư</th>
      <td class="balance">20,000,000 VND</td>
    </tr>
    <tr>
      <th>Trạng Thái</th>
      <td class="status-active">Hoạt Động</td>
    </tr>
    <tr>
      <th>Loại Tài Khoản</th>
      <td>Tiết Kiệm</td>
    </tr>
    <tr>
      <th>Chi Nhánh</th>
      <td>Hà Nội</td>
    </tr>
    <tr>
      <th>Ngày Mở Tài Khoản</th>
      <td>01/01/2020</td>
    </tr>
  </table>
  <div class="footer">
    <a href="<%=url%>/userPage/lichsugiaodich.jsp">Xem lịch sử giao dịch</a>
  </div>
</div>
</body>
</html>
