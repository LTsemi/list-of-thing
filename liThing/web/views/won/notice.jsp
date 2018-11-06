<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
    <head>
        <title>Summernote</title>
  <meta charset="UTF-8">

  <!-- include libraries(jQuery, bootstrap) -->
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  
  <!-- include summernote css/js -->
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

  <!-- summernote 실행 및 기본설정 [ Deep dive - Initialization options 참고 ] -->
  <script>
    $(document).ready(function() {
        $('#summernote').summernote({
		
        	width : 750,
		height: 500,                 // set editor height
		minHeight: null,             // set minimum height of editor
		maxHeight: null,             // set maximum height of editor
		focus: true                  // set focus to editable area after initializing summernote
  
  
		});
    });
  </script>
  
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

    <div id="video-container">
      
        	<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center wow zoomIn">
					<br />
					<br />
					<br />
					<br />
					<br />
						<h1>공지사항</h1>
						<span></span>
						<!-- <p>Our Frequently Asked Questions here.</p> -->
					</div>
				</div>
			</div>
			<br>
			
	  <div class="container" align="center" > 		
  <textarea id="summernote"></textarea> 
	</div>	 
   
  <br>
  

        	<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
        		
    </div>


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
<%@ include file="../common/footer.jsp" %>


    
    





</body>
</html>