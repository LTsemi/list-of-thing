<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>List of Thing</title>


<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300"
	rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">	
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/css/eventPageInsertForm.css">

<style>
@font-face {
	font-family: 'NanumSquareRoundR';
	src: url('<%= request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf');
}

body {
	box-sizing: border-box;
	font-family: NanumSquareRoundR !important;
}
</style>

</head>

<body>

	<%@ include file="../common/header.jsp"%>

	<div class="page-heading">
		<div class="container">
			<div class="heading-content">
				<h1>
					list of<em>thing ;)</em>
				</h1>
			</div>
		</div>
	</div>

		<div class="container-fluid">
		
			<div class="row content">



				<div class="evtEditor">
					<br>
					<br>
				<form action="<%=request.getContextPath()%>/eInsert.ev" method="post"
					encType="multipart/form-data">
					<h2>
						<input id="title" type="text" size="40" name="title"
							placeholder="제목" required="required">
						<input type="hidden" name="userId" value="<%= mh.getUserId() %>"/>
					</h2>
					<hr>
					<h5>
						이벤트 시작일 : <input type="date" name="dateStr"  required="required"> &nbsp; | &nbsp;
						이벤트 종료일 : <input type="date" name="dateEnd"  required="required"> &nbsp; | &nbsp;
						당첨자 수 : <input type="number" name="winner_cnt" class="winner_cnt" min="1" required="required"/>	<br />					
					</h5>
					
						<br>
						<table align="center" style="width: 100%" class="editTable">
							<tr>
								<td>대표 이미지</td>
								<td colspan="3">
									<div id="titleImgArea">
										<img id="titleImg">
									</div>
								</td>
							</tr>
							<tr>
								<td>내용 사진</td>
								<td>
									<div id="contentImgArea1">
										<img id="contentImg1" >
									</div>
								</td>						
							</tr>
							
						</table>
					
					<div id="fileArea">
						<input type="file" id="thumbnailImg1" multiple="multiple"
							name="thumbnailImg1" onchange="LoadImg(this,1)"> 
						<input type="file" id="thumbnailImg2" multiple="multiple"
							name="thumbnailImg2" onchange="LoadImg(this,2)"> 
					</div>
					
					<br><br>

					<hr>
					<br>
					<button type="button" class="listbtn"
						onclick="location.href='/semi/selectList.ev'">취소하기</button>
					<%-- <% if(m != null && m.getUserName().equals(t.getBwriter())){ %> --%>
					<button type="submit" class="listbtn">작성 완료</button>
					<%-- <% } %>	 --%>
					</form>
				</div>
			</div>
			<br />
			<br /> <br />
			<br />
		</div>
	
	<script>

			// 사진 게시판 미리보기 기능 지원 스크립트
			$(function(){
				$('#fileArea').hide();
				
				$('#titleImgArea').click(() => {
					$('#thumbnailImg1').click();
				});
				
				$('#contentImgArea1').click(() => {
					$('#thumbnailImg2').click();
				});
				
			});
			
			function LoadImg(value, num) {
				if(value.files && value.files[0]) {
					var reader = new FileReader();
					
					reader.onload = function(e){
						switch(num){
						case 1: $('#titleImg').attr('src', e.target.result);
							break;
						case 2: $('#contentImg1').attr('src', e.target.result);
							break;
						}
					}
					
					reader.readAsDataURL(value.files[0]);
				}
			}
			
		
		</script>

	<%@ include file="../common/footer.jsp"%>


</body>
</html>