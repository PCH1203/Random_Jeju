<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Random Jeju | RoomCatgory</title>
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
<style>
.wide-grid img {
	height: 40vh;
}

.row {
	font-size: 11px;
}

.row .col-md-12 {

	line-height: 1em;
}

.masonry__item {
	position: relative !important;
	left: 0px !important;
	right: 0px !important;
	top: 0px !important;
}

.masonry__container {
	height: auto !important;
}

.pwSubmit__btn {
	text-align: center;
}

.pwSubmit__btn>button {
	width: 100px;
	border-radius: 50px;
	border-style: none;
	background-color: rgba(166, 208, 205, 1);
}

.pwInput__box {
	background-color: rgba(138, 137, 137, 1);
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
		<section class="imagebg height-60 parallax" data-overlay="5">
			<div class="background-image-holder">
				<img alt="image" src="img/제주012.jpg" />
			</div>
			<div class="container pos-vertical-center">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h1>여행 목록 </h1>
						<p class="lead">참여하고싶은 여행을 골라보세요</p>
					</div>
				</div>
				<!--end row-->
			</div>
			<!--end container-->
		</section>

		<section class="wide-grid masonry masonry-shop">
			<!-- body컨텐츠들이 들어있는 장소 -->
			<div class="masonry__filters masonry__filters--outside text-center"
				data-filter-all-text="모두보기"></div>
			<div class="masonry__container masonry--animate">

				<c:forEach var="trip" items="${tripList}" varStatus="status">

					<c:if test="${trip.trStatus eq 1 }">
						<!-- 12.12 박찬호 추가 -->
						<div
							class="col-md-3 col-sm-6 col-xs-12 masonry__item modal-instance"
							data-masonry-filter="${trip.trMode}">


							<c:choose>
								<c:when test="${not empty trip.trPasswordSet}">

									<div class="modal-container">
										<div class="modal-content bg--white height--natural">
											<div
												class="form-subscribe-1 boxed boxed--lg bg--white box-shadow-wide">
												<div class="subscribe__title text-center">
													<h4>암호 입력</h4>
												</div>
												<form class=" form--center-submit-button" id="subForm">
													<div class="input-with-icon">
														<label for="pw">PassWord</label> <i
															class="icon icon-Security-Check"></i>
														 <input id="nammju${status.index}"  name="namju" type="passWord" />
														 
														<!-- <input id="nammju" name="namju" type="passWord" /> -->
													</div>
													<br>
													<!--<div class="pwSubmit__btn"> -->
													<center><button class="btn" type="button" style="background-color: rgba(166, 208, 205, 0.8); border-style: none;" id="${status.index }"
														value="${trip.trPasswordSet }" onclick="namju123(this);">참여하기</button><center>
													<!--</div> -->
												</form>

											</div>
										</div>
										<!--end of modal-content-->
									</div>

									<a class="modal-trigger" href="room-game.html">

										<div class="shop-item shop-item-1">
											<div class="qwe" style="width: 40px; height: 40px;"></div>
											<div class="hover-element hover-element-1 "
												data-title-position="top,left" style="background: black;">
												<div class="hover-element__initial">


													<c:if test="${empty trip.trImgName }">
														<img alt="Pic" src="img/pch_img_7.png" />
													</c:if>
													<c:if test="${!empty trip.trImgName }">
														<img alt="Pic" src="upload/${trip.trImgName}" />
													</c:if>


												</div>
												<div class="hover-element__reveal" data-overlay="9">
													<div class="boxed" style="padding: 1.5em;">
														<div class="row" style="display: flex; flex-wrap: wrap; font-size: 1.0vw;  line-height: 2;">
															<div class="col-md-12 col-sm-12"
																style="height:15%; border-bottom: 2px solid #eee; margin-bottom: 5%;">
																<span><em>${trip.trName }</em></span>
															</div>
															<br>
															<div class="col-md-12 col-sm-12">
																<span><em>인원 :&nbsp;
																		${trip.tripMember } / ${trip.trPersonnelSet }</em></span>
															</div>
															<br>
															<div class="col-md-12 col-sm-12">
																<span><em>성별 : </em>&nbsp; <span name="gender">
																		<c:choose>
																			<c:when test="${trip.trGenderSet eq 'F'}">여자만!</c:when>
																			<c:when test="${trip.trGenderSet eq 'M'}">남자만!</c:when>
																			<c:otherwise>무관</c:otherwise>
																		</c:choose>
																</span> </span>
															</div>
															<br>
															<div class="col-md-12 col-sm-12">
																<span><em>암호 : </em>&nbsp; <span name="pwd">
																		<c:choose>
																			<c:when test="${empty trip.trPasswordSet }">없음</c:when>
																			<c:when test="${not empty trip.trPasswordSet }">있음</c:when>
																		</c:choose>
																</span> </span>
															</div>
															<br>
															<div class="col-md-12 col-sm-12" style="height: 26px;">
																<span><em>면허 : </em>&nbsp; <span name="license">
																		<c:choose>
																			<c:when test="${trip.trLicenseSet eq 'Y'}">면허 O</c:when>
																			<c:when test="${trip.trLicenseSet eq 'N'}">면허 X</c:when>
																			
																			<c:otherwise>상관없음</c:otherwise>
																		</c:choose>
																</span> </span>
															</div>
															<br>
															<div class="col-md-12 col-sm-12">
																<span><em>모드 :</em>&nbsp; <em>${trip.trMode }</em>
																</span>
																<div class="col-md-12">
																<br>
																	<p style="color: black; background-color: #eee;">${trip.trIntro }</p>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</c:when>
								<c:when test="${empty trip.trPasswordSet }">
									<!-- <a href="entranceRoom.do?trSeq='${trip.trSeq  }"> -->
									<!--  <a href="entranceRoom.do?trSeq=${trip.trSeq  }">-->
									<a href="entranceRoom.do?trSeq=${trip.trSeq  }">

										<div class="shop-item shop-item-1">
											<div class="qwe" style="width: 40px; height: 40px;"></div>
											<div class="hover-element hover-element-1 "
												data-title-position="top,left" style="background: black;">
												<div class="hover-element__initial">
													<c:if test="${empty trip.trImgName }">
														<img alt="Pic" src="img/pch_img_7.png" />
													</c:if>
													<c:if test="${!empty trip.trImgName }">
														<img alt="Pic" src="upload/${trip.trImgName}" />
													</c:if>
												</div>
												<div class="hover-element__reveal" data-overlay="9">
													<div class="boxed" style="padding: 1.5em;">
														<div class="row" style="font-size: 1.0vw;  line-height: 2;">
															<div class="col-md-12 col-sm-12"
																style="height: 26px; border-bottom: 2px solid #eee; margin-bottom: 5px;">
																<span><em>${trip.trName }</em></span>
															</div>
															<br>
															<div class="col-md-12 col-sm-12">
																<span><em>인원 :</em>&nbsp; <em>
																		${trip.tripMember } / ${trip.trPersonnelSet }</em></span>
															</div>
															<br>
															<div class="col-md-12 col-sm-12">
																<span><em>성별 : </em>&nbsp; <span name="gender">
																		<c:choose>
																			<c:when test="${trip.trGenderSet eq 'F'}">여자만!</c:when>
																			<c:when test="${trip.trGenderSet eq 'M'}">남자만!</c:when>
																			<c:when test="${trip.trGenderSet eq 'X'}">무관</c:when>

																		</c:choose>
																</span> </span>
															</div>
															<br>
															<div class="col-md-12 col-sm-12">
																<span><em>암호 : </em>&nbsp; <span name="pwd">
																		<c:choose>
																			<c:when test="${empty trip.trPasswordSet }">없음</c:when>
																			<c:when test="${not empty trip.trPasswordSet }">있음</c:when>
																		</c:choose>
																</span> </span>
															</div>
															<br>
															<div class="col-md-12 col-sm-12" style="height: 26px;">
																<span><em>면허 : </em>&nbsp; <span name="license">
																		<c:choose>
																			<c:when test="${trip.trLicenseSet eq 'Y'}">면허 O</c:when>
																			<c:when test="${trip.trLicenseSet eq 'N'}">면허 X</c:when>
																			<c:when test="${trip.trLicenseSet eq 'X'}">무관</c:when>
																		</c:choose>
																</span> </span>
															</div>
															<br>
															<div class="col-md-12 col-sm-12">
																<span><em>모드 :</em>&nbsp;<em>${trip.trMode }</em></span>
															</div>
															<div class="col-md-12">
															<br>
																<p style="color: black; background-color: #eee;">${trip.trIntro }</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</c:when>
							</c:choose>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<!--end masonry container-->
		</section>

		<!-- footer -->
		<jsp:include page="tail.jsp" />

	</div>
	<!-- 12.13 박찬호 수정 -->
	<script>
		function namju123(obj) {
			var pw = obj.value;
			var index = obj.id;
			var trSeqList = [];
			<c:forEach var="trip" items="${tripList}" varStatus="status">
			trSeqList.push("${trip.trSeq}");
			</c:forEach>
			var inputpw = $("#nammju"+ obj.id).val();
			var trSeq = trSeqList[index];
			console.log("pw"+pw);
			console.log("inputpw.value" + $("#nammju" + obj.id).val());
			
			//console.log("inputpw"+inputpw);
			
			 if(pw==inputpw){			
				location.href="entranceRoom.do?trSeq=" + trSeq;
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				//location.href='getTripList.do';
			}  
			/* document.getElementById("nammju").value=""; */
		}
	</script>
	<!-- end 12.13 박찬호 수정 end -->

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
	<script language=JavaScript src="js/scripts.js" charset='euc-kr'></script>
</body>
</html>