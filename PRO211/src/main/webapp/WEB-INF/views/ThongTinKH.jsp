<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/themify-icons.css">
    <link rel="stylesheet" href="/css/slicknav.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/style2.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
 
 
<meta charset="ISO-8859-1">
<title>Thông tin khách hàng</title>
</head>
<body>
 <!-- header-start -->
   		<jsp:include page="../template/header.jsp"/>
    <!-- header-end -->
    <div class="cinema">
    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(/img/hero_bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
            <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Thông tin cá nhân</h1>
          </div>
        </div>
      </div>
    </div>   
	
	<div class="container">
	<br>
		<!-- Nav pills -->
		<ul class="nav nav-pills">
		  <li class="nav-item">
		    <a class="nav-link active" data-toggle="pill" href="#home">Thông tin cá nhân</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-toggle="pill" href="#menu1">Vé đã đặt</a>
		  </li>
		</ul>
		
		<!-- Tab panes -->
		<div class="tab-content">
		  <div class="tab-pane active" id="home">
		  		<jsp:include page="./_ThongTinKH/_ThongTin.jsp"/>
		  </div>
		  <div class="tab-pane fade" id="menu1">
		  		<jsp:include page="./_ThongTinKH/_VeDaDat.jsp"/>
		  </div>
		</div>
	</div>
	</div>
	<br>
	<jsp:include page="../template/footer.jsp"/>
</body>
</html>