<%@page import="com.buyme.ju.customerService.model.vo.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% CustomerService c = (CustomerService)request.getAttribute("customerService"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터 QnA 수정</title>

	<script src="<%=request.getContextPath() %>/resources/js/vendor/jquery-3.3.1.min.js"></script>

		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/CustomerService.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-style.css">
        
        <style>
    	@font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('<%=request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf');
        }
        *{ box-sizing: border-box;
            font-family: NanumSquareRoundR !important; 
        }
   </style>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<div class="page-heading">
	        <div class="container">
	            <div class="heading-content">
	                <h1 id="ctitle">List of Thing</h1>
	            </div>
	        </div>
    	</div>

<h2 align="center">QnA 수정</h2>
		<div class="tableArea" align="center">
			<form id="updateForm" method="post">
				<table>
					<tr>
						<td>제목 </td>
						<td colspan="3">
							<input type="text" size="50" name="title" 
							       value="<%= c.getCtitle().replace("\"", "&#34;") %>">
						</td>
					</tr>
					<tr>
						<td>글번호 </td>
						<td colspan="3">
							<input type="number" size="50" name="cno" value="<%= c.getCno() %>">
						</td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td>
							<input type="text" value="<%= c.getUserid() %>" name="writer" readonly>
						</td>
						<td>작성일</td>
						<td><input type="date" name="date" value="<%= c.getCdate() %>" readonly></td>
					</tr>
					<tr>
						<td>내용 </td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;" wrap="soft"><%= c.getCcontent() %></textarea>
						</td>
					</tr>
				</table>
				<br>
				</form>
				</div>
				<div align="center">
					<button onclick="complete();">수정완료</button>
				</div>
				<script>
					function complete(){
						$("#updateForm").attr("action","<%=request.getContextPath() %>/csUpdate.cs");

					}
				
				</script>
			</form>
			
	<%@ include file="../common/footer.jsp" %>
</body>
</html>