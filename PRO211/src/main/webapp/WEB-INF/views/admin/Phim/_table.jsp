<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!-- <h3>LIST OF Hinh Phim</h3> -->


<table id="example" class="table table-striped table-bordered" style="width:100%">
	<thead>
		<tr>
		 <th>Mã phim</th> 
			<th>Đạo diễn</th>
			<th>Diễn viên</th>
			<th>Tên phim</th>
			<th>Thể loại</th>
			<th>Ngày phát hành</th>
			<th>Nhà sản xuất</th>
			<th>Thời lượng</th>
			<th>Quốc gia</th>
			<th>Ngày bắt đầu</th>
			<th>Ngày kết thúc</th>
			<th>Hình</th>
			<th>Sửa</th>
		</tr>
	</thead>
	<tbody id="myTable">
		<c:forEach var="c" items="${listP}">
			<tr>
			 <td>${c.maPhim}</td>
				<td>${c.daoDien}</td>
				<td>${c.dienVien }</td>
				<td>${c.tenPhim}</td>
				<%-- <td>${c.noiDung}</td> --%>
				<td>${c.theloaiphim.maTheLoai}</td>
				<td>${c.ngayPhatHanh}</td>
				<td>${c.nhaSanXuat}</td>
				<td>${c.thoiLuong}</td>			
				<td>${c.quocGia}</td>
				<td>${c.ngayBatDau }</td>
				<td>${c.ngayKetThuc }</td>
				<td>${c.hinhPhim}</td>
				<td><a href="/admin/Phim/edit/${c.maPhim}">Edit</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
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