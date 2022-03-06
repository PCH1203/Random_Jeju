<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>Pillar Multipurpose HTML Template</title>
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

<script src="js/jquery-2.1.4.min.js"></script>
<style>


.pagination li:first-child, .pagination {
	opacity: 1;
}

.pagination li:last-child, .pagination {
	opacity: 1;
}
</style>
</head>
<body class="scroll-assist">
	<jsp:include page="Header.jsp" />
	<div class="main-container transition--fade ">
		<section class="imagebg height-60  page-title  page-title--animate">
			<div class="background-image-holder background--bottom ">
				<img alt="image" src="img/제주사진/제주013.jpg">
			</div>
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h1>자유게시판</h1>
						<p class="lead">원하는 주제에 대해 자유롭게 글을 등록 해 주세요</p>
					</div>
				</div>
				<!--end row-->
			</div>
			<!--end container-->
		</section>
		<section class="masonry-contained">
			<div class="container">
				<div class="row">
					<div style="display: flex; justify-content: flex-start;">
						<div class="btn" style="">
							<a href="getBoardCategory.do?category=etc" style="color: black">기타/잡담</a>
						</div>
						<div class="btn">
							<a href="getBoardCategory.do?category=place" style="color: black">장소추천</a>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
						<form action="" method="post" id="listForm">
						<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input
						type="hidden" name="amount" value="${pageMaker.cri.amount }">
							<table class="table" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>번호</th>
										<th>카테고리</th>
										<th>글쓴이</th>
										<th>제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
										<th>등록일</th>
										<th>조회</th>
								</thead>

								<tfoot>
									<tr>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>

									</tr>
								</tfoot>
								<!--여기부터 1 찍어야함 위에는 바닥부분 설정-->
								<tbody>
										
										<c:forEach var="board" items="${boardList }"
											varStatus="status">
											<tr>
												<th>${board.seq}</th>
												<c:if test="${board.category == 'etc' }">
													<th>기타/잡담</th>
												</c:if>
												<c:if test="${board.category == 'place' }">
													<th>장소추천</th>
												</c:if>
												<th>${board.writer}</th>
												<th><a href="getBoard.do?seq=${board.seq }">${board.title}</a></th>
												<th><fmt:formatDate value="${board.regDate}"
														pattern="yyyy.MM.dd" /></th>
												<th>${board.cnt}</th>


												<td></td>
											</tr>
										</c:forEach>
									
								</tbody>
							</table>
							</form>
						</div>
					</div>

					<div class="row" style="display: flex">
						<div class="col-8"></div>
						<div class="col-2">
							<button style="width: 100%; font-size: 200px;
							background-color: rgba(166, 208, 205, 0.8); border-style: none;""
								class="btn btn-primary" 
								
								onclick="location.href='admin-write2.jsp?${Member.mId}'">글
								쓰기</button>
						</div>
					</div>

					<!--end masonry container-->
				</div>
			</div>
			<!--end of row-->
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
	</div>
	<!--end of container-->
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