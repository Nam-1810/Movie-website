<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Thể loại</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/themify-icons.css">
    <link rel="stylesheet" href="/css/slicknav.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/style2.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
    
    <style type="text/css">
        .show {
            display: block;
        }

        .filterDiv {
            display: none;
        }

        .hide {
            display: none
        }
    </style>
    
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
            <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Thể loại phim</h1>
          </div>
        </div>
      </div>
    </div>  
        <div class="container">
            <div class="buy_ticket">
        		<div class="container">
		        	<h3>Phim điện ảnh</h3>
		        	<hr>
		        	<br>
		        	<div class="row">
		        		<div class="col-sm-4">		                    
		                 <form:form modelAttribute="formTL">
		                 	<form:select path="maTheLoai" class="filter form-control">
		                 		 <form:option value="all">Tất cả</form:option>
						    	<form:options items="${listTL}" itemValue="maTheLoai" itemLabel="tenTheLoai"/>
							</form:select>
		                 </form:form>
		                </div>
		                <div class="col-sm-4">		                
		                 <select class="filter2 form-control">
		                        <option value="all">Tất cả</option>
		                        <option value="Anh">Anh</option>
		                        <option value="Mỹ">Mỹ</option>
		                        <option value="Pháp">Pháp</option>
		                        <option value="Trung">Trung Quốc</option>
		                        <option value="Nga">Nga</option>
		                        <option value="Việt">Việt Nam</option>
		                        <option value="Ấn">Ấn Độ</option>
		                        <option value="Hồng">Hồng Kông</option>
		                        <option value="Thái">Thái Lan</option>
		                        <option value="Hàn">Hàn Quốc</option>
		                        <option value="Belgium">Belgium</option>
		                        <option value="Nhật">Nhật</option>
		                        <option value="Đức">Đức</option>
		                        <option value="Ai Cập">Ai Cập</option>
		                    </select>
		        		</div>
		        	</div>
		        	<br>
		            <div class="row" id="parent">
						<c:forEach var="p" items="${list}">
		                <div class="col-xl-12 col-md-12 col-lg-12 filter ${p.theloaiphim.maTheLoai}">
		             		<div class="row filter2 ${p.quocGia }">
			             		 <div class="single_expert mb-40 col-sm-3 ">
			                        <div class="expert_thumb">
			                            <ul class="caption-style-4">
			                                <li>
			                                    <a href="/ChiTietPhim/${p.maPhim}"><img class="img-fluid" src="/img/phim/${p.hinhPhim}">
			                                    </a>
			                                </li>
			                            </ul>
			                        </div>
			                   </div>
		             		  	<div class="experts_name text-justify mx-4 col-sm-8">
		                            <a href="/ChiTietPhim/${p.maPhim}"><h3>${p.tenPhim}</h3></a>
		                            <Strong>Thể loại : </Strong><i>${p.theloaiphim.tenTheLoai }</i>
		                            <br>
		                            <hr>
		                            <p>${p.noiDung}</p>
		                        </div>                    
		             		</div>    
		                </div>
		            	</c:forEach> 
		            </div>
		        </div>
		    </div> 
        </div>
    </div>
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
    <script>
    var $btnsF = $('.filter').change(function () {
        if (this.value == 'all') {
            $('#parent > div').fadeIn(450);
        } else {
            var $el = $('.' + this.value).fadeIn(450);
            $('#parent > div').not($el).hide();
        }
    });
    
    var $btnsF2 = $('.filter2').change(function () {
        if (this.value == 'all') {
            $('#parent > div > div').fadeIn(450);
        } else {
            var $el = $('.' + this.value).fadeIn(450);
            $('#parent > div > div').not($el).hide();
        }
    });

    </script>
</body>

</html>