  ///Chọn ghế và hiển thị danh sách ghế
		
	  allSeats = document.querySelectorAll('.seat');
	  allId = document.querySelectorAll('.id');
	  var counter = 1;
	  var list = [];
	  var soGhe = 0;
	  var soVe= 0;
	  
	  $(document).ready(function(){
		  $(".soVe").change(function(){
			  soVe = document.getElementById("soVe").value;
		  });
		});
	 
	  
	  $(document).ready(function(){
		  $(".soVe").change(function(){
			  document.getElementById("tongTien").innerHTML = document.getElementById("giaVe").value * Number(soVe);
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
	                    this.style.Color = 'black';
						counter--;
						list.splice( list.indexOf(value), 1 );
						document.getElementById("counter").innerHTML = counter-1;			
						document.getElementById("gheId").innerHTML = list;	
						
						}
	                else{
	                    this.style.backgroundColor = 'lightgreen';
	                    this.style.Color = 'white';
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

     	/// Tạo id cho ghế và button ghế trên danh sách
        $(document).ready(function() {
            $(".btn-chon").each(function(i) {
                $(this).attr('id',"chon" + (i + 1));
            });
            $(".id-chon").each(function(i) {
                $(this).attr('id',"chon" + (i + 1));
            });
        });