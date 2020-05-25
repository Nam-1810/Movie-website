<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

	<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">STT</th>
      <th scope="col">Ngày đặt</th>
      <th scope="col">Ngày chiếu</th>
      <th scope="col">Suất chiếu</th>
      <th scope="col">Tên phim</th>
      <th scope="col">Mã ghế</th>
      <th scope="col">Tên phòng</th>
      <th scope="col">Tên chi nhánh</th>
       <th scope="col">Giá</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="ct" items="${listVe}">
    <tr>
      <th scope="row">1</th>
      <fmt:parseDate pattern="yyyy-MM-dd" value="${ct.datve.ngayDat }" var="ngayDat" /> 
	  <fmt:parseDate pattern="yyyy-MM-dd" value="${ct.ve.lichchieu.ngayChieu }" var="ngayChieu" /> 
	  
      <td><fmt:formatDate pattern="dd/MM/yyyy" value="${ngayDat}" /></td>
      <td><fmt:formatDate pattern="dd/MM/yyyy" value="${ngayChieu}" /></td>
      <td>${fn:substring(ct.ve.lichchieu.suatchieu.gioBatDau,0,5) }</td>
      <td>${ct.ve.lichchieu.phim.tenPhim }</td>
      <td>${ct.ve.ghengoi.maGhe }</td>
      <td>${ct.ve.lichchieu.phongchieuphim.tenPhong }</td>
      <td>${ct.ve.lichchieu.phongchieuphim.chinhanh.tenChiNhanh }</td>
      <td>${ct.ve.lichchieu.gia }</td>
    </tr>
    </c:forEach>
  </tbody>
</table>

