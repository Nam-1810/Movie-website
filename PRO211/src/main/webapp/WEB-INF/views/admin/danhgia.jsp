<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quản lý phim</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/./css/owl.carousel.min.css">
<link rel="stylesheet" href="/./css/magnific-popup.css">
<link rel="stylesheet" href="/./css/font-awesome.min.css">
<link rel="stylesheet" href="/./css/themify-icons.css">
<link rel="stylesheet" href="/./css/slicknav.css">
<link rel="stylesheet" href="/./css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" href=" https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script>
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</head>
<body>
	<jsp:include page="../../admin_template/header.jsp"/>
	<div class="article">
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="../../admin_template/navigation.jsp"/>
				<div class="col-xl-10 col-lg-10" style="padding: 0px 25px 25px 25px;">
					<div class="content">
						<h3>Quản lí đánh giá</h3>
						<div class="table_style">
							<h1>Danh sách đánh giá</h1>
							<br>
							<table id="example" class="table table-striped table-bordered" style="width:100%">
								<thead>
									<tr>
										<th scope="col">Mã đánh giá</th>	
										<th scope="col">Mã khách hàng</th>	
										<th scope="col">Mã phim</th>
										<th scope="col">Tên phim</th>	
										<th scope="col">Điểm</th>
										<th scope="col">Chi tiết</th>
										<th scope="col">Xóa</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dg" items="${danhgia}">
								  		<tr>
										    <th scope="row">${dg.maDanhGia}</th>
										    <td>${dg.khachhang.maKhachHang}</td>
										    <td>${dg.phim.maPhim}</td>	
										    <td>${dg.phim.tenPhim}</td>				  
										    <td>${dg.diem}</td>
										    <td><a href="/admin/danhgia/chitiet/${dg.maDanhGia}">Detail</a></td>
										    <td><a href="/admin/danhgia/delete/${dg.maDanhGia}">Delete</a></td>
								 		</tr>
								 	</c:forEach>
								 </tbody>
							  </table>
						</div>
						<br>
						<hr>
						<br>
						<div>
							<h3>Chi tiết đánh giá</h3>
							<form:form modelAttribute="form">
								<div class="row">
									<div class="form-group col-sm-6">
										<label>Mã đánh giá</label>
										<form:input path="maDanhGia" class="form-control" readonly="true"/>
									</div>
									<div class="form-group col-sm-6">
										<label>Mã khách hàng</label>
										<form:input path="khachhang.maKhachHang" class="form-control" readonly="true"/>
									</div>
									<div class="form-group col-sm-6">
										<label>Tên Phim</label>
										<form:input path="phim.tenPhim" class="form-control" readonly="true"/>
									</div>
									<div class="form-group col-sm-6 ">
										<label>Điểm</label>
										<form:input path="diem" class="form-control" readonly="true"/>
									</div>
									<div class="form-group col-sm-12">
										<label>Chi tiết đánh giá</label>
										<form:textarea  path="chiTiet" class="form-control" readonly="true"/>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/main.js"></script>
	<script>
		$('#datepicker').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}
		});
		$('#datepicker2').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}

		});
		$(document).ready(function() {
			$('.js-example-basic-multiple').select2();
		});
	</script>
	<script>
		var menu = document.querySelectorAll('.main-header-area > ul > li');
		for (var i = 0; i < menu.length; i++) {
			menu[i].addEventListener("click", function() {
				// Ẩn hết menu con
				var menuList = document
						.querySelectorAll('.main-header-area > ul  > li > ul');
				for (var j = 0; j < menuList.length; j++) {
					menuList[j].style.display = "none";
				}
				this.children[2].style.display = "block";
			});
		}
	</script>
</body>


</html>
