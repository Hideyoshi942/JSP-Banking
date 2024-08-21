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
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
      }

      .transaction-history-container {
        width: 80%;
        max-width: 900px;
        background-color: #fff;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
      }

      .header {
        background-color: #007bff;
        color: #fff;
        padding: 20px;
        text-align: center;
        font-size: 24px;
        font-weight: bold;
      }

      .transaction-list {
        padding: 20px;
      }

      .transaction-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px;
        border-bottom: 1px solid #ddd;
        transition: background-color 0.3s ease;
      }

      .transaction-item:hover {
        background-color: #f0f0f0;
      }

      .transaction-item:last-child {
        border-bottom: none;
      }

      .transaction-details {
        display: flex;
        flex-direction: column;
      }

      .transaction-amount {
        font-size: 18px;
        font-weight: bold;
      }

      .transaction-date {
        color: #888;
        font-size: 14px;
      }

      .transaction-type {
        font-size: 16px;
        color: #333;
      }

      .transaction-status {
        padding: 5px 10px;
        border-radius: 15px;
        font-size: 14px;
      }

      .status-success {
        background-color: #28a745;
        color: #fff;
      }

      .status-failed {
        background-color: #dc3545;
        color: #fff;
      }

      .status-pending {
        background-color: #ffc107;
        color: #fff;
      }
    </style>
</head>
<body>
<div class="transaction-history-container">
    <div class="header">Lịch Sử Giao Dịch</div>
    <div class="transaction-list">
        <div class="transaction-item">
            <div class="transaction-details">
                <div class="transaction-amount">-1,500,000 VND</div>
                <div class="transaction-type">Rút tiền</div>
                <div class="transaction-date">18/08/2024</div>
            </div>
            <div class="transaction-status status-success">Thành công</div>
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
</div>
</body>
</html>
