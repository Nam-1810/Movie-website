<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="/./css/owl.carousel.min.css">
	<link rel="stylesheet" href="/./css/magnific-popup.css">
	<link rel="stylesheet" href="/./css/font-awesome.min.css">
	<link rel="stylesheet" href="/./css/themify-icons.css">
	<link rel="stylesheet" href="/./css/slicknav.css">
	<link rel="stylesheet" href="/./css/admin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


	<script>
	    $(document).ready(function () {
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
						<div class="table_style">
							<h5>${message}</h5>	
							<h1>Danh sách Vé</h1>
							<br>
							<table id="example"class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th scope="col">STT</th>
									<th scope="col">Mã vé</th>	
									<th scope="col">Mã lịch chiếu</th>	
									<th scope="col">Tên phim</th>	
									<th scope="col">Ngày chiếu</th>
									<th scope="col">Suất chiếu</th>
									<th scope="col">Mã ghế</th>
									<th scope="col">Tên phòng</th>	
									<th scope="col">Tên chi nhánh</th>		
									<th scope="col">Giá</th>		
									<th scope="col">Sửa</th>
									<th scope="col">Xóa</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="v" items="${ve}" varStatus="loop">
							 		<tr>
							 		    <th scope="row">${loop.index +1}</th>
								    <th scope="row">${v.maVe}</th>
								    <td>${v.lichchieu.maLichChieu}</td>
								    <td>${v.lichchieu.phim.tenPhim}</td>
								    <td>${v.lichchieu.ngayChieu}</td>
								    <td>${v.lichchieu.suatchieu.gioBatDau}</td>
								    <td>${v.ghengoi.maGhe}</td>
								    <td>${v.lichchieu.phongchieuphim.tenPhong}</td>
								    <td>${v.lichchieu.phongchieuphim.chinhanh.tenChiNhanh}</td>
								     <td>${v.lichchieu.gia}</td>
								    <td><a href="/admin/Ve/edit/${v.maVe}">Edit</a></td>
								    <td><a href="/admin/Ve/delete/${v.maVe}">Delete</a></td>
									</tr>
								</c:forEach>
								 </tbody>
							  </table>		    
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"> Xóa tất cả </button>
							</div>
							
							<br>
							<br>
							<hr>
							<div>
								<h4>Danh sách lịch chiếu phim</h4>
										<table id="example"class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th scope="col">Mã lịch chiếu</th>	
									<th scope="col">Tên phim</th>	
									<th scope="col">Ngày chiếu</th>
									<th scope="col">Suất chiếu</th>
									<th scope="col">Tên phòng</th>	
									<th scope="col">Số lượng ghế</th>
									<th scope="col">Tên chi nhánh</th>		
									<th scope="col">Giá</th>		
								</tr>
							</thead>
							<tbody>
								<c:forEach var="lc" items="${lichChieu}">
							  		<tr>
									    <th scope="row">${lc.maLichChieu}</th>
									    <td>${lc.phim.tenPhim}</td>
									    <td>${lc.ngayChieu}</td>
									    <td>${lc.suatchieu.gioBatDau}</td>
									    <td>${lc.phongchieuphim.tenPhong}</td>
									    <td>${lc.phongchieuphim.tongSoGhe }</td>
									    <td>${lc.phongchieuphim.chinhanh.tenChiNhanh}</td>
									    <td>${lc.gia}</td>
							 		</tr>
							 	</c:forEach>
							 </tbody>
							 </table>
							
							<ul class="nav nav-tabs" role="tablist">
							   <li class="nav-item">
							     <a class="nav-link active" data-toggle="tab" href="#home">Tạo vé</a>
							   </li>
							   <li class="nav-item">
							     <a class="nav-link" data-toggle="tab" href="#menu1">Tạo nhiều vé</a>
							   </li>
							 </ul>
							</div>
						<div class="form_style">
							 <!-- Tab panes -->
							 <div class="tab-content">
							   <div id="home" class="container tab-pane active"><br>
							     <h4>Tạo vé</h4>
							     <form:form method="post" action="admin/ve/create" modelAttribute="formVe">  		
							  	<form:input path="maVe" readonly="true" type="hidden" class="form-control"/>
							 
							  	<div class="row">
									<div class="form-group col">
										<label>Mã lịch chiếu</label>
										<form:input path="lichchieu.maLichChieu" class="form-control" required="required"/>
										<form:errors path="lichchieu.maLichChieu" style="color:red"></form:errors>
									</div>
							
									<div class="form-group col">
										<label>Mã ghế</label>
										<form:input path="ghengoi.maGhe" class="form-control" required="required"/>
										<form:errors path="ghengoi.maGhe" style="color:red"></form:errors>
									</div>
								</div>
								<div class="form-group">
										<label>Trạng thái</label>
										<div class="form-check">
											<form:radiobutton path="trangThai" value="False" class="form-check-input" checked="true"/>
											<Label class="form-check-label">Trống</Label>
							
										</div>
										<div class="form-check"> 
											<form:radiobutton path="trangThai" value="True" class="form-check-input"/>
											<label class="form-check-label">Không trống / Đã đặt</label>
										</div>
								</div>
								<div class="form-group">
									<button formaction="/admin/ve/create" class="btn btn-success">Save</button>
								</div>
							</form:form>
							    	</div>
							   <div id="menu1" class="container tab-pane fade"><br>
							     <h4>Tạo nhiều vé</h4>
							     <form:form method="post" action="admin/ve/createNhieuVe" modelAttribute="formNhieuVe">  		
							  	<form:input path="maVe" readonly="true" type="hidden" class="form-control"/>
							 
							  	<div class="row">
							  	
									<div class="form-group col">
										<label>Mã lịch chiếu</label>
										<form:input path="lichchieu.maLichChieu" showPassword="true" class="form-control" required="required"/>
										<form:errors path="lichchieu.maLichChieu" style="color:red"></form:errors>
									</div>
							
								</div>
								
								<div class="form-group">
									<button formaction="/admin/ve/createNhieuVe" class="btn btn-success">Save</button>
								</div>
							</form:form>
							   </div>	 
							 </div>
							
							<!-- The Modal -->
							 <div class="modal" id="myModal">
							 <form method="post" action="/admin/ve/deleteAll" method="post"> 		
							   <div class="modal-dialog">
							     <div class="modal-content">
							     
							       <!-- Modal Header -->
							       <div class="modal-header">
							         <h4 class="modal-title">Xóa tất cả vé theo mã lịch chiếu</h4>
							         <button type="button" class="close" data-dismiss="modal">&times;</button>
							       </div>
							       
							       <!-- Modal body -->
							       <div class="modal-body">
							         	
							  			<div class="row">	  	
											<div class="form-group col">
												<label>Mã lịch chiếu</label>
												<input type="text" name="maLichChieu" class="form-control" required="required"/>
											</div>
										</div>
									
							       </div>
							       
							       <!-- Modal footer -->
							       <div class="modal-footer">
							         <button class="btn btn-success">Xóa</button>
							         <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
							       </div>
							       
							     </div>
							   </div>
							   </form>
							  </div>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

