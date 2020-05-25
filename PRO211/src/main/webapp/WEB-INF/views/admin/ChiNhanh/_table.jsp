<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<table id="example" class="table table-striped table-bordered" style="width:100%">
	<thead>
		<tr>
			<th>Mã chi nhánh</th>
			<th>Tên chi nhánh</th>
			<th>Địa chỉ</th>
			<th></th>
		</tr>
	</thead>
	<tbody >
	<c:forEach var="c" items="${listCN}">
		<tr>
			<td>${c.maChiNhanh}</td>
			<td>${c.tenChiNhanh}</td>
			<td>${c.diaChi}</td>
			<td><a href="/admin/ChiNhanh/edit/${c.maChiNhanh}">Edit</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>