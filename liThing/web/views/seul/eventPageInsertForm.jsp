<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Highway Blog - Free CSS Template</title>


        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        
        <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../resources/css/fontAwesome.css">
        <link rel="stylesheet" href="../resources/css/light-box.css">
        <link rel="stylesheet" href="../resources/css/templatemo-style.css">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>        
		<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">

		<link rel="stylesheet" href="../../resources/css/eventPageInsertForm.css">

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
    

  
    <div class="evtEditor">
    <br><br>
    
      <h2><input id="title" type="text" size="40" name="title" placeholder="제목" ></h2>
      <hr>
      <h5><span class="glyphicon glyphicon-time"></span> Post by 오렌지, 2015/11/11</h5>
      <p>
        <br><br>
        <div id="evtImgArea">
            <img id="evtImg">
        </div>    
        <div id="fileArea">
            <input type="file" id="thumbnailImg" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
        </div>

        <br><br>
        <div id="titleText">
            <textarea name="content" rows="5" cols="120" style="resize:none;" placeholder="내용을 입력하세요."></textarea>
        </div>
        <br><br>
      </p>
      <hr>
      <br>
		<button type="button" class="listbtn" onclick="location.href='event.jsp'">취소하기</button>
		<%-- <% if(m != null && m.getUserName().equals(t.getBwriter())){ %> --%>
		<button type="submit" class="listbtn">작성 완료</button>
		<%-- <% } %>	 --%>
    </div>
    </div>
<br /><br />
<br /><br />
</div>
    <script>
        $(function(){
            $('#fileArea').hide();
            
            $('#evtImgArea').click(() => {
                $('#thumbnailImg').click();
            });
            
        });

        function LoadImg(value, num) {
				if(value.files && value.files[0]) {
					var reader = new FileReader();
					
					reader.onload = function(e){
						switch(num){
						case 1: $('#evtImg').attr('src', e.target.result);
							break;
						}
					}
					
					reader.readAsDataURL(value.files[0]);
				}
			}

    </script>

<%@ include file="../common/footer.jsp" %>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/semi/resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="/semi/resources/js/vendor/bootstrap.min.js"></script>
    
    <script src="/semi/resources/js/plugins.js"></script>
    <script src="/semi/resources/js/main.js"></script>

</body>
</html>