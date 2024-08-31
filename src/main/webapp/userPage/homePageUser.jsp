<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/23/2024
  Time: 11:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Banking</title>
    <link rel="stylesheet" href="/JSP_Banking_war/assets/css/userPage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
</head>
<body>
    <%@include file="headerUserPage.jsp"%>
    <div class="mainUser">
        <div class="container">
            <div class="boxMainUser">
                <div class="row boxItemsUser">
                    <div class="col-sm-4 itemUser">
                        <div class="boderItemUser">
                            <a href="<%=url%>/userPage/transacion.jsp"><i class="fa-solid fa-money-bill-transfer"></i>
                                <br/>Chuyển tiền</a>
                        </div>
                    </div>
                    <div class="col-sm-4 itemUser">
                        <div class="boderItemUser">
                            <a href="#"><i class="fa-solid fa-piggy-bank"></i>
                                <br/>Mở sổ tiết kiệm</a>
                        </div>
                    </div>
                    <div class="col-sm-4 itemUser">
                        <div class="boderItemUser">
                            <a href="#"><i class="fa-solid fa-credit-card"></i>
                                <br/>Mua số tài khoản đẹp</a>
                        </div>
                    </div>
                </div>
                <div class="row boxItemsUser">
                    <div class="col-sm-4 itemUser">
                        <div class="boderItemUser">
                            <a href="<%=url%>/userPage/loans.jsp"><i class="fa-solid fa-hand-holding-dollar"></i><br/>Vay tiền</a></div>
                    </div>
                    <div class="col-sm-4 itemUser">
                        <div class="boderItemUser">
                            <a href="#"><i class="fa-solid fa-money-bill"></i>
                                <br/>Thanh toán dịch vụ</a>
                        </div>
                    </div>
                    <div class="col-sm-4 itemUser">
                        <div class="boderItemUser">
                            <a href="#"><i class="fa-solid fa-shield"></i>
                                <br/>Mua bảo hiểm</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
