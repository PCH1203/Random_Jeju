<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>마이페이지</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/socicon.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/iconsmind.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/interface-icons.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/lightbox.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/theme.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
        <link href='https://fonts.googleapis.com/css?family=Lora:400,400italic,700%7CMontserrat:400,700' rel='stylesheet' type='text/css'>
    <style>
    body {
    background-image: url(img/제주사진/제주001.jpg);
    background-repeat: no-repeat;
   
   
}
    </style>
    </head>
    <body class="scroll-assist ">
        <a id="top"></a>
        <div class="loader"></div>

        <!-- nav -->
        <jsp:include page="Header.jsp" />
        <!--end of modal-container-->
        <div class="main-container transition--fade">
        
            <section class="height-30 page-title page-title--animate">
                <div class="container pos-vertical-center">
                    <div class="row">
                        <div class="col-sm-12 text-center">
                            <h1 style="color: white;">My Page</h1>
                     
                        </div>
                    </div>
                    <!--end row-->
                </div>
                <!--end container-->
            </section>
            <section>
                <div class="container">
                    <div class="row">
                        <div class="masonry masonry-blog">
                            <div class="masonry__container masonry--animate">
                                <div class="col-md-3 col-sm-6 masonry__item">
                                    <a href="myReviews.do">
                                        <div class="card card-4" style="height: 196.88px">
                                            <div class="card__image" style="height: 196.88px">
                                                <img alt="Pic" src="img/mypage1.jpg" />
                                            </div>
                                            <div class="card__body boxed boxed--sm bg--white" style="height: 196.88px">
                                                <h4>나의 리뷰 확인</h4>
                                                <div class="card__title">
                                                    <h5>함께 여행했던 멤버들이 남긴 리뷰를 확인할 수 있어요</h5>
                                                </div>
                                                <hr>
                                                <div class="card__lower">
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <!--end item-->
                                <div class="col-md-3 col-sm-6 masonry__item">
                                    <a href="getMyTripList.do?mSeq=${member.mSeq}">
                                        <div class="card card-4">
                                            <div class="card__image" style="height: 196.88px">
                                                <img alt="Pic" src="img/제주사진/제주023.jpg" style="height: 196.88px"/>
                                            </div>
                                            <div class="card__body boxed boxed--sm bg--white" style="height: 196.88px">
                                                <h4>여행내역 확인</h4>
                                                <div class="card__title">
                                                    <h5>우리 웹을 통해 함께 한 여행 내역을 확인 할 수 있어요</h5>
                                                </div>
                                                <hr>
                                                <div class="card__lower">
                                                
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <!--end item-->
                                <div class="col-md-3 col-sm-6 masonry__item">
								<a href="#" value="회원정보수정" onclick="location.href='getMember.do'">
                                        <div class="card card-4">
                                            <div class="card__image" style="height: 196.88px">
                                                <img alt="Pic" src="img/제주사진/제주008.jpg"  style="height: 196.88px">
                                            </div>
                                            <div class="card__body boxed boxed--sm bg--white" style="height: 196.88px">
                                                <h4>회원 정보 수정</h4>
                                                <div class="card__title">
                                                    <h5>회원정보를 변경할 수 있어요</h5>
                                                </div>
                                                <hr>
                                                <div class="card__lower">
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <!--end item-->
                                 <div class="col-md-3 col-sm-6 masonry__item">
								<a href="#" value="내글보기" onclick="location.href='getMyBoardList.do'">
                                        <div class="card card-4">
                                            <div class="card__image" style="height: 196.88px">
                                                <img alt="Pic" src="img/제주사진/제주011.jpg" style="height: 196.88px">
                                            </div>
                                            <div class="card__body boxed boxed--sm bg--white" style="height: 196.88px">
                                                <h4>내글보기</h4>
                                                <div class="card__title">
                                                    <h5>내글 모아보기</h5>
                                                </div>
                                                <hr>
                                                <div class="card__lower">
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <!--end masonry container-->
                        </div>
                        <!--end masonry-->
                        
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