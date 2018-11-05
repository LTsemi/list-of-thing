<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
  <head>
  <title>Summernote</title>
  <meta charset="UTF-8">

  <!-- include libraries(jQuery, bootstrap) -->
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  
  <!-- include summernote css/js -->
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  

  <!-- summernote 실행 및 기본설정 [ Deep dive - Initialization options 참고 ] -->
  <script>
    $(document).ready(function() {
        $('#summernote').summernote({
		
		height: 300,                 // set editor height
		minHeight: null,             // set minimum height of editor
		maxHeight: null,             // set maximum height of editor
		focus: true                  // set focus to editable area after initializing summernote
  
  
		});
    });
  </script>

<body>

   <%@ include file="../common/header.jsp" %>

   
   
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
       <!--  <div class="outer"> -->
		

  <textarea id="summernote"></textarea> 
	
	<!-- </div> -->
  <br>

        	<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
        		
   


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    




    

    <section class="overlay-menu">
      <div class="container">
        <div class="row">
          <div class="main-menu">
              <ul>
                  <li>
                      <a href="../index.jsp">랭 킹</a>
                  </li>
                  <li>
                      <a href="../views/notice.jsp">공지사항</a>
                  </li>
                  <li>
                      <a href="../views/LTpick.jsp">리띵's pick</a>
                  </li>
                  <li>
                      <a href="../views/lithingbox.jsp">리띵 박스  구매 </a>
                  </li>
                  <li>
                      <a href="../views/event.jsp">이벤트</a>
                  </li>
                  <li>
                      <a href="../views/CustomerService.jsp">고객센터</a>
                  </li>
              </ul>
              <p>We create awesome templates for you.</p>
          </div>
        </div>
      </div>
    </section>

  












</body>
</html>