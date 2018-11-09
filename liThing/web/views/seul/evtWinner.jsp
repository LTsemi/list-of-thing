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
        
		<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">	


    </head>

<body>

  <style>
    @font-face {
        font-family: 'NanumSquareRoundR';
        src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
    }
    * { box-sizing: border-box;
        font-family: NanumSquareRoundR; 
        color:#333;
    }
    
    a{
    text-decoration-line: none !important;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {
        /* background-color: aquamarine; */
        margin: 0 auto;
        width: 1000px;
        /* height: 1000px; */
        }


    .evtbanner{
        text-align: center;
        width: 1000px;
        margin: 0 auto;
        margin-bottom:70px;
    }

    .winner-tab{
        /* border: 1px solid #333; */
        width: 200px;
        text-align: center;
        margin: 0 auto;
        line-height: 170%;        
    }
    .winner-tab .first {
        border-bottom: 2px solid #333;

    }

    .winner-tab tr th{
        text-align: center;
        /* padding-bottom: 3px; */
    }
    .comment{
        width: 800px;
        margin: 0 auto;
    }
    
    .listbtn {
      padding: 10px 20px;
      background-color: white;
      border: 1px solid lightgray;
      color: gray;
      border-radius: 0;
      transition: .2s;
      margin: 0 auto;

  }
  .listbtn:hover, .btn:focus {
      border: 1px solid rgb(255, 208, 56);
      background-color: rgb(255, 208, 56);
      color: rgb(255, 255, 255);
  }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
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
      
      <h2>[새우깡] 10월 무료샘플 당첨자 안내</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by John Doe, Sep 24, 2015.</h5>
      <br><br>
      <p>
            안녕하세요. 리띵입니다^_^ <br><br>

            10월 9일~10월 22일까지 진행되었던 새우깡 무료샘플 이벤트! <br>
            
            기간 내 참여해주신 모든 분들께 감사드리며, 당첨자를 발표하겠습니다. <br><br>
                       
            * 당첨되신 상품은 회원정보에 입력해주신 주소지로 7/24(화) 일괄지급됩니다.
        </p>    
             
            <br><br>
            
             
            <h4 style="font-weight: 600"> *** [Ctrl + F] 를 이용하시면 쉽게 당첨여부를 확인 하실 수 있습니다.</h4>
        <br />
        <table class="winner-tab" border="1"> 
            <tr class="first">
                <th>당첨자ID</th>
                <th>이름</th>
            </tr>
            <tr>
                <td>user01</td>
                <td>사용*</td>
            </tr>
            <tr>
                <td>user02</td>
                <td>너구*</td>
            </tr>
            <tr>
                <td>user03</td>
                <td>복숭*</td>
            </tr>
            <tr>
                <td>user04</td>
                <td>라이*</td>
            </tr>
        </table>	
        <br /><br />

      
      <hr>
      <br>
      <a href="eventWin.jsp" class="listbtn">목록으로</a>
      <%-- <% if(m != null && m.getUserId().equals("admin")){ %> --%>
      <a href="#" class="listbtn">수정하기</a>		  
	  <%-- <% } %> --%>
    </div>
    </div>

</div>

<%@ include file="../common/footer.jsp" %>


</body>
</html>