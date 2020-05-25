<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/./css/owl.carousel.min.css">
<link rel="stylesheet" href="/./css/magnific-popup.css">
<link rel="stylesheet" href="/./css/font-awesome.min.css">
<link rel="stylesheet" href="/./css/themify-icons.css">
<link rel="stylesheet" href="/./css/slicknav.css">
<link rel="stylesheet" href="/./css/admin.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet"
	href=" https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
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
				<div class="col-xl-10 col-lg-10"
					style="padding: 0px 25px 25px 25px;">
					<div class="content">
						<h3>Danh sách nhân viên</h3>
						<div class="table_style">
							<table id="example" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th scope="col">Mã nhân viên</th>
										<th scope="col">Tên nhân viên</th>
										<th scope="col">Ngày sinh</th>
										<th scope="col">Giới tính</th>
										<th scope="col">Chức vụ</th>
										<th scope="col">Email</th>
										<th scope="col">Số điện thoại</th>
										<th scope="col">Địa chỉ</th>
										<th scope="col">Mật khẩu</th>
										<th scope="col">Sửa</th>
										<th scope="col">Xóa</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="nv" items="${listNV}">
										<tr>
											<th scope="row">${nv.maNhanVien}</th>
											<td>${nv.tenNhanVien}</td>
											<td>${nv.ngaySinh}</td>
											<td>${nv.gioiTinh ? 'Nam' : 'Nữ'}</td>
											<td>${nv.chucVu ? 'Quản lý' : 'Nhân viên'}</td>
											<td>${nv.email}</td>
											<td>${nv.soDT}</td>
											<td>${nv.diaChi}</td>
											<td>${nv.matKhau}</td>
											<td><a href="/admin/nhanvien/edit/${nv.maNhanVien}">Edit</a></td>
											<td><a href="/admin/nhanvien/delete/${maNV}/${nv.maNhanVien}">Delete</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="form_style">
						<div class="p-3 mb-2 bg-dark text-white">${message}</div>
							<form:form method="post" action="admin/nhanvien/create"
								modelAttribute="form">
								<div class="row">

									<form:input path="maNhanVien" readonly="true" type="hidden"
										class="form-control" />

									<div class="form-group col">
										<label>Tên nhân viên</label>
										<form:input path="tenNhanVien" class="form-control"
											required="required" />
										<form:errors path="tenNhanVien" style="color:red"></form:errors>
									</div>
								</div>

								<div class="row">

									<div class="form-group col">
										<label>Mật khẩu</label>
										<form:password path="matKhau" showPassword="true"
											class="form-control" required="required" />
										<form:errors path="matKhau" style="color:red"></form:errors>
									</div>

									<div class="form-group col">
										<label>Ngày sinh</label> <input type="date"
											class="form-control" data-date-format="dd-MM-yyyy"
											value="${form.ngaySinh}" id="ngaySinh1"
											onchange="myfunction()" required="required" />
										<form:input path="ngaySinh" id="ngaySinh2"
											class="form-control" type="hidden" />
										<form:errors path="ngaySinh" style="color:red"></form:errors>
									</div>

								</div>
								<div class="row">
									<div class="form-group col">
										<label>Giới tính</label>
										<div class="form-check">
											<form:radiobutton path="gioiTinh" value="False"
												class="form-check-input" />
											<Label class="form-check-label">Nữ</Label>
										</div>
										<div class="form-check">
											<form:radiobutton path="gioiTinh" value="True"
												class="form-check-input" checked="true" />
											<label class="form-check-label">Nam</label>
										</div>
									</div>

									<div class="form-group col">
										<label>Chức vụ</label>
										<div class="form-check">
											<form:radiobutton path="chucVu" value="False"
												class="form-check-input" checked="true" />
											<Label class="form-check-label">Nhân viên</Label>

										</div>
										<div class="form-check">
											<form:radiobutton path="chucVu" value="True"
												class="form-check-input" />
											<label class="form-check-label">Quản lý</label>
										</div>
									</div>
								</div>


								<div class="row">
									<div class="form-group col">
										<label>Email</label>
										<form:input path="email" class="form-control"
											readonly="${readonly}" required="required" />
										<form:errors path="email" style="color:red"></form:errors>
									</div>

									<div class="form-group col">
										<label>Số điện thoại</label>
										<form:input path="soDT" class="form-control"
											required="required" />
										<form:errors path="soDT" style="color:red"></form:errors>
									</div>
								</div>


								<div class="form-group">
									<label>Địa chỉ</label>
									<form:input path="diaChi" class="form-control"
										required="required" />
									<form:errors path="diaChi" style="color:red"></form:errors>
								</div>

								<div class="form-group">
									<button formaction="/admin/nhanvien/create"
										class="btn btn-success">Save</button>
									<button class="btn btn-alert"
										formaction="/admin/nhanvien/clear" ${clear}>Clear</button>
									<button class="btn btn-warning" formaction="/admin/nhanvien"
										${_new}>New</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function myfunction() {
		document.getElementById("ngaySinh2").value = document
				.getElementById("ngaySinh1").value;
	}
</script>
</html>

