<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<form:form modelAttribute="form" enctype="multipart/form-data">
	<div class="row">
		<div class="col">
			<label>Mã phim</label>
			<form:input path="maPhim" class="form-control" />
		</div>
		<div class="col">
			<label>Đạo diễn</label>
			<form:input path="daoDien" class="form-control" />
			<form:errors path="daoDien" style="color:red"></form:errors>

		</div>
		
		<div class="col">
			<label>Diễn viên</label>
			<form:input path="dienVien" class="form-control" />
			<form:errors path="dienVien" style="color:red"></form:errors>

		</div>
		
		<div class="form-group col-sm-6">
			<label>Tên Phim</label>
			<form:input path="tenPhim" class="form-control" />
			<form:errors path="tenPhim" style="color:red"></form:errors>

		</div>
		<div class="form-group col-sm-6 ">
			<label>Nội dung</label>
			<form:input path="noiDung" class="form-control" />
		</div>
		<div class="form-group col-sm-6">
			<label>Thời lượng</label>
			<form:input path="thoiLuong" class="form-control" />
		</div>

		<div class="form-group col-sm-6">
			<label>Thể loại phim</label>
			<form:select path="theloaiphim.maTheLoai"
				class="form-control form-control-lg">
				<form:options items="${listtl}" class="form-control"
					itemValue="maTheLoai" itemLabel="tenTheLoai" />
			</form:select>
		</div>
		<div class="form-group col-sm-6">
			<label>Ngày phát hành</label>
			<form:input path="ngayPhatHanh" class="form-control" />
			<form:errors path="ngayPhatHanh" style="color:red"></form:errors>
		</div>
		<div class="form-group col-sm-6">
			<label>Nhà sản xuất</label>
			<form:input path="nhaSanXuat" class="form-control" />
			<form:errors path="nhaSanXuat" style="color:red"></form:errors>
		</div>
		<div class="form-group col-sm-6">
			<label>Quốc gia</label>
			<form:input path="quocGia" class="form-control" />
			<form:errors path="quocGia" style="color:red"></form:errors>
		</div>
		
		<div class="form-group col-sm-6">
			<label>Ngày bắt đầu</label>
			<input type="date" class="form-control" data-date-format="dd-MM-yyyy" value="${form.ngayBatDau}"  id="ngayBatDau1" onchange="batDau()" required="required"/>
			<form:input path="ngayBatDau" id="ngayBatDau2" class="form-control" type="hidden"/>
			<form:errors path="ngayBatDau" style="color:red"></form:errors>
		</div>
		
		<div class="form-group col-sm-6">
			<label>Ngày kết thúc</label>
			<input type="date" class="form-control" data-date-format="dd-MM-yyyy" value="${form.ngayKetThuc}"  id="ngayKetThuc1" onchange="ketThuc()" required="required"/>
			<form:input path="ngayKetThuc" id="ngayKetThuc2" class="form-control" type="hidden"/>
			<form:errors path="ngayKetThuc" style="color:red"></form:errors>
		</div>
		
		<div class="form-group">
			<label>Ảnh</label> <input type="file" name="up_photo"
				onchange="openFile(this)" />
			<form:hidden path="hinhPhim" />
			<img style="max-width: 30%; max-height: 300px;"
				src="/img/phim/${form.hinhPhim}"> <input type="hidden"
				name="old_photo" value="${form.hinhPhim}" />
			<p>${form.hinhPhim}
		</div>
		<div class="form-group col-sm-12">
			<button class="btn btn-primary" formaction="/admin/Phim/create">Create</button>
			<button class="btn btn-warning" formaction="/admin/Phim/update">Update</button>
			<button class="btn btn-danger"
				data-confirm="Bạn có muốn xóa mục này?"
				formaction="/admin/Phim/delete">Delete</button>
			<a class="btn btn-info" href="/admin/Phim/index">Reset</a>
		</div>
</form:form>
<script>
	$(document).on('click', ':not(form)[data-confirm]', function(e) {
		if (!confirm($(this).data('confirm'))) {
			e.stopImmediatePropagation();
			e.preventDefault();
		}
	});

	$(document).on('submit', 'form[data-confirm]', function(e) {
		if (!confirm($(this).data('confirm'))) {
			e.stopImmediatePropagation();
			e.preventDefault();
		}
	});

	$(document).on('input', 'select', function(e) {
		var msg = $(this).children('option:selected').data('confirm');
		if (msg != undefined && !confirm(msg)) {
			$(this)[0].selectedIndex = 0;
		}
	});
</script>