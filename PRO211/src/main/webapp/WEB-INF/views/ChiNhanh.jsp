<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>ChiNhanh</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
            <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Chi nhánh</h1>
          </div>
        </div>
      </div>
    </div>  

        <div class="container py-5">
         	 <div class="row p-3">
         	 
         	 	<div class="col-xl-6 ">
         	 			<div class="form-group">
         	 				<h3>Thông tin chi nhánh</h3>
	                       <div class="cinema_show">
	                           <ul>
	                               <li>Tên rạp: Rạp Song Long</li>
	                               <li>Địa chỉ: 123a Đường Nam Kì Khởi Nghĩa quận 3 TP.HCM</li>
	                           </ul>
	                       </div>
         	 			</div>
                        <br>
                        <div class="form-group">
                        <h3>Thông tin chi nhánh2</h3>
	                        <div class="cinema_show">
	                            <ul>
	                                <li>Tên rạp: Rạp Nơ Trang Long</li>
	                                <li>Địa chỉ: 3 Nơ Trang Long, Phường 14, Bình Thạnh, Hồ Chí Minh</li>
	                            </ul>
	                        </div>
                    	</div>
                    	<br>
                    	<div class="form-group">
                        <h3>Thông tin chi nhánh3</h3>
	                        <div class="cinema_show">
	                            <ul>
	                                <li>Tên rạp: VinCom</li>
	                                <li>Địa chỉ:Số 161 Xa lộ Hà Nội, P, Quận 2, Hồ Chí Minh </li>
	                            </ul>
	                        </div>
                        </div>
                    </div>
               <div class="col-xl-6 ">
              	<div class="map">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.266898219578!2d106.67997221462268!3d10.79085869231172!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528d35939c66f%3A0xe52e3ed732b15272!2zVHLGsOG7nW5nIENhbyDEkOG6s25nIFRo4buxYyBow6BuaCBGUFQgUG9seXRlY2huaWMgKENTMSk!5e0!3m2!1svi!2s!4v1573833498163!5m2!1svi!2s"
                                width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="">
                            </iframe>
                        </div>
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