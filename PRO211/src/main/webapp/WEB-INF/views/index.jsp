<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>index</title>
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css"/>
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
	<script src="js/alert.js"></script>
	
</head>

<body>
    <!-- header-start -->
   		<jsp:include page="../template/header.jsp"/>
    <!-- header-end -->

    <!-- slider_area_start -->
    	<jsp:include page="../template/slider.jsp"/>
    <!-- slider_area_end -->



    <!-- offers_area_start -->
    <div class="buy_ticket">
        <div class="container">
            <h2>Phim đang chiếu</h2>
            <hr>
            <div class="row">
            	<c:forEach var="p" items="${list}">
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="single_expert mb-40">
                        <div class="expert_thumb">
                            <ul class="caption-style-4">
                                <li>
                                    <a href="/ChiTietPhim/${p.maPhim}"><img class="img-fluid" src="/img/phim/${p.hinhPhim}">
                                        <div class="caption">
                                            <div class="blur"></div>
                                            <div class="caption-text">
                                                <div class="button-buy">MUA VÉ</div>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="experts_name text-center">
                            <a href="/ChiTietPhim/${p.maPhim}">
                                <h3>${p.tenPhim}</h3>
                            </a>
                        </div>
                    </div>
                </div>
            	</c:forEach> 
            </div>
        </div>
    </div>
    <!-- offers_area_end -->
    
    
    <!--================Blog Area =================-->
    <jsp:include page="../template/blog.jsp"/>

    <!-- footer -->
    <jsp:include page="../template/footer.jsp"/>
</body>
<script>
	function myfunction() {
		document.getElementById("ngaySinh2").value = document
				.getElementById("ngaySinh1").value;
	}
</script>
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

<script type="text/javascript">      
     $(window).on('load', function () {             
            var springAttribute = '${message}';
            var springAttribute2 = '${messageDK}';
            var springAttribute3 = '${messageDN}';
            
            if(springAttribute != ""){
            	alertify.alert("Thông báo",springAttribute);
            }
            
            if(springAttribute2 != ""){
            	alertify.alert("Thông báo",springAttribute2);
            }
            		
            if(springAttribute3 != ""){
            	alertify.alert("Thông báo",springAttribute3);
            }
                 
     });
</script>

</html>