<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>change password</title>
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

<style>
.cover-12 form {
	margin-top: 2.25em;
}

label+input {
	margin-top: 0.125em;
}

.boxed.boxed--lg {
	margin-top: 8em;
	padding: 2.5625em;
}

input[type], textarea, select, .imgup {
	-webkit-appearance: none;
	background: #ffffff;
	padding: 0.3125em;
	padding-left: 0.6125em;
	padding-right: 0.6125em;
	border-radius: 50px;
	border: none;
	margin-bottom: auto;
}

.cover-12 form .input-with-icon {
	text-align: left;
	margin-bottom: 0.5em;
}

.filegr {
	display: flex;
	background-color: #f8f8f8;
	text-align: center;
	margin-left: 0;
	margin-bottom: 0.5em;
}

.imgup {
	background-color: white;
	width: 120px;
	text-align: center;
	margin-left: 0;
	margin-bottom: 5vh;
}

.filelabel {
	background-color: lightgrey;
	border-radius: 20%/50%;
	justify-content: space-between;
	min-width: 80px;
	margin-top: 2vh;
	margin-bottom: 2vh;
	padding: 1vh;
	padding-top: 2vh;
	margin-left: 1.5em;
}

.pos-vertical-center {
	top: 50%;
}

.pos-vertical-center {
	height: none;
}
</style>

</head>


<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!--  Header 인클루드  -->
	<jsp:include page="Header.jsp" />


	<!--end of modal-container-->
	<div class="main-container transition--fade">
		<section class="cover cover-12 form--dark imagebg height-100 parallax"
			data-overlay="4" style="height: 100vh;">
			<div class="background-image-holder" style="height: inherit;">
				<img alt="image" src="img/pch_img_1.jpg" />
			</div>
			<div class="container pos-vertical-center text-center-xs" id="con_2">
				<div class="row pos-vertical-align-columns">
					<div class="col-md-7 col-sm-8 col-sm-offset-2">
						<h2>
							<c:if test="${!empty member and !empty memberInfo.mId }">
                           ${memberInfo.mId}</c:if>
							<br>비밀번호 변경
						</h2>

						<!--end of modal instance-->
					</div>
					<div class="col-md-5 col-sm-8 col-sm-offset-2">
						<div
							class="form-subscribe-1 bg--white text-center box-shadow-wide"
							style="margin-right: none; background-color: rgba(255, 255, 255, 0.8); padding: 2em;">
							<h4 style="margin-bottom: 0.5em;">비밀번호 변경</h4>


							<form class="" action="updatePW.do" method="post"
								id="subForm" enctype="multipart/form-data">
								<input type="hidden" name="mId" value="${memberInfo.mId}">
								<div class="input-with-icon col-md-12">
									<label for="password">현재 비밀번호</label> <input id="mPassword"
										name="mPassword" type="password"
										style="height: 60%;" />

								</div>
								<div class="input-with-icon col-md-12">
									<label for="changepassword">변경할 비밀번호</label> <input
										id="mPassword" name="newmPassword" type="password" 
										style="height: 60%;" />
								</div>
								<div class="input-with-icon col-md-12">
									<label for="passwordcheck">비밀번호 확인</label> <input
										id="passwordcheck" name="newmPasswordConfirm" type="password" 
										style="height: 60%; margin-bottom: 3em;" />
								</div>




								<button class="btn " type="submit"
									style="background-color: rgba(166, 208, 205, 0.8); border-style: none;">변경하기</button>
								<button class="cencle btn btn-danger modal-close " onclick="location.href='Mypage.jsp'" type="button">취소</button>
							</form>
						</div>
					</div>

				</div>
			</div>
			</form>
	</div>
	</div>
	</div>
	<!--end row-->
	</div>
	<!--end container-->
	</section>
	<jsp:include page="tail.jsp" />
	</div>
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
	<script type="text/javascript" src="../js/script.js"></script>


</body>
</html>