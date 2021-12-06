<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>ReviewWrite</title>
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
</head>
<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!--  Header 인클루드  -->
	<jsp:include page="Header_2.jsp" />

	<!-- nav -->
	<!--end of modal-container-->
	<div class="main-container transition--fade">
		<section>
			<div class="container">
				<div class="row">
						<div class="shop-item-detail shop-item-detail-1">
							<form action="insertPlaceReview.do" method="post"
								class="validation-form" >
								<input type="hidden" name ="pSeq" value="${place.pSeq }">
							<div class="col-sm-6">
								<div class="slider" data-animation="fade" data-arrows="true"
									data-paging="true">
									<ul class="slides">
										<li><img alt="Pic"
											src="upload/${place.originalFileName}" /></li>
									</ul>
								</div>
							</div>
							<div class="col-md-4 col-md-offset-1 col-sm-6">
								<div class="item__title">
									<h4>"${place.pName}"</h4>
								</div>
								<div class="item__description">
									<div style="padding-bottom: 20px;">
										<span>개인 리뷰 :</span>
									</div>

									<div class="item__subinfo">
										<span>시설/객실</span> <span> <select name="bab"
											style="padding-right: 5.5em; border: 1px solid #232323">
												<option id="bab" value="null" selected="selected">선택없음</option>
												<option id="bab" value="5">매우만족</option>
												<option id="bab" value="4">다소만족</option>
												<option id="bab" value="3">보통</option>
												<option id="bab" value="2">다소미흡</option>
												<option id="bab" value="1">미흡</option>
										</select>
										</span>
									</div>
									<div class="item__subinfo">
										<span>청결도</span> <span> <select name="clean"
											style="padding-right: 5.5em; border: 1px solid #232323">
												<option value="null" selected="selected">선택없음</option>
												<option id="clean" value="5">매우만족</option>
												<option id="clean" value="4">다소만족</option>
												<option id="clean" value="3">보통</option>
												<option id="clean" value="2">다소미흡</option>
												<option id="clean" value="1">미흡</option>
										</select>
										</span>
									</div>
									<div class="item__subinfo">
										<span>친절도</span> <span> <select name="kind"
											style="padding-right: 5.5em; border: 1px solid #232323">
												<option value="null" selected="selected">선택없음</option>
												<option id="kind" value="5">매우만족</option>
												<option id="kind" value="4">다소만족</option>
												<option id="kind" value="3">보통</option>
												<option id="kind" value="2">다소미흡</option>
												<option id="kind" value="1">미흡</option>
										</select>
										</span>
									</div>
									<div class="item__subinfo">
										<span>수영장</span> <span> <select name="swim"
											style="padding-right: 5.5em; border: 1px solid #232323; width: 180px;">
												<option value="null" selected="selected">선택없음</option>
												<option id="swimming" name="swim" value="Y">있음</option>
												<option id="swimming" name="swim" value="N">없음</option>
										</select>
										</span>
									</div>
									<div class="item__subinfo">
										<span>주차장</span> <span> <select name="parking"
											style="padding-right: 5.5em; border: 1px solid #232323; width: 180px;">
												<option value="null" selected="selected">선택없음</option>
												<option id="park" value="Y">있음</option>
												<option id="park" value="N">없음</option>
										</select>
										</span>
									</div>
								</div>
								<form class="item__addtocart">
									<div style="padding-bottom: 20px; padding-top: 30px;">
										<span>짧은 리뷰 :</span>
									</div>
									<textarea id="reviewtext" name="review" placeholder="리뷰를 남겨주세요"
										style="resize: none; height: 180px; border-radius: 0%;"></textarea>
									<button type="submit" class="btn btn--primary">리뷰 남기기</button>
								</form>
							</div>
						  </form>
						</div>
				</div>
			</div>
			<!--end of row-->

			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
					<div class="blog-post__comments" style="margin-top: auto;">
						<hr>
						<h6>3 Comments:</h6>
						<ul>
							<li>
								<div class="comment">
									<div class="comment__image">
										<img alt="pic" src="img/avatar-small-4.png" />
									</div>
									<div class="comment__text">
										<h5>정준하</h5>
										<span> <em>매우만족 /</em> <em>매우만족 /</em> <em>다소만족 /</em>
											<em>있음 /</em> <em>있음</em>
										</span>
										<p>좋은 정보 감사합니다!! 이 번달에 가족들이랑 함께 꼭 가볼려구요!!.</p>
									</div>
									<hr>
								</div> <!--end comment-->
							</li>
							<li>
								<div class="comment">
									<div class="comment__image">
										<img alt="pic" src="img/avatar-small-1.png" />
									</div>
									<div class="comment__text">
										<h5>하하</h5>
										<span> <em>매우만족 /</em> <em>매우만족 /</em> <em>다소만족 /</em>
											<em>있음 /</em> <em>있음</em>
										</span>
										<p>자세한 리뷰로 이 번주 기념일은 호캉스를 하려고 합니다!! 저도 후기 꼭 남겨놓을게요 ㅎㅎ.</p>
									</div>
									<hr>
								</div> <!--end comment-->
							</li>
							<li>
								<div class="comment">
									<div class="comment__image">
										<img alt="pic" src="img/avatar-small-1.png" />
									</div>
									<div class="comment__text">
										<h5>박명수</h5>
										<span> <em>매우만족 /</em> <em>매우만족 /</em> <em>다소만족 /</em>
											<em>있음 /</em> <em>있음</em>
										</span>
										<p>자세한 리뷰로 이 번주 기념일은 호캉스를 하려고 합니다!! 저도 후기 꼭 남겨놓을게요 ㅎㅎ.</p>
									</div>
									<hr>
								</div> <!--end comment-->
							</li>
						</ul>
					</div>
					<!--end of blog comments-->
				</div>
			</div>

			<div class="pagination-container">
				<hr>
				<ul class="pagination">
					<li><a href="#"> <span>&larr;</span>
					</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#"> <span>&rarr;</span>
					</a></li>
				</ul>
			</div>
	</div>
	<!--end of container-->
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
</body>
</html>