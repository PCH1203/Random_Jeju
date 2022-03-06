<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

	<script src="js/jquery-2.1.4.min.js"></script>
<style>
body{
		font-size:13px;
	  background-image: url(img/제주사진/제주003.jpg);
    background-repeat: no-repeat;
	}
		.pimg{
			height:40vh;
			width:40vw;
			object-fit:cover;
		}
		
</style>
</head>
<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!--  Header 인클루드  -->
	<jsp:include page="Header.jsp" />

	<!-- nav -->
	<!--end of modal-container-->
	<div class="main-container transition--fade">
		<section class="height-40 page-title page-title--animate"
		>
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h1 style="color:white">장소 리뷰 게시판</h1>
						<p style="color:white"class="lead">제주도의 특별한 장소들을 찾아보세요.</p>
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
						<div class="masonry__filters text-center" style="color:black;"
							data-filter-all-text="모두 보기"></div>
							
						<div class="masonry__container masonry--animate">
							<form action="" method="post" id="listForm">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
								<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
									
							<c:forEach var="place_file" items="${reviewBoardList}"
								varStatus="status">
								
								<div class="col-md-4 col-sm-6 masonry__item"
									data-masonry-filter="${place_file.pCategory}">

										<a href="getReviewWriteList.do?pSeq=${place_file.pSeq }">
											<div class="card card-7">
												<div class="card__image">
													<img alt="Pic" class="pimg" src="upload/${place_file.originalFileName}" />
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
								
							</form>
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

		</section>




		<!--end of blog comments-->

		<jsp:include page="tail.jsp" />

	</div>
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