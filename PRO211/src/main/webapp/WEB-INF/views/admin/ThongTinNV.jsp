<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

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
    
</head>
<body>
 <jsp:include page="../../admin_template/header.jsp"/>
	<div class="article">
		<div class="container-fluid">
			<div class="row">
	    	 	<jsp:include page="../../admin_template/navigation.jsp"/>
                <div class="col-xl-10 col-lg-10" style="padding:100px;">
                	<h3>${message}</h3>	               	
					<form:form modelAttribute="formCTNV">	
					<div class="card">				
					    <div class="card-header"><h1 style="text-align: center"> Thông tin cá nhân</h1></div>
					    <div class="card-body">	
							<form:input type="hidden" path="maNhanVien"  class="form-control" />
							<div class="row">
							<div class="form-group  col-sm-6  ">
								<label >Tên Nhân viên</label>
								<form:input path="tenNhanVien" class="form-control" />
							</div>
							<div class="form-group  col-sm-6  ">
								<label >Ngày sinh</label>
								<form:input path="ngaySinh" class="form-control" />
							</div>
							<div class="form-group  col-sm-6  ">
								<label >Giới  tính</label>
								<form:input path="gioiTinh" class="form-control" />
							</div>
						
								
								<form:input type="hidden" path="chucVu" class="form-control" />
						
							<div class="form-group  col-sm-6  ">
								<label >Email</label>
								<form:input readonly="true"  path="email" class="form-control" />
							</div>
							
								
								<form:input type="hidden" path="matKhau" class="form-control" />
							
							<div class="form-group  col-sm-6  ">
								<label >Địa chỉ</label>
								<form:input path="diaChi" class="form-control" />
							</div>
							<div class="form-group  col-sm-6  ">
								<label >Số điện thoại</label>
								<form:input path="soDT" class="form-control" />
							</div>
						</div>
						<button class="btn btn-warning" formaction="/admin/CTNV/update">Update</button>
						</div>
					</div>
						
						</form:form>
					
					</div>
				</div>
			</div>
		</div>
</body>
</html>