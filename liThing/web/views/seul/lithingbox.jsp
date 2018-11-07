<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>About Highway - Free CSS Template</title>
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

        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
 	    <script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
    	<link rel="stylesheet" href="../../resources/css/lithing-Box.css">
 	    
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

    
    <div id="lithingBox">
        <div id="textTop">
            <h2>Lithing Box</h2>
            <br><br>
            <p>매월 새로운 <span class="lithing">리띵</span>박스가 배달됩니다!</p>
            <br><br><br><br>
            <br><br><br><br>
            <div id="banner" onclick="location.href='lithingbox.jsp'">
            
                <p>[10월] 이달의 리띵's Pick! <br />
                   	<em>"손이가요 손이가는 젤리 Best10"</em></p>
            </div>
        </div>
        <div id="buytab"> 
            
            <div class="buy">
                <div class="box leftbox">
                    <img src="../../resources/img/box1.png" width="120px" height="120px" alt="리띵박스테마">
                    <h3 class="buyMonth">1개월</h3>
                    <h4 class="price">12,000<span style="font-size: 13px; font-weight: 500" >원</span></h4>                 
                    <input type="button" value="구매하기" class="btn pull-right buybtn" onclick="location.href='orderBox.jsp'">               
                </div>
                <div class="box centerbox">
                    <img src="../../resources/img/box2.png" width="120px" height="120px" alt="리띵박스테마">
                    <h3 class="buyMonth">3개월</h3>
                    <h4 class="price">36,000<span style="font-size: 13px; font-weight: 500" >원</span></h4>                 
                    <input type="button" value="구매하기" class="btn pull-right buybtn" onclick="location.href='orderBox.jsp'">              
                </div>
                <div class="box rightbox">
                    <img src="../../resources/img/box3.png" width="120px" height="120px" alt="리띵박스테마">
                    <h3 class="buyMonth">6개월</h3>
                    <h4 class="price">72,000<span style="font-size: 13px; font-weight: 500" >원</span></h4>                 
                     <input type="button" value="구매하기" class="btn pull-right buybtn" onclick="location.href='orderBox.jsp'">
               </div>
        </div>

    </div>



<%@ include file="../common/footer.jsp" %>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/semi/resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="/semi/resources/js/vendor/bootstrap.min.js"></script>
    
    <script src="/semi/resources/js/plugins.js"></script>
    <script src="/semi/resources/js/main.js"></script>

</body>
</html>