<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<meta charset="utf-8">
<title>Report</title>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script>
     google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
        	  ['Phim', 'Giá trị'],
              <c:forEach var="array" items="${data}">
              ["${array[0]}",${array[2]}],
              </c:forEach>
        ]);

        var options = {
          title: 'Thống kê doanh số',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
     <script>
     google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
        	  ['Ngay', 'Giá trị'],
              <c:forEach var="array" items="${data5}">
              ["${array[0]}",${array[2]}],
              </c:forEach>
        ]);

        var options = {
          title: 'Thống kê doanh số theo ngày',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart1'));

        chart.draw(data, options);
      }
    </script> 
</head>
<body>
 <jsp:include page="../../../admin_template/header.jsp"/>
	<div class="article">
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="../../../admin_template/navigation.jsp"/>
                <div class="col-xl-10 col-lg-10" style="padding:5%;">
					<h1>Thống kê doanh thu theo phim</h1>
					<hr>
					<br>
				<table id="example"class="table table-striped table-bordered" style="width:100%">
						<thead>
							<tr>
								<th>MaPhim</th>
								<th>Số vé</th>
								<th>Doanh thu</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="array" items="${data}">
								<tr>
									<td>${array[0]}</td>
									 <td>${array[1]}</td>
					<td><f:formatNumber value="${array[2]}" pattern="#,###.00"/> VND </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<table id="example"class="table table-striped table-bordered" style="width:100%">
						<thead>
							<tr>
								<th>Ngay</th>
								<th>Số vé</th>
								<th>Doanh thu</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="array" items="${data5}">
								<tr>
									<td>${array[0]}</td>
									 <td>${array[1]}</td>
									  <td>${array[2]}</td>
					<td><f:formatNumber value="${array[3]}" pattern="#,###.00"/> VND </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					 <div id="curve_chart" style="width: 900px; height: 500px"></div>
					 	 <div id="curve_chart1" style="width: 900px; height: 500px"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>