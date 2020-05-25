function setCookie(name,value,days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "")  + expires + "; path=/";
}
function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

//----------------------------------------------------------------------------------------------------------------


function addStudentCtrl($scope, $firebaseObject) {
    let ref = firebase.database().ref('students');
    let pushKey = ref.push().key;
    $scope.formData = $firebaseObject(ref.child(pushKey));
	
    $scope.add = function(){
		var email = document.getElementById('email').value;
		firebase.database().ref('students').orderByChild("Email").equalTo(email).once("value",snapshot => {
		if (snapshot.exists()) {
			alert('Email đã tồn tại');
			return true;
		}else{
			$scope.formData.$save();
			alert('Đăng ký thành công');
			window.location.href = 'index.html';
		  }
		});      
    }
};

function homeCtrl($scope, $firebaseObject){
    const ref = firebase.database().ref('students');
    $scope.students = $firebaseObject(ref);
};

function doiMK ($scope, $firebaseObject){
	$scope.updateMK = function(){
		var email = document.getElementById('email').value;
		var matkhaucu = document.getElementById('passwordOld').value;
		var matkhaumoi = document.getElementById('password').value;
		firebase.database().ref('students').orderByChild("Email").equalTo(email).once("value",snapshot => {
		if (snapshot.exists()) {
			snapshot.forEach(function(child){
			data = child.val();
			var pass = data.MatKhau;
				if (pass == matkhaucu) {
					child.ref.update({ MatKhau : matkhaumoi});
					alert('Cập nhật thành công');
					window.location.href = 'index.html';
				}else{
					alert('Sai mật khẩu');
				}
			});
		}else{		
			alert('Sai địa chỉ email');
		  }
		});      
	}
};

function dangNhap($scope, $firebaseObject){
	$scope.check = function(){		
		var email = document.getElementById('email').value;
		var matkhau = document.getElementById('matkhau').value;
		firebase.database().ref('students').orderByChild("Email").equalTo(email).once("value",snapshot => {
		if (snapshot.exists()) {
			snapshot.forEach(function(child){
			var data = child.val();
			var pass = data.MatKhau;
				if (pass == matkhau) {
					alert('Đang nhập thành công');
					setCookie('email',data.Email);					
					window.location.href = 'doithongtin.html';
				}else{
					alert('Sai mật khẩu');
				}
			});
		}else{		
			alert('Sai địa chỉ email');
		  }
		});      
	}
};


function quenMK($scope, $firebaseObject){
	$scope.layLaiMK = function(){		
		var email = document.getElementById('email').value;
		firebase.database().ref('students').orderByChild("Email").equalTo(email).once("value",snapshot => {
		if (snapshot.exists()) {
			snapshot.forEach(function(child){
			var data = child.val();
			var pass = data.MatKhau;
				alert("Mật khẩu của bạn là : "+pass);
				window.location.href = 'index.html';
			});
		}else{		
			alert('Sai địa chỉ email');
		  }
		});      
	}
};
	
function doiTT ($scope){
	var Email = getCookie('email');
	firebase.database().ref('students').orderByChild("Email").equalTo(Email).once("value",snapshot => {
		if (snapshot.exists()) {
			snapshot.forEach(function(child){
			var data = child.val();
			var ho = data.Ho;
			var ten = data.Ten;
			var ngaysinh = data.NgaySinh;
			var matkhau = data.MatKhau;
			var email = data.Email;
			var gioitinh = data.GioiTinh;
			var diachi = data.DiaChi;
			var sodt = data.SoDT;
			$scope.formData = 
				{
					Ho : ho,
					Ten : ten,
					NgaySinh : ngaysinh,
					MatKhau : matkhau,
					Email : email,
					GioiTinh : gioitinh,
					DiaChi : diachi,
					SoDT : sodt
				}	
			});
			document.getElementById("lname").focus(); 
			document.getElementById("fname").focus(); 
		}
		 $scope.edit = function(){
			snapshot.forEach(function(child){
				var update = child.val();
				child.ref.update(
					{
						Ho : $scope.formData.Ho,
						Ten : $scope.formData.Ten,
						NgaySinh : $scope.formData.NgaySinh,
						MatKhau : $scope.formData.MatKhau,
						Email : $scope.formData.Email,
						GioiTinh : $scope.formData.GioiTinh,
						DiaChi : $scope.formData.DiaChi,
						SoDT : $scope.formData.SoDT
					}
					);		
				alert('Cập nhật thành công');
				window.location.href = 'index.html';
			});
		 }
		});  
	
};	
angular
    .module('app')
    .controller('homeCtrl', homeCtrl)
    .controller('addStudentCtrl', addStudentCtrl)
	.controller('dangNhap', dangNhap)
	.controller('doiMK', doiMK)
	.controller('quenMK', quenMK)
	.controller('doiTT', doiTT)
    
 
