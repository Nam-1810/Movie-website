<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html class="no-js" prefix="og: http://ogp.me/ns#">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Docmed</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/themify-icons.css">
    <link rel="stylesheet" href="/css/slicknav.css">
    <link rel="stylesheet" href="/css/style.css">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.2.1/firebase.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
    <style type="text/css">
        .comment {
            min-height: 100px;
            border: 1px dotted green;
            border-radius: 5px;
            margin: 5px;
            padding: 5px;
        }

        .show {
            display: block;
        }

        .filterDiv {
            display: none;
        }

        .hide {
            display: none
        }
    </style>
</head>

<body>
   		<jsp:include page="../template/header.jsp"/>

    <div class="movie_show">
        <div class="container">
            <jsp:include page="./_ChiTietPhim/_NoiDungPhim.jsp"/>
            <jsp:include page="./_ChiTietPhim/_LichChieu.jsp"/>
            <jsp:include page="./_ChiTietPhim/_CungTheLoai.jsp"/>
            
           <div ng-app="app" ng-controller="ctrl">
					<h3>Bình luận</h3>
					<div id="fb-root"></div>
					<textarea  ng-model="message" rows="3" class="form-control "
						placeholder="Nhập commments"> </textarea>  <p>	<p>
							<input ng-model="authors" required ="required"	placeholder="Nhập tên hiển thị" type="text" class="form-control ">
				
					<P>
					<div class="text-right">
						<button class="btn btn-danger" ng-click="send()">Gửi bình luận</button>
					</div>
					<hr>
					<div class="comment">
						<ul>
							<li ng-repeat="(key,value) in messages">
							<div class="mx-2"><Strong style="margin-right: 4px">{{value.author}}</Strong> {{value.text}}</div>
							 	<p class="mx-2" style="font-size:12px">{{value.posted|date}}</p>
								<p>
<!-- 									<a ng-click="reply(key)" href=""style="color: blue">Trả lời</a>
								<ul>
									<li style="background-color: #DCDCDC;"
										ng-repeat="(key,value) in value.replies"><strong>
											{{value.author}}</strong>
										<p>{{value.text}}</li>
								</ul> -->
							</li>
						</ul>
					</div>

				</div>
			</div>
		</div>
  
  <jsp:include page="../template/footer.jsp"/>

    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-caret-down"></span>'
            }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-caret-down"></span>'
            }

        });
        $(document).ready(function () {
            $('.js-example-basic-multiple').select2();
        });
    </script>
    <script>
        var $btns = $('.date').change(function () {
            if (this.value == '') {
                $('#parent > div').fadeIn(450);
            } else {
                var $el = $('.' + this.value).fadeIn(450);
                $('#parent > div').not($el).hide();
            }
        });

        var $btnsF = $('.filter').change(function () {
            if (this.value == 'all') {
                $('#parent > div > div').fadeIn(450);
            } else {
                var $el = $('.' + this.value).fadeIn(450);
                $('#parent > div > div').not($el).hide();
            }
        });

    </script>
	<script>
		app = angular.module("app", []);
		app.controller("ctrl", function($scope) {
			$db = firebase.database();			
			var path = "comments/${item.maPhim}/" + Date.now();
			$scope.send = function() {
				$db.ref(path).update({
					text : $scope.message,
					posted : Date.now(),
					author : $scope.authors,
				}, function(error) {
					if (error) {
						alert("Loi post")
					}
				})
			}
			$scope.reply = function(key) {
				var path = 'comments/${item.maPhim}/' + key + '/replies/'
						+ Date.now();
				/*  var text=prompt("Nhập trả lời"); */
				$db.ref(path).update({
					text : prompt("nhập trả lời"),
					replied : Date.now(),
					author : 'Admin'
				});
			}
			var path2 = 'comments/${item.maPhim}'
			$db.ref(path2).on('value', function(response) {
				$scope.messages = response.val();
				$scope.$digest();
			})
		})
	</script>
    <script src="https://www.gstatic.com/firebasejs/7.2.1/firebase.js"></script>
    <script>
        // Your web app's Firebase configuration
        var firebaseConfig = {
            apiKey: "AIzaSyB6a-G1G5FElkjNR9y8qmIxQSKTig037aA",
            authDomain: "phuc-4e8c3.firebaseapp.com",
            databaseURL: "https://phuc-4e8c3.firebaseio.com",
            projectId: "phuc-4e8c3",
            storageBucket: "phuc-4e8c3.appspot.com",
            messagingSenderId: "547902667504",
            appId: "1:547902667504:web:c1b83d2862e100fb852035"
        };
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);
    </script>
</body>

</html>