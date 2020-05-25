<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.show {
	  display: block;
	}
	.htThanhToan {
	  display: none;
	}
	.hide{
	display: none
	}
</style>

<meta charset="UTF-8">
<title>Thanh toán</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
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
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
</head>
<body>
  <!-- header-start -->
   		<jsp:include page="../template/header.jsp"/>
    <!-- header-end -->
    
	<div class="container">
		<div class="p-3">
			<div><span id="time">20:00</span> minutes!</div>
		<form:form method="post" action="/ThanhToan/create" modelAttribute="formChiTiet">
		<div class="row">
			<form:input path="maChiTietVe" type="hidden"/>	
			<form:input path="datve.maDatVe" value="${datVe.maDatVe}" class="form-control" type="hidden"/> 
				<div class="form-group col-sm-12">
					<label>Hình thức thanh toán</label>
					<select id="htThanhToan" class=" htThanhToan form-control">
				        <option value="0" selected>Vui lòng chọn</option>
				        <option value="1">Ví MoMo</option>
				        <option value="1">Thẻ ngân hàng</option>
				        <option value="1">Thẻ Visa/Master Card</option>
			        </select>
				</div>
				
				<div class="form-group col-sm-12" id="parent">
					<label>Mã thẻ thanh toán</label>
					<input class="form-control" type="text" name="maThe" value="" placeholder="Vui lòng nhập mã thẻ"/> 
				</div>
				
				<div class="form-group col-sm-12">
					<label>Họ tên</label>
					<input class="form-control" type="text" value="${tenKH}" readonly/> 
				</div>
				<div class="form-group col-sm-12">
					<label>Email</label>
					<input class="form-control" type="text" value="${email}" readonly/> 
				</div>
				<div class="form-group col-sm-12">
					<label>Số điện thoại</label>
					<input class="form-control" type="text" value="${soDT}" readonly/> 
				</div>
				
			<div class="form-group"> 
				<button formaction="/ThanhToan/create" class="btn-save btn btn-default">Save</button>
				<button formaction="/ThanhToan/DatVe/Delete" class="btn-save btn btn-default">Hủy</button>
			</div>
		</div>
	</form:form> 
		</div>
	</div>
	 <!-- footer -->
    <jsp:include page="../template/footer.jsp"/>
	
</body>
<script>
var $btns = $('.htThanhToan').change(function() {
	  if (this.value == '1') {
	    $('#parent').fadeIn(450);
	  } else {
	    var $el = $('.' + this.value).fadeIn(450);
	    $('#parent').not($el).hide();
	  }
	});
</script>
<script>
	/////CountDown
const display = document.getElementById('time');
const fiveminutes = 20 * 60 * 1000;

function timer(endTime) {
  var myTimer = setInterval(function() {
    let now = new Date().getTime();
    let diff = endTime - now;
    let minutes = Math.floor(diff % (1000 * 60 * 60) / (1000 * 60));
    let seconds = Math.floor(diff % (1000 * 60) / 1000);

    minutes = minutes < 10 ? `0${minutes}` : minutes;
    seconds = seconds < 10 ? `0${seconds}` : seconds;
    display.textContent = minutes + ":" + seconds;
    if (diff <= 0) {
      display.textContent = "TIME IS UP!";
      clearInterval(myTimer);
	  	$.ajax({
			type : "POST",
			url:"/ThanhToan/DatVe/Delete",
			success: function(response) {
				alertify.alert("Hết giờ, vé của bạn sẽ bị hủy");
			}
})
    }
  }, 100);
}

window.onload = timer(new Date().getTime() + fiveminutes);
</script>
</html>