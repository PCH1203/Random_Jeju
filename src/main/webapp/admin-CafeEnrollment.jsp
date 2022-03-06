<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>관리자 | 가게등록</title>
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

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="css/data" rel="stylesheet">
<script src="js/jquery-2.1.4.min.js"></script>
<style>
a {
	text-decoration: none !important
}

a:hover {
	text-decoration: none !important
}

a {
	color: black;
}

section {
	padding-top: 5em;
	padding-bottom: 8.125em;
}
</style>

</head>
<body>
	<jsp:include page="admin-Header.jsp" />
	<section>
		<div style="margin-left: 0px;"
			class="col-md-1 col-md-offset-1 hidden-sm hidden-xs">
			<div class="sidebar">

				<!--end widget-->
				<div class="sidebar__widget">
					<h6>Categories</h6>
					<ul class="link-list">

						<li><a href="getMemberList.do" style="color: black"> 회원관리
						</a></li>
						<li><a href="getPlaceAllList.do" style="color: black">
								장소관리 </a></li>
					</ul>
					<hr>

				</div>
				<!--end widget-->

				<!--end widget-->

				<!--end widget-->
			</div>
		</div>
	</section>
	<!-- Content Wrapper -->
	<div id="content-wrapper"
		style="background-color: rgba(255, 255, 255, .9)" class=" flex-column">

		<!-- Main Content -->
		<div id="content" style="margin-bottom: 50px">
			<!--nav-->

			<!--section-->
			<section style="padding: 0em;">

				<!--바디 영역-->
				<div class="container" style="margin-top: -130px">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-10 mx-auto"
							style="padding: 0em, 5em">
							<h2 class="mb-3">장소등록</h2>
							<hr style="background-color: rgba(0, 0, 0, 0.2);">
							<form action="insertplace.do" method="post"
								enctype="multipart/form-data">
								<div class="mb-3">
									<label for="name"><h5
											style="color: rgba(0, 0, 0, 0.5);">카테고리</h5> </label> <select
										name="pCategory"
										style="width: 50px; height: 60px; padding-bottom: 1em; border: 1px solid rgba(0, 0, 0, 0.2);">
										<option value="cafe" selected>카페</option>
										<option value="tourlist">관광지</option>
										<option value="restaurant">식당</option>
										<option value="rooms">숙소</option>
									</select> <label for="name"><br>
									<h5 style="color: rgba(0, 0, 0, 0.5);">이름</h5> </label> <input
										name="pName" type="text" class="form-control" id="customer-id"
										placeholder="등록하실 장소명을 입력해주세요" maxlength="12" required
										style="border: 1px solid rgba(0, 0, 0, 0.2);" />
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="area"><h5
											style="color: rgba(0, 0, 0, 0.5);">방향</h5></label><br> <select
										name="pArea"
										style="width: 50px; height: 60px; border: 1px solid rgba(0, 0, 0, 0.2);">
										<option value="east" selected>동</option>
										<option value="west">서</option>
										<option value="south">남</option>
										<option value="north">북</option>
									</select>

									<div class="invalid-feedback">위치를입력해주세요.</div>
								</div>


								<div class="mb-3">
									<label for="tel"><h5 style="color: rgba(0, 0, 0, 0.5);">장소전화번호</h5></label>
									<input type="text" name="pTell" class="form-control" id="tel"
										placeholder="전화번호를 입력해주세요" required
										style="border: 1px solid rgba(0, 0, 0, 0.2);" />

									<div class="invalid-feedback">전화번호를 입력해주세요.</div>
								</div>
								<div class="mb-3">
									<label for="email"><h5
											style="color: rgba(0, 0, 0, 0.5);">장소주소</h5></label> <input
										type="text" name="pAddress" class="form-control" id="email"
										placeholder="주소를 적어주세요" required
										style="border: 1px solid rgba(0, 0, 0, 0.2);" />

									<div class="invalid-feedback">주소를 입력해주세요</div>
								</div>

								<label for="email"><h5
										style="color: rgba(0, 0, 0, 0.5);">장소정보</h5></label>
								<div class="mb-3">
									<textarea style="border: 1px solid rgba(0, 0, 0, 0.2);"
										placeholder="가게를 소개해주세요" name="pInfo" id="info" cols="50"
										rows="5"></textarea>

									<div class="invalid-feedback">매장정보를 입력해주세요</div>
								</div>



								<div class="row" id="cooperation">
									<div class="col-md-6 mb-3">
										<label for="name">
											<h5 style="color: rgba(0, 0, 0, 0.5);">X좌표</h5>
										</label> <input type="text" name="pXaxis" class="form-control"
											id="pXaxis" placeholder="위도" onkeyup="keyupevent()"
											style="border: 1px solid rgba(0, 0, 0, 0.2);" required />
										<div class="invalid-feedback">위도를 입력해주세요.</div>
									</div>
									<div class="col-md-6 mb-3">
										<label for="nickname">
											<h5 style="color: rgba(0, 0, 0, 0.5);">Y좌표</h5>
										</label> <input type="text" name="pYaxis" class="form-control"
											id="pYaxis" style="border: 1px solid rgba(0, 0, 0, 0.2);"
											onkeyup="keyupevent()" placeholder="경도" required />
										<div class="invalid-feedback">경도를 입력해주세요.</div>
									</div>
								</div>
								<!--사진 첨부 미리보기 -->
								<div class="row">
									<div class="col-md-6 mb-3">
										<div id="map" style="width: 100%; height: 350px;"></div>
									</div>

									<!--사진 첨부 미리보기 -->
									<div class="col-md-6 mb-3">
										<div class="image-container">
											<img style="width: 430px; height: 300px;" id="preview-image"
												src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
											<input style="display: block;" type="file" id="input-image"
												name="uploadFile"> ${getPlace.originalFileName}
										</div>
									</div>

									<!--사진 첨부 미리보기 끝-->

								</div>
								<!--버튼 submit 타입이라 일단 주석 처리함-->
								<!-- <button
                                      id="red"
                                      class="btn btn-primary btn-lg btn-block"
                                      type="submit"
                                    >
                                      가입 완료
                                    </button> -->

								<div style="margin-top: 20px;"></div>
								<!--9.28 회원가입 버튼 영역 일부 수정 및 회원가입 취소 버튼 추가-->


								<div class="sign-up-footer row col-md-8 mb-3">


									<button type="submit"
										class="btn btn-success btn-lg btn-block button-custom"
										id="red">등록하기</button>

								</div>
								<!-- form 끝. -->
								<div class="sign-up-footer-items col-md-2 mb-3">
									<a href="getPlaceAllList.do" style="font-size: 25px;">
										<button type="button"
											onclick="location.href='getPlaceAllList.do'"
											style="width: 15em;" class=" btn btn-secondary btn-lg"
											id="red">뒤로가기</button>
									</a>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- <footer class="my-3 text-center text-small">
                                <p class="mb-1">&copy; 2021 HS</p>
                              </footer> -->
		</div>
		</section>
	</div>
	<!-- End of Main Content -->
	<!--end of container-->

	<jsp:include page="tail.jsp" />
	<!-- kakao map -->
	<script type="text/javascript"
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3223cceebbc99daf72eb23b373491dd8"></script>
	<script>
	function keyupevent(){
		var pXaxis = document.getElementById('pXaxis').value;
		var pYaxis = document.getElementById('pYaxis').value;

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    
    mapOption = {
        center: new kakao.maps.LatLng(pXaxis, pYaxis), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
	    {
	        content: '<div>카카오</div>',
	        latlng: new kakao.maps.LatLng(pXaxis, pYaxis)
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
	};
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
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>


	<script>
    function readImage(input) {
// 인풋 태그에 파일이 있는 경우
if(input.files && input.files[0]) {
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


</body>
</html>