<%@ page import="model.user" %>
<%@ page import="model.account" %>
<%@ page import="model.beneficiaries" %>
<%@ page import="model.transactions" %>

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
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<header>
    <div class="headerUser">
        <div class="container">
            <%
                Object obj = session.getAttribute("us");
                Object objac = session.getAttribute("ac");
                user u = null;
                account a = null;

                if (obj!=null && objac!=null) {
                    u = (user) obj;
                    a = (account) objac;
                }

                if(u!=null && a!=null){

            %>
            <div class="row navigatorHeaderUser">
                <div class="leftHeaderUser col-sm-8">
                    <ul class="leftItemsUser">
                        <li><a href="<%=url%>/userPage/homePageUser.jsp">JSP-Banking</a></li>
                        <li><a href="<%=url%>/userPage/bangbieu.jsp">Bảng biểu</a></li>
                        <li><a href="<%=url%>/userPage/lichsugiaodich.jsp">Lịch sử giao dịch</a></li>
                        <li><a href="<%=url%>/userPage/privatePage.jsp">Thông tin cá nhân</a></li>
                    </ul>
                </div>
                <div class="rightHeaderUser col-sm-4">
                    <ul class="rightItemsUser">
                        <li><a href="#">Xin chào <%=u.getUsername()%></a></li>
                        <li><a href="<%=url%>/khach-hang?hanhDong=dang-xuat">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</header>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    var path = window.location.pathname;
    var page = path.split("/").pop(); // Lấy tên tệp từ đường dẫn

    var links = document.querySelectorAll(".leftItemsUser a");
    links.forEach(function(link) {
      var linkPath = link.getAttribute("href");

      // Xóa dấu "/" ở đầu và so sánh
      if (linkPath.startsWith("/")) {
        linkPath = linkPath.substring(1);
      }

      if (linkPath === page) {
        link.classList.add("active");
      }
    });
  });
</script>

