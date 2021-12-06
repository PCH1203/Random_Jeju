<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>about</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/socicon.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/iconsmind.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/interface-icons.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/lightbox.min.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/theme.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
    <link href='https://fonts.googleapis.com/css?family=Lora:400,400italic,700%7CMontserrat:400,700' rel='stylesheet'
        type='text/css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <style>
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        p,
        div {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .process-1:before {
            border-right: none;
        }

        section,
        footer {
            padding-top: 3.5em;
            padding-bottom: 4.125em;
        }

        .nav-bar .logo {
            max-height: 100%;
            margin: 0;
        }
    </style>
</head>

<body class="scroll-assist">
    <a id="top"></a>
    <div class="loader"></div>

    <!-- nev -->
	<jsp:include page="Header_2.jsp" />
	
    <!--end of modal-container-->
    <div class="main-container transition--fade">
        <section class="height-70 bg--dark imagebg page-title page-title--animate parallax" data-overlay="5">
            <div class="background-image-holder background--bottom">
                <img alt="image" src="img/제주사진/제주010.jpg" />
            </div>
            <div class="container pos-vertical-center">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 text-center">
                        <h1 style="font-weight: 100;">JeJuº</h1>
                        <p class="lead">새로운 여행 공유 커뮤니티 JeJuº 에 오신걸 환영합니다. </p>
                        <p> JeJuº는 제주의 온도, 사람과 사람간의 온도를 뜻 하는 이름으로<br> 제주도를 여행하는 사람들간의 여행 동행과 정보 공유를 위한 <br>커뮤니티 기반의 여행
                            사이트 입니다.</p>
                    </div>
                </div>
                <!--end row-->
            </div>
            <!--end container-->
        </section>
        <section class="process-1 section--overlap">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2 text-center">
                        <div class="piechart piechart-2" data-size="260" data-value="33">
                            <div class="piechart__overlay">
                                <div class="piechart__description">
                                    <h6>1단계</h6>
                                    <span class="h4">방만들기/참가하기</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end of row-->
                <div class="row">
                    <div class="col-sm-5">
                        <div class="feature feature-1 text-right text-center-xs">
                            <i class="fas fa-flag fa-3x"></i>
                            <h5>방만들기</h5>
                            <p>원하는 종류의 방을 만들어 사람들과 여행을 해 봐요<br>
                                방은 일반/ 추천/ 게임 세 가지 종류가 있습니다.
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-5 col-sm-offset-2">
                        <div class="feature feature-1 text-center-xs">
                            <i class="far fa-hand-point-up fa-3x"></i>
                            <h5>참가하기</h5>
                            <p>원하는 종류의 방에 참가해 사람들과 여행을 해 봐요<br>
                                방은 일반/ 추천/ 게임 세 가지 종류가 있습니다.
                            </p>
                        </div>
                    </div>
                </div>
                <section style="padding-top: 3.5em;
                    padding-bottom: 4.125em;">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1 text-center">
                                <h4>방고르기</h4>
                                <div class="tabs-container tabs-2">
                                    <ul class="tabs">
                                        <li class="active">
                                            <div class="tab__title">
                                                <i class="fas fa-user-cog fa-3x"></i>
                                            </div>
                                            <div class="tab__content">
                                                <p class="lead">일반 모드<br></p>
                                                <p>일반모드는 동행을 위한 모드 입니다!<br>
                                                    새로운 만남 새로운 사람들과 즐거운 여행을 즐기고 싶으신 분들은 일반 모드를 선택하세요
                                                    마음이 맞는 사람들과 함께 여행을 떠날 수 있습니다. <br>저녁모임, 카쉐어링 , 파티 등
                                                    원하시는 목적을 상세하게 적어주시면 금방 사람들이 찾아올꺼에요
                                                </p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="tab__title">
                                                <i class="fas fa-random fa-3x"></i>
                                            </div>
                                            <div class="tab__content">
                                                <p class="lead">추천 모드<br></p>
                                                <p>추천모드는 여행 계획이 힘드신분들에게 추천해드려요!<br>
                                                    여행은 즐겁지만 여행 장소 찾는건 너무 힘들고 귀찮은 일이죠<br>
                                                    저희가 데이터 베이스를 기반으로 새롭고 즐거운 혹은 유명하고 꼭 가봐야할 장소를 추천해드려요
                                                    혹시 추천받은 장소가 마음에 들지 않으신다면 다시 추천하기 버튼을 눌러주시면 새로운 장소를 추천 해 드려요
                                                </p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="tab__title">
                                                <i class="fas fa-gamepad fa-3x"></i>
                                            </div>
                                            <div class="tab__content">
                                                <p class="lead">게임 모드<br></p>
                                                <p>게임모드는 색다른 여행을 원하시는 분들을 위해 만들었어요!<br>
                                                    항상 똑같은 여행에 질리셨나요?<br>
                                                    정말 색다르고 즉흥적인 여행이 하고싶으시나요? 그렇다면 게임모드는 어떨까요?<br>
                                                    추천받은 장소에 가서 인증을 하면 다음 장소가 공개된답니다! 하나하나 clear 하며 여행을 즐겨봐요
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <!--end of tabs container-->
                            </div>
                        </div>
                        <!--end of row-->
                    </div>
                    <!--end of container-->
                </section>
                <!--end of row-->
            </div>
            <!--end of container-->
        </section>
        <section class="process-1 bg--secondary">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2 text-center">
                        <div class="piechart piechart-2" data-size="260" data-value="66">
                            <div class="piechart__overlay">
                                <div class="piechart__description">
                                    <h6>2단계</h6>
                                    <span class="h4">여행하기</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end of row-->
                <div class="row">
                    <div class="col-sm-5">
                        <div class="feature feature-1 text-right text-center-xs">
                            <i class="fas fa-route fa-3x"></i>
                            <h5>계획된 여행 하기</h5>
                            <p>일반모드를 선택 하셨나요?<br>
                                서로의 의견을 합쳐 즐거운 여행을 해 볼까요?
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-5 col-sm-offset-2">
                        <div class="feature feature-1 text-center-xs">
                            <i class="fas fa-random fa-3x"></i>
                            <h5>즉흥적인 여행 하기 </h5>
                            <p>랜덤모드 , 게임모드를 선택하셨나요?<br>
                                제주도 힐링되는 여행지긴 한데.. 좀 질리는것 같아요 <i class="far fa-sad-tear"></i><br>
                                사이트에서 추천해주는 여행장소를 따라 즉흥적으로 여행을 해 보세요! 어떤 장소가 나올지 걱정된다고요?
                                하지만 새로운친구들과 함께라면 분명히 즐거울꺼에요

                            </p>
                        </div>
                    </div>
                </div>
                <!--end of row-->
            </div>
            <!--end of container-->
        </section>
        <section class="process-1 process-end">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2 text-center">
                        <div class="piechart piechart-2" data-size="260" data-value="100">
                            <div class="piechart__overlay">
                                <div class="piechart__description">
                                    <h6>3단계</h6>
                                    <span class="h4">여행 마치기</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end of row-->
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3">
                        <div class="feature feature-1 text-center">
                            <i class="fas fa-cocktail fa-3x"></i>
                            <h5>여행을 마치고 해야할 일 </h5>
                            <p>즐거운 여행이 끝이 났어요<br>
                                그동안 친해진 친구들에게 한마디씩 메세지를 남겨줄까요? <br>
                                혹시 트러블이 있었다면 신고 버튼으로 저희에게 살짝 알려주세요. <br>
                                (상대방은 절대 알지 못해요).<br>
                                그리고 즐거웠던 장소나 식당 저희가 모르고 있던 장소까지 저희와 다른 분들에게 추천해 주시면 다음번엔 더욱더 즐거운 제주도 여행이 되실 거예요

                            </p>
                        </div>
                    </div>
                </div>
                <!--end of row-->
            </div>
            <!--end of container-->
        </section>

        <footer></footer>
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