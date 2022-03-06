<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Random Jeju | 신고하기</title>
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
<style>
h1, h2, h3, h4, h5, h6, p, div, li, th, tr {
	font-family: 'Noto Sans KR', sans-serif;
}

.btn {
	padding: 0.5em 1em;
}

h1, h2, h3, h4, h5, h6, p, div {
	font-family: 'Noto Sans KR', sans-serif;
}

.boxed {
	position: relative;
	overflow: hidden;
	padding: 1.4375em;
	margin-bottom: 30px;
}

.comment {
	margin-left: 5%;
}

.chatbox {
	/* border: solid 1px gray; */
	padding-left: 2em;
	padding-right: 2em;
	width: fit-content;
	background-color: #d0d9f5;
	border-radius: 10%/60%;
	font-size: 13px;
	padding-left: 5%;
	padding-right: 5%;
	padding-top: 2%;
	padding-bottom: 2%;
}

.cimg {
	width: auto !important;
}

.csimg {
	width: 3em;
	height: 3em;
	margin-right: 1em;
	border-radius: 50%;
	overflow: hidden;
}

em {
	font-size: 12px;
}

textarea {
	height: 25em;
}

#sc-btn {
	width: 25em;
	background-color: rgba(226, 88, 61, 1);
	border-style: none;
	
}


span {
	font-size: large;
}
</style>

</head>

<body class="scroll-assist">
	<a id="top"></a>

	<div class="loader"></div>
	<div class="main-container transition--fade">

		<section class="imagebg height-30">
			<div class="background-image-holder background--bottom">
				<img alt="image" src="img/제주사진/제주005.jpg" />
			</div>
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h2 style="color: white">
							신고하기
						</h2>
						
					</div>
				</div>
				<!--end row-->
			</div>
			<!--end container-->
		</section>
		<section style="padding-bottom: 10px">
			<div class="container" style="width: 70%">
				<div class="row">

					<div class="col-md-12">
						<ul>
							<li><br></li>
							<li><h4>${reviewTarget.mName}님에 대한 신고 사유를 작성해 주세요.</h4></li>
							<li>
							
							</li>

						</ul>
					</div>


				</div>
			</div>
		</section>


		<section class="masonry-contained">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
					<div class="blog-post__comments">
						<hr>
						<div id="CommentArea">
							<form class="comment__form form--square" action="insertReview.do"
								method="post" onsubmit="return confirm('정말로 신고하시겠습니까?');">
								<ul>
									<li><select id="rComplain" name="rComplain">
											<option value="">사유 선택</option>
											<option>욕설/폭행</option>
											<option>불법/도박</option>
											<option>음란/성인</option>
											<option>사기/고발</option>
											<option>기타</option>
									</select>
									</li>
									<li>
									<br>
									</li>
									<li><textarea placeholder="신고 내용을 작성하세요." name="rContent" rows="4"></textarea> 
									<input type="hidden" name="mSeq" value=${reviewTarget.mSeq  } />
									<input type="hidden" name="rReviewType" value="complain"/>
										<div class="row">
											<div class="col-md-8">
												<button type="submit" class="btn" id="sc-btn">
													<span>등록</span>
												</button>
												<button type="button" class="btn" id="sc-btn"
													onclick="reveiwCancel()">
													<span>취소</span>
												</button>
											</div>

										</div></li>
								</ul>



							</form>



						</div>


					</div>
					<!--end of blog comments-->
				</div>
			</div>

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
	
	<!-- 신고 취소하기 -->
	<script>
		function reveiwCancel() {			
			if (window.confirm("신고 작성을 취소 하시겠습니까?")) {
				location.href= ("entranceRoom.do?trSeq=" + ${trip.trSeq});
				
				} else {
					console.log("취소. 변화 없음");
				}
			}
		
	</script>
	
	
	
	
	
</body>

</html>