<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>Random Jeju | Create Trip</title>
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
</head>
<style>
    .btn_count {
        width: 25px;
        height: 25px;
        box-sizing: border-box;
        border-style: none;
        border-radius: 50%;
        background-color: rgba(166, 208, 205, 0.8);
    }

    .btn_count span {
        font-size: 15px;
        text-align: center;
        vertical-align: middle;
        font-weight: bolder;
        color: white;
    }

    #pmbutton {
        display: grid;
    }

    #areaSet,
    #name,
    #date,
    #mode-select,
    #personal,
    #rtext,
    #password,
    #licenseSet {
        background-color: rgba(130, 127, 123, 0.1);
    }

    .input-radio {
        display: inline-block;
    }

    #create_btn span {
        color: white;
        font-weight: bolder;
        font-size: large;
    }

    .text-left {
        padding-top: 10%;
    }

    #rtext {
        margin-bottom: 0%;
    }

    select {
        max-height: 80%;
    }

    #personal {
        padding-left: 20%;
    }

    #name {
        padding-left: 5%;
    }
    
    #hostInfo {
    
    padding-left: 5%;
    background-color: white
    
    
    }
    
    

    label {
        font-size: 12px;
        font-weight: bolder;
    }
</style>

<body class="scroll-assist">
    <a id="top"></a>
    <div class="loader"></div>

    <!--  Header 인클루드  -->
    <jsp:include page="Header.jsp" />



    <div class="main-container transition--fade">
        <section class="height-100 cover cover-8" style="height: 90em;">
            <div class="col-md-7 col-sm-5">
                <div class="background-image-holder">
                 
                     <div>
	                     	<button class="btn " onclick="location.href='choose_join.jsp'"
	                     	
	                     	style="background-color: rgba(0, 0, 0, 0.01); margin:13vh 0 0 5vh  " >
	                     		<h4 style="margin-bottom: 0em;color: white">나가기</h4>
	                     	</button>
                     </div>
                        <div class=" " style="margin-top: 20vh; text-align: center;">
                        <h3 style="color: white">여행 만들기</h3>
               
                    </div>
                    
                    
                    <img alt="image" src="img/pch_img_7.png" />
                </div>
            </div>

            <div class="col-md-5 col-sm-7 bg--white text-center">
                <div class="pos-vertical-center">
                    <div class="text-left">
                        <form action="insertTrip.do" method="post" enctype="multipart/form-data"
                            style="max-width: 75%;">

                            <div class="row" style="margin-bottom: 5%;">
                                <div class="col-sm-7">
                                    <img src="img/기본이미지.jpg" ;
                                        style="height: 150px; width: 150px; border-radius: 50%; overflow: hidden; border-style: none;"
                                        id="preview-image"> <input style="display: block;" type="file" id="input-image"
                                        name="uploadFile">

                                </div>
                                <div class="col-sm-5">
                                    <br> <br>
                                    <h5>
                                        나타낼 이미지를<br>선택하세요.
                                    </h5>
                                </div>
                            </div>

                     <div class="row">
                        <div class="col-sm-12">
                           <div class="input-with-icon">
                              <label>Host 정보</label>                                  
                                 <input type="text" name="tmId"
                                 id="hostInfo" value="${hostInfo.mId }" readonly="readonly" />
                                 
                                 <input type="text" name="tmName"
                                 id="hostInfo" value="${hostInfo.mName }" readonly="readonly" />   
                                 
                                 <input type="hidden" name="tmRole" value="h"/>      
                                                         
                                 <input type="hidden" name="mSeq" value="${hostInfo.mSeq }"/>                              
                           </div>
                        </div>
                     </div>

                     <div class="row">
                                <div class="col-sm-12">
                                    <div class="input-with-icon">
                                        <label>여행 제목</label> <input type="text" name="trName" id="name"
                                            placeholder="여행 제목을 지정해 주세요." />
                                    </div>
                                </div>
                            </div>
                            <!-- 일정/모드 row -->
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="input-with-icon">
                                        <label>일정</label> <select name="trDateSet" id="date">
                                            <option value="">선택</option>
                                            <option value="0">당일</option>
                                            <option value="1">1박</option>
                                            <option value="2">2박</option>
                                            <option value="3">3박</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input-with-icon">
                                        <label>모드</label> <select name="trMode" id="mode-select">
                                            <option value="">선택</option>
                                            <option value="일반모드">일반모드</option>
                                            <option value="게임모드">게임모드</option>
                                            <option value="랜덤추천모드">랜덤모드</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <!-- 지역/인원 row -->
                            <div class="row" style="margin-bottom: 0%;">
                                <div class="col-sm-6">
                                    <div class="input-with-icon">
                                        <label>지역</label> <select name="trAreaSet" id="areaSet">
                                            <option value="">-선택-</option>
                                            <option value="east">동</option>
                                            <option value="west">서</option>
                                            <option value="south">남</option>
                                            <option value="north">북</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="input-with-icon">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <label>인원</label>
                                                <div class="input-with-icon">
                                                    <input type="text" name="trPersonnelSet" id="personal" value="2"
                                                        readonly="readonly" />
                                                </div>
                                            </div>
                                            <div class="col-sm-4" id="pmbutton" style="padding-top: 25px;">
                                                <button type="button" class="btn_count"
                                                    onclick="fnCalCount('p', this);">
                                                    <span>+</span>
                                                </button>
                                                <button type="button" class="btn_count"
                                                    onclick="fnCalCount('m', this);">
                                                    <span>-</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="input-with-icon">
                                        <label>성별</label> <select name	="trGenderSet" id="date">
                                           <option value="X" selected="selected">-무관-</option>
                                            <option value="M">남</option>
                                            <option value="F">여</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-with-icon">
                                        <label>이동수단</label> <select name="trTransportationSet" id="date">
                                            <option value="X" selected="selected">-무관-</option>
                                            <option value="자동차">자동차</option>
                                            <option value="바이크">바이크</option>
                                            <option value="자전거">자전거</option>
                                            <option value="기타">기타</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-with-icon">
                                        <label>운전면허</label> <select name="trLicenseSet" id="licenseSet">
                                            <option value="X" selected="selected">-무관-</option>
                                            <option value="Y">유</option>
                                            <option value="N">무</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <!-- 여행소개 -->

                            <div class="row">

                                <div class="col-sm-12">
                                    <label>여행 소개</label>
                                    <textarea name="trIntro" id="rtext" cols="15" rows="4"
                                        style="border-style: none; border-radius: 20px;"
                                        placeholder="여행을 소개해 주세요."></textarea>
                                </div>
                            </div>
                            <!-- 비밀번호 -->
                            <div class="row">
                                <div class="col-sm-6">
                                    <label>비밀번호 설정</label> <input type="password" name="trPasswordSet" id="password"
                                        placeholder="비밀번호" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <button type="submit" class="btn" id="create_btn"
                                        style="background-color: rgba(166, 208, 205, 0.8); border-style: none;">
                                        <span>create !</span>
                                    </button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-5"></div>
                                <input type="reset" value="RESET" style="text-decoration: none;" />
                            </div>



                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

        <!-- <<<<< footer >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
        <jsp:include page="tail.jsp" />

        <!-- <<<<< end footer end >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->


        <!-- <<<<< end footer end >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->


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
            });

            // 인원설정 수량 카운트 버튼 이벤트 처리
            function fnCalCount(type, ths) {
                var $input = $(ths).parents("div").find("input[name='trPersonnelSet']");
                var tCount = Number($input.val());
                var maxNum = 5;
                var minNum = 2;
                
                // +/- 버튼 구동 제약
                
                // 1) 입력한 버튼이 (+) 라면
                if (type == 'p') { 
                   
                    if (tCount < maxNum) {
                       
                           $input.val(Number(tCount) + 1);  
                           
                       } else if (tCount >= maxNum) {
                          
                           alert("여행 인원은 최대" + maxNum + " 인을 초과 할 수 없습니다.");
                       } 
                
                // 2) 입력한 버튼이 (-) 라면
                } else if (type == 'm') {
                   
                   if (tCount > minNum) {  
                      
                            $input.val(Number(tCount) - 1);
                            
                   } else if (tCount <= minNum) {
                      
                      alert("여행 인원은 최소" + minNum + " 인 이상이어야 합니다.");
                      
                   }
                }
 
            }
        </script>

</body>

</html>