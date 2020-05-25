<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="/./css/owl.carousel.min.css">
<link rel="stylesheet" href="/./css/magnific-popup.css">
<link rel="stylesheet" href="/./css/font-awesome.min.css">
<link rel="stylesheet" href="/./css/themify-icons.css">
<link rel="stylesheet" href="/./css/slicknav.css">
<link rel="stylesheet" href="/./css/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>

 
<script>
	$(document).ready(function() {
		$('#example1').DataTable();
	});
</script>
<script>
	$(document).ready(function() {
		$('#example2').DataTable();
	});
</script>
<meta charset="utf-8">
<title>Quản lý vé</title>
</head>
<body>
<jsp:include page="../../../admin_template/header.jsp"/>
	<div class="article">
		<div class="container-fluid">
			<div class="row">
				<jsp:include page="../../../admin_template/navigation.jsp"/>
				<div class="col-xl-10 col-lg-10" style="padding: 20px;">
					<div>
						<ul class="nav nav-tabs"  id="myTab">
							<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#quanLyVe">Quản lý đặt vé</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#chiTiet">Chi tiết đặt vé</a></li>
						</ul>
						<div class="tab-content">
							<div id="quanLyVe" class="tab-pane active">
								<br>
								<jsp:include page="./_DatVe.jsp"/>
							</div>
							<div id="chiTiet" class="tab-pane fade">
								<br>
								<jsp:include page="./_ChiTietDatVe.jsp"/>
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
</body>
<script>
var tenkh = document.getElementById('tenKH');
var makh = document.getElementById('maKH');


function getSelectedOptionKH(tenkh) {
    var optKH;
    for ( var i = 0, len = tenkh.options.length; i < len; i++ ) {
    	optKH = tenkh.options[i];
        if ( optKH.selected === true ) {
            break;
        }
    }
    return optKH;
}

	document.getElementById('tenKH').onchange = function () {
		makh.value = tenkh.value;    
	}
</script>
<script>
var tennv = document.getElementById('tenNV');
var manv = document.getElementById('maNV');

function getSelectedOptionNV(tennv) {
    var optNV;
    for ( var i = 0, len = tennv.options.length; i < len; i++ ) {
    	optNV = tennv.options[i];
        if ( optNV.selected === true ) {
            break;
        }
    }
 
    return optNV;
}
    document.getElementById('tenNV').onchange = function () {
    	manv.value = tennv.value;    
    };

</script>
<script>
	$('#myTab a').click(function(e) {
		  e.preventDefault();
		  $(this).tab('show');
		});
	
		// store the currently selected tab in the hash value
		$("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
		  var id = $(e.target).attr("href").substr(1);
		  window.location.hash = id;
		});
	
		// on load of the page: switch to the currently selected tab
		var hash = window.location.hash;
		$('#myTab a[href="' + hash + '"]').tab('show');
</script>
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
</html>