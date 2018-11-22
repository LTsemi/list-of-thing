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
* {
	box-sizing: border-box;
	font-family: NanumSquareRoundR !important;
}

td{
	padding: 3px 3px;
	text-align: center;
	border-bottom: 1px solid lightgray;
	border-left: 1px solid lightgray;
}

table{
	border: 1px solid lightgray;
	border-radius: 4px;
	border-collapse: collapse;
}

	
	#out {
		width:1400px;
		height:auto;

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
	<br />
	<br />
	<h1 id="ttitle" style="font-family: Gugi;" align="center">회원목록</h1>
	
	<div id="out">
	<br />
	<br />
		<div style="margin: 100px auto;  width: 1200px;">
		<div style=" margin: 0 auto; width: 1200px;">
		</div>
		<table style="margin: 0 auto; width: 1200px; font-size: 11px;" id="mtable" >
			<thead style="font-weight: 600">
				<tr>
					<td width="50px" style="text-align: center">
						<input type="button" id="delbtn" value="삭제" disabled="disabled" onclick="Mconfirm();">
					</td>
					<td>아이디</td>
					<td>이름</td>
					<td>성별</td>
					<td>생일</td>
					<td>이메일</td>
					<td>연락처</td>
					<td>주소</td>
					<td>가입일</td>
			
				</tr>
			</thead>
			<tbody >
					<% for(Member m : list){ %>
			<tr>
			<% if(m.getUserId().equals("admin")) {%>
				<td></td>
				<% } else{ %>
				<td><input type="checkbox" name="chk<%= i %>"/></td>
				<% } %>
				<td><%= m.getUserId() %></td>
				<td><%= m.getUserName() %></td>
				<td><%= m.getGender() %></td>
				<td><%= m.getBirth() %></td>
				<td><%= m.getEmail() %></td>
				<td><%= m.getPhone() %></td>
				<td><%= m.getAddress() %></td>
				<td><%= m.getEnrollDate() %></td>
				
			
				
			</tr>
			
				<% i++;
			} %>
			</tbody>
		</table>
	</div>
<%-- 		<table>
		<tr>
			<th><input type="button" id="delbtn" value="삭제" disabled="disabled" onclick="Mconfirm();"></th>
			<th style="width : 50px;">아이디 </th>
			<th style="width : 50px;">이름 </th>
			<th style="width : 40px;">성별 </th>
			<th style="width : 100px;">생일</th>
			<th>이메일 </th>
			<th>연락처</th>
			<th>주소 </th>
			<th>가입일 </th>
			

		</tr>
		<% for(Member m : list){ %>
			<tr>
			<% if(m.getUserId().equals("admin")) {%>
				<td></td>
				<% } else{ %>
				<td><input type="checkbox" name="chk<%= i %>"/></td>
				<% } %>
				<td><%= m.getUserId() %></td>
				<td><%= m.getUserName() %></td>
				<td><%= m.getGender() %></td>
				<td><%= m.getBirth() %></td>
				<td><%= m.getEmail() %></td>
				<td><%= m.getPhone() %></td>
				<td><%= m.getAddress() %></td>
				<td><%= m.getEnrollDate() %></td>
				
			
				
			</tr>
			
				<% i++;
			} %>
	
		</table> --%>
<br />
<br />

</div>
	<script>
	
	$('#mtable tbody').children().mouseenter(function () {
		$(this).children().not(':first').css({'background':'#F7D58B', 'cursor':'pointer'});
		$(this).children().not(':first').click(function () {
		});
			
	}).mouseleave(function () {
		$(this).children().not(':first').css({'background':'white'});
	});
	

	
		function Mconfirm(){
			var val = confirm("정말로 회원을 삭제하시겠습니까? ");
			if(val == true){
				var thisid = $(this).attr('id');
				console.log($('#userid'+thisid).val());
	
				deleteItem();
			}
			
		} 
		
		function deleteItem() {

			$('input[name^=chk]:checked').each(function() {
				var userId = $(this).parent().next().text();
				console.log("userid : " + userId)
				$.ajax({
					url : '/semi/mAdmindelete.me',
					type : 'get',
					data : {
						userId : userId
					},
					success : function (result) {
						
						console.log(result);
						alert("회원이 삭제되었습니다.");
						
					}, error : function (result) {
						console.log("회원삭제 실패!");
						alert("회원 삭제 실패.");
					}
				}); 
				
				$(this).parent().parent().remove();
				
			});
		}
		

	</script>
</body>
</html>