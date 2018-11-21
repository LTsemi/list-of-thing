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
<title>테마 수정</title>

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
                body, input, textarea { box-sizing: border-box;
                    font-family: NanumSquareRoundR !important; 
                }
        </style>

</head>
<body>
<%@ include file="../common/header.jsp" %>

	<div class="page-heading">
	   <div class="container">
	       <div class="heading-content">
	           <h1 id="ttitle">List of Thing</h1>
	       </div>
	   </div>
    </div>

	<div class="outer">
		<br>
		<h2 align="center">테마 수정 페이지</h2>
		<div class="tableArea">
			<form id="updateForm" method="post" enctype="multipart/form-data">
				<table align="center">
					<tr>
						<td>제목 </td>
						<td colspan="3">
							<input type="text" size="66" name="title" value="<%=t.getTtitle() %>">
							<input type="hidden" name="bno" value="<%=t.getTno()%>">
						</td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td colspan="3"><%= t.getUserid() %></td>
					</tr>
					<% if(t.getTimage() != null){ %>
					<tr>
						<td>기존 파일 </td>
						<td colspan="3">
							<a href="/semi/tidown.tm?path=<%=t.getTimage()%>" width="67">
							<%= t.getTimage()%></a>	
						</td>
					</tr>
					<% } %>
					<tr>
						<td>새 파일 </td>
						<td colspan="3">
							<input type="file" name="file" id="file" />
						</td>
					</tr>
					<tr>
						<td>내용 </td>
						<td colspan="3">
							<textarea name="content" cols="67" rows="15" style="resize:none;"><%=(t.getTcontent().replace("\r\n", "<br>")).replace("<br>", "\r\n") %></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button onclick="complete();">수정완료</button>
					<button onclick="delThema();">삭제하기</button>
				</div>
				<script>
					function complete(){
						$("#updateForm").attr("action","<%= request.getContextPath()%>/tUpdate.tm?tno=<%=t.getTno() %>");
					}
					
					function delThema() {
						$("#updateForm").attr("action", "<%= request.getContextPath() %>/tDelete.tm?tno=<%= t.getTno() %>");
					}
				
				</script>
			</form>
	</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>