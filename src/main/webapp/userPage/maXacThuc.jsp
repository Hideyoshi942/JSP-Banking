<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mã Xác Thực</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
      }

      .verification-container {
        text-align: center;
      }

      .verification-container h2 {
        margin-bottom: 20px;
      }

      .verification-input {
        display: flex;
        justify-content: center;
      }

      .verification-input input {
        width: 50px;
        height: 50px;
        margin: 0 5px;
        text-align: center;
        font-size: 24px;
        border: 2px solid #ccc;
        border-radius: 5px;
      }

      .verification-input input:focus {
        border-color: #007bff;
        outline: none;
      }

      .submit-button {
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }

      .submit-button:hover {
        background-color: #0056b3;
      }

      .red {
        color: red;
      }
    </style>
</head>
<body>
<%
    String verification_code = (String) request.getAttribute("verification-code");
    verification_code = (verification_code != null) ? verification_code : "";

    String baoLoi = (String) request.getAttribute("baoLoi");
    baoLoi = (baoLoi != null) ? baoLoi : "";

    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<div class="verification-container">
    <h2>Nhập Mã Xác Thực</h2>
    <div class="red" id="baoLoi"><%= baoLoi %></div>
    <form id="verificationForm" action="<%= url %>/khach-hang" method="POST">
        <input type="hidden" name="hanhDong" value="xac-nhan-doi-mat-khau"/>
        <div class="verification-input">
            <input type="text" maxlength="1" name="digit1" required/>
            <input type="text" maxlength="1" name="digit2" required/>
            <input type="text" maxlength="1" name="digit3" required/>
            <input type="text" maxlength="1" name="digit4" required/>
            <input type="text" maxlength="1" name="digit5" required/>
            <input type="text" maxlength="1" name="digit6" required/>
        </div>
        <input type="hidden" name="verification-code" id="verification-code" value="<%= verification_code %>">
        <button type="submit" class="submit-button">Xác Nhận</button>
    </form>
</div>

<script>
  function combineCode() {
    // Lấy các giá trị từ các ô input
    const inputs = document.querySelectorAll('.verification-input input');
    let verificationCode = '';

    inputs.forEach(input => {
      verificationCode += input.value;
    });

    // Gán chuỗi vào input ẩn
    document.getElementById('verification-code').value = verificationCode;
  }

  document.getElementById('verificationForm').addEventListener('submit', (event) => {
    combineCode();
  });

  const inputs = document.querySelectorAll('.verification-input input');

  inputs.forEach((input, index) => {
    input.addEventListener('input', () => {
      if (input.value.length === 1 && index < inputs.length - 1) {
        inputs[index + 1].focus();
      }
    });

    input.addEventListener('keydown', (e) => {
      if (e.key === 'Backspace' && input.value === '' && index > 0) {
        inputs[index - 1].focus();
      }
    });
  });
</script>
</body>
</html>
