<%@ page import="model.user" %><%--
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
                user u = null;
                if (obj!=null)
                    u = (user)obj;

                if(u!=null){
            %>
            <div class="row navigatorHeaderUser">
                <div class="leftHeaderUser col-sm-8">
                    <ul class="leftItemsUser">
                        <li><a href="#">JSP-Banking</a></li>
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
