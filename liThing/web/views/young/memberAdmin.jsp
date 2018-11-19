<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.buyme.young.member.model.vo.*"%>
    <%
    	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
    
    	int i = 1;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">

<link href="https://fonts.googleapis.com/css?family=Gugi|Itim"
	rel="stylesheet">


<style>
	table, th, td {
		border:1px solid black;
		text-align:center;
	}
	
	#out {
		width:800px;
		height:500px;

		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
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
	<%@ include file="../common/header.jsp" %>
	<div class="page-heading">
		<div class="container">
			<div class="heading-content">
				<h1>
					list of<em>thing ;)</em>
				</h1>
			</div>
		</div>
	</div>
	
	<div id="out">
		<table>
		<tr>
			<th>순번</th>
			<th style="width : 50px;">아이디 </th>
			<th style="width : 50px;">이름 </th>
			<th style="width : 40px;">성별 </th>
			<th style="width : 100px;">생일</th>
			<th>이메일 </th>
			<th>연락처</th>
			<th>주소 </th>
			<th>가입일 </th>
			<th  style="width : 70px;">삭제</th>
			
		</tr>
		<% for(Member m : list){ %>
			<tr>
			<% if(m.getUserId().equals("admin")) {%>
				<td><%= 0 %></td>
				<% } else{ %>
				<td><%= i %></td>
				<% } %>
				<td id="userid<%= i %>"><%= m.getUserId() %></td>
				<td><%= m.getUserName() %></td>
				<td><%= m.getGender() %></td>
				<td><%= m.getBirth() %></td>
				<td><%= m.getEmail() %></td>
				<td><%= m.getPhone() %></td>
				<td><%= m.getAddress() %></td>
				<td><%= m.getEnrollDate() %></td>
				
				<td><%  if(!m.getUserId().equals("admin")) { %> <button  id ="<%= i %>" onclick="Mconfirm();">삭제하기</button> <% } %></td>
			</tr>
			
			<% i++;
			} %>
	
		</table>


	<script>
		function Mconfirm(){
			var val = confirm("정말로 회원을 삭제하시겠습니까? ");
			if(val == true){
				var thisid = $(this).attr('id');
				console.log(thisid);
				console.log($('#userid'+thisid).val());

				<%-- location.href='<%= request.getContextPath() %>/mAdmindelete.me?userid='+ ; --%>
			}
			
		}
	</script>
</body>
</html>