<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đánh giá</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/themify-icons.css">
    <link rel="stylesheet" href="/css/slicknav.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/style2.css">
</head>

<body>
    <!-- header-start -->
   		<jsp:include page="../template/header.jsp"/>
    <!-- header-end -->
    <!-- header-end -->
    <div class="cinema">
    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(/img/hero_bg_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
            <h1 class="text-white font-weight-light text-uppercase font-weight-bold">Đánh giá</h1>
          </div>
        </div>
      </div>
    </div>  
        <div class="container">
            <form:form action="/DanhGia/create" modelAttribute="formDanhGia" class="p-5 bg-white was-validated">
              <h4>${message }</h4>
              <form:input path="maDanhGia" hidden="hidden"/>
              <form:input path="phim.maPhim"  hidden="hidden"/>
			  <form:input path="khachhang.maKhachHang" hidden="hidden"/>
			  
              <div class="row form-group">
                <div class="col-md-6">
                  <label class="text-black" for="subject">Tên phim</label> 
                  <input  class="form-control" value="${ formDanhGia.phim.tenPhim}" readonly/>
                </div>
                
                <div class="col-md-6">
                  <label class="text-black" for="subject">Điểm</label> 
                  <form:input class="form-control" path="diem" type="number" min="1" max="10"/>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="message">Nội dung</label> 
                  <form:textarea path="chiTiet" id="message" cols="30" rows="7" class="form-control" placeholder="Vui lòng nhập nội dung..."/>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Gửi thông tin" class="btn btn-primary py-2 px-4 text-white">
                </div>
              </div>
            </form:form>
           
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
</body>

</html>