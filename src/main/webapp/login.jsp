<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- spring:message="메시지 키값" -->
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Random Jeju | Login page</title>
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
</head>
<body class="scroll-assist">
	<a id="top"></a>
	<div class="loader"></div>

	<!--  Header 인클루드  -->
	<jsp:include page="Header_2.jsp" />

	<div class="modal-container search-modal" data-modal-id="search-form">
		<div class="modal-content bg-white imagebg" data-width="100%"
			data-height="100%">
			<div class="pos-vertical-center clearfix">
				<div
					class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 text-center">
					
					
					<form class="clearfix" action="login.do" method="post">
						<div class="input-with-icon">
							<i class="icon-Magnifi-Glass2 icon icon--sm"></i> <input
								type="search" name="query"
								placeholder="Type your search and hit enter" />
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--end of modal-content-->
	</div>
	<!--end of modal-container-->
	<div class="main-container transition--fade">
		<section class="height-100 cover cover-8">
			<div class="col-md-7 col-sm-5">
				<div class="background-image-holder">
					<img alt="image" src="img/login_img.png" />
				</div>
			</div>
			<div class="col-md-5 col-sm-7 bg--white text-center">
				<div class="pos-vertical-center">
					<img class="rdjj_logo" alt="Pillar" src="img/logo_demo_dark.png"
						style="width: 200px; margin-bottom: 0;" />
					<p class="lead"></p>
					<div class="text-left">
					
					
						<form action="login.do" method="post">
							<div class="row">
								<div class="col-sm-12">
									<div class="input-with-icon">
										
										<i class="icon icon-Male-2"></i>
										 <input type="text" name="mId" id="Id" 
											 placeholder="아이디를 입력하세요." />
											
									
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="input-with-icon">

										<i class="icon icon-Security-Check"></i> <input
											type="password" name="mPassword" placeholder="비밀번호를 입력하세요." />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 text-center">
									<div class="input-checkbox">
										<div class="inner" onclick="checkChange();"></div>
										<input type="checkbox" id="idCheck" name="remember"/>
										
									</div>
									<span class="type--fine-print" >아이디 기억하기</span>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<button type="submit" class="btn"
										style="background-color: rgba(166, 208, 205, 0.8); border-style: none;">로그인</button>
								</div>
							</div>
						
							
							<div class="row text-center">
								<p class="type--fine-print" style="text-decoration: none;">

									<a href="join.jsp" style="text-decoration: none;">회원가입</a>&emsp;&emsp;&emsp;

									<a href="findaccount.do" style="text-decoration: none;">아이디
										| 비밀번호 찾기</a>
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>


		<!-- <<<<< footer >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
		<jsp:include page="tail.jsp" />

		<!-- <<<<< end footer end >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->

	</div>
	<%-- <%
	MemberVO member = session.getAttribute("login");
 	Cookie idCoo= new Cookie("Id","mId");
	idCoo.setMaxAge(60*60);
	response.addCookie(idCoo); 
	
	
	%> --%>
 <%--  <%
		Cookie[] cookies = request.getCookies();
		if(cookies == null) {
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("remember")) {
					request.setAttribute("remember","mId");
				}
			}
		}
	%> --%>

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
	<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
	<script>
	
	/* $(document).ready(function(){
		 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#Id").val(key); 
	     
	    if($("#Id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#Id").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#Id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#Id").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(Id, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	} */
	
	$(document).ready(function() {
		var cookie = getCookie('mId');
		
		if(cookie != null && cookie !='')  {
			$("#Id").val(cookie);
		}
			
	});
	
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	function setCookie(name, value, day) {
        var date = new Date();
        date.setTime(date.getTime() + day * 30 * 30 * 24 *1000);
        document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
    };

	function checkChange() {
		if(!$('#idCheck').is(':checked')) {
			
			setCookie('mId', $("#Id").val(), 7);
		}
	}
</script>
</body>
</html>