<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.buyme.won.notice.model.vo.*"%>

<% Notice n = (Notice)request.getAttribute("notice"); %>

<!DOCTYPE html>
<html>
<head>
<title>공지사항 수정</title>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">

<link rel="stylesheet" href="/semi/resources/css/evtPage.css">
<link rel="stylesheet" href="/semi/resources/css/templatemo-style.css">

<link href="https://fonts.googleapis.com/css?family=Gugi|Itim"
	rel="stylesheet">

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">

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
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	
	<% if(mh != null && mh.getUserId().equals("admin")){ %>
	<div class="page-heading">
		<div class="container">
			<div class="heading-content">
				<h1>
					list of<em>thing :)</em>
				</h1>
			</div>
		</div>
	</div>


	<div id="video-container" style="height: 720px;">

		<div class="row">
			<div class="col-md-12">
				<div class="section-title text-center wow zoomIn">
					<br />
					<h1 style="font-family: Gugi;">공지사항 수정</h1>

				</div>
			</div>
		</div>
		<br>
		<form id="updateForm" method="post">
			<div align="center">

				제목 : &nbsp; <input size="80" id="title" align="center" type="text"
					size="50" name="title"
					value="<%= n.getNtitle().replace("\"", "&#34;") %>"><br>
				<br> 작성자 : <input size="25" id="writer" align="center"
					type="text" value="관리자" name="writer" readonly>&nbsp;
				작성일 : &nbsp; <input type="date" id="date" name="date"
					value="<%= n.getNdate() %>"> <input type="hidden"
					name="nno" value="<%= n.getNno() %>" />
				<% System.out.println("nno jsp : " + n.getNno()); %>
			</div>
			<br>

			<div class="container" align="center">
				<textarea id="summernote" name="content"><%= n.getNcontent() %></textarea>

				<div align="center">
					<button id="btn1" onclick="complete();">작성완료</button>
					<button id="btn2" onclick="deleteNotice();">삭제하기</button>
				</div>
			</div>

			<script>
					function complete(){
						$("#updateForm").attr("action","<%=request.getContextPath() %>/nUpdate.no");
						
					}
					
					function deleteNotice(){
						
						var checkdel = window.confirm("정말로 삭제하시겠습니까?");
						
						if(checkdel){
							$("#updateForm").attr("action","<%=request.getContextPath() %>/nDelete.no");
						}else{
							$("#updateForm").attr("action","<%=request.getContextPath() %>/nUpdate.no");
						}
						
					}
					
					
				
				</script>
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