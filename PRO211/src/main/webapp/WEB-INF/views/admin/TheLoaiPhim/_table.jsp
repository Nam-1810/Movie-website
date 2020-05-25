<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
  <table id="example" class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>Mã thể loại</th>
			<th>Tên thể loại</th>
			<th></th>
		</tr>
	</thead>
	<tbody >
	<c:forEach var="c" items="${listTL}">
		<tr>
			<td>${c.maTheLoai}</td>
			<td>${c.tenTheLoai}</td>
			<td><a href="/admin/TheLoaiPhim/edit/${c.maTheLoai}">Edit</a></td>
		</tr>
	</c:forEach>
	</tbody>
	
</table>
