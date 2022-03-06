<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>관리자 | 회원관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/socicon.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/iconsmind.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/interface-icons.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/lightbox.min.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/theme.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,400italic,700%7CMontserrat:400,700'
	rel='stylesheet' type='text/css'>

<!-- Custom fonts for this template -->

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
<style>
a {
	color: black;
}

a {
	text-decoration: none !important
}

a:hover {
	text-decoration: none !important
}

.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}
/*dele-btn*/
#dele-btn1 {
	padding: 0.3rem 1rem;
	background-color: #ccc;
	text-align: center;
	margin-top: 0.4rem;
	margin-left: 0.4rem
}

#dele-btn2 {
	padding: 0.3rem 1rem;
	background-color: #ccc;
	text-align: center;
	margin-top: 0.4rem;
	margin-left: 0.4rem
}

#dele-btn1:hover {
	background-color: green;
	transition: 0.7s;
}

#dele-btn2:hover {
	background-color: red;
	transition: 0.7s;
}

/* Hide default HTML checkbox */
.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

/* check button start 체크버튼 옵션*/
input[type="checkbox"] {
	display: none;
}

.label__on-off {
	overflow: hidden;
	position: relative;
	display: inline-block;
	width: 58px;
	height: 26px;
	-webkit-border-radius: 13px;
	-moz-border-radius: 13px;
	border-radius: 13px;
	background-color: #0bba82;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
	-webkit-transition: all .3s;
	-moz-transition: all .3s;
	-ms-transition: all .3s;
	-o-transition: all .3s;
	transition: all .3s;
}

.label__on-off>* {
	vertical-align: middle;
	-webkit-transition: all .3s;
	-moz-transition: all .3s;
	-ms-transition: all .3s;
	-o-transition: all .3s;
	transition: all .3s;
	font-size: 14px;
}

.label__on-off .marble {
	position: absolute;
	top: 1px;
	left: 1px;
	display: block;
	width: 24px;
	height: 24px;
	background-color: #fff;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .3);
	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .3);
	box-shadow: 0 0 10px rgba(0, 0, 0, .3);
}

.label__on-off .on {
	display: none;
	padding-left: 12px;
}

.label__on-off .off {
	padding-left: 30px;
	line-height: 25px;
}

.input__on-off:checked+.label__on-off {
	background-color: #ed4956;
}

.input__on-off:checked+.label__on-off .on {
	display: inline-block;
}

.input__on-off:checked+.label__on-off .off {
	display: none;
}

.input__on-off:checked+.label__on-off .marble {
	left: 33px;
}

/* check button end*/
</style>

</head>
<body class="scroll-assist">
	<jsp:include page="admin-Header.jsp" />

	<section>
		<div style="margin-left: 0px;"
			class="col-md-3 col-md-offset-1 hidden-sm hidden-xs">
			<div class="sidebar">

				<!--end widget-->
				<div class="sidebar__widget">
					<h6>Categories</h6>
					<ul class="link-list">

						<li><a href="getMemberList.do"> 회원관리 </a></li>
						<li><a href="getPlaceAllList.do"> 장소관리 </a></li>
					</ul>
					<hr>

				</div>
				<!--end widget-->

				<!--end widget-->

				<!--end widget-->
			</div>
		</div>
		<!--여기서부터 목록 start-->
		<!-- Begin Page Content -->
		<div style="margin-left: -40px;" class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">회원관리 페이지</h1>
			</p>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<div class="card-header py-3"
						style="display: flex; justify-content: space-between;">
						<div>
							<h2 class="m-0 font-weight-bold"
								style="color: rgba(0, 0, 0, .6);">회원관리목록</h2>
						</div>

					</div>

					<br>
					<div class="">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing=0>
							<thead>
								<tr>
									<th>Seq</th>
									<th>ID</th>
									<th>NAME</th>
									<th>BIRTHDAY</th>
									<th>EMAIL</th>
									<th>TELL</th>
									<th>신고횟수</th>
									<th>회원 상태</th>
									<th>관리자권한</th>
								</tr>
							</thead>



							<!--여기부터 1 찍어야함 위에는 바닥부분 설정-->
							<tbody>
								<c:forEach var="member" items="${MemberList }"
									varStatus="status">
									<tr>
										<th>${member.mSeq}</th>
										<th>${member.mId}</th>
										<th>${member.mName}</th>
										<th>${member.mBirthday}</th>
										<th>${member.mEmail}</th>
										<th>${member.mTell}</th>
										<th>${member.mAccountStatus}</th>
										<c:choose>
											<c:when test="${member.mAccountStatus ge 3}">
												<th style="color: red;">정지됨</th>
											</c:when>
											<c:when test="${member.mAccountStatus le 3}">
												<th style="color: green;">활동중</th>
											</c:when>
										</c:choose>
										<td>
											<div style="display: flex;">
												<div>

													<input id="dele-btn2"
														onclick="location.href='memberBan.do?mSeq=${member.mSeq}'"
														type="submit" class="btn btn-primary" value="정지">
												</div>
												<div>
													<input id="dele-btn1"
														onclick="location.href='memberKeep.do?mSeq=${member.mSeq}'"
														type="submit" class="btn btn-primary" value="복구">

												</div>

											</div>

										</td>
									</tr>




								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>
	</section>
	<jsp:include page="tail.jsp" />
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/ytplayer.min.js"></script>
	<script src="js/easypiechart.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/lightbox.min.js"></script>
	<script src="js/twitterfetcher.min.js"></script>
	<script src="js/smooth-scroll.min.js"></script>
	<script src="js/scrollreveal.min.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/scripts.js"></script>
	<!-- Bootstrap core JavaScript-->


	<!-- Core plugin JavaScript-->


	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
</body>
</html>