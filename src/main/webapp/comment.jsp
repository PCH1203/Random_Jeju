<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>room-game</title>
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
<!-- <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e35f6f46581e9c3e609a42f60484833"></script> -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<style>
h1, h2, h3, h4, h5, h6, p, div {
	font-family: 'Noto Sans KR', sans-serif;
}

.boxed {
	position: relative;
	overflow: hidden;
	padding: 1.4375em;
	margin-bottom: 30px;
}
</style>
</head>

<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!-- nav -->
	<!--  Header 인클루드  -->
	<jsp:include page="Header_2.jsp" />

	<!--end of modal-container-->

	<div class="main-container transition--fade">
		<section class="blog-post">
			<div class="blog-post__title bg--secondary">
				<div style="text-align: center;">
					<h2>방 이름 대충 아무거나</h2>
				</div>
				<div class="container"
					style="display: flex; flex-direction: row-reverse;">
					<div class="row">

						<a class="btn btn--sm" href="#"> <span class="btn__text">
								방 나가기 </span>
						</a>
					</div>
					<!--end of row-->
				</div>
				<!--end of container-->
			</div>
			<div class="container" style="display: flex;">
				<div class="row">
					<div class="col-sm-6">
						<a href="#">
							<div class="hover-element hover-element-1"
								data-title-position="center,left">
								<em>
									<h4>여행하는 사람들</h4>
								</em>
								<div class="hover-element__initial">
									<img alt="Pic" src="img/제주사진/제주001.jpg" />
								</div>
								<div class="hover-element__reveal" data-overlay="9">
									<div class="boxed">
										<h4>여행하는사람들</h4>
										<br> <span> <a href="">
												<h5>허지윤</h5>
										</a> <a href="">
												<h5>허지윤</h5>
										</a> <a href="">
												<h5>허지윤</h5>
										</a> <a href="">
												<h5>허지윤</h5>
										</a> <a href="">
												<h5>허지윤</h5>
										</a>
										</span>
									</div>
								</div>
							</div> <!--end hover element-->
						</a>
					</div>
					<div class="col-md-6">
						<div>
							<h5>오늘 여행은?</h5>
							<p>
								안녕하세요~ <br>함께 제주도 여행하실 분들을 찾습니다! 제주도 동쪽위주로 가 볼 생각이고요 저는 승마를
								꼭 하고 싶은데 말 타실 계획이 분들이 있으신 분들이 들어와주시면 좋을 것 같아요 <br>저녁으로는 딱히
								생각하고 있는 식당은 없지만 해산물 종류를 먹으려 합니다.

							</p>
						</div>
						<div>
							<h5>만나는 장소</h5>
							<p>제주공항 앞</p>
						</div>
					</div>

				</div>
			</div>



			<!-- 여행지 -->
			<section>
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="elements--title">
								<h4>여행 추천장소</h4>
							</div>
						</div>



						<!-- 추천장소 -->
						<div class="col-md-3 col-sm-3 modal-instance">
							<div class="card card-1">
								<div class="card__image">
									<img alt="Pic" src="img/제주사진/제주028.jpg" />
								</div>
								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5>제주도</h5>
									</div>
									<a class="btn modal-trigger" href="#"
										style="padding-right: 1.25em; padding-left: 1.25em;"> <span
										class="btn__text"> 더보기 </span>
									</a>
								</div>

								<div class="modal-container">
									<div class="modal-content height--natural">
										<div class="card card-1">
											<div class="card__image">
												<img alt="Pic" src="img/제주사진/제주002.jpg" />
											</div>
											<div class="card__body boxed bg--white">
												<div class="card__title">
													<h5>폭포</h5>
												</div>
												<span> <em>제주시 어딘가 에 있음 </em>
												</span>
												<p>예쁜 폭포임</p>


											</div>
										</div>
									</div>
									<!--end of modal-content-->
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-3 modal-instance">
							<div class="card card-1">
								<div class="card__image">
									<img alt="Pic" src="img/제주사진/제주028.jpg" />
								</div>
								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5>제주도</h5>
									</div>
									<a class="btn modal-trigger" href="#"
										style="padding-right: 1.25em; padding-left: 1.25em;"> <span
										class="btn__text"> 더보기 </span>
									</a>
								</div>

								<div class="modal-container">
									<div class="modal-content height--natural">
										<div class="card card-1">
											<div class="card__image">
												<img alt="Pic" src="img/제주사진/제주002.jpg" />
											</div>
											<div class="card__body boxed bg--white">
												<div class="card__title">
													<h5>폭포</h5>
												</div>
												<span> <em>제주시 어딘가 에 있음 </em>
												</span>
												<p>예쁜 폭포임</p>


											</div>
										</div>
									</div>
									<!--end of modal-content-->
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-3 modal-instance">
							<div class="card card-1">
								<div class="card__image">
									<img alt="Pic" src="img/제주사진/제주028.jpg" />
								</div>
								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5>제주도</h5>
									</div>
									<a class="btn modal-trigger" href="#"
										style="padding-right: 1.25em; padding-left: 1.25em;"> <span
										class="btn__text"> 더보기 </span>
									</a>
								</div>

								<div class="modal-container">
									<div class="modal-content height--natural">
										<div class="card card-1">
											<div class="card__image">
												<img alt="Pic" src="img/제주사진/제주002.jpg" />
											</div>
											<div class="card__body boxed bg--white">
												<div class="card__title">
													<h5>폭포</h5>
												</div>
												<span> <em>제주시 어딘가 에 있음 </em>
												</span>
												<p>예쁜 폭포임</p>


											</div>
										</div>
									</div>
									<!--end of modal-content-->
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-3 modal-instance">
							<div class="card card-1">
								<div class="card__image">
									<img alt="Pic" src="img/제주사진/제주028.jpg" />
								</div>
								<div class="card__body boxed bg--white">
									<div class="card__title">
										<h5>제주도</h5>
									</div>
									<a class="btn modal-trigger" href="#"
										style="padding-right: 1.25em; padding-left: 1.25em;"> <span
										class="btn__text"> 더보기 </span>
									</a>
								</div>

								<div class="modal-container">
									<div class="modal-content height--natural">
										<div class="card card-1">
											<div class="card__image">
												<img alt="Pic" src="img/제주사진/제주002.jpg" />
											</div>
											<div class="card__body boxed bg--white">
												<div class="card__title">
													<h5>폭포</h5>
												</div>
												<span> <em>제주시 어딘가 에 있음 </em>
												</span>
												<p>예쁜 폭포임</p>
												<span class="btn__text"> 인증하기 </span>

											</div>
										</div>
									</div>
									<!--end of modal-content-->
								</div>
							</div>
						</div>


						<!-- 게임모드 버튼 -->
						<div class="container modal-instance"
							style="display: flex; justify-content: space-around;">
							<a class="btn mb--1" href="#"> <span class="btn__text">
									장소정하기 </span>
							</a> <a class="btn mb--1 modal-trigger" href="#"> <span
								class="btn__text"> 인증하기 </span>
							</a>
							<div class="modal-container">
								<div class="modal-content height--natural">
									<div class="card card-1">
										<div class="boxed bg--white ">
											<form>
												<div class="card__title">
													<h5>인증하기</h5>
													<div id="imagePreview">
														<img id="img" />
													</div>
													<div class="form-group">
														<input type="file" class="form-control-file"
															id="InputFile" />
													</div>
												</div>
												<a class="btn modal-trigger" href="#"
													style="padding-right: 1.25em; padding-left: 1.25em;">
													인증하기 </a>
											</form>
										</div>
									</div>
								</div>
								<!--end of modal-content-->
							</div>

							<a class="btn mb--1" href="#"> <span class="btn__text">
									clear </span>
							</a>
						</div>
					</div>
					<!--end row-->
				</div>
				<!--end of container-->
			</section>

			<!--end of row-->
			<div class="row">
				<div class="col-md-12 col-sm-10 text-center">
					<div class="blog-post__share">
						<h5>방 공유하기</h5>
						<a class="btn btn--sm bg--facebook" href="#"> <span
							class="btn__text"> <i class="fas fa-link"></i>링크 복사하기
						</span>
						</a> </a>
					</div>
				</div>
			</div>
			<!--end of row-->
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
					<div class="blog-post__comments">
						<hr>
						<h6>Comments:</h6>
						<ul>
							<li>
								<div class="comment">
									<div class="comment__image">
										<img alt="pic" src="img/avatar-small-4.png" />
									</div>
									<div class="comment__text">
										<h5>허지윤</h5>
										<span> <em>March 17th, 2016</em>
										</span>
										<p>안녕하세요~</p>
									</div>
									<hr>
								</div> <!--end comment-->
							<li>
								<div class="comment">
									<div class="comment__image">
										<img alt="pic" src="img/avatar-small-1.png" />
									</div>
									<div class="comment__text">
										<h5>허지윤</h5>
										<span> <em>March 15th, 2016</em>
										</span>
										<p>저 지금 공항 앞이에요</p>
									</div>
									<hr>
								</div> <!--end comment-->
							</li>
						</ul>
						<form class="comment__form form--square">
							<h6>Leave a Comment</h6>
							<!-- <input placeholder="Your Name" type="text" name="name" /> -->
							<!-- <input placeholder="Email Address" type="email" name="email" /> -->
							<textarea placeholder="Your Comment" name="comment" rows="4"></textarea>
							<button type="submit" class="btn btn--primary" style="float:right;">Submit Comment</button>
						</form>
					</div>
					<!--end of blog comments-->
				</div>
			</div>
			<!--end of row-->
	</div>
	<!--end of container-->
	</section>

	<!-- footer -->
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