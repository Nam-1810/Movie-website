<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Chi tiet vé-->
						<h2>Tạo chi tiết đặt vé</h2>
								<hr>
						<form:form method="post" action="/admin/VePhim/createChiTiet" modelAttribute="formChiTiet">
								
								<form:input path="maChiTietVe" type="hidden"/>	
								
							<div class="row"> 
								<div class="form-group col-sm-6">
									<label>Mã khách hàng</label>
									<input class="form-control" type="text" value="${maKH}"/> 
								</div>
								<div class="form-group col-sm-6">
									<label>Tên khách hàng</label>
									<input class="form-control" type="text" value="${tenKH}"/> 
								</div>
								<div class="form-group col-sm-6">
									<label>Ngày đặt vé</label>
									<input class="form-control" type="text" value="${ngayDV}"/> 
								</div>
								
								<div class="form-group col-sm-6">
									<label>Mã đặt vé</label>
									<form:input path="datve.maDatVe" value="${maDV}" class="form-control"/> 
								</div>	
								
								<div class="form-group col-sm-6">
									<label>Mã lịch chiếu</label>
									<input id="maLichChieuInput" value="${maLC}" class="form-control"/> 
								</div>
							</div>	
							<br>
							<h3>Số lượng vé</h3>
							<hr>
							<div class="row">
								<div class="form-group col-sm-4">
									<label>Số vé</label>
									<input type="number" value="0" id="soGhe"	 class="form-control"/> 					
								</div>	
								
								<div class="form-group col-sm-2">
									<label>&emsp;</label>
									<button type="button" onclick="getSoGhe()" id="bb" class="btn btn-primary form-control">Xác nhận</button>				
								</div>	
							</div>
							<br>
								<div style="border:1px solid gray; width:800; height:500" class="form-group">
									<div id="driver">Màn hình</div>
									<table id="table1" style="margin-top:10px">
										<c:forEach var="A" items="${listVe}" begin="0" end="9">
											<td><button class="seat" type="button" value="${A.ghengoi.maGhe}" ng-class="{red: ${A.trangThai}}" ng-disabled="${A.trangThai}">${A.ghengoi.maGhe}</button></td>
										 </c:forEach>
										        
										 <tr>
										   	<c:forEach var="B" items="${listVe}" begin="10" end="19">
										    	<td><button class="seat" type="button" value="${B.ghengoi.maGhe}" ng-class="{red: ${B.trangThai}}" ng-disabled="${B.trangThai}">${B.ghengoi.maGhe}</button></td>
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
										
										<div style="margin-left: 40px" class="col">
											<label>Giá vé :</label> 
											<label id="giaVe"> </label> 
											<input type="hidden" value="${giaVe.gia}" id="giaVeLC"/>
										</div>
										<input type="hidden" name="array">	
									</div>
								</div>
								<div class="form-group col"> 
									<button formaction="/admin/VePhim/createChiTiet" class="btn-save btn btn-primary">Save</button>
								</div>
					</form:form> 