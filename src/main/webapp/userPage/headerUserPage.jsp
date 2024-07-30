<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/30/2024
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/JSP_Banking_war/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/JSP_Banking_war/assets/css/headerUser.css">
<header>
    <div class="headerUser">
        <div class="container">
            <div class="row navigatorHeaderUser">
                <div class="leftHeaderUser col-sm-8">
                    <ul class="leftItemsUser">
                        <li><a href="#">JSP-Banking</a></li>
                        <li><a href="#">Bảng biểu</a></li>
                        <li><a href="#">Lịch sử giao dịch</a></li>
                        <li><a href="#">Thông tin cá nhân</a></li>
                    </ul>
                </div>
                <div class="rightHeaderUser col-sm-4">
                    <ul class="rightItemsUser">
                        <li><a href="#">Xin chào Tuan</a></li>
                        <li><a href="#">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>
<script>
  // JavaScript để thêm lớp active vào mục hiện tại
  document.addEventListener("DOMContentLoaded", function() {
    var path = window.location.pathname;
    var page = path.split("/").pop();

    var links = document.querySelectorAll(".leftItemsUser a");
    links.forEach(function(link) {
      if (link.getAttribute("href") === page) {
        link.classList.add("active");
      }
    });
  });
</script>
