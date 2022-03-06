<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>Random Jeju | Find Account</title>
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
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        .modal-content {
            padding: 30px;
            text-align: center;
            height: 30% !important;
        }

        .modal-body {
            margin-top: 30px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#idBtn").on('click', function () {
                var form = $("#idfindform");
                $.ajax({
                    url: 'findId.do',
                    data: form.serialize(),
                    type: 'post',
                    success: function (data) {
                        var jsonData = JSON.parse(data);
                        if (jsonData.check == '0') {
                            $("#userId").text('찾으시는 아이디가 없습니다.');
                        } else {
                            $("#userId").text('찾으시는 아이디는 ' + jsonData.id + '입니다.');
                        }

                        $('#myModal').modal('show');
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            });
        });
       /*
         $(document).ready(function() {
             $("#pwdBtn").on('click', function() {
                 var form = $("#pwdfindform");
                 $.ajax({
                     url : 'findPWD.do',
                     data : form.serialize(),
                     type : 'post',
                     success : function(data) {
                         var jsonData = JSON.parse(data);
                         if(jsonData.check == '3') {
                             $("#userPwd").text('일치하는 비밀번호가 없습니다.');
                         } 
                     	
                         $('#myModal2').modal('show');
                     },
                     error : function(error) {
                         console.log(error);
                     }
                 });
             });
         }); */
    </script>

</head>

<body class="scroll-assist">
    <a id="top"></a>
    <div class="loader"></div>

    <!--  Header 인클루드  -->

    <jsp:include page="Header_2.jsp" />

    <!-- <<<<< 아이디 / 비밀번호 찾기 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->
    <section class="masonry-contained">
        <div class="container">
            <div class="row">
                <div class="masonry">
                    <div class="masonry__filters text-center" data-filter-all-text=""></div>
                    <div class="masonry__container masonry--animate">
                        <!--end item-->
                        <div class="col-sm-12 masonry__item">

                            <div class="card card--horizontal card-3">
                                <div class="card__image col-sm-3 col-md-4">
                                    <div class="background-image-holder">
                                        <img alt="Pic" src="img/pch_img_4.jpg" />
                                    </div>
                                </div>
                                <div class="card__body col-sm-9 col-md-8 boxed boxed--lg bg--white">
                                    <div class="card__title">


										 
                                        <!-- form 영역-->
                                        <form action="updatePassword.do" method="post" name="pwdfindform">
                                            <div class="row">

                                                <div class="col-sm-12" style="margin-bottom: 80px; text-align: center;">
                                                    <h2 style="color: rgba(130, 127, 123, 0.8);">새 비밀번호 입력</h2>
                                                </div>


                                            </div>
                                            <!-- 세번째 줄 : 비밀번호, 비밀번호 확인 창 -->
                                            <div>
                                                <div class=" ">
                                                    <label for="password">아이디</label> <input type="text"
                                                        class="form-control" name="mId" value="${findPwd.mId}" required>

                                                </div>
                                                
                                               
                                                <div class="row" id="pwbord">
                                                    <div class=" ">
                                                        <label for="password">비밀번호</label> <input type="password"
                                                            class="form-control" id="password" name="mPassword"
                                                            placeholder="******" value="" required>

                                                    </div>

                                                    <div class="">
                                                        <label for="confirmpw">비밀번호 확인</label> <input type="password"
                                                            class="form-control" id="confirmpw" 
                                                            onkeyup="checkPwd()" placeholder="******" value="" required>

                                                    </div>
													

                                                    <!-- 세번째 줄 연산 결과 출력 : 동일한 암호를 입력하세요 / 암호가 확인 되었습니다.  -->
                                                    <div class="col-md-12 mb-3">
                                                        <div id="checkPwd">동일한 암호를 입력하세요.</div>
                                                    </div>
                                                </div>

                                                <br>
                                                <div class="row">

                                                    <div class="col-sm-6">
                                                        <button type="submit" id="findPwd" class="btn"
                                                            onclick="tmpConsole()"
                                                            style="background-color: rgba(166, 208, 205, 0.8); border-style: none;">
                                                            <span style="color: white; font-size: 20px;">비밀번호변경</span>
                                                        </button>
                                                    </div>

                                                </div>
                                                </form>
								
                                                <!-- 아이디 이름과 이메일 이 같지 않을때-->
                                                <c:if test="${check == 3}">
                                                    <!--  <script>
												opener.document.pwdfindform.mId.value = "";
												opener.document.pwdfindform.mName.value = "";
												opener.document.pwdfindform.mEmail.value = "";
											</script>-->
                                                    <label>일치하는 정보가 존재하지 않습니다.</label>
                                                </c:if>
                                                <!-- 이름과 비밀번호가 일치하지 않을 때 -->
                                                <c:if test="${check == 4 }">
                                                    <!-- <label>입력하신 email로 비밀번호가 전송 되었습니다.</label>	-->
                                                </c:if>

                                        </form>


                                        <!-- end form 영역 end-->
                                    </div>

                                </div>
                            </div>

                        </div>
                        <!--end item-->
                    </div>
                    <!--end masonry container-->
                </div>
            </div>
            <!--end of row-->
        </div>
        <!--end of container-->
    </section>

    <!-- <<<<< footer >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
    <jsp:include page="tail.jsp" />

    <!-- <<<<< end footer end >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->

    <!-- <<<<< end 아이디 / 비밀번호 찾기 end >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  -->
    <script>
        //pw 동일 체크 
        function checkPwd() {
            var pw1 = $("#password").val();
            var pw2 = $("#confirmpw").val();
            if (pw1 != pw2) {

                $("#checkPwd").css('color', 'red');
                document.getElementById('checkPwd').style.color = "red";
                document.getElementById('pwbord').style.borderColor = "red";
                document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
            } else {
                document.getElementById('checkPwd').style.color = "green";
                document.getElementById('pwbord').style.borderColor = "white";
                document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";

            }

        }

        // 부정 입력 방지 이벤트
        window.addEventListener('load', () => {
            const forms = document.getElementsByClassName('validation-form');

            Array.prototype.filter.call(forms, (form) => {
                form.addEventListener('submit', function (event) {
                    console.log(form.checkValidity());
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
        }, false);

    </script>
    <!-- <<<<< footer >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
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