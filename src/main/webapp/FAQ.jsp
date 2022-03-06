<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="ko">
<style>
/* .mainhead {
	text-align: center;
	padding-top: 30px;
	height: 305px;
	background: rgb(247, 240, 218);
} */
.faqfaq {
	margin-left: 26px;
	width: auto;
}

h5 {
	display: block;
}

h3 {
	display: block;
}

input[id*="answer"] {
	display: none;
}

input[id*="answer"]+label {
	display: block;
	padding: 2em;
	padding-left: 4em;
	border: 1px solid white; border-bottom : 0;
	color: #fff;
	font-weight: 600;
	background: #8fa10a49;
	cursor: pointer;
	position: relative;
	border-bottom: 0;
}

input[id*="answer"]+label em {
	position: relative;
	font-size: 17px;
	margin-top: -15px;
	display: inline-block;
	background: url('img/033755.jpg') 0 0 no-repeat;
	color: white;
}

input[id*="answer"]+label+div {
	max-height: 0;
	transition: all .35s;
	overflow: hidden;
	background: #fff;
	color: black;
	font-size: 14px;
}

input[id*="answer"]+label+div p {
	display: inline-block;
	padding: 20px;
	padding-left: 3em;
	margin-bottom: 0;
}

input[id*="answer"]:checked+label+div {
	max-height: 7em;
}

input[id*="answer"]:checked+label+em {
	background-position: 0 -30px;
}

.accordion {
	margin-top: 3%;
	margin-left: 10%;
	margin-right: 10%;
}

h4 {
	font-family: 'Noto Sans KR', sans-serif;
	color: white;
	margin-bottom: 0em;
}
</style>


<head>
<meta charset="utf-8">
<title>FAQ</title>
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
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
</head>

<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!-- nav -->
	<jsp:include page="Header_2.jsp" />
	<!--end of modal-container-->

	<div class="modal-container search-modal" data-modal-id="search-form">
		<div class="modal-content bg-white imagebg" data-width="100%"
			data-height="100%">
			<div class="pos-vertical-center clearfix">
				<div
					class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 text-center">
					<form class="clearfix">
						<div class="input-with-icon">
							<i class="icon-Magnifi-Glass2 icon icon--sm"></i> <input
								type="search" name="query"
								placeholder="Type your search and hit enter" />
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--end of modal-content-->
	</div>
	<!--end of modal-container-->
	<div class="main-container transition--fade">
		<section
			class="height-50 bg--dark imagebg page-title project-single-title page-title--animate parallax"
			data-overlay="3">
			<div class="background-image-holder">
				<img alt="image" src="img/제주사진/제주008.jpg" />
			</div>
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h2>FAQ</h2>
						<br>
						<h5>평일 오전 11:00 - 오후 6:00</h5>
						<h5>점심 오후 1:00 - 오후 2:30</h5>
						<h5>1644-0000</h5>
					</div>
				</div>
				<!--end row-->
			</div>
			<!--end container-->
		</section>
	</div>
	<section>

		<div class="accordion">
			<input type="checkbox" id="answer01""> <label for="answer01"
				style="border-radius: 1em 1em 0em 0em;"> <em
				style="color: white; margin-bottom: 0em; font-weight: bolder;">>
					게임모드에서 지정된 여행코스는 변경이 불가능한가요?</em>
			</label>
			<div class="faqfaq">
				<p>게임 모드에서 지정된 여행코스는 변경이 불가하며, 원치 않을 경우 새로운 방을 생성 해주셔야합니다.</p>
			</div>
			<input type="checkbox" id="answer02"> <label for="answer02">
				<em>> 신고된사람은 어떻게 되죠?</em>
			</label>
			<div class="faqfaq">
				<p>저희 제주의온도 관리규정에 따라서 일정 이상의 신고가 누적 될 경우 자동적으로 아이디가 비활성화 됩니다.</p>
			</div>
			<input type="checkbox" id="answer03"> <label for="answer03">
				<em>> 아이와 함께 랜덤추천모드를 사용하기에 적합한가요?</em>
			</label>
			<div class="faqfaq">
				<p>아이와 함께 동행 하실 경우에는 지인과 아이와 함께 게임모드를 추천드립니다.</p>
			</div>
			<input type="checkbox" id="answer04"> <label for="answer04">
				<em>> 관리자와 1 : 1 채팅은 불가능한가요?</em>
			</label>
			<div class="faqfaq">
				<p>저희 랜덤제주는 관리자와 1 : 1 채팅은 어려우며, 안내드린 고객센터 번호로 연락 부탁드립니다.</p>
			</div>
			<input type="checkbox" id="answer05"> <label for="answer05">
				<em>> 계정 비활성화는 어떻게 풀 수 있나요?</em>
			</label>
			<div class="faqfaq">
				<p>아이디가 비활성화 되었을 경우 고객센터로 연락바랍니다. 신고 관련사정을 말씀주시면 심의 과정을 갖고 있습니다.</p>
			</div>
			<input type="checkbox" id="answer06"> <label for="answer06">
				<em>> 랜덤추천모드에서 여행지가 마음에 들지 않으면 어쩌죠?</em>
			</label>
			<div class="faqfaq">
				<p> 다시추천하기 버튼을 누르면 여행지를 다시 추천해드립니다.</p>
			</div>
			<input type="checkbox" id="answer07"> <label for="answer07">
				<em>> 추천해준 여행지가 정보와 달라요.</em>
			</label>
			<div class="faqfaq">
				<p>주기적으로 업데이트 중이나 미쳐 반영되지 못한 장소가 있을 수 있습니다. 고객센터로 연락주시면 수정하겠습니다.
				</p>
			</div>
			<input type="checkbox" id="answer08"> <label for="answer08"
				style="border-bottom: 1px solid white; border-radius: 0em 0em 1em 1em;">
				<em>> 제주의 온도에서 예약은 불가능한가요?</em>
			</label>
			<div class="faqfaq">
				<p>저희는 여행 장소 추천과 게임모드가 주 기능인 사이트로 예약은 불가능 합니다.</p>
			</div>

		</div>

	</section>
	<div>
		<!-- footer -->
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
	<script>
                $(function () {
                    var selectedClass = "";
                    $("p").click(function () {
                        selectedClass = $(this).attr("data-rel");
                        $("#portfolio").fadeTo(50, 0.1);
                        $("#portfolio div").not("." + selectedClass).fadeOut();
                        setTimeout(function () {
                            $("." + selectedClass).fadeIn();
                            $("#portfolio").fadeTo(50, 1);
                        }, 500);

                    });
                });
            </script>
</body>

</html>