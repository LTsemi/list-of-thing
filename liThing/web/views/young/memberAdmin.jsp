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
		background : #ffff;
		width:900px;
		margin-left:50px;
		
	}
	
	#out {
		width:1000px;
		height:auto;

		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
		background : #FFEEC2;
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
		<table>
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
	
		</table>
<br />
<br />

</div>
	<script>
	
	$('input[name^=chk]').click(function() {
		if($('input[name^=chk]').is(':checked')==true){
			buttonOn();
		}else{
			buttonOff();
		}
	});
	
	function buttonOn() {
		$('#delbtn').attr("disabled", false);
	}
	function buttonOff() {
		$('#delbtn').attr("disabled", true);
	} 
	
	
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
						
					}, error : function (result) {
						console.log("회원삭제 실패!");
					}
				}); 
				
				$(this).parent().parent().remove();
				
			});
		}
	</script>
</body>
</html>