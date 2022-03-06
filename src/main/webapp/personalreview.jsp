<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Random Jeju | 리뷰 남기기</title>
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
	background-color: rgba(166, 208, 205, 1);
	border-style: none;
	
}

#de-btn {
	width: 8em;
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
				<img alt="image" src="img/제주사진/제주013.jpg" />
			</div>
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h2 style="color: white">
							리뷰 남기기
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
					<div class="col-md-2">
						<div class="">
							<img alt="Pic" src="upload/${reviewTarget.mImgName}"
								style="height: 120px; width: 120px; border-radius: 50%;" preview-image" />

						</div>
					</div>
					<div class="col-md-6">
						<ul>
							<li><br></li>
							<li><h4>${reviewTarget.mName}님과의여행어떠셨나요?</h4></li>

						</ul>
					</div>
					<div class="col-md-4" style="text-align: right;">
					<br>
						<button type="button" class="btn btn--primary" id="de-btn" onclick="complain()">
							<span>신고</span>
						</button>
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
						<form class="comment__form form--square" action="insertReview.do" method="post">
							<textarea placeholder="Your Comment" name="rContent" rows="4" ></textarea>
							<input type="hidden" name="rReviewType" value="review"/>
							<input type="hidden" name="mSeq" value=${reviewTarget.mSeq  } />
								<div class="row">
									<div class="col-md-8">
										<button type="submit" class="btn" id="sc-btn"><span>등록</span></button>
										<button type="button" class="btn" id="sc-btn" onclick="reveiwCancel()"><span>취소</span></button>
									</div>
									
								</div>
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
	
	<!-- 리뷰 작성 취소하기 -->
	<script>
		function reveiwCancel() {			
			if (window.confirm("리뷰 작성을 취소 하시겠습니까?")) {
				location.href= ("entranceRoom.do?trSeq=" + ${trip.trSeq});
				
				} else {
					console.log("취소. 변화 없음");
				}
			}
		
	</script>
	
	<!-- 신고하기 -->
	<script>
		function complain() {			
			if (window.confirm("신고 페이지로  이동 하시겠습니까?")) {
				location.href= ("complain.do?mSeq="+ ${reviewTarget.mSeq  } );
				
				} else {
					console.log("취소. 변화 없음");
				}
			}
		
	</script>
	
	
	
</body>

</html>