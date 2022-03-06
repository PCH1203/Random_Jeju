<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//HttpSession 데이터 보관소에 저장된 member 객체 꺼내서 사용
	//Member member = (Member)session.getAttribute("Member");
%>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap')
	;

li{
list-style-type : none
}
</style>

<nav class="transition--fade">
	<div class="nav-bar nav--absolute nav--transparent" data-fixed-at="200">
		<div class="nav-module logo-module left">
			<a href="index.jsp"> <img class="rdjj_logo logo-dark" alt="logo"
				src="img/logo_demo_dark.png" style="width: 120px;" /> <img
				class="rdjj_logo logo-light" alt="logo"
				src="img/logo_demo_light.png" style="width: 120px;" />
			</a>
		</div>

		<div class="nav-module menu-module left">
			<ul class="menu">
				<li><a href="index.jsp"> Home </a></li>

				<!-- intro -->
				<li><a href="about.jsp"> Intro </a>
					<ul class="multi-column">
						<li>
							<ul>
								<li><a href="about.jsp"> 소개 </a></li>
								<li><a href="FAQ.jsp"> FAQ </a></li>
								<li><a href="dev.jsp"> 개발자들 </a></li>
							</ul>
						</li>
					</ul></li>

				<!-- Trip -->
				<c:if test="${not empty member or not empty member.mId }">
				<li><a href="choose_join.jsp"> Trip </a>
					<ul class="multi-column">
						<li>
							<ul>
								<li>
									<ul>
										<li><a href="choose_join.jsp"> 여행 시작하기 </a></li>
									</ul>
								</li>
							</ul>
						</li>
					</ul></li>
				</c:if>
				<c:if test = "${empty member or empty member.mId }">
				<li><a href="login.jsp"> Trip </a>
					<ul class="multi-column">
						<li>
							<ul>
								<li>
									<ul>
										<li><a href="login.jsp"> 여행 시작하기 </a></li>
									</ul>
								</li>
							</ul>
						</li>
					</ul></li>
				</c:if>
				<!-- Notice -->
				<c:if test="${not empty member or not empty member.mId }">
				<li><a href="#"> Notice </a>
					<ul class="multi-column">
						<li>
							<ul>
								<li>
									<ul>
										<li><a href="getBoardList.do"> 자유 게시판 </a></li>
										<li><a href="getReviewBoardList.do"> 장소 추천 게시판 </a></li>
									</ul>
								</li>
							</ul>
						</li>
					</ul></li>
				</c:if>
				<c:if test = "${empty member or empty member.mId }">
				<li><a href="#"> Notice </a>
					<ul class="multi-column">
						<li>
							<ul>
								<li>
									<ul>
										<li><a href="login.jsp"> 자유 게시판 </a></li>
										<li><a href="login.jsp"> 장소 추천게시판 </a></li>
									</ul>
								</li>
							</ul>
						</li>
					</ul></li>
				</c:if>
				<li><a href="#"> mypage </a>
					<ul class="multi-column">
						<li>
							<ul>
							<li>
							<c:if test="${empty member or empty member.mEmail }">
									<a href="<%=request.getContextPath() %>/login.jsp">mypage</a>	
							</c:if> 
							
							<c:if test="${!empty member and member.mId eq 'admin'}">
									<a href="<%=request.getContextPath() %>/getMemberList.do">관리자페이지</a>
							</c:if>
							
							<c:if test="${!empty member and !empty member.mEmail }">
								<c:if test="${!empty member and member.mEmail ne 'admin'}">
									<a href="<%=request.getContextPath() %>/Mypage.jsp">${member.mName} mypage</a>
								</c:if>
							</c:if>
							
						</li>
								<!-- <li><a href="elements-buttons.html"> blank_2 </a></li>
								<li><a href="elements-cards.html"> blank_3 </a></li> -->
							</ul>
						</li>
					</ul>
					</li>
			</ul>
		</div>

		<!--end nav module-->
		<div class="nav-module right">
			 <c:choose>
         
             <c:when  test="${empty sessionScope.member}">
                   <li>
                     <a class="nav-function" href="<%=request.getContextPath() %>/login.jsp"><i class="interface-icons">Login</i></a>
                   </li>
            </c:when> 
                   
            <c:when test="${!empty sessionScope.member}">
                   <li>
                  <a class="nav-function" href="<%=request.getContextPath() %>/logout.do"><i class="interface-icons"  >Logout</i></a>
                  
                  </li>   
            </c:when>   
           </c:choose>
			<!-- <a href="login.jsp" class="nav-function"> <i
				class="interface-icons">Login</i>
			</a> -->
		</div>

		<!-- <<<<< 검색 기능 비활성화 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

		<div class="nav-module right">
			
		</div>

		<!-- <<<<< end 검색 기능 비활성화 end >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->

	</div>

	<!--end nav bar-->
	<div class="nav-mobile-toggle visible-sm visible-xs">
		<i class="icon-Align-Right icon icon--sm"></i>
	</div>
</nav>
