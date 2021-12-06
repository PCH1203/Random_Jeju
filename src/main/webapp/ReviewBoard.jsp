<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>ReviewBoard</title>
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
<link href="css/dataTables.bootstrap4.hyun.css" rel="stylesheet">
</head>
<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!--  Header 인클루드  -->
	<jsp:include page="Header_2.jsp" />

	<!-- nav -->
	<!--end of modal-container-->
	<div class="main-container transition--fade">
		<section class="height-50 page-title page-title--animate">
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h1>장소 추천 게시판</h1>
						<p class="lead">Please leave reviews of tourist attractions,
							restaurants, cafes, and accommodations you've experienced!.</p>
					</div>
				</div>
				<!--end row-->
			</div>
			<!--end container-->
		</section>
		<section class="masonry-contained">
			<div class="container">
				<div class="row">
					<div class="masonry masonry-shop">
						<div class="masonry__filters text-center"
							data-filter-all-text="모두 보기"></div>
						<div class="masonry__container masonry--animate">

							<c:forEach var="place_file" items="${reviewBoardList}"
								varStatus="status">

								<div class="col-md-4 col-sm-6 masonry__item"
									data-masonry-filter="${place_file.pCategory}">


									<a href="getReviewWriteList.do?pSeq=${place_file.pSeq }">
										<div class="card card-7">
											<div class="card__image">
												<img alt="Pic" src="upload/${place_file.originalFileName}" />
											</div>
											<div class="card__body boxed bg--white">
												<div class="card__title">
													<h6>"${place_file.pCategory}"</h6>
													<h5>"${place_file.pName}"</h5>
												</div>
											</div>
										</div>
									</a>


								</div>

							</c:forEach>
						</div>
						<!--end masonry container-->
					</div>
					<!--end masonry-->
				</div>


			</div>
			<!--end of container-->

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

		</section>

		
		
		
		<!--end of blog comments-->

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