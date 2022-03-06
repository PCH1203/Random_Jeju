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


.btn {
	padding: 0.5em 1em;
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
	border-radius: 1em;
	font-size: 15px;
	
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
</style>

</head>

<body class="scroll-assist">
	<a id="top"></a>

	<jsp:include page="Header.jsp" />
	<div class="loader"></div>
	<div class="main-container transition--fade">
		<section class="imagebg height-30">
			<div class="background-image-holder background--bottom">
				<img alt="image" src="img/제주사진/제주013.jpg" />
			</div>
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h1>
							<a style="color: white" href="getBoardList.do">자유게시판</a>
						</h1>
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

					<h2>${board.title}</h2>
					<h5>작성자:&nbsp;&nbsp;${board.writer} &nbsp;&nbsp;&nbsp;&nbsp; 날짜:&nbsp;&nbsp;<fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd" /> &nbsp;&nbsp;&nbsp;&nbsp; 조회수:&nbsp;&nbsp;${board.cnt}</h5>
					<div style="display: flex; justify-content: flex-end;">
						<div>
							<c:if test="${board.mSeq == member.mSeq }">
								<a class="btn" href="admin-writeupdate.jsp?seq=${board.seq}">수정</a>
							</c:if>
						</div>
						<div>
							<c:if test="${board.mSeq == member.mSeq }">
								<a class="btn" href="deleteBoard.do?seq=${board.seq}">삭제</a>
							</c:if>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12 mb-6"
							style="background-color: rgba(255, 255, 255, 0.849); border-radius: 10px; padding: 15%; border: 1px solid rgba(0, 0, 0, .2);">
							<c:forEach var="boardFile" items="${fileList}">
								<div style="text-align: center; align-items: center;">
									<img src="upload/${boardFile.originalFileName}"
										style="max-height: 50%; max-width: 50%;">
								</div>
								<br>
							</c:forEach>
							<div>${board.content}</div>
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
						<h6>Comments:</h6>
						<div id="CommentArea">
						
							<form action="" method="post" id="listForm">
						<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input
						type="hidden" name="amount" value="${pageMaker.cri.amount }">
					
		
							<div>
								<c:forEach items="${freeCommentList}" var="commentList">
									<div style=" display: flex ; justify-content:space-between;" >
									<div class="comment" style="display: flex">
										<div class="comment__image  cimg">
										<c:if test="${!empty commentList.mImgName}">
											<img alt="pic" src="upload/${commentList.mImgName}"
												class="csimg" />
										</c:if>
										<c:if test="${empty commentList.mImgName}">
											<img alt="pic" src="img/avatar-small-1.png"
												class="csimg" />
										</c:if>
										</div>
										<div class="comment__text">
											<div style="font-weight: 200px">
												<b>${commentList.fmNickname}</b> <em>${commentList.fmTime}</em>
											</div>
											<div style="font-size: 20px">	
											<p class="chatbox"
												style="padding-left: 1em; padding-right: 1em;">${commentList.fmComment}</p>
											</div>
										</div>
									</div>
										<div style=" display: flex ; justify-content: flex-end;">
										<c:if test="${commentList.mSeq == member.mSeq}">
                              <a
                                 href="deleteComment.do?fmSeq=${commentList.fmSeq}&mSeq=${commentList.mSeq}">삭제</a>
                              <br>
                              </c:if>
										</div>
										</div>
									<!--end comment-->
								</c:forEach>
							</div>
								</form>
						</div>
						<form class="comment__form form--square"
							action="insertBoardComment.do?seq=${board.seq}">
							<h6>Leave a Comment</h6>
							<!-- <input placeholder="Your Name" type="text" name="name" /> -->
							<!-- <input placeholder="Email Address" type="email" name="email" /> -->
							<textarea placeholder="Your Comment" name="fmComment" rows="4"></textarea>
							<button type="submit" class="btn btn--primary"
							style="background-color: rgba(166, 208, 205, 0.8); border-style: none;"
							>Submit
								Comment</button>
						</form>
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