<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="p-3 mb-2 bg-dark text-white">${message}</div>
<form:form modelAttribute="form">
	<div class="form-group">
		<label>Mã ghế</label>
		<form:input path="maGhe" class="form-control" maxlength="3" pattern="[G][0-9][0-9]"/>
	</div>
	<div class="form-group">
			<label>Tên phòng</label>
			<form:select path="phongchieuphim.maPhong"
				class="form-control form-control-lg">
				<form:options items="${listPC}" class="form-control"
					itemValue="maPhong" itemLabel="tenPhong" />
			</form:select>
		</div>

		<div class="form-group">
			<button class="btn btn-primary" formaction="/admin/GheNgoi/create">Create</button>
			<button class="btn btn-warning" formaction="/admin/GheNgoi/update">Update</button>
			<button class="btn btn-danger"data-confirm="Bạn có muốn xóa hình này?" formaction="/admin/GheNgoi/delete">Delete</button>
			<button class="btn btn-info"><a style="color: white;" href="/admin/GheNgoi/index">Reset</a></button>
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