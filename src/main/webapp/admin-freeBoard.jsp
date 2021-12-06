<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">

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
        
        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">

    <title>Table #1</title>
    <style>
      h1,h2,h3,h4,h5,h6,p,div,li,th,tr{
                font-family: 'Noto Sans KR', sans-serif;
                    }
                    
                    p{
                    font-weight: medium;
                    }
            h5{
            font-weight: medium
            }
            
    </style>
  </head>
  <body>
  

  <div class="content">
    
    <div class="container">
    <h3>${userName }</h3>
      <h1 style="font-weight: bold;">자유게시판</h1><br>
      <div style="width: 100%; border-radius: 10px; border: 1px solid rgba(0, 0, 0, .5) ">
        <ul style="text-align: center; margin:1em; ">
          <h5>본 게시판은 누구나 자유롭게 의견을 게시할 수 있으며, 게시된 의견에 대하여는 답변을 하지 않습니다.</h5>
          <h5>시정 관련 건의사항 또는 답변을 원하는 민원사무 등은 1577-1577 를 이용하시기 바랍니다.</h5>
         <br>
        </ul>
      </div>
      <br>
      
      <div style="display: flex; justify-content: flex-start;">
      <div class="btn"style=""><a href="getBoardCategory.do?category=etc" style="color: black">기타/잡담</a></div>
      <div class="btn"><a href="getBoardCategory.do?category=place" style="color: black">장소추천</a></div>
      </div>
      
     <div class="card-body">
                            <div class="table-responsive">
                                <table class="table" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>글쓴이</th>
                                            <th>제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                            <th>등록일</th>
                                            <th>조회</th>
                                            <th></th>
                                            
                                    </thead>

                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                           
                                        </tr>
                                    </tfoot>
                                    <!--여기부터 1 찍어야함 위에는 바닥부분 설정-->
                                    <tbody>
                                       <c:forEach var="board" items="${boardList }" varStatus="status">
                                        <tr>
                                            <th>${board.seq}</th>
                                            <th>${board.writer}</th>
                                            <th><a href="getBoard.do?seq=${board.seq }"><p>${board.title}</p></a></th>
                                            <th>${board.regDate}</th>
                                            <th>${board.cnt}</th>
                                            
                                            
                                           <td> 
                                        </td>
                                        </tr>
                                        </c:forEach>
                                        
                                         
                                        
                                       
                                    </tbody>
                                </table>

                            </div>
                        </div>
                        
</div>
<div class="row">
  <div class="col-8"></div>
  <div class="col-2">
  <button style="width: 100%; font-size: 200px;" class="btn btn-primary" onclick="location.href='admin-write2.jsp?${Member.mId}'" >글 쓰기</button>
  </div>
</div>
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
        <!-- Bootstrap core JavaScript-->
    <script src="jquery/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
  </body>
</html>