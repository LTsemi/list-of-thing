<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<title>공지사항 작성</title>
<meta charset="UTF-8">


<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="https://fonts.googleapis.com/css?family=Gugi|Itim"
	rel="stylesheet">

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	
	
	
	<link rel="stylesheet" href="../../resources/css/evtPage.css">
	<link rel="stylesheet" href="../../resources/css/templatemo-style.css">	




<style>
@font-face {
	font-family: 'NanumSquareRoundR';
	src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
}

body {
	box-sizing: border-box;
	font-family: NanumSquareRoundR !important;
}

#btn1 {
	background-color: white;
	color: black;
	border: 0.5px solid #BDBDBD;
	height: 24px;
}

#btn2 {
	background-color: white;
	color: black;
	border: 0.5px solid #BDBDBD;
	height: 24px;
}

#title {
	position: absolte: width:100px;
	height: 32px
}

#writer {
	position: absolte: width:100px;
	height: 30px
}

#date {
	position: absolte: width:100px;
	height: 32px
}
​
</style>

</head>

<body>

	<%@ include file="../common/header.jsp"%>

  
	<div class="page-heading">
		<div class="container">
			<div class="heading-content">
				<h1>
					list of<em>thing :)</em>
				</h1>
			</div>
		</div>
	</div>


  <% if(mh != null && mh.getUserId().equals("admin")) { %>
	<div id="video-container" style="height: 720px;">

		<div class="row">
			<div class="col-md-12">
				<div class="section-title text-center wow zoomIn">
					<br />
					<h1 style="font-family: Gugi;">공지사항</h1>

				</div>
			</div>
		</div>
		<br>


<form action="<%= request.getContextPath() %>/nInsert.no" method="post">

		<div align="center">
			제목 : &nbsp; <input type="text" size="80" id="title" name="title" align="center" placeholder="   제목을 입력하세요."><br> 
			<br> 
			작성자 : <input type="text" value="<%= mh.getUserName() %>" name="writer" readonly size="25" id="writer" align="center">&nbsp; 
			작성일 : &nbsp; <input type="date" id="date" name="date">
		</div>
		<br>

		<div class="container" align="center">
			<!-- <textarea id="summernote" name="content"></textarea> -->
			<textarea id="summernote"></textarea>

			<div align="center">
				<button type="reset" id="btn1">취소하기</button>
				<button type="submit" id="btn2">등록하기</button>
			</div>
		</div>

		<br>

	</form>


	</div>


	<br>
	<br />
	
	<% } else {
		request.setAttribute("msg", "관계자 외에 접근이 불가능한 페이지입니다.");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	} %>

	<%@ include file="../common/footer.jsp"%>



<script>
    $(document).ready(function() {
        $('#summernote').summernote({
		
        width : 800,
		height: 400,                 // set editor height
		minHeight: null,             // set minimum height of editor
		maxHeight: null,             // set maximum height of editor
		focus: true,                  // set focus to editable area after initializing summernote
  
  
		toolbar: [
			// [groupName, [list of button]]
			['style', ['style']],
			['font', ['bold', 'italic', 'underline', 'clear']],
			['font', ['fontsize', 'color']],
			['font', ['fontname']],
			['para', ['paragraph']],
			['table', ['table']]

		]
	
		
		
		});
    });
  </script>





</body>
</html>