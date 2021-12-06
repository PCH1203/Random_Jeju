<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>Random Jeju | Main page</title>
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
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap')
	;

P, h1, h2, h3, h4, h5, h6, div, a, i {
	font-family: 'Noto Sans KR', sans-serif;
}

.museum-intro {
	white-space: nowrap;
	top: 50%;
	bottom: 0;
	padding: 0 15px;
	background-color: #8a8989;
	background-color: rgba(138, 137, 137, 0.7);
}

.museum-intro {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 50%;
	z-index: 10;
	margin: auto;
	white-space: nowrap;
	color: #fff;
	background-color: rgba(138, 137, 137, 0.7);
	text-align: center;
}
</style>


<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!--  Header 인클루드  -->
	<jsp:include page="Header.jsp" />

	<!--<<<<< main 영역 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->

	<div class="main-container transition--fade d-flex align-items-center">


		<!--<<<<< 동영상 배경 >>>>> -->

		<section class="imagebg videobg height-100" data-overlay="4">
			<video autoplay loop muted>
				<source src="video/background_video_2.mp4" type="video/mp4">
			</video>
			<div class="background-image-holder">
				<img alt="image" src="img/pch_img_2.jpg" />
			</div>
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 text-center">
						<img alt="image" src="img/logo_demo_light.png" style="width: 50%;" />
					</div>
				</div>
			</div>
		</section>

		<!--<<<<< end 동영상 배경 end >>>>> -->



		<!-- <<<<< 간략한 웹사이트 소개 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

		<section
			class="testimonial testimonial-4 section--even imagebg parallax"
			data-overlay="5">
			<div class="background-image-holder">
				<img alt="image" src="img/pch_img_1.jpg" />
			</div>
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h3>제주º</h3>
					</div>
				</div>
				<!--end of row-->
				<div class="row">
					<div class="slider slider--animate slider--controlsoutside"
						data-animation="fade" data-arrows="false" data-paging="true"
						data-timing="5000">
						<ul class="slides">
							<li>
								<div class="col-sm-10 col-sm-offset-1 text-center">
									<blockquote>새로운 혹은 소중한 사람들과 제주를 함께 즐기세요.</blockquote>
									<h5></h5>
								</div>
							</li>
							<li>
								<div class="col-sm-10 col-sm-offset-1 text-center">
									<blockquote>랜덤 모드를 통해 색다른 제주를 즐기세요.</blockquote>
									<h5></h5>
								</div>
							</li>
							<li>
								<div class="col-sm-10 col-sm-offset-1 text-center">
									<blockquote></blockquote>
									<h5></h5>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!--end of row-->
			</div>
			<!--end of container-->
		</section>

		<section class="wide-grid masonry" style="margin-top: 5%;">
			<div style="text-align: center;">
				<h3>
					제주º <small>추천 place</small>
				</h3>
			</div>
			<div class="masonry__filters text-center" data-filter-all-text="전체"></div>
			<div class="masonry__container">

				<!-- <<<< 숙소 >>>>  -->
				<div class="col-md-4 col-sm-6 masonry__item"
					data-masonry-filter="숙소">
					<a href="#">
						<div class="hover-element hover-element-1"
							data-title-position="top,right">
							<div class="hover-element__initial">
								<img alt="Pic" src="img/place_4.jpg" />
							</div>
							<div class="hover-element__reveal" data-overlay="9">
								<div class="boxed">
									<h5>Freehance</h5>
									<span> <em>iOS Application</em>
									</span>
								</div>
							</div>
						</div> <!--end hover element-->
					</a>
				</div>

				<div class="col-md-4 col-sm-6 masonry__item"
					data-masonry-filter="숙소">
					<a href="#">
						<div class="hover-element hover-element-1"
							data-title-position="top,right">
							<div class="hover-element__initial">
								<img alt="Pic" src="img/room_1.jpg" />
							</div>
							<div class="hover-element__reveal" data-overlay="9">
								<div class="boxed">
									<h5>Freehance</h5>
									<span> <em>iOS Application</em>
									</span>
								</div>
							</div>
						</div> <!--end hover element-->
					</a>
				</div>

				<!-- <<<< end 숙소 end >>>>  -->

				<!-- <<<< 카페 >>>>  -->
				<div class="col-md-4 col-sm-6 masonry__item"
					data-masonry-filter="카페">
					<a href="#">
						<div class="hover-element hover-element-1"
							data-title-position="top,right">
							<div class="hover-element__initial">
								<img alt="Pic" src="img/pch_img_6.jpg" />
							</div>
							<div class="hover-element__reveal" data-overlay="9">
								<div class="boxed">
									<h5>Michael Andrews</h5>
									<span> <em>Branding & Identity</em>
									</span>
								</div>
							</div>
						</div> <!--end hover element-->
					</a>
				</div>
				<div class="col-md-4 col-sm-6 masonry__item"
					data-masonry-filter="카페">
					<a href="#">
						<div class="hover-element hover-element-1"
							data-title-position="top,right">
							<div class="hover-element__initial">
								<img alt="Pic" src="img/pch_img_5.PNG" />
							</div>
							<div class="hover-element__reveal" data-overlay="9">
								<div class="boxed">
									<h5>Pillar Stationary</h5>
									<span> <em>Branding Collateral</em>
									</span>
								</div>
							</div>
						</div> <!--end hover element-->
					</a>
				</div>
				<div class="col-md-4 col-sm-6 masonry__item"
					data-masonry-filter="장소">
					<a href="#">
						<div class="hover-element hover-element-1"
							data-title-position="top,right">
							<div class="hover-element__initial">
								<img alt="Pic" src="img/성산_1.jpg" />
							</div>
							<div class="hover-element__reveal" data-overlay="9">
								<div class="boxed">
									<h5>Authentic Apparel</h5>
									<span> <em>Packaging Design</em>
									</span>
								</div>
							</div>
						</div> <!--end hover element-->
					</a>
				</div>

				<!-- <<<< end 카페 end >>>>  -->

				<!-- <<<< 식당 >>>>  -->

				<!-- (1) -->


				<!-- (2) -->
				<div class="col-md-4 col-sm-6 masonry__item"
					data-masonry-filter="식당">
					<a href="#">
						<div class="hover-element hover-element-1"
							data-title-position="top,right">
							<div class="hover-element__initial">
								<img alt="Pic" src="img/식당_2.jpg" />
							</div>
							<div class="hover-element__reveal" data-overlay="9">
								<div class="boxed">
									<h5>Tesla Controller</h5>
									<span> <em>Apple Watch Application</em>
									</span>
								</div>
							</div>
						</div> <!--end hover element-->
					</a>
				</div>


				<!-- <<<< end 식당 end >>>>  -->

			</div>
			<!--end masonry container-->

			<section class="bg--secondary partners-1 space--sm">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="slider" data-items="6" data-timing="3000">
								<ul class="slides">
									<li><img alt="img" src="img/partner1.png" /></li>
									<li><img alt="img" src="img/partner2.png" /></li>
									<li><img alt="img" src="img/partner4.png" /></li>
									<li><img alt="img" src="img/partner3.png" /></li>
									<li><img alt="img" src="img/partner5.png" /></li>
									<li><img alt="img" src="img/partner6.png" /></li>
									<li><img alt="img" src="img/partner7.png" /></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>

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