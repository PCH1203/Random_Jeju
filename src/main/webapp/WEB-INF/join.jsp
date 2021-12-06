<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- spring:message="메시지 키값" -->
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

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
</style>
</head>

<body>
	<div class="container">
		<!-- 로고 사진 최 상단에 표시 -->
		<img src="assets/img/028.png" class="img-responsive"
			style="height: 150px;">
		<div class="input-form-backgroud row">

			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<form action="login.do" class="validation-form" novalidate>

					<!-- 첫번째 줄 이름, 별명 입력창 -->
					<d iv class="row">
					<div class="col-md-6 mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control" id="name" name = "name" placeholder="" value="" required>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>
					<div class="col-md-6 mb-3">
						<label for="nickname">별명<span class="text-muted">&nbsp;(필수
								아님)</span></label> <input type="text" class="form-control" id="nickname" name ="nickname"
							placeholder="" value="">
						<div class="invalid-feedback">별명을 입력해주세요.</div>
					</div>
					</d>

					<!-- 두번째 줄 : 아이디 입력 -->
					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="id" name ="id" placeholder="input your id"
								required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
					</div>

					<!-- 세번째 줄 : 비밀번호, 비밀번호 확인 창 -->
					<div class="row" id="pwbord">
						<div class="col-md-6 mb-3 ">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="password" name="password" placeholder="" value=""
								required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="confirmpw">비밀번호 확인</label> <input type="password"
								class="form-control" id="confirmpw" name="confirmpw" onkeyup="checkPwd()"
								placeholder="" value="" required>
							<div class="invalid-feedback">비밀번호 확인을 진행해주세요.</div>
						</div>
					</div>

					<!-- 세번째 줄 연산 결과 출력 : 동일한 암호를 입력하세요 / 암호가 확인 되었습니다.  -->
					<div class="col-md-6 mb-3">
						<div id="checkPwd">동일한 암호를 입력하세요.</div>
					</div>

					<!-- 네번째 줄 : 이메일 입력 -->
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="email" placeholder="you@example.com"
							required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<!--  -->
					<div class="mb-3">
						<label for="address">전화번호</label> <input type="tel"
							class="form-control" id="phone" name="phone" placeholder="010-0000-0000"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required> <small>Format:
							010-0000-0000</small>
						<div class="invalid-feedback">전화번호를 입력해주세요.</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="birthday">생년월일</label> <input type="date"
								class="form-control" id="birthday" name="birthday" placeholder="yyyymmdd"
								required>
							<div class="invalid-feedback">생년월일를 입력해주세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<input type="radio"
								style="width: auto; height: auto; display: inline-block;"
								class="form-control" id="female" name="gender" value="female"
								required>   <label for="female">여자</label>   <br> <input
								type="radio" id="male" name="gender" value="male">   <label
								for="male">남자</label>
							<div class="invalid-feedback">성별을 입력해주세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="drive">운전면허 여부(Y/N)</label> <br> 
						<input type="checkbox" id="drive" name="drive" class="input__on-off" required> 
						<label for="drive" class="label__on-off">
							<span class="marble"></span> <span class="yes">Yes</span> <span
							class="no">No</span>
						</label>
						<div class="invalid-feedback">운전면허 여부를 입력해주세요.</div>
					</div>

					<hr>
					<div class="row">
						<div class="col-md-8 mb-3">
							<p>프로필 입력</p>
							<label> <textarea id ="profile" name="profile" class="form-control"
									cols="50" rows="5" placeholder="소개를 입력하세요" required></textarea>
								<div class="invalid-feedback">소개를 입력하세요</div>
							</label>
						</div>

						<div class="col-md-4 mb-3">
							<p>
								프로필 사진 <span class="text-muted">&nbsp;(필수 아님)</span>
							</p>
							<label> <img
								style="height: 150px; width: 150px; border-radius: 50%; overflow: hidden;"
								id="preview-image"> <input style="display: block;"
								type="file" id="input-image" name="input-image">
								<div class="invalid-feedback">별명을 입력해주세요.</div>
							</label>
						</div>
					</div>

					<hr class="mb-4">

					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement" name ="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>

					<!-- submit 버튼과 reset 버튼 -->
					<center>
						<button class="btn btn-primary col-md-9" type="submit"
							style="background: transparent; border-color: white;">
							<img src="assets/img/submitbtn.png" style="height: 50px;"
								onmouseover="this.src='assets/img/submitbtnhover.png'"
								onmouseout="this.src='assets/img/submitbtn.png'">
						</button>
						<button type="reset" id="btnReset" class="btn btn-light col-md-2">취소</button>
					</center>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2021 RandomJeju</p>
		</footer>
	</div>
	<script>
    // 부정 입력 방지 이벤트
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
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
      var f1 = document.forms[0];
      var pw1 = f1.password.value;
      var pw2 = f1.confirmpw.value;
      if (pw1 != pw2) {
        document.getElementById('checkPwd').style.color = "red";
        document.getElementById('pwbord').style.borderColor = "red";
        document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
      } else {
        document.getElementById('checkPwd').style.color = "green";
        document.getElementById('pwbord').style.borderColor = "white";
        document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";

      }

    }
  </script>
</body>

</html>