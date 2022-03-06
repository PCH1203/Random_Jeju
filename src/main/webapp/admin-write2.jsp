<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="kr">
    <head>
        <meta charset="UTF-8">
        <title>Pillar Multipurpose HTML Template</title>
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
        <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
        <style>
            h1,h2,h3,h4,h5,h6,p,div,li,th,tr{
                      font-family: 'Noto Sans KR', sans-serif;
                          }
                          
                    
                  
          </style>
    </head>
    <body class="scroll-assist">
        <a id="top"></a>
        <div class="loader"></div>
            <jsp:include page="Header.jsp" />
        <div class="main-container transition--fade">
            <section class="imagebg height-10">
                <div class="background-image-holder background--bottom">
                    <img alt="image" src="img/제주사진/제주013.jpg" />
                </div>
                <div class="container pos-vertical-center">
                    <div class="row">
                        <div class="col-sm-12 text-center">
                            <h1><a style="color:white; font-weight: 500;" href="getBoardList.do">자유게시판</a></h1>
                            <p class="lead">원하는 주제에 대해 자유롭게 글을 등록 해 주세요</p>
                        </div>
                    </div>
                    <!--end row-->
                </div>
                <!--end container-->
            </section>
            <section class="masonry-contained">
                <div class="container">
                    <div >
                        
                        <h1>글쓰기</h1> 
                        <hr> <br>
                        <form method="post" action="insertBoard.do"
                        enctype="multipart/form-data">
                        <div class="row">
                            <div class="mb-3 col-md-9">
                                <label for="title"><h5>제목</h5></label> 
                                <input type="text"
                                    class="form-control" name="title" 
                                    id="title"
                                    style=" border: 1px solid rgba(0, 0, 0, 0.2);"  
                                    placeholder="제목을 입력해 주세요">
                            </div>
                            <div class="mb-3 col-md-3">
                                <label for="title"><h5>카테고리</h5></label>
                               
                                <select  name="category"
                                    style="width: 100%; border: 1px solid rgba(0, 0, 0, 0.2); margin-top: 12px">
                                    <option selected value="etc">기타/잡담</option>
                                    <option style="margin" value="place" selected>장소추천</option>
                                </select>
                                
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-12 mb-6">
                                <label for="content"><h5>내용</h5></label>
                                <textarea style="height: 400px; resize: none;" class="form-control" rows="8"
                                    name="content" id="content" placeholder="내용을 입력해 주세요"></textarea>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="content"><h6></h6></label>
                                <div class="image-container">
                                    <img style="width: 200px; height: 200px;" id="preview-image">
                                    <input style="display: block;" type="file" id="input-image"
                                        name="uploadFile" multiple="multiple">
                                </div>
                            </div>
                        </div>
                        <div style="text-align: center;" class="row">
                            <div class="col-md-0"></div>
                            
                            <div class="col-md-12">
                                <button style="background-color: rgba(166, 208, 205, 0.8); border-style: none; padding: 10px"   type="submit" class="btn btn-primary"
                                    id="btnList">저장하기</button>
                            
                            </div>    
                            <div class="col-md-0"></div>
                    </form>
                        </div>  
                  
                           
                            <!--end masonry container-->
                        </div>
                    </div>
                    <!--end of row-->
                </div>
                <!--end of container-->
            </section>
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

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>



	<!-- Bootstrap CSS -->

	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
		integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
		crossorigin="anonymous">



	<title>board</title>



	<script>

	$(document).on('click', '#btnSave', function(e){

		e.preventDefault();

		

		$("#form").submit();

	});

	



</script>

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