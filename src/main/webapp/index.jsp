<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/15/2024
  Time: 8:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="./assets/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <title>Internet Banking</title>
</head>
<body>
<%--    Header--%>
<%@include file="header.jsp" %>

<%--Body--%>
<main>
  <!-- Slide -->
  <div class="slide">
  </div>
  
  <!-- Product -->
  <div class="product">
      <div class="container">
          <div class="row product_name">
              <div class="col-sm-12 product_title">
                  Sản phẩm Khách hàng Cá nhân nổi bật
              </div>
          </div>
          <div class="row product_options">
              <div class="col-sm-4">
                  <i class="fa-solid fa-coins"></i>
                  <h3>1. CHO VAY</h3>
                  <p>
                      Các sản phẩm cho vay đa dạng linh hoạt, phù hợp với nhiều mục đích khác nhau. Thủ tục đơn giản, dễ dàng thuận tiện và giải ngân nhanh chóng.
                  </p>
                  <a href="#">XEM CHI TIẾT</a>
              </div>
              <div class="col-sm-4">
                  <i class="fa-solid fa-laptop-file"></i>
                  <h3>App Bank</h3>
                  <p>
                      Ứng dụng ngân hàng của MB trên điện thoại di động, thực hiện các giao dịch tài chính, thanh toán với thao tác đơn giản, thuận tiện.
                  </p>
                  <a href="#">XEM CHI TIẾT</a>
              </div>
              <div class="col-sm-4">
                  <i class="fa-brands fa-bitcoin"></i>
                  <h3>3. DỊCH VỤ KIỀU HỐI </h3>
                  <p>
                      Chuyển tiền quốc tế, mua bán ngoại tệ, chuyển tiền từ nước ngoài về Việt Nam nhanh chóng, bảo mật, đa dạng ngoại tệ và dễ dàng trên App MBBank
                  </p>
                  <a href="#">XEM CHI TIẾT</a>
              </div>
          </div>
      </div>
  </div>
  <!-- Sale -->
  <div class="sale">
      <div class="container">
          <div class="row sale_name">
              <div class="col-sm-12 sale_title">Tin khuyến mại</div>
          </div>
          <div class="row sale_options">
              <div class="col-sm-4 sale_options-item">
                  <img src="./assets/img/sale_option_one.png" alt="Sale One">
                  <div>
                      <h5>Tặng voucher ShopeeFood 200K khi chi tiêu tích luỹ thẻ Hi ShopeeFood mới từ</h5>
                      <a href="#">XEM CHI TIẾT</a>
                  </div>
              </div>
              <div class="col-sm-4 sale_options-item">
                  <img src="./assets/img/sale_option_two.png" alt="Sale Two">
                  <div>
                      <h5>[MB x WONDERLAND WATER PARK] Giảm 20% dành cho chủ thẻ MB</h5>
                      <a href="#">XEM CHI TIẾT</a>
                  </div>
              </div>
              <div class="col-sm-4 sale_options-item">
                  <img src="./assets/img/sale_option_three.png" alt="Sale Three">
                  <div>
                      <h5>Đi chợ giá hời, tặng voucher ShopeeFood Mart 100K cho chủ thẻ Hi ShopeeFood</h5>
                      <a href="#">XEM CHI TIẾT</a>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Services -->
  <div class="service">
      <div class="container">
          <div class="row service_name">
              <div class="col-sm-12 service_title">Trung tâm dịch vụ khách hàng 24/7</div>
          </div>
          <div class="row service_options">
              <div class="col-sm-4">
                  <div class="row">
                      <span class="col-sm-3">
                          <i class="fa-solid fa-phone"></i>
                      </span>
                      <span class="col-sm-9">
                          <h3>Hotline</h3>
                          <p>1900 545426</p>
                          <p>(84-24)3767 4050 (quốc tế gọi về)</p>
                          <a href="#">Hướng dẫn sử dụng Tổng đài (Tại đây)</a>
                      </span>
                  </div>
              </div>
              <div class="col-sm-4">
                  <div class="row">
                      <span class="col-sm-3">
                          <i class="fa-solid fa-envelope"></i>
                      </span>
                      <span class="col-sm-9">
                          <h3>Email cho chúng tôi</h3>
                          <a href="#">mb247@mbbank.com.vn</a>
                      </span>
                  </div>
              </div>
              <div class="col-sm-4">
                  <div class="row">
                      <span class="col-sm-3">
                          <i class="fa-solid fa-globe"></i>
                      </span>
                      <span class="col-sm-9">
                          <h3>Liên hệ MB247</h3>
                          <a href="#">https://www.mbbank.com.vn/Contact</a>
                      </span>
                  </div>
                  
              </div>
          </div>
      </div>
  </div>
</main>

<%--Footer--%>
<%@include file="footer.jsp" %>
</body>
<script type="text/javascript" src="./assets/js/bootstrap.bundle.min.js.map"></script>
</html>
