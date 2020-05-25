<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<head>
	<link rel="stylesheet" href="../css/DatVe.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
	<link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/themify-icons.css">
    <link rel="stylesheet" href="../css/slicknav.css">
    <link rel="stylesheet" href="../css/style.css">
  	<script src="../js/DatVe.js"></script>
<meta charset="UTF-8">
<title>Đặt vé</title>
</head>
<body ng-app="">
	  <!-- header-start -->
   		<jsp:include page="../template/header.jsp"/>
    <!-- header-end -->
	
	<div class="container">
		<br>
		<h2>Chọn vé</h2>
		<br>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">Loại vé</th>
		      <th scope="col">Số lượng</th>
		      <th scope="col">Giá</th>
		      <th scope="col">Tổng (VNĐ)</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">Người lớn /Vé 2D</th>
		      <td><input type="number"  min=0 max=5 style="width:80px; height:30px" id="soVe" class="soVe form-control" autocomplete="off"/></td>
		      <td>
		      	<label><fmt:formatNumber type="number" groupingUsed="true" value="${lichChieu.gia}" /></label>
		      	<input type="hidden" value="${lichChieu.gia}" class="giaVe" id="giaVe"/>
		      </td>
		      <td><p id="tongTien"><fmt:formatNumber type="number" groupingUsed="true" pattern="#,###" value=""/></p></td>
		    </tr>
		  </tbody>
		</table>
		<br>
		<div style="border:1px solid gray; width:800; height:500" class="form-group">
			<div id="driver">Màn hình</div>
			<table id="table1" style="margin-top:10px">
				<c:forEach var="A" items="${listVe}" begin="0" end="9">
					<td><button class="seat" type="button" value="${A.ghengoi.maGhe}" ng-class="{red: ${A.trangThai}}" ng-disabled="${A.trangThai}">${A.ghengoi.maGhe}</button></td>
				 </c:forEach>
				        
				 <tr>
				   	<c:forEach var="B" items="${listVe}" begin="10" end="19">
				    	<td><button class="seat" type="button" value="${B.ghengoi.maGhe}"  ng-class="{red: ${B.trangThai}}" ng-disabled="${B.trangThai}">${B.ghengoi.maGhe}</button></td>
				    </c:forEach>
				</tr>
				        
		        <tr>
		        	<c:forEach var="C" items="${listVe}" begin="20" end="29">
		                <td><button class="seat" type="button" value="${C.ghengoi.maGhe}" ng-class="{red: ${C.trangThai}}" ng-disabled="${C.trangThai}">${C.ghengoi.maGhe}</button></td>
		        	</c:forEach>
		        </tr>
				        
		        <tr>
		        	<c:forEach var="D" items="${listVe}" begin="30" end="39">
		                <td><button class="seat" type="button" value="${D.ghengoi.maGhe}" ng-class="{red: ${D.trangThai}}" ng-disabled="${D.trangThai}">${D.ghengoi.maGhe}</button></td>
		        	</c:forEach>
		        </tr>
				        
		        <tr>
		       		<c:forEach var="E" items="${listVe}" begin="40" end="49">
		            	<td><button class="seat" type="button" value="${E.ghengoi.maGhe}" ng-class="{red: ${E.trangThai}}" ng-disabled="${E.trangThai}">${E.ghengoi.maGhe}</button>
			        </c:forEach>
			    </tr>
	        </table>
	        
			<div class="row">
				<div style="margin-left: 40px" class="col">
						<label> Số ghế đã chọn :</label>
						<label id="counter"></label>
				</div>
				<div style="margin-left: 40px" class="col">
						<label>Mã ghế bạn đã chọn :</label> 
						<label id="gheId"></label> 
				</div>
			</div>
		</div>
		<form:form action="/DatVe/create" method="post" modelAttribute="formDatVe">
			<form:input path="maDatVe" type="hidden" />						
			<input type="hidden" name="array">	
			<div class="form-group float-right">
				<button type="submit" class="btn btn-save btn-primary">Xác nhận</button>
			</div>
		</form:form>
	</div>
	<div  class="clearfix">
	</div>
	
	    <!-- footer -->
    <jsp:include page="../template/footer.jsp"/>
</body>
 <script src="../js/vendor/jquery-1.12.4.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.counterup.min.js"></script>
    <script src="../js/jquery.slicknav.min.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/datePicke.js"></script>
    <script src="../js/dangkyKH.js"></script>
    <script src="../js/DatVe.js"></script>

</html>