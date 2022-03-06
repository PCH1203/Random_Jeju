<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Random Jeju |Room My reviews</title>
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

<style>
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

.profileImg {
	box-shadow: 10px 10px 10px  ; 
	overflow: hidden;
	margin-right: 5em;
}
</style>



<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!--  Header 인클루드  -->
	<jsp:include page="Header.jsp" />


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
		<section class="imagebg height-40">
			<div class="background-image-holder background-top">
				<img alt="image" src="img/제주사진/제주030.jpg" />
			</div>
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h1>${myInfo.mNickname }'s 리뷰</h1>

					</div>
				</div>
				<!--end row-->
			</div>
			<!--end container-->
		</section>


		<section style="margin-top:80px;">
			<div class="container">
				<div class="row">
					<div class="shop-item-detail shop-item-detail-1">
						<div class="col-sm-6">
							<div class="slider  cimg" data-animation="fade" data-arrows="true"
								data-paging="true">
							
									<img alt="profile" class="profileImg" src="upload/${myInfo.mImgName }" />
								
							</div>
						</div>
						<div class="col-md-4 col-md-offset-1 col-sm-6">
							<div class="item__title">
								<h4>${myInfo.mName } / ${myInfo.mNickname }</h4>
							</div>
							<br>
							<div class="item__description">
								<h6>Information:</h6>
								<div class="item__subinfo">
									<span>성별</span> 
									<c:if test="${myInfo.mGender eq	'F' }">여성</c:if>
									<c:if test="${myInfo.mGender eq	'M' }">남성</c:if>
								</div>
								<div class="item__subinfo">
									<span>나이</span> <span>${myInfo.mBirthday }</span>
								</div>
								<div class="item__subinfo">
									<span>운전면허</span> 
									<c:if test="${myInfo.mLicense eq 'Y' }">있음</c:if>
									<c:if test="${myInfo.mLicense eq 'N' }">없음</c:if>
									
								</div>
								<div class="item__subinfo">
									<span>EMAIL</span> <span>${myInfo.mEmail }</span>
								</div>

								<div class="item__description">
									<hr>
									<h6>INTRODUCE:</h6>
									<p>${myInfo.mIntroduce }</p>
								</div>
							</div>
							<div class="item__description">
								<hr>
								<ul class="social-list">
									<li><a href="#"> <i class="socicon-twitter"></i>
									</a></li>
									<li><a href="#"> <i class="socicon-facebook"></i>
									</a></li>
									<li><a href="#"> <i class="socicon-pinterest"></i>
									</a></li>
									<li><a href="#"> <i class="socicon-stumbleupon"></i>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!--end of row-->
			</div>
			<!--end of container-->
		</section>

		<section class="masonry-contained">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
					<div class="blog-post__comments">
						<hr>
						<h6>Reviews: </h6>
						<div id="CommentArea">

						

								<div>
									<c:forEach items="${myReviewList}" var="reviews"
										varStatus="status">
										<div style="display: flex; justify-content: space-between;">
											<div class="comment" style="display: flex">
											
											<c:if test="${reviews.rReviewType != 'complain'}">
												<div class="comment__image  cimg">
														<img alt="pic" src="img/avatar-small-1.png" class="csimg" />
												</div>
												<div class="comment__text">
														<div>
															<b>*****</b>
														</div>
														<p class="chatbox"
															style="padding-left: 1em; padding-right: 1em;">${reviews.rContent }</p>
												
													</c:if>
												</div>
											</div>

										</div>
										<!--end comment-->
									</c:forEach>
								</div>
						
						</div>

						<div class="pagination-container">
							<hr>
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<li class="pagination_button active"><a
										href="${pageMaker.startPage - 1 }">Prev</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
									<li class="pagination_button active"><a href="${num }">${num }</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next }">
									<li class="pagination_button active"><a
										href="${pageMaker.endPage + 1 }">Next</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!--end of blog comments-->
				</div>

			</div>


		</section>

		<!-- <<<<< footer >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
		<jsp:include page="tail.jsp" />

		<script>
		$(document).ready(
				function() {
					var listForm = $("#listForm");

					$(".pagination_button a").on(
							"click",
							function(e) {
								e.preventDefault();

								listForm.find("input[name='pageNum']").val(
										$(this).attr("href"));
								listForm.submit();
							});
				});
	</script>

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