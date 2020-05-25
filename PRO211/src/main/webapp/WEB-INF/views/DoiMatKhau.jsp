<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đổi mật khẩu</title>
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

    <div class="cinema">
    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(/img/hero_bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
            <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Đổi mật khẩu</h1>
          </div>
        </div>
      </div>
    </div>  
        <div class="container">
          	<div class="p-4">
          		<h1>Đổi mật khẩu</h1>
			<h4>${message}</h4>
			  <form method="post" action="/DoiMatKhau/kiemtra">
				  <div class="row">		  	
					<div class="form-group col-sm-12">
						<label>Email :</label>
						<input type="text" name="email" value="${email}" class="form-control"/>
					</div>
					<div class="form-group col-sm-12">
						<label>Mật khẩu cũ :</label>
						<input type="password" name="matKhau" class="form-control" required="required"/>
					</div>
					<div class="form-group col-sm-12">
						<label>Mật khẫu mới :</label>
						<input type="password" name="newMatKhau" class="form-control" required="required"/>
					</div>
					<div class="form-group col-sm-12">
						<label>Nhập lại mật khẩu :</label>
						<input type="password" name="renewMatKhau" class="form-control" required="required"/>
					</div>
				  </div>
				<div class="form-group">
					<button formaction="/DoiMatKhau/kiemtra" class="btn btn-success">Đổi mật khẩu</button>
					<a href="/index" class="btn btn-success" style="color:white">Hủy</a>
				</div>
			</form>
          	</div>
        </div>
    </div>
        <!-- footer -->
    <jsp:include page="../template/footer.jsp"/>

    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-caret-down"></span>'
            }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-caret-down"></span>'
            }

        });
        $(document).ready(function () {
            $('.js-example-basic-multiple').select2();
        });
    </script>
</body>

</html>