<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>List of Thing</title>
<!-- 

Highway Template

http://www.templatemo.com/tm-520-highway

-->
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">


        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">	
        
        
        <script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	
    	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/lithing-Box.css">
 	    
 	<style>
	 @font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('<%= request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf');
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
            <div id="banner" title="이달의 리띵's Pick 보러가기" onclick="location.href='/semi/selectList.tm'">
            
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
                    <input type="button" value="구매하기" class="btn pull-right buybtn" id="one" onclick="ordersubmit(this);">               
                </div>
                <div class="box centerbox">
                    <img src="../../resources/img/box2.png" width="120px" height="120px" alt="리띵박스테마">
                    <h3 class="buyMonth">3개월</h3>
                    <h4 class="price" name="36">36,000<span style="font-size: 13px; font-weight: 500" >원</span></h4>   
                    <input type="button" value="구매하기" class="btn pull-right buybtn" id="three" onclick="ordersubmit(this);">              
                </div>
                <div class="box rightbox">
                    <img src="../../resources/img/box3.png" width="120px" height="120px" alt="리띵박스테마">
                    <h3 class="buyMonth">6개월</h3>
                    <h4 class="price">72,000<span style="font-size: 13px; font-weight: 500" >원</span></h4>
                     <input type="button" value="구매하기" class="btn pull-right buybtn" id="six" onclick="ordersubmit(this);">
               </div>
        </div>
 <% if( mh != null){ %>
        <form id = "goOrder" method = "post" action ="<%= request.getContextPath() %>/sOrderbox.or?userid=<%=mh.getUserId() %>" >
            <input type="hidden" name="price" id="price" />      
             <input type="hidden" name="buyMonth" id="buyMonth" />              
		</form>
		<%} else {%>
		<form id = "goOrder" method = "post" action ="<%= request.getContextPath() %>/sOrderbox.or?" >
            <input type="hidden" name="price" id="price" />          
             <input type="hidden" name="buyMonth" id="buyMonth" />          
		</form>
		<% } %>
    </div>
    
<script>
	
		
	function ordersubmit(now){
		var nowid = $(now).attr('id');
		
		console.log(nowid);
		
		if(nowid == "one"){
			$('#price').val("12");
			$('#buyMonth').val("1개월");			
			console.log($('#price').val());
			$("#goOrder").submit();
		} else if(nowid == "three"){
			$('#price').val("36");
			$('#buyMonth').val("3개월");
			$("#goOrder").submit();
		} else if(nowid == "six"){
			$('#price').val("72");
			$('#buyMonth').val("6개월");
			$("#goOrder").submit();
		}
	};
</script>


<%@ include file="../common/footer.jsp" %>


</body>
</html>