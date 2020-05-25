<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h3>Bảng đặt vé</h3>
								<table id="example1" class="table table-striped table-bordered" style="width:100%">
									<thead>
										<tr>
											<th>Mã đặt vé</th>
											<th>Mã khách hàng</th>
											<th>Tên khách hàng</th>
											<th>Mã nhân viên</th>
											<th>Tên nhân viên</th>
											<th>Ngày đặt</th>
											<th>Sửa</th>
											<th>Xóa</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="dv" items="${listDatVe}">
											<tr>
												<th>${dv.maDatVe}</th>
												 <td>${dv.khachhang.maKhachHang}</td> 
												<td>${dv.khachhang.tenKhachHang}</td>
												<td>${dv.nhanvien.maNhanVien}</td>
												<td>${dv.nhanvien.tenNhanVien}</td>
												<td>
													<fmt:parseDate pattern="yyyy-MM-dd" value="${dv.ngayDat}" var="parsedDate" /> 
													<fmt:formatDate pattern="dd/MM/yyyy" value="${parsedDate}" />
												</td> 
												<td><a href="/admin/VePhim/DatVe/edit/${dv.maDatVe}">Edit</a></td>
												<td><a href="/admin/VePhim/DatVe/delete/${dv.maDatVe}">Delete</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<hr>
								<h3 class="from-group">Cập nhật thông tin đặt vé</h3>
								<form:form method="post" action="/admin/VePhim/UpdateDV" modelAttribute="formDatVe">
								<div class="row">
										<div class="form-group col-sm-4">
											<label>Mã đặt vé</label>
											<form:input path="maDatVe" class="form-control" readonly="true"/> 
										</div>
												
										<div class="form-group col-sm-4">
											<label>Mã nhân viên</label>
											<input value="${formDatVe.nhanvien.maNhanVien }" class="form-control" id="maNV" readonly/> 
										</div>
										
										<div class="form-group col-sm-4">
											<label>Mã khách hàng</label>
											<input value="${formDatVe.khachhang.maKhachHang}" class="form-control" id="maKH" readonly/> 
										</div>
														
										<div class="form-group col-sm-6">
											<label>Tên khách hàng</label>
											<form:select path="khachhang.maKhachHang" class="form-control" id="tenKH">
												<form:options items="${listKH}" itemValue="maKhachHang" itemLabel="tenKhachHang" />
											</form:select>
										</div>
										
										<div class="form-group col-sm-6">
											<label>Tên nhân viên</label>
											<form:select path="nhanvien.maNhanVien" class="form-control" id="tenNV">
												<form:options items="${listNV}" itemValue="maNhanVien" itemLabel="tenNhanVien" />
											</form:select>
										</div>
										
										<div class="form-group col-sm-6">
											<label>Ngày đặt vé</label>
											<form:input path="ngayDat" class="form-control"/> 
										</div>
										
								</div>
										<div class="form-group">
											<Button class="btn btn-primary" formaction="/admin/VePhim/UpdateDV">Update</Button>
										</div>	
								</form:form>