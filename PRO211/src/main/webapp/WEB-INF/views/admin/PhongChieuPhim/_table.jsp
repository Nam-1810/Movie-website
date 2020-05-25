<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<table id="example" class="table table-striped table-bordered" style="width:100%">
	<thead>
		<tr>
			<th>Mã phòng</th>
			<th>Tên phòng</th>
			<th>Mã rạp</th>
			<th>Tổng số ghế</th>
			<th>Sửa</th>
			<th>Xóa</th>
		</tr>
	</thead>
	<tbody >
	<c:forEach var="c" items="${listPC}">
		<tr>
			<td>${c.maPhong}</td>
			<td>${c.tenPhong}</td>
			<td>${c.chinhanh.maChiNhanh}</td>
			<td>${c.tongSoGhe}</td>
			<td><a href="/admin/PhongChieuPhim/edit/${c.maPhong}">Edit</a></td>
			<td><a href="/admin/PhongChieuPhim/delete/${c.maPhong}">Delete</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<script >
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
<script>

$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>