<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
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
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
  <style>
*,
*::before,
*::after {
  box-sizing: border-box;
}

body {
  color: #363c44;
  font-size: 14px;
  font-family: 'Roboto', sans-serif;
}

.ticket-design {
  top: 50%;
  left: 50%;
  background: #fff;
  border: 2px solid #99d298;
  box-shadow: 0 5px 30px rgba(0, 0, 0, .2);
  overflow: hidden;
}

.ticket-design small {
  display: block;
  font-size: 12px;
  color: #a2a9b3;
  margin-bottom: 2px;
}

.ticket-design header {
  padding: 12px 20px;
  height: 80px;
}

.ticket-design header .logo img {
  float: left;
  width: 60px;
  height: 60px;
  margin-right: 10px;
}

.ticket-design .rightSection .eventDetails {
  position: relative;
}

.ticket-design .mainSection:after,
.ticket-design .mainSection .leftSection::after,
.ticket-design .mainSection .times::after,
.ticket-design .rightSection .infos:after,
.ticket-design .rightSection .eventDetails::after,
.ticket-design .rightSection .infos .places::after,
.ticket-design .rightSection .infos .times::after,
.ticket-design .strap::after {
  content: '';
  display: table;
  clear: both;
}

.ticket-design .rightSection .eventDetails .eventDetail {
  padding: 20px 18px;
  float: left;
}

.ticket-design .rightSection .eventDetails .eventDetail:nth-child(2) {
  float: right;
}

.ticket-design .rightSection .eventDetails .eventDetail strong {
  font-size: 30px;
  font-weight: 300;
  line-height: 1;
}

.ticket-design .rightSection .eventDetails .eventDetail small {
  margin-bottom: 0;
  margin-left: 3px;
  font-size : 14px;
}

.ticket-design .rightSection .infos {
  border-top: 2px solid #99d298;
  border-bottom: 2px solid #99d298;
  width: 100%;
}

.ticket-design .rightSection .infos .places,
.ticket-design .rightSection .infos .times {
  width: 50%;
  height: 80px;
  padding: 10px 0;
}

.ticket-design .rightSection .infos .places {
  float: left;
}

.ticket-design .rightSection .infos .times {
  float: right;
}

.ticket-design .rightSection .infos .times strong {
  transform: scale(0.9);
  transform-origin: left bottom;
}

.ticket-design .rightSection .infos .places {
  border-right: 1px solid #99d298;
}

.ticket-design .rightSection .infos .places small {
  color: #97a1ad;
  font-size:14px;
}

.ticket-design .rightSection .infos .box {
  padding: 10px 20px 10px;
  float: left;
}

.ticket-design .rightSection .infos .box small {
  font-size: 14px;
}

.ticket-design .mainSection {
  border-top: 2px solid #99d298;
  position: relative;
}

.ticket-design .mainSection .leftSection {
  width: 20%;
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  border-right: 2px solid #99d298;
}

.ticket-design .mainSection .leftSection .qrcode img {
  width: 200px;
  height: 200px;
  position: absolute;
  top: 50%;
  bottom: 55%;
  left: 0;
  right: 0;
  margin: auto;
}

.ticket-design .mainSection .rightSection {
  width: 80%;
  float: right;
}

.ticket-design .mainSection .times strong {
  transform: scale(0.9);
  transform-origin: left bottom;
}

.ticket-design .mainSection .box {
  padding: 10px 20px 10px;
  float: left;
  font-size: 20px;
}

.ticket-design .mainSection .box small {
  font-size: 14px;
}

.ticket-design .strap {
  clear: both;
  position: relative;
  /*border-top: 1px solid #99d298;*/
}

.ticket-design .strap .box {
  padding: 23px 0 20px 20px;
}

.ticket-design .strap .box div {
  margin-bottom: 15px;
}

.ticket-design .strap .box div small {
  font-size: 14px;
}

.ticket-design .strap .box div strong {
  font-size: 20px;
}

.ticket-design .strap .box sup {
  font-size: 8px;
  position: relative;
  top: -5px;
}

.ticket-design .strap .eventLogo img {
  position: absolute;
  top: 20px;
  right: 20px;
  width: 200px;
  height: 100px;
}
  </style>
</head>
<body>
	 <!-- header-start -->
   		<jsp:include page="../template/header.jsp"/>
    <!-- header-end -->
    <br>
	<div class="container">
		<h1>Vé của bạn :</h1>
		<h4>${message }</h4>
		<form method="post">
			<button type="submit" class="btn btn-warning" formaction="/SendVeEmail">Gửi đến email</button>
		</form>
		<br>
		<hr>
			<c:forEach var="ct" items="${veList}">
			  <div class="ticket-design">
			  <header>
			    <div class="logo">
			      <img src="../img/logo.png">
			    </div>
			    <h2>${ct.ve.lichchieu.phim.tenPhim} 123123</h2>
			  </header>
			  <div class="mainSection">
			    <div class="leftSection">
			      <div class="qrcode">
			        <img src="../img/qr.png">
			      </div>
			    </div>
			    <div class="rightSection">
			      <div class="eventDetails">
			        <div class="eventDetail">
			          <small>Tên khách hàng :</small>
			          <br>
			          <strong>${ct.datve.khachhang.tenKhachHang }123</strong>
			        </div>
			      </div>
			      <div class="infos">
			        <div class="places">
			          <div class="box">
			            <small>Ngày giờ</small>
												
			            <strong><fmt:parseDate pattern="yyyy-MM-dd" value="${ct.ve.lichchieu.ngayChieu }" var="parsedDate"/><fmt:formatDate pattern="dd/MM/yyyy" value="${parsedDate}" /> (${fn:substring(ct.ve.lichchieu.suatchieu.gioBatDau,0,5)} / ${fn:substring(ct.ve.lichchieu.suatchieu.gioKetThuc,0,5) })</strong>
			          </div>
			        </div>
			        <div class="times">
			          <div class="box">
			            <small>Phòng / Chi Nhánh</small>
			            <strong>${ct.ve.lichchieu.phongchieuphim.tenPhong } / ${ct.ve.lichchieu.phongchieuphim.chinhanh.tenChiNhanh }</strong>
			          </div>
			        </div>
			      </div>
			      <div class="strap">
			        <div class="box">
			          <div class="passenger">
			            <small>Mã ghế</small>
			            <strong>${ct.ve.ghengoi.maGhe }</strong>
			          </div>
			          <div class="date">
			            <small>Giá tiền</small>
			            <strong>${ct.ve.lichchieu.gia }</strong>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div><br>
		  </c:forEach>
		</div>
		<br>
	<jsp:include page="../template/footer.jsp"/>
</body>
</html>