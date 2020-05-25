<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

				<h3>Bảng chi tiết vé</h3>
								<table id="example2" class="table table-striped table-bordered" style="width:100%">
									<thead>
										<tr>
											<th>Mã chi tiết</th>
											<th>Mã đặt vé</th>
											<th>Mã vé</th>
											<th>Mã lịch chiếu</th>
											<th>Sửa</th>
											<th>Xóa</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="ct" items="${listChiTiet}">
											<tr>
											<th>${ct.maChiTietVe}</th>
												<td>${ct.datve.maDatVe}</td>
												<td>${ct.ve.maVe }</td>
												<td>${ct.ve.lichchieu.maLichChieu}</td>
												<td><a href="/admin/VePhim/ChiTiet/edit/${ct.maChiTietVe}">Edit</a></td>
												<td><a href="/admin/VePhim/ChiTiet/delete/${ct.maChiTietVe}">Delete</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<form:form method="post" action="/admin/VePhim/UpdateCT" modelAttribute="formChiTiet">
									<div class="row">
										<div class="form-group col-sm-6">
											<label>Mã chi tiết đặt vé</label>
											<form:input path="maChiTietVe" class="form-control" readonly="true"/> 
										</div>
										
										<div class="form-group col-sm-6">
											<label>Mã đặt vé</label>
											<form:select path="datve.maDatVe" class="form-control">
												<form:options items="${listDatVe}" itemValue="maDatVe" itemLabel="maDatVe" />
											</form:select>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-sm-6">
											<label>Mã vé</label>
											<form:select path="ve.maVe" class="form-control" disabled="${disabled }">
												<form:options items="${listVe}" itemValue="maVe" itemLabel="maVe"/>
											</form:select>
										</div>
				
										<div class="form-group col-sm-6">
											<label>Tên phim</label>
											<input type="text" value="${formChiTiet.ve.lichchieu.phim.tenPhim }" class="form-control" readonly/>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-sm-6">
											<label>Thời gian bắt đầu</label>
											<fmt:parseDate pattern="HH:mm" value="${formChiTiet.ve.lichchieu.suatchieu.gioBatDau}" var="parsedTimeStart"/> 
											<fmt:formatDate pattern="HH:mm" value="${parsedTimeStart}" var="timeStartText"/>
											<input type="text" value="${timeStartText}" class="form-control" readonly/>
										</div>
										
										<div class="form-group col-sm-6">
											<label>Thời gian kết thúc</label>
											<fmt:parseDate pattern="HH:mm" value="${formChiTiet.ve.lichchieu.suatchieu.gioKetThuc}" var="parsedTimeEnd"/> 
											<fmt:formatDate pattern="HH:mm" value="${parsedTimeEnd}" var="timeEndText"/>
											<input type="text" value="${timeEndText}" class="form-control" readonly/>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-sm-4">
											<label>Tên phòng</label>
											<input type="text" value="${formChiTiet.ve.lichchieu.phongchieuphim.tenPhong }" class="form-control" readonly/>
										</div>
									
										<div class="form-group col-sm-4">
											<label>Mã ghế</label>
											<input type="text" value="${formChiTiet.ve.ghengoi.maGhe }" class="form-control" readonly/>
										</div>
				
										<div class="form-group col-sm-4">
											<label>Tên chi nhánh</label>
											<input type="text" value="${formChiTiet.ve.lichchieu.phongchieuphim.chinhanh.tenChiNhanh }" class="form-control" readonly/>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group">
											<Button class="btn btn-primary" formaction="/admin/VePhim/UpdateCT">Update</Button>
										</div>
										
									</div>		
							</form:form>