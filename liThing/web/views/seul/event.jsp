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
        
		

        <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../resources/css/fontAwesome.css">
        <link rel="stylesheet" href="../resources/css/light-box.css">
        <link rel="stylesheet" href="../resources/css/templatemo-style.css">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        
           
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">

		<link rel="stylesheet" href="../../resources/css/event.css">
        	
        


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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

<div id="eventPage"> 
    <br>
    <h2>Event</h2>
    <p>혜택이 가득한 리띵박스의 이벤트에 참여해보세요^_^</p>
    <br>
    
    <ul class="nav nav-tabs">
      <li class="active"><a href="event.jsp">&nbsp; 이벤트 &nbsp;</a></li>
      <li><a href="eventWin.jsp">당첨자발표</a></li>
    </ul>
  
    <div class="tab-content">
      <div id="home" class="tab-pane fade in active">
      <!--   이벤트 창    -->
      <div id="lithingevt">
      	  <br><br>
      	  
     	  <%-- <% if(m != null && m.getUserId().equals("admin")){ %> --%>
		  <a href="eventPageInsertForm.jsp" class="listbtn">이벤트 추가</a>
		  <%-- <% } %> --%>
		  
          <br><br>
          <div class="row">
             
            <div class="thumbnail">
              <span class="dday">D-30</span>
              <a href="eventPage.jsp" target="_top">
                <p class="evtImg">
                  <img src="image/lighs.jpg">
                </p>
                <div class="evtText">
                  <h3>무료 체험 이벤트</h3>
                  <p>2018/08/20 ~ 2018/09/01까지</p>
                </div>
              </a>
            </div>
      
            <div class="thumbnail">
                <span class="dday">D-26</span>
                <a href="eventPage.jsp" target="_top">
                  <p class="evtImg">
                    <img src="image/lighs.jpg">
                  </p>
                  <div class="evtText">
                    <h3>무료 체험 이벤트</h3>
                    <p>2018/08/20 ~ 2018/09/01까지</p>
                  </div>
                </a>
              </div>
      
              <div class="thumbnail image-cover">
                  <span class="dday">D-08</span>
                  <a href="eventPage.jsp" target="_top">
                    <p class="evtImg">
                      <img src="image/lighs.jpg">
                    </p>
                    <div class="evtText">
                      <h3>무료 체험 이벤트</h3>
                      <p>2018/08/20 ~ 2018/09/01까지</p>
                    </div>
                  </a>
                </div>
                
                
          </div>
          <br><br><br><br>
        </div>
      </div>
	</div>     
</div>     

   


<%@ include file="../common/footer.jsp" %>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/semi/resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="/semi/resources/js/vendor/bootstrap.min.js"></script>
    
    <script src="/semi/resources/js/plugins.js"></script>


</body>
</html>