<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


    		<h3>${message}</h3>
		<div class="card">
		    <div class="card-header"><h1 style="text-align: center"> Thông tin cá nhân</h1></div>
		    <div class="card-body">
		    <form:form modelAttribute="formCTKH" action="/UpdateKhachHang" id="myform">
			<form:input type="hidden" path="maKhachHang"  class="form-control" />
			<div class="row">
			<div class="form-group  col-sm-6  ">
				<label >Tên khách hàng</label>
				<form:input path="tenKhachHang" class="form-control" />
				<form:errors path="tenKhachHang" style="color:red"></form:errors>
			</div>
			 <div class="form-group  col-sm-6  ">
				<label >Ngày sinh</label>
				<form:input path="ngaySinh" class="form-control" />
				<form:errors path="ngaySinh" style="color:red"></form:errors>
			</div>
			<div class="form-group  col-sm-6  ">
				<label >Giới tính</label>
				<form:input path="gioiTinh" class="form-control" />
			</div>
			<div class="form-group  col-sm-6  ">
				<label >Email</label>
				<form:input readonly="true"  path="email" class="form-control" />
			</div>
			
			<div class="form-group  col-sm-6  ">
				<label >Địa chỉ</label>
				<form:input path="diaChi" class="form-control" />
				<form:errors path="diaChi" style="color:red"></form:errors>
			</div>
			
				
			<form:input type="hidden" path="matKhau" class="form-control" />
		
		<div class="form-group  col-sm-6  ">
			<label >Số điện thoại</label>
			<form:input path="soDT" class="form-control" />
			<form:errors path="soDT" style="color:red"></form:errors>
		</div> 
		</div>
		</form:form>
		</div> 
	    <div class="card-footer">
	    	<button type="submit" class="btn btn-warning" form="myform">Update</button>
	    </div>
	  </div>