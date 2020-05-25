<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h2>Tạo đặt vé</h2>
<hr>
<form:form method="post" action="admin/VePhim/createDatVe" modelAttribute="formDatVe">
	<div class="row">		
		<form:input path="maDatVe" type="hidden" />
		
		<div class="form-group col-sm-4">
			<label>Mã khách hàng</label>
			<form:select path="khachhang.maKhachHang" class="form-control">
				<form:option value="0" label="Please Select" />
				<form:options items="${listKH}" itemValue="maKhachHang" itemLabel="tenKhachHang" />
			</form:select>
		</div>
			
		<div class="form-group col-sm-4">
			<label>Mã nhân viên</label> 
			<form:input path="nhanvien.maNhanVien" value="${nhanvien.tenNhanVien}" class="form-control"/>
		</div>
			
		<div class="form-group col-sm-4">
			<label>Ngày đặt</label> 
			<input type="date" class="form-control" data-date-format="dd-MM-yyyy" value="" name="setTodaysDate" id="ngayDat1" onchange="myfunc();" />
			<form:input path="ngayDat" id="ngayDat2" class="form-control" type="hidden"/>
		</div>
		<div class="form-group col-sm-12"> 
			<button formaction="/admin/VePhim/createDatVe" class="btn btn-primary">Save</button>
		</div>
	</div>	
</form:form>	