<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>Random Jeju | Room Game</title>
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
	 <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>

<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/scripts.js"></script>
<style>
h1, h2, h3, h4, h5, h6, p, div {
	font-family: 'Noto Sans KR', sans-serif;
}

.previmg {
	width: 15em;
	height: 15em;
	margin-right: 1em;
	border-radius: 50%;
}
.boxed {
	position: relative;
	overflow: hidden;
	padding: 1.4375em;
	margin-bottom: 30px;
}

.row-sc {
	height: 60px;
	padding-top: 20px;
}

#controlBtn {
	border-style: none;
	background-color: rgba(26, 87, 148, 0.8);
}

#controlBtn>span {
	color: white;
	font-size: 15px;
}

.profile-btn, .reviewbtn {
	border-style: none;
	background-color: rgba(166, 208, 205, 0);
}

.profile-btn>span {
	font-size: large;
	color: white;
}

.reviewbtn>span {
	font-size: large;
	color: white;
}

.comment {
	margin-left: 5%;
}

.chatbox {
	/* border: solid 1px gray; */
	padding-left: 1em;
	padding-right: 1em;
	width: fit-content;
	background-color: #d0d9f5;
	border-radius: 10%/60%;
	font-size: 13px;
	padding-left: 5%;
	padding-right: 5%;
	padding-top: 1%;
	padding-bottom: 1%;
}

.cimg {
	width: auto !important;
}

.csimg {
	width: 3em;
	height: 3em;
	margin-right: 1em;
	border-radius: 50%;
}

em {
	font-size: 12px;
}

.cs {
	height: 500px;
	overflow: auto;
	display: flex;
	flex-direction: column-reverse;
}

/* 12.13 박찬호 추가*/
.viewReviewBtn {
	text-align: right;
}

.vr__btn>span {
	font-size: large;
	color: white;
}

.profile-btn, .reviewbtn, .vr__btn {
	border-style: none;
	background-color: rgba(166, 208, 205, 0);
}

/* end 12.13 박찬호 추가 end */
.modal-content::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera*/
}

.mi {
	width: 40vw;
	height: 40vh;
	object-fit: cover;
}


</style>
</head>

<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!--  Header 인클루드  -->
	<jsp:include page="Header_2.jsp" />

	<!-- nav -->
	<!--end of modal-container-->

	<div class="main-container transition--fade">
		<section class="blog-post">

			<!--  여행방 공통 영역 12.12 박찬호 추가  -->
			<div class="blog-post__title bg--secondary"
				style="background-image: url(img/제주사진/제주023.jpg);">

				<input type="hidden" id="tripSeq" value="${trip.trSeq }">
				<div style="text-align: center;">

					<c:if test="${tripMember.tmRole eq 'h' }">
						<h4 style="color: white;">안녕하세요 ${tripMember.tmName } (호스트)
							님! 반가워요😊</h4>
					</c:if>
					<c:if test="${tripMember.tmRole eq 'g' }">
						<h4 style="color: white;">안녕하세요 ${tripMember.tmName } (게스트)
							님! 반가워요😊</h4>
					</c:if>

					<c:if test="${empty tripMember }">
						<h4 style="color: white;">여행에 참가하여 색다른 제주도를 경험하세요!</h4>
					</c:if>

				</div>
				<br>
				<div style="text-align: center;">
					<h2 style="color: white;">${trip.trName }</h2>
				</div>
				<br> <br> <br>



				<div class="row">
					<div class="col-sm-12 text-left" style="padding-left: 5%">
						<div class="bloe">

							<a class="btn btn--sm" id="controlBtn" href="getTripList.do">
								<span class="btn__text"> ◁ LIST</span>
							</a>

						</div>
					</div>
				</div>

			</div>

			<div class="container" style="margin-top: 5em;">

				<div class="row">
					<div class="col-sm-4" id="memberArea">

						<em><h4>여행 맴버 ( ${members } / ${trip.trPersonnelSet })</h4></em>

						<c:forEach var="tmList" items="${tripMemberList}"
							varStatus="status">

							<div class="hover-element hover-element-1"
								data-title-position="center,left" >
								
								<c:if test="${tmList.tmRole eq 'h' }" >
								<div ><i style="transform: rotate( -25deg );color: #00000059 "class="fas fa-crown fa-3x"></i></div>
								 </c:if>
								<c:if test="${tmList.tmRole eq 'g' }" >
								 </c:if>


								<div class="shop-item shop-item-1"
									<c:if test="${tmList.tmRole eq 'h' }" >
										style="height: 160px; width: 160px; border-radius: 50%; padding: 0; margin: 0;
                                        border-style: solid; border-width: 5px; border-color: rgba(226, 88, 61, 1); "
                                   </c:if>
									<c:if test="${tmList.tmRole eq 'g' }" >
										style="height: 150px; width: 150px; border-radius: 50%; padding: 0; margin: 0;
                                        border-style: none;"
                                   </c:if>>


									<div class="hover-element__initial">
										<c:choose>
											<c:when test="${empty tmList.mImgName }">
												<img alt="Pic" src="img/기본이미지.jpg"
													style="height: 150px; width: 150px; border-radius: 50%;" preview-image" />
											</c:when>
											<c:when test="${!empty tmList.mImgName }">
												<img alt="Pic" src="upload/${tmList.mImgName}"
													style="height: 150px; width: 150px; border-radius: 50%;" preview-image" />
											</c:when>
										</c:choose>


									</div>


									<div class="hover-element__reveal" data-overlay="7">

										<!-- 맴버 프로필  -->
										<div class="modal-instance">
											<div class="btn modal-trigger"
												style="border-style: none; padding-left: 20%; padding-top: 20%">
												<ul style="font-size: small; color: white">
													<li>&nbsp;&nbsp;${tmList.mName }/${tmList.mGender}/${tmList.mBirthday }</li>
													<li><p>&nbsp;&nbsp;&nbsp;&nbsp;프로필 보기</p></li>
													<li><c:if
															test="${tripMember.mSeq != tmList.mSeq && tmList.tmRole eq 'h' }">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-crown fa-3x"></i></c:if>
														<c:if
															test="${tripMember.mSeq != tmList.mSeq && tmList.tmRole eq 'g' }">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-users fa-3x"></i></c:if>
														<c:if test="${tripMember.mSeq eq tmList.mSeq }">&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-user fa-3x"></i></c:if>

													</li>
												</ul>

											</div>
											<!-- 맴버 프로필 모달  -->
											<div class="modal-container">
												<div class="modal-content height--natural">
													<div class="card card-1">
														<div class="card__image">

															<img alt="Pic" style="width: 100%;"
																src="upload/${tmList.mImgName}" />

														</div>
														<div class="card__body boxed bg--white">
															<div class="card__title">
																<ul>
																	<li><h4>${tmList.mName }/${tmList.mNickname }</h4></li>
																	<li>
																		<h5>${tmList.mId }
																			/
																			<c:if test="${tmList.mGender eq 'M' }">남성</c:if>
																			<c:if test="${tmList.mGender eq 'F' }">여성</c:if>
																			/ ${tmList.mBirthday }
																		</h5>
																	</li>
																	<!-- 12.13 박찬호 추가 -->
																	<c:if test="${tripMember.mSeq != tmList.mSeq }">
																		<li>
																			<div class="viewReviewBtn">
																				<form action="myReviews.do" method="POST">
																					<input type="hidden" name="mSeq"
																						value="${tmList.mSeq } " />
																					<button type="submit" class="vr__btn btn"
																					style="background-color: rgba(166, 208, 205, 0.8); border-style: none;">
																						<h4 style="color:white;">리뷰보기</h4>
																					</button>
																				</form>
																			</div>
																		</li>
																	</c:if>
																	<!-- end 12.13 박찬호 추가 end -->

																	<hr>
																	<br>
																	<li><h5>< 자기소개 ></h5></li>

																	<li>${tmList.mIntroduce }</li>
																	<br>

																	<li style="text-align: center">
																		<div class="row">
																			<div class="col-sm-6">
																				<c:if
																					test="${!empty tripMember && tripMember.tmRole eq 'h' && tmList.tmRole eq 'g' && trip.trStatus != 3 }">
																					<form action="exileTrip.do" method="post">
																						<button type="submit" class="profile-btn btn"
																						style="background-color: red; border-style: none;"
																							name="mSeq" value=${tmList.mSeq  }>
																							<h4 style="color:white;">강퇴하기</h4>
																						</button>
																					</form>
																				</c:if>
																			</div>

																			<div class="col-sm-6">
																				<c:if
																					test="${!empty tripMember && tripMember.mSeq != tmList.mSeq }">
																					<!-- ============================================================================================================= -->
																					<form action="accessReview.do" method="post">
																						<input type="hidden" name="mSeq"
																							value=${tmList.mSeq  } /> <input type="hidden"
																							name="trSeq" value=${trip.trSeq  } />

																						<button class="reviewbtn btn" type="submit"
																						style="background-color: rgba(166, 208, 205, 0.8); border-style: none;"
																							id="reviewbtn">
																							<h4 style="color:white;">리뷰남기기</h4>
																						</button>
																					</form>
																					<!-- ========================================================================================================= -->


																				</c:if>

																				<c:if test="${tripMember.mSeq == tmList.mSeq }">
																					<button class=" btn" href="getMember.do"
																					style="background-color: rgba(166, 208, 205, 0.8); border-style: none; color: white">
																					<h4 style="color:white;">프로필 수정</h4>
																					</button>
																				</c:if>

																			</div>

																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<!--end of modal-content-->
											</div>
											<!--end of modal-container-->
										</div>

									</div>
								</div>

							</div>

						</c:forEach>

					</div>

					<div class="col-sm-8">

						<div class="row">
							<h3>여행 소개</h3>
							<hr>
							<p>${trip.trIntro }</p>
						</div>
						<hr>
						<div class="row-sc">
							<div class="col-sm-12">
								<h4>일정 정보</h4>
							</div>
						</div>
						<hr>

						<div class="row-sc">
							<div class="col-sm-3">
								<h5>여행 타입</h5>
							</div>
							<div class="col-sm-9">
								<h5>${trip.trMode }</h5>
							</div>
						</div>


						<div class="row-sc">
							<div class="col-sm-3">
								<h5>여행 구역</h5>
							</div>
							<div class="col-sm-9">
								<c:choose>
									<c:when test="${trip.trAreaSet eq 'east' }">동</c:when>
									<c:when test="${trip.trAreaSet eq 'west' }">서</c:when>
									<c:when test="${trip.trAreaSet eq 'south' }">남</c:when>
									<c:when test="${trip.trAreaSet eq 'north' }">북</c:when>
								</c:choose>
							</div>
						</div>


						<div class="row-sc">
							<div class="col-sm-3">
								<h5>여행 일정</h5>
							</div>
							<div class="col-sm-9">
								<c:choose>
									<c:when test="${trip.trDateSet eq 0 }">당일</c:when>
									<c:when test="${trip.trDateSet != 0 }">
										<h5>${trip.trDateSet}박</h5>
									</c:when>
								</c:choose>
							</div>
						</div>


						<div class="row-sc">
							<div class="col-sm-3">
								<h5>이동 수단</h5>
							</div>
							<div class="col-sm-9">
								<h5>
									<c:if test="${trip.trTransportationSet eq 'X' }">무관</c:if>
									<c:if test="${trip.trTransportationSet eq '자동차' }">자동차</c:if>
									<c:if test="${trip.trTransportationSet eq '바이크' }">바이크</c:if>
									<c:if test="${trip.trTransportationSet eq '자전거' }">자전거</c:if>
									<c:if test="${trip.trTransportationSet eq '기타' }">기타</c:if>
								</h5>
							</div>
						</div>

					</div>

				</div>

				<!-- 여행 진행 컨트롤 버튼 12.12 박찬호 추가 -->
				<div class="row">
					<div class="col-sm-12 text-center">
						<div class="bloe">
							<hr>

							<c:if
								test="${!empty tripMember && tripMember.tmRole eq 'h' && trip.trStatus eq 1 && members < 2  }">
								<br>
								<div class="set-status">
									<h4>아직 아무도 참여하지 않았어요ㅜㅡㅜ</h4>
								</div>
							</c:if>
							<c:if
								test="${!empty tripMember && tripMember.tmRole eq 'h' && trip.trStatus eq 1 && members > 1  }">
								<button type="button" class="btn btn--sm "
									id="start" onclick="startTripConfirm('start')"
									style="background-color: rgba(166, 208, 205, 0.8); border-style: none;">start!</button>
							</c:if>

							<c:if
								test="${!empty tripMember && tripMember.tmRole eq 'h' && trip.trStatus eq 2  }">

								<button type="button" class="btn btn--sm "
								style="background-color: rgba(166, 208, 205, 0.8); border-style: none;"
									onclick="startTripConfirm('finish')">일정완료</button>
							</c:if>

							<c:if test="${!empty tripMember && trip.trStatus eq 3  }">
								<div>
									<ul>
										<li><h5>일정이 완료 되었습니다.</h5></li>
										<li><h5>함께 여행한 맴버들에게 리뷰를 남겨보세요!</h5></li>
									</ul>

								</div>
							</c:if>


							<c:choose>
								<c:when test="${!empty tripMember && tripMember.tmRole eq 'g'}">
									<button type="button" class="btn btn--sm bg--facebook"
									style="background-color: red; border-style: none;"
										onclick="exitTripConfirm()">참여 취소</button>
								</c:when>

								<c:when test="${empty tripMember && trip.trStatus eq 1 }">
									<button type="button" class="btn btn--sm bg--facebook"
									style="background-color: rgba(166, 208, 205, 0.8); border-style: none;"
										onclick="attendTripConfirm()">여행 참여</button>
								</c:when>
							</c:choose>

						</div>
					</div>
				</div>
				<!-- end 여행 진행 컨트롤 버튼 12.12 박찬호 end -->
				<!-- end 여행방 공통 영역 end -->

				<!-- 여행지 -->
				<section>
					<div class="container">
						<div class="row" id="rowSchedule">
						<c:if test="${!empty tripMember }">
							<div class="col-sm-12">
								<div class="elements--title">
									<h4>여행 추천장소</h4>
								</div>
							</div>
							</c:if>


							<c:forEach var="schedule" items="${scheduleList}">
								<!-- 추천장소 -->
								<div class="col-md-3 col-sm-3 modal-instance">
									<div class="card card-1">
										<div class="card__image">
											<c:if test="${schedule.trStatus eq 1}">
												<img alt="Pic"
													style="height: 200px; opacity: 0.5; width: 100%;"
													src="/upload/${schedule.trClearFilename }" />
											</c:if>
											<c:if test="${schedule.trStatus eq 0}">
												<img alt="Pic" style="height: 200px; width: 100%;"
													src="/upload/${schedule.originalFileName }" />
											</c:if>
										</div>
										<div class=" boxed bg--white">
											<div class="card__title">
												<h5>${schedule.pName}</h5>
												<span>${schedule.pCategory}</span>
												<!-- status c:if 1일때는 표출, 0일때는 숨김 -->
												<c:if test="${schedule.trStatus eq 1}">
													<center>
														<span
															style="font-size: 20px; color: red; font-wight: bold;">cleard</span>
													</center>
												</c:if>
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
														<img alt="Pic" class="mi"
															src="/upload/${schedule.originalFileName }" />
													</div>
													<div class=" boxed bg--white">
														<div class="card__title">
															<h5>${schedule.pName}</h5>
														</div>
														<span> 주소 : ${schedule.pAddress} </span><br> <span>
															<em>전화번호 : ${schedule.pTell} </em>
														</span>
														<p>${schedule.pInfo}</p>
														<form action="updateClearTrschedule.do" method="post"
														enctype="multipart/form-data">
														<span><i class="fas fa-camera"></i>인증하기</span> <input
															type="hidden" id="scSeq" name="scSeq"
															value="${schedule.scSeq}"> <input type="hidden"
															id="trSeq" name="trSeq" value="${schedule.trSeq}">
															<div >
														<div class="image-container">
															<div style=" display:flex; justify-content: center">
															<div>
															<img class="previmg" 
																id="preview-image"
																src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
													</div>
													</div>

															<input style="display: block;" type="file"
																id="input-image" name="uploadFile">
														</div>
														</div>
														<div style="display: flex; justify-content: center;">
															<button class="btn" style="background-color: rgba(166, 208, 205, 0.8); border-style: none;"  type="submit">사진 제출하기</button>
														</div>
													</form>
													</div>
												</div>
											</div>
										</div>
										<!--end of modal-content-->
									</div>

								</div>
							</c:forEach>

						</div>
						<c:if
							test="${!empty tripMember && tripMember.tmRole eq 'h' && trip.trStatus eq 2 }">
							<div class="row">
								<!-- 게임모드 버튼 -->
								<div class="container"
									style="display: flex; justify-content: space-around;">
									<button type="button" id="btnAddSchedule" class="btn mb--1"
										href="#"
										style="background-color: rgba(166, 208, 205, 0.8); border-style: none;">
										<span class="btn__text"> 장소정하기 </span>
									</button>

								</div>
							</div>
						</c:if>
						<!--end row-->
						<!--end of container-->
				</section>


				<!--end of row-->

				<!--댓글 달기-->
					<c:if test="${!empty tripMember }">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
										<div class="blog-post__comments cs" id="scroll">
						<hr>
						<div id="CommentArea">

							<div
								style="height: 1em; border-radius: 1em 1em 0em 0em; background-color: rgba(0, 0, 0, 0.04)">
							</div>
								<c:if test="${empty commentList}">
								<div style="display: flex; justify-content: center; border-right: 40px; background-color: rgba(0, 0, 0, 0.04)">
										<h3 style="margin: none;color: white;">메시지를 입력해 주세요</h3>
										</div>
								</c:if>
							<c:forEach items="${commentList}" var="commentList">

								<!--end comment-->
								<c:if test="${commentList.mSeq == member.mSeq}">
									<div
										style="display: flex; justify-content: flex-end; border-right: 40px; background-color: rgba(0, 0, 0, 0.04)">
										<div class="comment" style="display: flex">
											<div class="comment__image  cimg">

												<c:if test="${not empty commentList.mImgName }">
													<img class="csimg" alt="pic"
														src="/upload/${commentList.mImgName }" />
												</c:if>

												<c:if test="${empty commentList.mImgName }">
													<img alt="pic" src="img/avatar-small-1.png" />
												</c:if>

											</div>
											<div class="comment__text" style="padding-right: 3em">
												<div>
													<b>${commentList.mNickname}</b> <em>${commentList.cmTime}</em>
												</div>
												<p class="chatbox"
													style="padding-left: 1em; padding-right: 1em; background-color: #fff59d;">${commentList.cmComent}</p>
											</div>
										</div>

									</div>
								</c:if>
								<!--end comment-->
								<c:if test="${commentList.mSeq != member.mSeq}">
									<div
										style="display: flex; justify-content: space-end; background-color: rgba(0, 0, 0, 0.04)">
										<div class="comment" style="display: flex">
											<div class="comment__image  cimg">

												<c:if test="${not empty commentList.mImgName }">
													<img class="csimg" alt="pic"
														src="/upload/${commentList.mImgName }" />
												</c:if>

												<c:if test="${empty commentList.mImgName }">
													<img alt="pic" src="img/avatar-small-1.png" />
												</c:if>

											</div>
											<div class="comment__text">
												<div>
													<b>${commentList.mNickname}</b> <em>${commentList.cmTime}</em>
												</div>
												<p class="chatbox"
													style="padding-left: 1em; padding-right: 1em;">${commentList.cmComent}</p>
											</div>
										</div>

									</div>
								</c:if>
							</c:forEach>
							<div
								style="height: 1em; border-radius: 0em 0em 1em 1em; background-color: rgba(0, 0, 0, 0.04)">
							</div>


						</div>

					</div>
							<c:if test="${!empty tripMember && trip.trStatus != 3  }">
								<form class="comment__form form--square">
									<div class="row" style="display:column; justify-content: center">

										<div class="col-md-12">
											<textarea placeholder="메세지를 입력해주세요" id="cmComent"
												name="cmComent" rows="4"></textarea>
										</div>
										<div class="col-md-10"></div>
										<div class="col-md-2" style="height:10em;">
										
											<button type="button" id="commentsubmit"
												class="btn "
												 style="background-color: rgba(166, 208, 205, 0.8); border-style: none;
												 font-size:large;">
												 입력하기</button>
										</div>
									</div>
								</form>
							</c:if>
							<!--end of blog comments-->
						</div>
					</div>
				</c:if>
				<!--end of row-->

				<!--end of container-->
		</section>

		<!-- <<<<< footer >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
		<jsp:include page="tail.jsp" />
		<!-- footer -->
	</div>

	<script>
	
	
	//첨부파일 관련 이벤트
    function readImage(input) {
        // 인풋 태그에 파일이 있는 경우
        if (input.files && input.files[0]) {
            // 이미지 파일인지 검사 (생략)
            // FileReader 인스턴스 생성
            const reader = new FileReader()
            // 이미지가 로드가 된 경우
            reader.onload = e => {
                const previewImage = document.getElementById("preview-image")
                previewImage.src = e.target.result
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0])
        }
    }
    // input file에 change 이벤트 부여
    const inputImage = document.getElementById("input-image")
    inputImage.addEventListener("change", e => {
        readImage(e.target)
    })
	</script>
	<script>
		setInterval(function() {
			$("#CommentArea").load(location.href + " #CommentArea");
		}, 3000);
		

		$("#btnAddSchedule").on('click',function() {

            var trDateSet = (parseInt('${trip.trDateSet}')+1)*4;
            if(trDateSet == list.length) {
            	alert("일정이 모두 끝났습니다, 일정 종료를 눌러주세요!");

            	$("#btnAddSchedule").attr("disabled", true);
            } else {
               var trSeq = $("#tripSeq").val();
               $.ajax({
                        url : 'addGameModeSchedule.do',
                        data : {
                           trSeq : trSeq
                        },
                        type : 'post',
                        success : function(data) {
                           var jsonData = JSON.parse(data);
                           console.log(jsonData);
                           
                           $("#imgPic1").attr("src", "/upload/"+ jsonData.addGameModeSchedule.originalFileName);
                           $("#imgPic2").attr("src", "/upload/"+ jsonData.addGameModeSchedule.originalFileName);
                           $("#pName1").text(jsonData.addGameModeSchedule.pName);
                           $("#pName2").text(jsonData.addGameModeSchedule.pName);
                           $("#pCategroy1").text(jsonData.addGameModeSchedule.pCategory);
                           $("#pAddress1").text(jsonData.addGameModeSchedule.pAddress);
                           $("#pTell1").text(jsonData.addGameModeSchedule.pTell);
                           $("#pInfo1").text(jsonData.addGameModeSchedule.pInfo);
                           location.reload();
                           $("#additionalSchedule").show();
                           
                        },
                        error : function(e) {
                           console.log(e);
                        }
                     });
            }
         });


		var list = [];
		$(document).ready(function() {
			<c:forEach var="schedule" items="${scheduleList}" varStatus="status">
				list.push("${schedule.trStatus}");
			</c:forEach>
			if(list.indexOf('0') != -1) {
			   $("#btnAddSchedule").attr("disabled", true);
			} else {
			   $("#btnAddSchedule").attr("disabled", false);
			}
		});
		
			 $('#commentsubmit').on('click', function(){
		        $.ajax({
		            url: "insertComment.do",
		            type: "POST",
		            data: $('form').serialize(),
		            success: function(data){
		            	document.getElementById("cmComent").value='';

		            	
		            	/* $('#cmComent').value.remove(); */
		            },
		            error: function(error){  alert("댓글등록 error");  }
		        });
		    }); 
		
		
	</script>

	<!-- 여행 참가 신청 confirm -->
	<script>
		function attendTripConfirm() {
			if (window.confirm("여행에 참여 하시겠습니까?")) {
				location.href = "attendTrip.do";

			} else {
				console.log("취소. 변화 없음");
			}
		}
	</script>

	<!-- 참가 취소  confirm -->
	<script>
		function exitTripConfirm() {
			if (window.confirm("여행에서 나가시겠습니까?")) {
				location.href = "exitTrip.do";

			} else {
				console.log("취소. 변화 없음");
			}
		}
	</script>

	<!-- tripStart  confirm -->
	<script>
		function startTripConfirm(type) {
			if (window.confirm("일정 상태를 변경 하시겠습니까?")) {
				if (type == 'start') {
					location.href = "tripStatus.do?trStatus=2";
				} else if (type == 'finish') {
					location.href = "tripStatus.do?trStatus=3";
				} else {
					console.log("취소. 변화 없음");
				}
			}
		}
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


</body>

</html>