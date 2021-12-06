<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>choose_join</title>
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

	<!--end of modal-container-->
	<div class="main-container transition--fade">
		<section class="height-50 page-title page-title--animate">
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h2>어떤 여행을 원하시나요?</h2>
						<p class="lead"></p>
					</div>
				</div>
				<!--end row-->
			</div>
			<!--end container-->
		</section>
		<section>
			<div class="container">
				<div class="row">
					<div class="masonry masonry-blog">
						<div class="masonry__container masonry--animate">
							<div class="col-md-6 col-sm-6 masonry__item">
								<a href="getTripList.do">
									<div class="card card-4">
										<div class="card__image">
											<img alt="Pic" src="img/제주021.jpg" style="max-height: 50vh;" />
										</div>
										<div class="card__body boxed boxed--sm bg--white">
											<h3>참여하기</h3>
											<hr>
											<div class="card__title">
												<h5>
													혼자하는 여행이 지루하신가요? <br>마음에 드는 사람들과 짧은 여행을 즐겨보세요!
												</h5>
											</div>

										</div>
									</div>
								</a>
							</div>
							<!--end item-->
							<div class="col-md-6 col-sm-6 masonry__item">
								<a href="createTrip.do">
									<div class="card card-4">
										<div class="card__image">
											<img alt="Pic" src="img/제주002.jpg" style="max-height: 50vh;" />
										</div>
										<div class="card__body boxed boxed--sm bg--white">
											<h3>방 만들기</h3>
											<hr>
											<div class="card__title">
												<h5>
													가까운 지인과의 여행 또는 <br> 랜덤 여행의 즐거움을 위해 방을 만들어보세요!
												</h5>
											</div>

										</div>
									</div>
								</a>
							</div>
							<section>

								<!--end of container-->
							</section>
							<!--end item-->
						</div>
						<!--end masonry container-->
					</div>

				</div>
				<!--end of row-->
			</div>
			<!--end of container-->
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