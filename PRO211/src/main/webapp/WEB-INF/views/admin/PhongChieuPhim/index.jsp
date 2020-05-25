<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="utf-8">
<title>Phòng chiếu phim</title>
<!-- <link href="/static/css/bootstrap.min.css" rel="stylesheet"/> -->
</head>
<body>
	<jsp:include page="../../../admin_template/header.jsp"/>
	<div class="article">
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="../../../admin_template/navigation.jsp"/>
				<div class="col-xl-10 col-lg-10"
					style="padding: 0px 25px 25px 25px;">
					<div class="content">
						<h3>Phòng chiếu phim</h3>
						<div class="table_style">
							<jsp:include page="_table.jsp" />
						</div>
						<div class="form_style">
							<div class="p-3 mb-2 bg-dark text-white">${message}</div>
							<jsp:include page="_form.jsp" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</html>