<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Phim đang chiếu</title>
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

</head>

<body>
    <!-- header-start -->
   		<jsp:include page="../template/header.jsp"/>
    <!-- header-end -->

    <!-- offers_area_start -->
    <div class="buy_ticket">
        <div class="container">
           <h3>Phim đang chiếu</h3>
            <div class="row">
            	<c:forEach var="p" items="${list}">
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="single_expert mb-40">
                        <div class="expert_thumb">
                            <ul class="caption-style-4">
                                <li>
                                    <a href="/ChiTietPhim/${p.maPhim}"><img src="/img/phim/${p.hinhPhim}" alt="">
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

    <!-- footer -->
    <jsp:include page="../template/footer.jsp"/>

    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/main.js"></script>
	<script src="js/datePicke.js"></script>
</body>
</html>