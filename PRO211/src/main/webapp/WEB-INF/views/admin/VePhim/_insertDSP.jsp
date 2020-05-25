<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="form-group col">
								<h2>Lịch phim đang chiếu</h2>
								<table id="example" class="table table-striped table-bordered" style="width:100%">
									<thead>
										<tr>
											<th>Mã lịch chiếu</th>
											<th>Tên phim</th>
											<th>Tên chi nhánh</th>
											<th>Tên phòng</th>
											<th>Giờ bắt đầu</th>
											<th>Giờ kết thúc</th>
											<th>Ngày bắt đầu</th>
											<th>Ngày kết thúc</th>
											<th>Giá</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="lc" items="${listLichChieu}">
										<tr>
											<td class="id-chon">${lc.maLichChieu}</td>
											<td>${lc.phim.tenPhim}</td>
											<td>${lc.phongchieuphim.chinhanh.tenChiNhanh }</td>
											<td>${lc.phongchieuphim.tenPhong}</td>
											<td>
												<fmt:parseDate pattern="HH:mm" value="${lc.suatchieu.gioBatDau}" var="parsedTimeStart" /> 
												<fmt:formatDate pattern="HH:mm" value="${parsedTimeStart}" /></td>
											<td>
												<fmt:parseDate pattern="HH:mm" value="${lc.suatchieu.gioKetThuc}" var="parsedTimeEnd" /> 
												<fmt:formatDate pattern="HH:mm" value="${parsedTimeEnd}" /></td>
											<td>
												<fmt:formatDate pattern="dd/MM" value="${lc.phim.ngayBatDau}" />
											</td>
											<td>
												<fmt:formatDate pattern="dd/MM" value="${lc.phim.ngayKetThuc}" />
											</td>
											<td>${lc.gia }</td>
											<td><button class="btn-chon LichChieu btn btn-primary">Chọn</button></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>