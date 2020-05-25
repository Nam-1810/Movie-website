<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<style  type="text/css">
		.red{
			background-color: red;
		}
	
		.seat {
            height: 50px;
            width: 50px;
			margin-right: 10px;
            border: 1px solid gray;
           cursor:pointer;
		   color: black;
		   display: flex;
		  align-items: center;
		  justify-content: center;
		  font-weight: bold;
        }

        .walk{
            padding-left:80px;
        }
        #driver {
            background-color:gray;          
            height: 80px;
			font-size : 50px;
			color: white;
			 display: flex;
			align-items: center;
		  justify-content: center;
		  font-weight: bold;
        }

		#table1 {

		  border-collapse:separate; 
		  border-spacing: 0 1em;
		  margin-left: 100px;
		  width: 50%;
			margin: 0 auto;
		}

	</style>
	
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>

<script>

$(document).ready(function() {
    $('#example').DataTable();
} );

</script>
<title>Quản lý vé</title>
</head>
<body onload="myFunction()" ng-app="">
	<jsp:include page="../../../admin_template/header.jsp"/>
    <div class="article">
        <div class="container-fluid">
            <div class="row">
               <jsp:include page="../../../admin_template/navigation.jsp"/>
                <div class="col-xl-10 col-lg-10" style="padding:30px;">
						<div class="row">
							<jsp:include page="./_insertDSP.jsp"/>
						</div>
						<jsp:include page="./_insertDV.jsp"/>
						<br>
						<jsp:include page="./_insertCT.jsp"/>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	   ///Chọn ghế và hiển thị danh sách ghế
		
	  allSeats = document.querySelectorAll('.seat');
	  allId = document.querySelectorAll('.id');
	  var counter = 1;
	  var list = [];
	  var soGhe = 0;
	  var soVe= 0;
	  function getSoGhe() {
		  return soVe = document.getElementById("soGhe").value;
	  };
	  
	  $(document).ready(function(){
		  $("#bb").click(function(){
			  document.getElementById("giaVe").innerHTML = document.getElementById("giaVeLC").value * Number(soVe);
		  });
		});

		  
	  document.getElementById("gheId").innerHTML = list;
        for (var i = 0; i < allSeats.length; i++) {
            var seat = allSeats[i];
            seat.addEventListener('click', function () {
                var bgclr = this.style.backgroundColor;
				var value = this.value;
				if(counter <= soVe){
					if(bgclr =='lightgreen'){
	                    this.style.backgroundColor = '#f0f0f0';
						counter--;
						list.splice( list.indexOf(value), 1 );
						document.getElementById("counter").innerHTML = counter-1;			
						document.getElementById("gheId").innerHTML = list;	
						
						}
	                else{
	                    this.style.backgroundColor = 'lightgreen';
						counter++;
						list.push(value)
						document.getElementById("counter").innerHTML = counter-1;
						document.getElementById("gheId").innerHTML = list;
						;
	               }
				}else{
					if(bgclr =='lightgreen'){
	                    this.style.backgroundColor = '#f0f0f0';
						counter--;
						list.splice( list.indexOf(value), 1 );
						document.getElementById("counter").innerHTML = counter-1;			
						document.getElementById("gheId").innerHTML = list;	
						
						}
				}
                
            }, false);	 
        }
        
        ///Gửi lên danh sách ghế
        $(function() {
			$(".btn-save").click(function() {
				var array = JSON.stringify(list);
				$("input[name=array]").val(array);
			})
		})
</script>
<script>
     	/// Tạo id cho ghế và button ghế trên danh sách
        $(document).ready(function() {
            $(".btn-chon").each(function(i) {
                $(this).attr('id',"chon" + (i + 1));
            });
            $(".id-chon").each(function(i) {
                $(this).attr('id',"chon" + (i + 1));
            });
        });
</script>

<script>   
	///Gửi mã lịch chiếu đã chọn lên server và refesh trang
	
     $(document).ready(function() {
     	   $('.LichChieu').each(function() {
     	      $(this).click(function(){
     	          var id = $(this).attr('id');
     	          var maLC = document.getElementById(id).innerHTML;
     	          document.getElementById("maLichChieuInput").value = maLC; 
     	          $.ajax({
   					type : "POST",
   					url:"/admin/VePhim/maLichChieu",
   					data:{maLC: maLC},
   					success: function(response) {
   						location.reload(); 
   					}
   				}) 
     	      });
     	   });
     	});
</script>

<script>
	///Lấy ngày tách ra ngày tháng năm riêng biệt
	n =  new Date();
	y = n.getFullYear();
	m = n.getMonth() + 1;
	d = n.getDate();

	///Lấy ngày tháng hiện tại set cho lịch nhỏ nhất
    var today = new Date().toISOString().split('T')[0];
    document.getElementsByName("setTodaysDate")[0].setAttribute('min', today);
    
    //Load lấy ngày hôm nay là ngày mặt định trên ô chọn lịch
    function myFunction(){	
		today =  new Date();
		document.getElementById("ngayDat1").valueAsDate = today; 
	};

    ///Set lên ô ngày đặt form:input theo kiểu yyyy/MM/dd mặc định
    document.getElementById("ngayDat2").value = y + "-" + m + "-" + d;

 	/// OnChange khi chọn ngày đặt tự điền vào ô form:input
	function myfunc(){
		document.getElementById("ngayDat2").value = document.getElementById("ngayDat1").value;
	};
</script>
</html>