<%@page import="com.buyme.ju.thema.model.vo.Thema"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Thema t = (Thema)request.getAttribute("thema");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테마 추가</title>

<script src="<%=request.getContextPath() %>/resources/js/vendor/jquery-3.3.1.min.js"></script>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/thema.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-style.css">
        
		<link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet"> 

        <style>
            @font-face {
                  font-family: 'NanumSquareRoundR' ;
                  src: url("<%=request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf");
                }
                body, h2, p { box-sizing: border-box;
                    font-family: NanumSquareRoundR !important; 
                }
        </style>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="page-heading">
	   <div class="container">
	       <div class="heading-content">
	           <h1 id="htitle">List of Thing</h1>
	       </div>
	   </div>
    </div>
	
		<% if (mh != null) { %>
		<div class="outer" align="center">
			<h2>게시판 작성</h2>
			<div class="tableArea">
				<form id="insertForm" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>제목 </td>
							<td colspan="3"><input type="text" size="51" name="title" id="title"></td>
						</tr>
						<tr>
							<td>작성자 </td>
							<td colspan="3"><%= mh.getUserName() %>
								<input type="hidden" name="userId" value="<%= mh.getUserId() %>"/>
							</td>
						</tr>
						<tr>
							<td>첨부파일 </td>
							<td colspan="3">
								<input type="file" name="file" id="file" />
							</td>
						</tr>
						<tr>
							<td>내용 </td>
							<td colspan="3">
								<textarea name="content" cols="52" rows="15" style="resize:none;"></textarea>
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button onclick="complete();">등록하기</button>
						<button type="reset">취소하기</button>
					</div>
					<script>
					function complete(){
						$("#insertForm").attr("action","<%=request.getContextPath() %>/tInsert.tm");
						$("#insertForm").submit();
					}
					</script>
				</form>
			</div>
		</div>
		<% } else { 
			request.setAttribute("msg", "관리자만 열람 가능합니다.");
			request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
		 } %>
		<%@ include file="../common/footer.jsp" %>
</body>
</html>