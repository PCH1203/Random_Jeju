<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>developers</title>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
   <link href='https://fonts.googleapis.com/css?family=Lora:400,400italic,700%7CMontserrat:400,700' rel='stylesheet'
        type='text/css'>
<!-- 	<div>아이콘 제작자 <a href="https://www.freepik.com" title="Freepik">Freepik</a> 
	from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div> -->


<style>

body{
 	background: url('../img/제주028.jpg');
  
}
.modal-instance {
	display: table-cell;
	text-align: center;
}
.card{
	width:25vw;
}

.a1 {
	max-width: 200px;
	min-width: 100px;
}


.crowni{
		width:1.5em;
		margin-bottom:3px;
		
	}
	.container2{
		background: rgba(255, 255, 255, 0.8);
		padding-top: 5%;
		padding-left: 5%;
    	padding-right: 5%;
		margin-bottom:10%;
		max-width:800px;
	}
	@font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

</style>

</head>
<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!--  Header 인클루드  -->
	<jsp:include page="Header_2.jsp" />

	<!--end of modal-container-->
	<div class="main-container transition--fade">
		<section style="height: 50vh; margin-bottom:1.5em;">

			<div class="background-image-holder">
				
			</div>
			<div class="container pos-vertical-center" >
				<div class="row">
					<div class="col-sm-12 text-center"   >
						<h1 style="color:white;margin-bottom:0; margin-top: 1em;
						 /*    -webkit-text-stroke: 1px #88b3b5; */font-weight:700;
						 font-family: 'Cafe24Ssurround'; ">개발자 소개</h1>

					</div>
				</div>
				<!--end row-->
			</div>
			<!--end container-->
		</section>
		<div class="container container2" >
			<div class="row"
				style="display: flex; justify-content: center; flex-wrap: wrap;">
				<div class="modal-instance col-md-6 col-sm-5"
					style="margin-bottom: 5%;">
					<a class="btn modal-trigger a1"> <img src="img/chanho.png"
						class="btn__text"> <br> 박찬호
					</a>
					<div class="modal-container">
						<div class="modal-content height--natural">
							<div class="card card-1">

								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5>박찬호</h5>
									</div>
									<ul>
									<li>- 여행 개설 및 참여 기능</li>
									<li>- DB설계 및 구축</li>
									<li>- index 페이지 </li>
									<li>- 개인 리뷰 페이지</li>
									<li>- 파일 업로드</li>
								
							
									</ul>
								</div>
							</div>
						</div>
						<!--end of modal-content-->
					</div>
					<!--end of modal-container-->
				</div>



				<div class="modal-instance col-md-6 col-sm-5"
					style="margin-bottom: 5%;">
					<a class="btn modal-trigger a1" href="#"> <img
						src="img/namju.png" class="btn__text" style="margin-bottom:1em;"> <br><img alt="crown" src="img/crown.png"class="crowni">
						 한남주
					</a>
					<div class="modal-container">
						<div class="modal-content height--natural">
							<div class="card card-1">

								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5><img alt="crown" src="img/crown.png"class="crowni">한남주
										<span style="color:grey;font-weight:none;font-size:10px;">프로젝트 총괄</span></h5>
									</div>
									<ul>
									  <li>- 회원가입 기능</li>
									  <li>- 게임모드 구현</li>
									  <li>- 랜덤 추천 모드 구현</li>
									 <!--  <li>- 시큐리티</li> -->
									  <li>- 채팅 기능 </li>
									  <li>- DB 데이터 작업</li>
										
									</ul>
								</div>
							</div>
						</div>
						<!--end of modal-content-->
					</div>
					<!--end of modal-container-->
				</div>
				<div class="modal-instance col-md-4 col-sm-5"
					style="margin-bottom: 5%;">
					<a class="btn modal-trigger a1"> <img src="img/euichan.png"
						class="btn__text"> <br> 정의찬
					</a>
					<div class="modal-container">
						<div class="modal-content height--natural">
							<div class="card card-1">

								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5>정의찬</h5>
									</div>
									<ul>
									<li>- 로그인</li>
									<li>- 회원 가입,탈퇴,정보수정 등</li>
									<li>- 장소 추천 게시판 전반</li>
									<li>- 장소 리뷰 게시판 전반</li>
									<li>- 페이징 처리 </li>
									
									</ul>
								</div>
							</div>
						</div>
						<!--end of modal-content-->
					</div>
					<!--end of modal-container-->
				</div>
				<div class="modal-instance col-md-4 col-sm-5"
					style="margin-bottom: 5%;">
					<a class="btn modal-trigger  a1"> <img src="img/jiyoon.png"
						class="btn__text"> <br> 허지윤
					</a>
					<div class="modal-container">
						<div class="modal-content height--natural">
							<div class="card card-1">

								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5>허지윤</h5>
									</div>
									<ul>
										<li>- 관리자 게시판 구현 </li>
										<li>- 자유 게시판 구현 </li>
										<li>- UI Prototype 디자인</li>
										<li>- room 페이지 UI</li>
										<li>- UI 수정</li>

									</ul>
								</div>
							</div>
						</div>
						<!--end of modal-content-->
					</div>
					<!--end of modal-container-->
				</div>
				<div class="modal-instance col-md-4 col-sm-5"
					style="margin-bottom: 5%;">
					<a class="btn modal-trigger  a1"> <img src="img/hyunsuk.png"
						class="btn__text"> <br> 정현석
					</a>
					<div class="modal-container">
						<div class="modal-content height--natural">
							<div class="card card-1">

								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5>정현석</h5>
									</div>
									<ul>
									<li>- 관리자 게시판 구현</li>
									<li>- 자유 게시판 구현</li>
									<li>- 게시판 페이징 처리</li>
									<li>- 방에서 멤버프로필 띄우기</li>
									<li>- 페이지 알림창 작업 </li>
									
								</ul>
								</div>
							</div>
						</div>
						<!--end of modal-content-->
					</div>
					<!--end of modal-container-->
				</div>
				<div class="modal-instance col-md-6 col-sm-5"
					style="margin-bottom: 5%;">
					<a class="btn modal-trigger  a1"> <img src="img/lahee.png"
						class="btn__text"> <br> 김라희
					</a>
					<div class="modal-container">
						<div class="modal-content height--natural">
							<div class="card card-1">

								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5>김라희</h5>
									</div>
									<ul>
									<li>- 아이디 기억하기</li>
									<li>- dev 페이지</li>
									<li>- 로그인,로그아웃 버튼 동작</li>
									<li>- UI 수정</li>
									
									<li></li>
									</ul>
								</div>
							</div>
						</div>
						<!--end of modal-content-->
					</div>
					<!--end of modal-container-->
				</div>
				
				<div class="modal-instance col-md-6 col-sm-5"
					style="margin-bottom: 5%;">
					<a class="btn modal-trigger  " href="#"> 
					<img src="img/avatar-small-1.png" class="btn__text" style="height: 10em;"> <br>
						 이윤진
					</a>
					<div class="modal-container">
						<div class="modal-content height--natural">
							<div class="card card-1">

								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5>이윤진
										</h5>
									</div>
									<ul>
									  <li>- 데이터베이스 작업</li>
								
									</ul>
								</div>
							</div>
						</div>
						<!--end of modal-content-->
					</div>
					<!--end of modal-container-->
				</div>
				
				
			</div>
			
				
			
		</div>
		<!-- <<<<< footer >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
		<jsp:include page="tail.jsp" />

		<!-- <<<<< end footer end >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->

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
</body>
</html>