<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
    $(document).ready(function () {
        $('#example').DataTable();
        
    });
    $(document).on('click', ':not(form)[data-confirm]', function(e){
        if(!confirm($(this).data('confirm'))){
          e.stopImmediatePropagation();
          e.preventDefault();
    		}
    });

    $(document).on('submit', 'form[data-confirm]', function(e){
        if(!confirm($(this).data('confirm'))){
        	e.stopImmediatePropagation();
          e.preventDefault();
    		}
    });

    $(document).on('input', 'select', function(e){
        var msg = $(this).children('option:selected').data('confirm');
        if(msg != undefined && !confirm(msg)){
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
                <div class="col-xl-10 col-lg-10" style="padding:20px;">
					<h2>Suất Chiếu Phim</h2>
					<table id="example" class="table table-striped table-bordered" style="width:100%">
						<thead>
							<tr>
								<th>Mã suất chiếu</th>
								<th>Giờ bắt đầu</th>
								<th>Giờ kết thúc</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="s" items="${list}">
								<tr>
									<td>${s.maSuatChieu}</td>
									<td>${s.gioBatDau}</td>
									<td>${s.gioKetThuc}</td>
									<td><a href="/admin/SuatChieu/edit/${s.maSuatChieu}">Edit</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>
					<div class="alert alert-warning" role="alert">${message}</div>
					<form:form modelAttribute="form">
						<div class="form-group">
							<label>Mã suất chiếu</label>
							<form:input path="maSuatChieu" class="form-control" />
								<form:errors path="maSuatChieu" style="color:red"></form:errors>
						</div>
						<div class="form-group">
							<label>Giờ bắt đầu</label>
							<form:input path="gioBatDau" class="form-control" />
							<form:errors path="gioBatDau" style="color:red"></form:errors>
						</div>
						<div class="form-group">
							<label>Giờ kết thúc</label>
							<form:input path="gioKetThuc" class="form-control" />
								<form:errors path="gioKetThuc" style="color:red"></form:errors>
						</div>
						<div class="form-group">
							<button class="btn btn-warning" formaction="/admin/SuatChieu/update">Lưu</button>
							<button class="btn btn-danger"data-confirm="Bạn có muốn xóa mục này?" formaction="/admin/SuatChieu/delete">Xóa</button>
							<button class="btn btn-default" formaction="/admin/SuatChieu/list">Làm
								mới</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>