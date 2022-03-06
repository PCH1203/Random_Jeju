<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- spring:message="메시지 키값" -->
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>회원가입</title>
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

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

  <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#c7e2ff),
		to(#fff));
	background: -webkit-linear-gradient(bottom left, #c7e2ff 0%, #fff 100%);
	background: -moz-linear-gradient(bottom left, #c7e2ff 0%, #fff 100%);
	background: -o-linear-gradient(bottom left, #c7e2ff 0%, #fff 100%);
	background: linear-gradient(to top right, #c7e2ff 0%, #fff 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 10px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

#checkPwd {
	color: red;
}

#pwbord {
	border-style: dotted;
	border-color: white;
}

input[type="checkbox"] {
	display: none;
}

.label__on-off {
	overflow: hidden;
	position: relative;
	display: inline-block;
	width: 58px;
	height: 26px;
	-webkit-border-radius: 13px;
	-moz-border-radius: 13px;
	border-radius: 13px;
	background-color: #ed4956;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
	-webkit-transition: all .3s;
	-moz-transition: all .3s;
	-ms-transition: all .3s;
	-o-transition: all .3s;
	transition: all .3s;
}

.label__on-off>* {
	vertical-align: middle;
	-webkit-transition: all .3s;
	-moz-transition: all .3s;
	-ms-transition: all .3s;
	-o-transition: all .3s;
	transition: all .3s;
	font-size: 18px;
}

.label__on-off .marble {
	position: absolute;
	top: 1px;
	left: 1px;
	display: block;
	width: 24px;
	height: 24px;
	background-color: #fff;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .3);
	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .3);
	box-shadow: 0 0 10px rgba(0, 0, 0, .3);
}

.label__on-off .on {
	display: none;
	padding-left: 12px;
}

.label__on-off .off {
	padding-left: 30px;
	line-height: 25px;
}

.input__on-off:checked+.label__on-off {
	background-color: #0bba82;
}

.input__on-off:checked+.label__on-off .on {
	display: inline-block;
}

.input__on-off:checked+.label__on-off .off {
	display: none;
}

.input__on-off:checked+.label__on-off .marble {
	left: 33px;
}

 button{
    background-color: rgba(166, 208, 205, 0.8); border-style: none;  color: white;
    }
</style>
</head>

<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<jsp:include page="Header_2.jsp" />
	<!--end of modal-container-->
	<div class="main-container transition--fade">
		<section class="cover cover-8" style="height: 130em;">
			<div class="col-md-7 col-sm-5">
				<div class="background-image-holder">
					<img alt="image" src="img/제주사진/제주012.jpg" />
				</div>
			</div>
			<div class="col-md-5 col-sm-7 bg--white text-center">
				<div class="pos-vertical-center">
					<img class="logo" alt="Pillar" src="img/logo_demo_dark.png" 
					style="margin: 3em;"/>
					
					<h4 style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold;" >
						회원가입 
					</h4>
					<p style="font-size: small;">JEJUº에 회원가입하고 새로운 여행을 즐겨봐요!</p>
					<div class="text-left">
						<form action="insertMember.do" method="post"
							class="validation-form" enctype="multipart/form-data" novalidate>

							<!-- 첫번째 줄 이름, 별명 입력창 -->
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name">이름</label> <input type="text"
										class="form-control" id="name" name="mName" placeholder=""
										value="" required>
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="nickname">별명<span class="text-muted">&nbsp;(필수
											아님)</span></label> <input type="text" class="form-control" id="nickname"
										name="mNickname" placeholder="" value="">
										
									<div class="invalid-feedback">별명을 입력해주세요.</div>
								</div>
							</div>
							<!-- 두번째 줄 : 아이디 입력 -->
							<div class="row">
								<label for="id">아이디</label> <input type="text"
									class="form-control" id="id" name="mId"
									placeholder="input your id" onblur = "idcheck()" required>
								<div class="invalid-feedback">아이디를 입력해주세요.</div>
							</div>

							<!-- 세번째 줄 : 비밀번호, 비밀번호 확인 창 -->
							<div class="row" id="pwbord">
								<div class="col-md-6 mb-3 ">
									<label for="password">비밀번호</label> <input type="password"
										class="form-control" id="password" name="mPassword"
										placeholder="****" value="" required>
									<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
								</div>

								<div class="col-md-6 mb-3">
									<label for="confirmpw">비밀번호 확인</label> <input type="password"
										class="form-control" id="confirmpw" name="confirmpw"
										onkeyup="checkPwd()" placeholder="****" value="" required>
									<div class="invalid-feedback">비밀번호 확인을 진행해주세요.</div>
								</div>


								<!-- 세번째 줄 연산 결과 출력 : 동일한 암호를 입력하세요 / 암호가 확인 되었습니다.  -->
								<div class="col-md-12 mb-3">
									<div id="checkPwd">동일한 암호를 입력하세요.</div>
								</div>
							</div>
							<!-- 네번째 줄 : 이메일 입력 -->
							<div class="row">
								<div class="col-md-12">
									<label for="email">이메일</label> <input type="email"
										class="form-control" id="email" name="mEmail"
										placeholder="you@example.com" required>
									<div class="invalid-feedback">이메일을 입력해주세요.</div>
								</div>
							</div>

							<!--  -->
							<div class="row">
								<label for="tell">전화번호</label> <input type="tel"
									class="form-control" id="tell" name="mTell"
									placeholder="010-0000-0000"
									pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required> <small>Format:
									010-0000-0000</small>
								<div class="invalid-feedback">전화번호를 입력해주세요.</div>
							</div>

							<div class="row">
								<div class="col-sm-8">
									<label for="birthday">생년월일</label> <input type="date"
										class="form-control" id="birthday" name="mBirthday"
										placeholder="yyyymmdd" required>
									<div class="invalid-feedback">생년월일를 입력해주세요.</div>
								</div>
								<div class="col-sm-2">
									<div class="input-radio">
										<div class="inner"></div>
										<input type="radio" id="gender" name="mGender" value="M"
											required />
									</div>
									<label>남자</label>
								</div>
								<div class="col-sm-2">
									<div class="input-radio">
										<div class="inner"></div>
										<input type="radio" id="gender" name="mGender" value="F" />
									</div>
									<label>여자</label>
								</div>
							</div>
							<label>운전면허 여부 (Y/N)</label>
							<div class="row">
								<div class="col-sm-2">
									<div class="input-radio">
										<div class="inner"></div>
										<input type="radio" id="license" name="mLicense" value="Y"
											required />
									</div>
									<label>Y</label>
								</div>
								<div class="col-sm-2">
									<div class="input-radio">
										<div class="inner"></div>
										<input type="radio" id="license" name="mLicense" value="N" />
									</div>
									<label>N</label>
								</div>
							</div>

							<hr>
							<div class="row">
								<p>프로필 입력</p>
								<label> <textarea id="profile" name="mIntroduce"
										class="form-control" cols="50" rows="5"
										placeholder="소개를 입력하세요" required></textarea>
									<div class="invalid-feedback">소개를 입력하세요</div>
								</label>

								<div class="row">
									<p>
										프로필 사진 <span class="text-muted">&nbsp;(필수 아님)</span>
									</p>
									<label> <img
										style="height: 150px; width: 150px; border-radius: 50%; overflow: hidden;"
										id="preview-image"> <input style="display: block;"
										type="file" id="input-image" name="uploadFile">
										<div class="invalid-feedback">프로필 사진을 입력해주세요.</div>
									</label>
								</div>
							</div>

							<hr class="mb-4">

							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="aggrement" name="aggrement" required> <label
									class="custom-control-label" for="aggrement">개인정보 수집 및
									이용에 동의합니다.</label>
							</div>
							<div class="mb-4"></div>

							<!-- submit 버튼과 reset 버튼 -->

							<div class="row" style="margin-top: 50px;">
								<button class="btn col-md-8" type="submit"  style="background-color: rgba(166, 208, 205, 0.8); border-style: none;  color: white;">가입</button>
								<button type="reset" id="btnReset"
									class="btn btn-light col-md-3">취소</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</section>

		<!-- footer -->

	</div>

	<jsp:include page="tail.jsp" />
	<script>
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
        
        //id 동일 체크
        function idcheck() {
    		var id = $("#id").val();
    		$.ajax({
    			url : 'id_check.do',
    			data : {id : id},
    			success : function(data) {
    				console.log(data);
    				var status = $.trim(data);
    				if(status == "fail") {
    					alert("중복된 아이디입니다.");
    				} else {
    					alert("사용가능한 아이디입니다.");
    				}
    			},
    			error:function(request,status,error){

    	             alert("중복된 아이디를 그대로 사용하셨습니다. 다시 회원가입 부탁드립니다."+error);
    	          }
    		});
    	}
    </script>
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