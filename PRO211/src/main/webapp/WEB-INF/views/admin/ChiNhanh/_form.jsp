<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="p-3 mb-2 bg-dark text-white">${message}</div>
<form:form modelAttribute="form">
	<div class="form-group">
		<label>Mã chi nhánh</label>
		<form:input path="maChiNhanh" required="required" class="form-control" />
		<form:errors path="maChiNhanh" style="color:red"></form:errors>
	</div>
	<div class="form-group">
		<label>Tên chi nhánh</label>
		<form:input path="tenChiNhanh" required="required"
			class="form-control" />
		<form:errors path="tenChiNhanh" style="color:red"></form:errors>
	</div>
	<div class="form-group">
		<label>Địa chỉ</label>
		<form:input path="diaChi" required="required" class="form-control" />
		<form:errors path="diaChi" style="color:red"></form:errors>
	</div>
	<div class="form-group">
		<button class="btn btn-primary" formaction="/admin/ChiNhanh/create">Create</button>
		<button class="btn btn-warning" formaction="/admin/ChiNhanh/update">Update</button>
		<button class="btn btn-danger"
			data-confirm="Bạn có muốn mục này không?"
			formaction="/admin/ChiNhanh/delete">Delete</button>
		<a class="btn btn-info" href="/admin/ChiNhanh/index">Reset</a>
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