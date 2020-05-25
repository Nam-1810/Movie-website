<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/main.js"></script>
	<script src="js/datePicke.js"></script>
    <link rel="stylesheet" href="/css/style2.css">
</head>

<body>
    <!-- header-start -->
   		<jsp:include page="../template/header.jsp"/>
    <!-- header-end -->
	
	    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(/img/hero_bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
            <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Đăng nhập</h1>
          </div>
        </div>
      </div>
      </div>

    <!-- offers_area_start -->
    <div class="buy_ticket">
        <div class="container">
   			<form method="post" action="/DangNhap" class="p-3">
		     <h5>${messageDN}</h5>
		         <div class="form-group">
		             <label for="recipient-name1" class="col-form-label">Tài khoản</label>
		             <input type="email" class="form-control" id="taikhoan" name="email" value="${email}" required>
		         </div>
		         <div class="form-group">
		             <label for="password1" class="col-form-label">Mật khẩu</label>
		             <input type="password" class="form-control" name="matKhau" class="form-control" id="password" required>
		         </div>
		         <p class="text-center">
		             <button class="btn btn-template-outlined" type="submit">
		             <i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
		         </p>
		     </form>  
        </div>
    </div>
    <!-- offers_area_end -->
    

    <!-- footer -->
    <jsp:include page="../template/footer.jsp"/>
</body>

</html>          