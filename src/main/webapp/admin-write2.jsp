<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<style>
h1, h2, h3, h4, h5, h6, p, div {
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	padding-top: 70px;
	padding-bottom: 30px;
}

a:hover {
	color: #224abe;
	text-decoration: none;
}
</style>
</head>

<body>

	<article>

		<div class="container" role="main" style="background-color: white;">
			<div style="display: flex; justify-content: space-between;">
				<div>
					<h1 style="font-weight: bold;">
						<a style="color: black" href="getBoardList.do">자유게시판</a>
					</h1>
					<br>
					<h2>글쓰기</h2>
				</div>
				<div>
					<a class="btn btn-dark"href="getBoardList.do">나가기</a>
				</div>
			</div>
			<form method="post" action="insertBoard.do"
				enctype="multipart/form-data">
				<div class="row">
					<div class="mb-3 col-md-9">
						<label for="title"><h6>제목</h6></label> <input type="text"
							class="form-control" name="title" id="title"
							placeholder="제목을 입력해 주세요">
					</div>
					<div class="mb-3 col-md-3 row">
						<h6>카테고리</h6>
						<br> <select name="category"
							style="width: 100%; border: 1px solid rgba(0, 0, 0, 0.2);">
							<option selected value="etc">기타/잡담</option>
							<option value="place" selected>장소추천</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="content"><h6>내용</h6></label>
						<textarea style="height: 400px;" class="form-control" rows="8"
							name="content" id="content" placeholder="내용을 입력해 주세요"></textarea>
					</div>
					<div class="col-md-6 mb-3">
						<label for="content"><h6>사진</h6></label>
						<div class="image-container">
							<img style="width: 100%; height: 100%;" id="preview-image"
								src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
							<input style="display: block;" type="file" id="input-image"
								name="uploadfile">
						</div>
					</div>
				</div>
				<div style="display: flex; justify-content: center;">
					<div>
						<button style="padding: 10px;" type="submit" class="btn btn-dark"
							id="btnList">&nbsp저장&nbsp</button>
			</form>
		</div>
		</div>
		</div>






	</article>
	<!-- jQuery -->

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