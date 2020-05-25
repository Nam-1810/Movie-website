<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/./css/owl.carousel.min.css">
<link rel="stylesheet" href="/./css/magnific-popup.css">
<link rel="stylesheet" href="/./css/font-awesome.min.css">
<link rel="stylesheet" href="/./css/themify-icons.css">
<link rel="stylesheet" href="/./css/slicknav.css">
<link rel="stylesheet" href="/./css/style.css">
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

	$(document).on('click', ':not(form)[data-confirm]', function(e) {
		if (!confirm($(this).data('confirm'))) {
			e.stopImmediatePropagation();
			e.preventDefault();
		}
	});

	$(document).on('submit', 'form[data-confirm]', function(e) {
		if (!confirm($(this).data('confirm'))) {
			e.stopImmediatePropagation();
			e.preventDefault();
		}
	});

	$(document).on('input', 'select', function(e) {
		var msg = $(this).children('option:selected').data('confirm');
		if (msg != undefined && !confirm(msg)) {
			$(this)[0].selectedIndex = 0;
		}
	});
</script>
</head>
<body>
	<jsp:include page="../../../admin_template/header.jsp"/>
	<div class="article">
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="../../../admin_template/navigation.jsp"/>
				<div class="col-xl-10 col-lg-10" style="padding: 3%;">
					<ul class="list-inline">
					   <li class="list-inline-item"><a class="social-icon text-xs-center" target="_blank" href="/admin/LichChieu/list">Tất cả</a></li>
					   <li class="list-inline-item"><a class="social-icon text-xs-center" target="_blank" href="/admin/LichChieu/PhimDaChieu">Lịch phim đã chiếu</a> </li>
					   <li class="list-inline-item"><a class="social-icon text-xs-center" target="_blank" href="/admin/LichChieu/PhimDangChieu">Lịch phim đang chiếu</a> </li>
					   <li class="list-inline-item"><a class="social-icon text-xs-center" target="_blank" href="/admin/LichChieu/PhimSapChieu">Lịch phim sắp chiếu</a></li>
					</ul>
					<hr>
					<table id="example" class="table table-striped table-bordered"
						style="width: 100%">
						<thead>
							<tr>
								<th>Mã lịch chiếu</th>
								<th>Ngày bắt đầu</th>
								<th>Ngày kết thúc</th>
								<th>Mã phim</th>
								<th>Mã phòng</th>
								<th>Ngày chiếu</th>
								<th>Suất chiếu</th>
								<th>Sửa</th>
								<th>Xóa</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="l" items="${list}">
								<tr>
									<td>${l.maLichChieu}</td>
									<td>${l.phim.ngayBatDau}</td>
									<td>${l.phim.ngayKetThuc}</td>
									<td>${l.phim.maPhim}</td>
									<td>${l.phongchieuphim.maPhong}</td>
									<td>${l.ngayChieu }</td>
									<td>${l.suatchieu.maSuatChieu}</td>
									<td><a href="/admin/LichChieu/edit/${l.maLichChieu}">Edit</a></td>
									<td><a href="/admin/LichChieu/delete/${l.maLichChieu}">Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>
					<br>
					<hr>
					<h2>Danh sách phim</h2>
					<table class="table table-striped table-bordered"
						style="width: 100%">
						<thead>
							<tr>
								<th>Mã phim</th>
								<th>Tên phim</th>
								<th>Ngày bắt đầu</th>
								<th>Ngày kết thúc</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${listP}">
								<tr>
									<td>${p.maPhim}</td>
									<td>${p.tenPhim}</td>
									<td>${p.ngayBatDau}</td>
									<td>${p.ngayKetThuc}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>
					<hr>
					<h1>Lịch Chiếu Phim</h1>
					<form:form modelAttribute="form" class="row">
					
						<form:input path="maLichChieu" class="form-control" type="hidden"/>

						<div class="form-group col-sm-6">
							<label>Giờ bắt đầu</label>
							<form:select path="suatchieu.maSuatChieu"
								class="form-control form-control-lg">
								<form:options items="${listSC}" class="form-control"
									itemValue="maSuatChieu" itemLabel="gioBatDau" />
							</form:select>
							
						</div><p>
			
						<div class="form-group col-sm-6">
							<label>Ngày chiếu</label>
							<form:input path="ngayChieu" class="form-control" />
						</div>
						<div class="form-group col-sm-6">
							<label>Ten phim</label>
							<form:select path="phim.maPhim"
								class="form-control form-control-lg">
								<form:options items="${listP}" class="form-control"
									itemValue="maPhim" itemLabel="tenPhim" />
							</form:select>

						</div>
						<div class="form-group col-sm-6">
							<label>Mã phòng</label>
							<form:select path="phongchieuphim.maPhong"
								class="form-control form-control-lg">
								<form:options items="${listPCP}" class="form-control"
									itemValue="maPhong" itemLabel="tenPhong" />
							</form:select>
						</div>	
						<div class="form-group col-sm-12"></div>
						<div class="form-group col-sm-12">
							<button class="btn btn-primary"
								formaction="/admin/LichChieu/create">Thêm</button>
							<button class="btn btn-warning"
								formaction="/admin/LichChieu/update">Sửa</button>
							<button class="btn btn-danger"
								data-confirm="Bạn có muốn xóa hình này?"
								formaction="/admin/LichChieu/delete">Xóa</button>
							<button class="btn btn-default"
								formaction="/admin/LichChieu/list">Làm mới</button>
						</div>
					</form:form>
					<p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>