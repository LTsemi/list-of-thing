<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Highway Blog - Free CSS Template</title>
<!-- 

Highway Template

http://www.templatemo.com/tm-520-highway

-->
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

		<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">

		<link rel="stylesheet" href="../../resources/css/evtPage.css">
		<link rel="stylesheet" href="../../resources/css/templatemo-style.css">	
		
	<style>
	 @font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
        }
        body { box-sizing: border-box;
            font-family: NanumSquareRoundR !important; 
        }
	</style>
        
    </head>

<body>

  <%@ include file="../common/header.jsp" %>

    <div class="page-heading">
        <div class="container">
            <div class="heading-content">
                <h1>list of<em>thing ;)</em></h1>
            </div>
        </div>
    </div>

<div class="container-fluid">
  <div class="row content">
    

  
    <div class="evtbanner">
    <br><br>
      <h4><small>list of thing - 리띵!</small></h4>   
      <hr>
      
      <h2>[새우깡] 10월 무료샘플 이벤트</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by John Doe, Sep 24, 2015.</h5>
      <br><br>
      <img src="../../resources/img/evtbanner.jpg" width="700px">
      <br><br>
      <hr>
    </div>
      <!-- <h4>Leave a Comment:</h4> -->
      <div class="comment">
        <form role="form">
            <div class="form-group">
            <textarea class="form-control" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn pull-right">응모하기</button>
        </form>
        <br><br><br>
        
        <div class="row cmtbar">
            <br>
            <p><span class="badge">2</span> Comments:</p><br>
            <div class="col-sm-2 text-center">
            <img src="../../resources/img/user.jpg" class="img-circle" height="65" width="65" alt="Avatar">
            </div>
            <div class="col-sm-10">
            <h4>라이언 <small>Sep 29, 2015, 9:12 PM</small></h4>
            <p>응모합니다 ^_^ 저 주세요~!~!</p>
            <br>
            </div>
            <div class="col-sm-2 text-center">
            <img src="../../resources/img/user.jpg" class="img-circle" height="65" width="65" alt="Avatar">
            </div>
            <div class="col-sm-10">
            <h4>무지 <small>Sep 25, 2015, 8:25 PM</small></h4>
            <p>무지무지 갖고싶당..</p>
            <br>
            </div>
        </div> 
        <br><br>
    </div>
    <div class="listGo">
        <a href="event.jsp" class="listbtn">목록으로</a> 
        <%-- <% if(m != null && m.getUserId().equals("admin")){ %> --%>
        <a href="#" class="listbtn">수정하기</a>		  
        <a href="#" class="listbtn">삭제하기</a>		  
		<%-- <% } %> --%>
    </div>
        
        <br><br><br><br>
     </div>

</div>

<%@ include file="../common/footer.jsp" %>



</body>
</html>