<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Happy House</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root }/css/styles.css" rel="stylesheet" />
<link href="${root }/css/custom.css" rel="stylesheet" />
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFhvndwTb7zd3egLZQsUDFAIaDJtZLhjo&callback=initMap&libraries=&v=weekly"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="icon" href="/favicon.ico">
    <link href="${root }/css/newsapp.css" rel="preload" as="style">
    <link href="${root }/js/newsapp.js" rel="preload" as="script">
    <link href="${root }/css/newsapp.css" rel="stylesheet">
    

<style>
#map {
	height: 500px;
	margin-bottom: 10px;
}
</style>


<script type="text/javascript">
        
        //????????? ?????? ??????
		$(document).ready(function() {
			$("#btn-login").click(function() {
				if($("#loginId").val() == "") {
					alert("????????? ??????!!!");
					return;
				} else if($("#loginPwd").val() == "") {
					alert("???????????? ??????!!!");
					return;
				} else {
					$("#loginform").attr("action", "${root}/user/login").submit();
				}
			});
			
			//???????????? ?????? ??????
			$('#logout').click(function(){
			    alert('???????????????????????????.');
			    location.href = "${root}/user/logout";
			})
			
			//?????????????????? ?????? ??????
			$("#delete-btn").click(function() {			
				let userid="<c:out value='${userinfo.userid}'/>";
				location.href = "${root}/user/deleteMember?userid="+userid;
			})
			
			
			
			$("#searchbyapt").click(function() {
				let aptname = $("#myInput").val();
				location.href = "${root}/search/aptSearch?aptname="+aptname;
			});
		});
		
		
		$(function(){
		     
		   //?????? ????????? ??????
		$("#city").change(function(){
			let si = $('#city').val();
		$.ajax({
			url:'${root}/address/gugun/' + si,  
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:function(address) {
				var list= "<option value=all >???/???</option>";
	            $("#gu").empty();
	            $.each(address, function(index,item){
	                list+= "<option value=" +item.gugun+" >"+item.gugun+"</option>";
	            });
	            $("#gu").append(list);
			},
			error:function(xhr,status,msg){
				console.log("????????? : " + status + " Http??????????????? : "+msg);
			},
			statusCode: {
				500: function() {
					alert("????????????.");
					// location.href = "/error/e500";
				},
				404: function() {
					alert("???????????????.");
					// location.href = "/error/e404";
				}
			}	
		});
		})
		
		
		//??? ????????? ??????
		$("#gu").change(function(){
			let gugun = $('#gu').val();
		$.ajax({
			url:'${root}/address/dong/' + gugun,  
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:function(address) {
				var list= "<option value=all >???</option>";
	            $("#dong").empty();
	            $.each(address, function(index,item){
	                list+= "<option value=" +item.dong+" >"+item.dong+"</option>";
	            });
	            $("#dong").append(list);
			},
			error:function(xhr,status,msg){
				console.log("????????? : " + status + " Http??????????????? : "+msg);
			},
			statusCode: {
				500: function() {
					alert("????????????.");
					// location.href = "/error/e500";
				},
				404: function() {
					alert("???????????????.");
					// location.href = "/error/e404";
				}
			}	
		});
		})
		
		})
		
		
        
   function initMap() {
       const myLatLng = {  lat: 37.570705, lng: 126.981354};
       const map = new google.maps.Map(document.getElementById("map"), {
         zoom: 15,
         center: myLatLng,
       });
     }
   function search(){
	   var form = document.getElementById("frm");
       var dong = form.dong.value;
       var gugun = form.gu.value;
       var city = form.city.value;
       form.act.value = "searchhouse";
       $("#frm").attr("action", "${root}/search/searchDong").submit();
   }
   function interest(){
	   var form = document.getElementById("frm");
       var dong = form.dong.value;
       var gugun = form.gu.value;
       var city = form.city.value;
       form.act.value = "registerInterest";
       $("#frm").attr("action", "${root}/interest/insert").submit();
   }
   
   
   
    </script>
<!--  ???????????? ???????????? ????????? END -->
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<div class="dropdown">
				<button type="button" class="btn btn-primary dropdown-toggle mr-3"
					data-toggle="dropdown">More</button>
				<div class="dropdown-menu">
					<h3 class="dropdown-header">Lists</h3>
					<a class="dropdown-item" href="${root}/mvnotice">????????????</a> <a
						class="dropdown-item" href="#" id="todaynews">????????? ??????</a> <a
						class="dropdown-item" href="#" id="search">?????? ??????</a>
					<c:if test="${userinfo ne null}">
						<a class="dropdown-item"
							href="${root }/interest/list?userid=${userinfo.userid}">?????? ??????
							????????????</a>
					</c:if>
				</div>
			</div>


			<a class="navbar-brand js-scroll-trigger" href="${root }/">Happy
				House</a>
			<button
				class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<c:if test="${ userinfo eq null }">
						<li class="nav-item mx-0 mx-lg-1" id="signupli"><a
							class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							id="signup" href="${root}/user/mvsignup">Sign up</a></li>
						<li class="nav-item mx-0 mx-lg-1" id="signinli"><a
							class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							data-toggle="modal" data-target="#loginModal">Sign in</a></li>
					</c:if>
					<c:if test="${ userinfo ne null }">
						<li class="nav-item mx-0 mx-lg-1" id="logoutli"><a
							class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							id="logout">Logout</a></li>
						<li class="nav-item mx-0 mx-lg-1" id="userinfoli"><a
							class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
							data-toggle="modal" data-target="#infoModal">UserInfo</a></li>
					</c:if>
				</ul>

				<input class="form-control" id="myInput" name="searchbyapt"
					type="text" placeholder="Search.." style="width: 500px">
				<button class="btn btn-warning" id="searchbyapt" type="submit">??????</button>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Happy House</h1>
			<br>
			<h2 class="masthead-heading text-uppercase mb-0" id="happy">?????????
				?????????</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div
				class="sorting-filters text-center mb-20 d-flex justify-content-center">
				<form class="form-inline" id="frm" method="post" action="">
					<input type="hidden" id="code" name="act" value="" /> <input
						type="hidden" id="userid" name="userid"
						value="${userinfo.userid }" />
					<div class="form-group md">
						<select class="form-control" name="city" id="city">
							<c:if test="${gugunlist eq null}">
								<option value="all">???/?????????</option>
								<option value="???????????????">?????????</option>
								<option value="???????????????">?????????</option>
								<option value="???????????????">?????????</option>
								<option value="???????????????">?????????</option>
								<option value="???????????????">?????????</option>
								<option value="???????????????">?????????</option>
								<option value="???????????????">?????????</option>
								<option value="?????????">?????????</option>
								<option value="?????????????????????">?????????</option>
								<option value="?????????">?????????</option>
								<option value="????????????">????????????</option>
								<option value="????????????">????????????</option>
								<option value="????????????">????????????</option>
								<option value="????????????">????????????</option>
								<option value="????????????">????????????</option>
								<option value="????????????">????????????</option>
								<option value="?????????????????????">?????????</option>
							</c:if>
							<c:if test="${gugunlist ne null}">
								<option value="${selectedsi}">${selectedsi}</option>
							</c:if>

						</select>
					</div>
					<div class="form-group md-1">
						<select class="form-control" name="gugun" id="gu">
							<c:if test="${donglist eq null}">
								<option value="all">???/???</option>
								<c:forEach var="guguns" items="${gugunlist}" varStatus="status">
									<option value="${guguns.gugun}">${guguns.gugun}</option>
								</c:forEach>
							</c:if>
							<c:if test="${donglist ne null }">
								<option value="${selectedgu}">${selectedgu}</option>
							</c:if>
						</select>
					</div>
					<div class="form-group md-1">
						<select class="form-control" name="dong" id="dong">
							<option value="all">???</option>
							<c:forEach var="dongs" items="${donglist}" varStatus="status">
								<option value="${dongs.dong}">${dongs.dong}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group md-1">
						<input class="btn btn-warning" type="button" value="??????"
							onclick="javascript:search()" />
					</div>
					<div class="form-group md-1">
						<input class="btn btn-secondary" type="button"
							onclick='interest()' value="?????? ????????? ??????" />
					</div>
				</form>
			</div>
		</div>
	</header>


	
	<!-- vue -->
	<noscript><strong>We're sorry but todaysnewscli doesn't work properly without JavaScript enabled. Please enable it
            to continue.</strong></noscript>
    <div id="app"></div>
    <script src="${root}/js/newsapp.js"></script>


	<!-- Footer-->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Find Us</h4>
					<p class="lead mb-0">
						(SSAFY) ????????? ????????? ???????????? ??????????????? <br /> 1544-9001 <br />
						admin@ssafy.com
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright ?? SSAFY. All rights reserved.</small>
		</div>
	</div>
	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
	<div class="scroll-to-top d-lg-none position-fixed">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"><i class="fa fa-chevron-up"></i></a>
	</div>
	<!-- Portfolio Modals-->
	<!-- Portfolio Modal 1-->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label"
		aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"><i class="fas fa-times"></i></span>
				</button>
				<div class="modal-body text-center">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- Portfolio Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0"
									id="portfolioModal1Label">Maps</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- Portfolio Modal - Image-->
								<div id="map"></div>
								<!-- Portfolio Modal - Text-->
								<button class="btn btn-primary" data-dismiss="modal">
									<i class="fas fa-times fa-fw"></i> Close Window
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal" id="loginModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Login</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form method="post" id="loginform" action="">
						<div class="form-group">
							<label for="loginId">ID:</label> <input type="text"
								class="form-control" placeholder="Enter ID" id="userid"
								name="userid">
						</div>
						<div class="form-group">
							<label for="loginPwd">Password:</label> <input type="password"
								class="form-control" placeholder="Enter password" id="userpwd"
								name="userpwd">
						</div>


						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="btn-login">LogIn</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade" id="infoModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="color: black">??????
						?????? ??????</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<h1 style="color: black">?????? ?????? ??????</h1>
					<table class="table table-hover">
						<tbody>
							<tr>
								<td>????????? :</td>
								<td>${ userinfo.userid }</td>
							</tr>
							<tr>
								<td>???????????? :</td>
								<td>${ userinfo.userpwd }</td>
							</tr>
							<tr>
								<td>?????? :</td>
								<td>${ userinfo.username }</td>
							</tr>
							<tr>
								<td>e-mail :</td>
								<td>${ userinfo.email }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">??????</button>
					<button type="button" class="btn btn-primary" id="modify-btn"
						onclick="location.href='${root}/user/usermodify'">??????</button>
					<button type="button" class="btn btn-danger" id="delete-btn">??????
						??????</button>
				</div>
			</div>
		</div>
	</div>
	<div class="toast">
		<div class="toast-header">?????? ?????? ??????</div>
		<div class="toast-body">?????? ???????????????????????? ?</div>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="assets/mail/jqBootstrapValidation.js"></script>
	<script src="assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
