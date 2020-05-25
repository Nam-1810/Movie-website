<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form modelAttribute="form">
	<div class="form-group">
		<label>Mã phòng</label>
		<form:input path="maPhong" required="required" class="form-control" />
		<form:errors path="maPhong" style="color:red"></form:errors>

	</div>
	<div class="form-group">
		<label>Tên phòng</label>
		<form:input path="tenPhong" required="required" class="form-control" />
		<form:errors path="tenPhong" style="color:red"></form:errors>

	</div>
	<div class="form-group">
		<label>Tên rạp</label>
		<form:select path="chinhanh.maChiNhanh" 
			class="form-control form-control-lg">
			<form:options items="${listCN}" class="form-control"
				itemValue="maChiNhanh" itemLabel="tenChiNhanh" />
		</form:select>
	</div>
	<div class="form-group">
		<label>Tổng số ghê</label>
		<form:input path="tongSoGhe" type="number" required="required"
			min="10" max="50" class="form-control" />
	<form:errors path="tongSoGhe" style="color:red"></form:errors>

	</div>
	<div class="form-group">
		<button class="btn btn-primary"
			formaction="/admin/PhongChieuPhim/create">Create</button>
		<button class="btn btn-warning"
			formaction="/admin/PhongChieuPhim/update">Update</button>
		<button class="btn btn-danger"data-confirm="Bạn có muốn xóa hình này?"
			formaction="/admin/PhongChieuPhim/delete">Delete</button>
		<a class="btn btn-info" href="/admin/PhongChieuPhim/index">Reset</a>
	</div>
</form:form>
<script>
$(document).on('click', ':not(form)[data-confirm]', function(e){
    if(!confirm($(this).data('confirm'))){
      e.stopImmediatePropagation();
      e.preventDefault();
		}
});

$(document).on('submit', 'form[data-confirm]', function(e){
    if(!confirm($(this).data('confirm'))){
    	e.stopImmediatePropagation();
      e.preventDefault();
		}
});

$(document).on('input', 'select', function(e){
    var msg = $(this).children('option:selected').data('confirm');
    if(msg != undefined && !confirm(msg)){
        $(this)[0].selectedIndex = 0;
    }
});
</script>