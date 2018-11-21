<%@page import="com.buyme.ju.customerService.model.vo.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("member");
	CustomerService c = (CustomerService)request.getAttribute("customerService");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>고객센터 QnA 추가</title>
        <script src="<%=request.getContextPath() %>/resources/js/vendor/jquery-3.3.1.min.js"></script>

        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/CustomerService.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-style.css">
        
        <style>
    	@font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('<%=request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf');
        }
        body, p { box-sizing: border-box;
            font-family: NanumSquareRoundR !important; 
        }
   </style>

    </head>
    <body>
        <%@ include file="../common/header.jsp" %>
        <% if(m != null && m.getUserId().equals("admin")){ %>
        
        <div class="page-heading">
	        <div class="container">
	            <div class="heading-content">
	                <h1>List of Thing</h1>
	            </div>
	        </div>
        </div>

        <h1 style="margin-top: 30px;">고객센터 QnA 추가</h1>

        <div align="center" id="insertForm">
        <form action="<%= request.getContextPath() %>/csInsert.cs" method="post">
				<table>
					<tr>
						<td>제목 </td>
						<td colspan="3"><input type="text" size="50" name="ctitle"></td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td>
							<input type="text" value="<%= m.getUserName() %>" name="name" readonly>
							<input type="hidden" value="<%= m.getUserId() %>" name="userId">
						</td>
						<td>작성일</td>
						<td><input type="date" name="cdate"></td>
					</tr>
					<tr>
						<td>내용 </td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="ccontent" id="ccontent" cols="60" rows="15" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="submit" onclick="test()">등록하기</button>
					<button onclick="location.href='selectList.cs'">취소하기</button>
                </div>		
            </form>
        </div>

		<% } else {
			request.setAttribute("msg", "관계자 외에 접근이 불가능한 페이지입니다.");
			request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
		 } %>
		 
		 <script>
			$(function(){
				
				var str = $('#ccontent').val();
			
				str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			
				$('#ccontent').val(str);
				
				
				var str = $('#ccontent').val();
			
				str = str.split('<br/>').join("\r\n");
			
				$('#ccontent').val(str); 
				
			});	 	
			
			
			function test(){
				alert($('#ccontent').val());
			}
			
		</script>
		 
        <%@ include file="../common/footer.jsp" %>
    </body>
</html>
      