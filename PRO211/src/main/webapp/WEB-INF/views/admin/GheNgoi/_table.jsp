<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<table id="example" class="table table-striped table-bordered" style="width:100%">
	<thead>
		<tr>
			<th>Mã ghế</th>
			<th>Tên phòng</th>
			<th>Sửa</th>
		</tr>
	</thead>
	<tbody >
	<c:forEach var="c" items="${listGN}">
		<tr>
			<td>${c.maGhe}</td>	
			<td>${c.phongchieuphim.tenPhong}</td>
			<td><a href="/admin/GheNgoi/edit/${c.maGhe}">Edit</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
