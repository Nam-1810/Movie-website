<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<meta charset="utf-8">
<title>Report</title>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    var mydata=[
        ['Phim', 'Giá trị'],
        <c:forEach var="array" items="${data}">
        ["${array[0]}",${array[1]}],
        </c:forEach>
       
      ]
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable(mydata);

        var options = {
          title: 'Thống kê CGV'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    <script>
     google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
        	  ['Phim', 'Giá trị'],
              <c:forEach var="array" items="${data}">
              ["${array[0]}",${array[1]}],
              </c:forEach>
        ]);

        var options = {
          title: 'Thống kê doanh số',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      };
    </script>
</head>
<body class="container">
	<h1>Thống kê</h1>
	<table class="table table-hover ">
		<thead>
			<tr>
				<th>MaPhim</th>
				<th>Thống kê</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="array" items="${data}">
				<tr>
					<td>${array[0]}</td>
					<%-- <td>${array[1]}</td> --%>
	<td><f:formatNumber value="${array[1]}" pattern="#,###.00"/> VND </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	 <div id="piechart" style="width: 900px; height: 500px;"></div>
	 <div id="curve_chart" style="width: 900px; height: 500px"></div>
</body>
</html>