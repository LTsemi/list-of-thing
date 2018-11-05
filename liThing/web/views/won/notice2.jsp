<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

  <script src="lang/summernote-ko-KR.js"></script>

  <!-- summernote 실행 및 기본설정 [ Deep dive - Initialization options 참고 ] -->
  <script>
    $(document).ready(function() {
        $('#summernote').summernote({
		
        width:750,
		height: 300,                 // set editor height
		minHeight: 100,             // set minimum height of editor
		maxHeight: null,             // set maximum height of editor
		focus: true ,                 // set focus to editable area after initializing summernote
		lang: 'ko-KR' // default: 'en-US'
  
		});
    });
  </script>
  
  <style>
  @font-face {
    font-family: 'NanumSquareRoundR';
    src: url('resource/font/NanumSquareRoundR.ttf');
    }
    * { box-sizing: border-box;
    font-family: NanumSquareRoundR; 
    }
  
  #summernote {
   margin-top: 500;
    padding: 30px;
  }
  
  </style>
  
</head>
<body>

  <textarea id="summernote"></textarea> 
 
</body>
</html>
