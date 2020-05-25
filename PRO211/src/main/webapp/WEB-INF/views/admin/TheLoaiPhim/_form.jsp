<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form modelAttribute="form">
	<div class="form-group">
		<label>Mã thể loại</label>
		<form:input path="maTheLoai" required="required" class="form-control"/>
		<form:errors path="maTheLoai" style="color:red"></form:errors>
	</div>
	<div class="form-group">
		<label>Tên thể loại</label>
		<form:input path="tenTheLoai" required="required" class="form-control"/>
		<form:errors path="tenTheLoai" required="required" style="color:red"></form:errors>
	</div>
	
	<div class="form-group">
		<button class="btn btn-primary" formaction="/admin/TheLoaiPhim/create">Create</button>
		<button class="btn btn-warning" formaction="/admin/TheLoaiPhim/update">Update</button>
		<button class="btn btn-danger" formaction="/admin/TheLoaiPhim/delete">Delete</button>
		<a class="btn btn-info" href="/admin/TheLoaiPhim/index">Reset</a>
	</div>
</form:form>