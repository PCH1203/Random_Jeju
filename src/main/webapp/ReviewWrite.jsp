<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>ReviewWrite</title>
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


<script src="js/jquery-2.1.4.min.js"></script>

<style>
.chatbox {
	/* border: solid 1px gray; */
	padding-left: 1em;
	padding-right: 1em;
	width: fit-content;
	background-color: #d0d9f5;
	border-radius: 1em;
	font-size: 13px;
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
	margin-right: 1em;
}

em {
	font-size: 12px;
}

#wdt {
	width: 95px;
}

.pagination li:first-child, .pagination {
	opacity: 1;
}

.pagination li:last-child, .pagination {
	opacity: 1;
}

li {
	list-style-type: none
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
		<section>
			<div class="container">
				<div class="row">
									<a href="getReviewBoardList.do" class="btn"
										style="background-color: rgba(166, 208, 205, 0.8); border-style: none; ">Back</a>
					<div class="shop-item-detail shop-item-detail-1">
						<form action="insertPlaceReview.do" method="post"
							class="validation-form">
							<input type="hidden" name="pSeq" value="${place.pSeq }">
							<div class="col-sm-6">
							<div class="item__title col-md-2" style="height: 60px;">
								</div>
								<div class="" data-animation="fade" data-arrows="true"
									data-paging="true">
									
										<img alt="Pic" src="upload/${place.originalFileName}" />
									
								</div>
							</div>
							<div class="col-md-4 col-md-offset-1 col-sm-6" style="background-color: rgba(0,0,0,0.04); border-radius: 1em;
							    padding-left: 2em; padding-right: 2em; padding-bottom: 2em; ">
							    <div style="display: flex; justify-content:space-between;">
								<div class="item__title col-md-12">
									<h5>"${place.pName}"</h5>
								</div>
								
								</div>
								<div class="item__description" >
										
									<div class="item__subinfo">
										<span id="wdt">시설/객실</span> <span> <select name="bab"
											style="padding-right: 5.5em; border: none; height: 3em;">
												<option id="bab" value="null" selected="selected">선택없음</option>
												<option id="bab" value="5">매우만족</option>
												<option id="bab" value="4">다소만족</option>
												<option id="bab" value="3">보통</option>
												<option id="bab" value="2">다소미흡</option>
												<option id="bab" value="1">미흡</option>
										</select>
										</span>
									</div>
									<div class="item__subinfo">
										<span id="wdt">청결도</span> <span> <select name="clean"
											style="padding-right: 5.5em; border: none; height: 3em;" >
												<option value="null" selected="selected">선택없음</option>
												<option id="clean" value="5">매우만족</option>
												<option id="clean" value="4">다소만족</option>
												<option id="clean" value="3">보통</option>
												<option id="clean" value="2">다소미흡</option>
												<option id="clean" value="1">미흡</option>
										</select>
										</span>
									</div>
									<div class="item__subinfo">
										<span id="wdt">분위기/풍경 </span> <span> <select
											name="view"
											style="padding-right: 5.5em; border: none; height: 3em;">
												<option value="null" selected="selected">선택없음</option>
												<option id="view" value="5">매우만족</option>
												<option id="view" value="4">다소만족</option>
												<option id="view" value="3">보통</option>
												<option id="view" value="2">다소미흡</option>
												<option id="view" value="1">미흡</option>
										</select>
										</span>
									</div>
									<div class="item__subinfo">
										<span id="wdt">주차장</span> <span> <select name="parking"
											style="padding-right: 5.5em; border: none; width: 180px;height: 3em;">
												<option value="null" selected="selected">선택없음</option>
												<option id="park" value="Y">있음</option>
												<option id="park" value="N">없음</option>
										</select>
										</span>
									</div>
									<div class="item__subinfo">
										<span id="wdt">재방문의사</span> <span> <select
											name="revisit"
											style="padding-right: 5.5em; border: none; width: 180px;height: 3em;">
												<option value="null" selected="selected">선택없음</option>
												<option id="revisit" value="Y">있음</option>
												<option id="revisit" value="N">없음</option>
										</select>
										</span>
									</div>
								</div>
								<form class="item__addtocart">
									<div style="padding-bottom: 20px; ">
										<span>짧은 리뷰 :</span>
									</div>
									<textarea id="reviewtext" name="review" placeholder="리뷰를 남겨주세요"
										style="resize: none; height: 180px; border-radius: 0%;"></textarea>
									<button type="submit" class="btn btn--primary"
style="background-color: rgba(166, 208, 205, 0.8); border-style: none;">리뷰 남기기</button>
								</form>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--end of row-->

			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
					<form action="" method="post" id="listForm">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum }"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount }">
						<div class="blog-post__comments" style="margin-top: auto;">
							<hr>
							<div class="row">
								<div class="col-md-8">
									<h6>Address : ${ReviewAddress.pAddress}</h6>
									<h6>Area : ${ReviewAddress.pArea}</h6>
									<h6>Tell : ${ReviewAddress.pTell}</h6>
									<h6>${ReviewAddress.pCategory}</h6>
									<h6>${ReviewAddress.pInfo}</h6>
									<h6>${ReviewAllComment}Comments:</h6>
								</div>
								<div class="col-md-4" style="height: 300px;">
									<div id="map" style="width: 100%; height: 300px;"></div>
								</div>
							</div>
							<c:forEach items="${ReviewCommentList}" var="ReviewCommentList">
								<li>
									<div class="comment row">
										<div class="comment__image cimg col-md-4">
											<label style="margin-left: inherit; padding-top: 10px">
												<c:if test="${empty ReviewCommentList.mImgName}">
													<img src="img/avatar-small-2.png" style="height: 100px;">
												</c:if> 
												<c:if test="${not empty ReviewCommentList.mImgName}">
													<img
														style="height: 100px; width: 100px; border-radius: 50%; overflow: hidden;"
														id="preview-image" alt="Pic"
														src="upload/${ReviewCommentList.mImgName }">
												</c:if>
											</label>
										</div>

										<div class="comment__text col-md-8">
											<div>
												<b>${ReviewCommentList.mId}</b> <em>${ReviewCommentList.rcTime}</em>
												<c:if test="${ReviewCommentList.mSeq == member.mSeq }">
													<a style="display: inline;" href="deleteReview.do?rcSeq=${ReviewCommentList.rcSeq}
						                                       &mSeq=${ReviewCommentList.mSeq}
						                                       &pSeq=${ReviewCommentList.pSeq}"><span >삭제</span></a>
												</c:if>
												
											</div>
											<div>
												<em>시설/객실 : </em>
												<c:if test="${ReviewCommentList.bab eq 'NULL'}">
													<em>선택안함</em>
												</c:if>
												<c:if test="${ReviewCommentList.bab eq '1'}">
													<em>미흡</em>
												</c:if>
												<c:if test="${ReviewCommentList.bab eq '2'}">
													<em>다소미흡</em>
												</c:if>
												<c:if test="${ReviewCommentList.bab eq '3'}">
													<em>보통</em>
												</c:if>
												<c:if test="${ReviewCommentList.bab eq '4'}">
													<em>다소만족</em>
												</c:if>
												<c:if test="${ReviewCommentList.bab eq '5'}">
													<em>매우만족</em>
												</c:if>

												<em>ㅣ청결도 : </em>
												<c:if test="${ReviewCommentList.clean eq 'NULL'}">
													<em>선택안함</em>
												</c:if>
												<c:if test="${ReviewCommentList.clean eq '1'}">
													<em>미흡</em>
												</c:if>
												<c:if test="${ReviewCommentList.clean eq '2'}">
													<em>다소미흡</em>
												</c:if>
												<c:if test="${ReviewCommentList.clean eq '3'}">
													<em>보통</em>
												</c:if>
												<c:if test="${ReviewCommentList.clean eq '4'}">
													<em>다소만족</em>
												</c:if>
												<c:if test="${ReviewCommentList.clean eq '5'}">
													<em>매우만족</em>
												</c:if>

												<em>ㅣ분위기/풍경 : </em>
												<c:if test="${ReviewCommentList.view eq 'NULL'}">
													<em>선택안함</em>
												</c:if>
												<c:if test="${ReviewCommentList.view eq '1'}">
													<em>미흡</em>
												</c:if>
												<c:if test="${ReviewCommentList.view eq '2'}">
													<em>다소미흡</em>
												</c:if>
												<c:if test="${ReviewCommentList.view eq '3'}">
													<em>보통</em>
												</c:if>
												<c:if test="${ReviewCommentList.view eq '4'}">
													<em>다소만족</em>
												</c:if>
												<c:if test="${ReviewCommentList.view eq '5'}">
													<em>매우만족</em>
												</c:if>

												<em>ㅣ주차장 : </em>
												<c:if test="${ReviewCommentList.revisit eq 'NULL'}">
													<em>선택안함</em>
												</c:if>
												<c:if test="${ReviewCommentList.revisit eq 'Y'}">
													<em>있음</em>
												</c:if>
												<c:if test="${ReviewCommentList.revisit eq 'N'}">
													<em>없음</em>
												</c:if>

												<em>ㅣ재방문의사 : </em>
												<c:if test="${ReviewCommentList.parking eq 'NULL'}">
													<em>선택안함</em>
												</c:if>
												<c:if test="${ReviewCommentList.parking eq 'Y'}">
													<em>있음</em>
												</c:if>

												<c:if test="${ReviewCommentList.parking eq 'N'}">
													<em>없음</em>
												</c:if>
												
												<p class="chatbox">${ReviewCommentList.review}</p>
											</div>

										</div>
									</div> <!--end comment-->
								</li>
							</c:forEach>

							</ul>
							<!--end of blog comments-->
						</div>
					</form>
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
			<!--end of container-->
		</section>

		<jsp:include page="tail.jsp" />

	</div>

	<script type="text/javascript"
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3223cceebbc99daf72eb23b373491dd8">
   </script>
	<script>
   
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
     
     mapOption = {
         center: new kakao.maps.LatLng('${ReviewAddress.pXaxis}', '${ReviewAddress.pYaxis}'), // 지도의 중심좌표
         level: 3 // 지도의 확대 레벨
     };

 var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

 // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
 var positions = [
     {
         content: '<div>${place.pName}</div>',
         latlng: new kakao.maps.LatLng('${ReviewAddress.pXaxis}', '${ReviewAddress.pYaxis}')
     },
   
 ];

 for (var i = 0; i < positions.length; i++) {
     // 마커를 생성합니다
     var marker = new kakao.maps.Marker({
         map: map, // 마커를 표시할 지도
         position: positions[i].latlng // 마커의 위치
     });

     // 마커에 표시할 인포윈도우를 생성합니다 
     var infowindow = new kakao.maps.InfoWindow({
         content: positions[i].content // 인포윈도우에 표시할 내용
     });

     // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
     // 이벤트 리스너로는 클로저를 만들어 등록합니다 
     // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
     kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
     kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
 }

 // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
 function makeOverListener(map, marker, infowindow) {
     return function () {
         infowindow.open(map, marker);
     };
 }

 // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
 function makeOutListener(infowindow) {
     return function () {
         infowindow.close();
     };
 }
	
	$(document).ready(function() {
		var listForm = $("#listForm");
		
		$(".pagination_button a").on("click", function(e) {
			e.preventDefault();
			
			listForm.find("input[name='pageNum']").val($(this).attr("href"));
			listForm.submit();
		});
	});
	
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