<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>changeinfo</title>
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
         .cover-12 form {
    margin-top: 2.25em;
}
            label + input {
    margin-top: 0.125em;
}
            .boxed.boxed--lg {
                margin-top: 8em;
    padding: 2.5625em;
        }
input[type], textarea, select, .imgup {
    -webkit-appearance: none;
    background: #ffffff;
    padding: 0.3125em;
    padding-left: 0.6125em;
    padding-right: 0.6125em;
    border-radius: 50px;
    border: none;
    margin-bottom : auto;
}
.cover-12 form .input-with-icon {
    text-align: left;
    margin-bottom: 0.5em;
}
.filegr{
   display:flex;
   background-color: #f8f8f8;
   text-align:center;
   margin-left:0;
   margin-bottom:0.5em;
   
}
.imgup{
   background-color: white; 
    width:120px;
     text-align:center;
     margin-left:0; 
     margin-bottom:5vh;
   
     
 
}
.filelabel{
   background-color:lightgrey;
   border-radius:20%/50%;
   justify-content: space-between;
   
   min-width:80px;
   margin-top:2vh;
   margin-bottom:2vh;
     padding:1vh;
     padding-top:2vh;
	margin-left : 1.5em;
   
   }

.pos-vertical-center {
	top : 50%; 
}  

.pos-vertical-center {
	height : none;
}
        </style>
    
    </head>
    
    	
    <body class="scroll-assist">
        <a id="top"></a>
        <div class="loader"></div>
        
        <!--  Header 인클루드  -->
		<jsp:include page="Header.jsp" />
      
     
        <!--end of modal-container-->
        <div class="main-container transition--fade">
            <section class="cover cover-12 form--dark imagebg height-100 parallax"
         data-overlay="4" style="height: 130vh;">
         <div class="background-image-holder" style="height: inherit;">
            <img alt="image" src="img/pch_img_1.jpg" />
         </div>
         <div class="container pos-vertical-center text-center-xs" id="con_2">
            <div class="row pos-vertical-align-columns">
               <div class="col-md-7 col-sm-8 col-sm-offset-2">
                  <h2>
                     <c:if test="${!empty member and !empty memberInfo.mId }">
                           ${memberInfo.mId}</c:if>
                     <br>회원정보 수정
                  </h2>
                  
                     <div>
	                     <form action="getMembPw.do" method="POST">
	                     	<button class="btn " style="background-color: rgba(0, 0, 0, 0.01);" >
	                     		<h4 style="margin-bottom: 0em">비밀번호 변경하기</h4>
	                     	</button>
                     	</form>
                     </div>

                  <!--end of modal instance-->
               </div>
               <div class="col-md-5 col-sm-8 col-sm-offset-2">
                  <div
                     class="form-subscribe-1 bg--white text-center box-shadow-wide"
                     style="margin-right: none; background-color: rgba(255, 255, 255, 0.8); padding: 2em;">
                     <h4 style="margin-bottom: 0.5em;">회원정보 수정</h4>
                     
                     <form class="" action="updateMember.do" method="post"
                        id="subForm" enctype="multipart/form-data">
                        <input type="hidden" name="mId" value="${memberInfo.mId }">
                        <div class="input-with-icon col-md-6">
                           <label for="changeName">이름</label> <input id="changeName"
                              name="mName" type="text" value="${memberInfo.mName}"
                              readonly="readonly" style="height: 60%;" />
                        </div>
                        <div class="input-with-icon col-md-6">
                           <label for="changeGender">성별</label> <input id="changeName"
                              name="mGender" type="text" value="${memberInfo.mGender}"
                              readonly="readonly" style="height: 60%;" />
                        </div>
                        <div class="input-with-icon col-md-6">
                           <label for="changeNickname">닉네임</label> <input
                              id="changeNickname" name="mNickname" type="text"
                              value="${memberInfo.mNickname}" style="height: 60%;" />
                        </div>
                        <div class="input-with-icon col-md-6">
                           <label for="changeEmail">이메일</label> <input id="changeEmail"
                              name="mEmail" type="text" value="${memberInfo.mEmail}"
                              style="height: 60%;" />
                        </div>
                        
                        <div class="input-with-icon col-md-6">
                           <label for="changetell">전화번호</label> <input id="changetell"
                              name="mTell" type="text" value="${memberInfo.mTell}"
                              style="height: 60%;" />
                        </div>
                        <div class="input-with-icon col-md-6">
                           <label for="changeLicense">운전면허</label> <select
                              id="DriveLicense" name="mLicense" style="height: 60%;">

                              <option value="Y"
                                 <c:if test="${memberInfo.mLicense eq 'Y'}"> selected</c:if>>있음</option>
                              <option value="N"
                                 <c:if test="${memberInfo.mLicense eq 'N'}"> selected</c:if>>없음</option>

                           </select>
                        </div>

                        <div class="input-with-icon col-md-12">
                           <label for="">자기소개</label>
                           <div class="form-floating">
                              <textarea class="form-control" name="mIntroduce"
                                 placeholder="간단한 자기소개 작성 부탁드립니다." id="floatingTextarea2"
                                 style="resize: none; height: 80px">${memberInfo.mIntroduce}</textarea>
                           </div>
                        </div>
                        <div class="input-with-icon forimg col-md-12">
                           <div
                              style="color: #343434; font-size: 0.625em; margin-top: 0.125em; margin-bottom: 0.3em;">
                              <label>프로필사진 변경</label>
                           </div>
                           <div class="filegr col-md-12">
                              <label style="margin-left : inherit; padding-top:10px"> <img
                                 style="height: 150px; width: 150px; border-radius: 50%; overflow: hidden;"
                                 id="preview-image" alt="Pic" src="upload/${memberInfo.mImgName}"> 
                                 <input style="display: block;"
                                 type="file" id="input-image" name="uploadFile"></label>
                           </div>
                           <input type="submit" value="변경하기" class="btn"
                              style="background-color: steelblue;'">
                           <div class="modal-instance col-md-12" style="padding-top: 10px;" >
                              <a class="modal-trigger col-md-12" href="#"
                                 style="padding-right: 32px; position: relative; text-align: -webkit-center; font-size: 0.25em;">
                                 회원 탈퇴 </a>
                                  
                               

                              <div class="modal-container">
                                 <div class="modal-content bg--white height--natural">
                                    <div
                                       class="form-subscribe-1 boxed bg--white box-shadow-wide"
                                       style="margin-bottom: 0;">
                                       <div class="subscribe__title text-center">
                                          <h4>암호 입력</h4>
                                       </div>
                                       <form id="subForm" action="Withdrawal.do" method="post"
                                          enctype="multipart/form-data">
                                          <div class="input-with-icon">
                                             <label for="fieldName">PassWord</label> <input
                                                id="checkcheck" name="cm-name" type="text" />
                                          </div>
                                          <button class="btn btn-success"
                                             onclick="pspsps('${memberInfo.mPassword}')" type="submit">회원탈퇴</button>
                                          <button class="cencle btn btn-danger modal-close "
                                             type="button">취소</button>
                                       </form>
                                    </div>
                                 </div>

                              </div>
                           </div>
                     </form>
                  </div>
               </div>
            </div>
            <!--end row-->
         </div>
         <!--end container-->
      </section>

           
           
            <jsp:include page="tail.jsp" />
             
          
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
        
        
        
        function pspsps(pwd) {
        	var outout = document.getElementById("checkcheck").value;
        	if(outout==pwd){
        		location.href="/Withdrawal.do?mSeq=${memberInfo.mSeq}";
	
        	} else if(outout != pwd){
        		alert("비밀번호가 틀렸습니다! 다시 입력 부탁드립니다.");	
        		
        	}
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
        <script type="text/javascript" src="../js/script.js"></script>

		
    </body>
</html>