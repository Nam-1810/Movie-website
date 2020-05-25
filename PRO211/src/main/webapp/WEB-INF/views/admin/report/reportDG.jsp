<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet"
	href=" https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/./css/owl.carousel.min.css">
<link rel="stylesheet" href="/./css/magnific-popup.css">
<link rel="stylesheet" href="/./css/font-awesome.min.css">
<link rel="stylesheet" href="/./css/themify-icons.css">
<link rel="stylesheet" href="/./css/slicknav.css">
<link rel="stylesheet" href="/./css/style.css">
<link rel="stylesheet" href="/./css/admin.css">
<meta charset="utf-8">
<title>Report</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script>
     google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
        	  ['Phim', 'Điểm trung bình'],
              <c:forEach var="array" items="${data4}">
              ["${array[0]}",${array[1]}],
              </c:forEach>
        ]);

        var options = {
          title: 'Thống kê điểm phim',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      };
    </script>
</head>
<body>
	<jsp:include page="../../../admin_template/header.jsp"/>
	<div class="article">
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="../../../admin_template/navigation.jsp"/>
				<div class="col-xl-10 col-lg-10" style="padding: 5%;">
					<h1>Thống kê đánh giá</h1>
					<hr>
					<br>
					<table class="table table-hover ">
						<thead>
							<tr>
								<th>Tên phim</th>
								<th> Điểm</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="array" items="${data4}">
								<tr>
									<td>${array[0]}</td>
									  <td>${array[1]}</td> 
					
								</tr>
							</c:forEach>
						</tbody>
					</table>
						 <div id="curve_chart" style="width: 900px; height: 500px"></div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>