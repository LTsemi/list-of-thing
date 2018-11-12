<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.buyme.young.member.model.vo.Member"%>
<%
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리띵 아이디 찾기</title>

        <link rel="stylesheet" href="../../resources/css/coocha-member.min.css">
        <link rel="stylesheet" href="../../resources/css/sub.css">
        <link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
        <script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
        <script src="../../resources/js/coomember.js"></script>
        
        <style>
    @font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
        }
        body { box-sizing: border-box;
            font-family: NanumSquareRoundR !important; 
        }
   </style>
   

</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="member-container login-container">
	    <div class="img"></div>
    <div class="bg" style="opacity : 0.3; "></div>
	<div class="member-wrap">
		<div class="member-inner">
			<div class="contents">
				<h1 class="logo"><a href="/semi/index.jsp"><span class="blind">리띵</span></a></h1>
				<%if ( m == null ) { %>
				<h2 class="title">ID 찾기</h2>
				<form id="IDForm" action="<%= request.getContextPath() %>/mIDCheck.me" method="post">
				<div class="login">
					
					<div class="forms">
						<div class="input">
							<input type="text" placeholder="이름" id="name" name="name">
						</div>
						<div class="input">
							<input type="text" name="email" id="email" placeholder="가입시 사용했던 이메일을 입력해주세요"/>
						</div>
					</div>
					<div class="btns tooltip-wrap">
						<button type="button" class="btn-confirm" id="loginBtn" onclick='myId()'>ID 찾기</button>
						<div class="tooltip blind" id="idpwInvalidTooltip"></div>
					</div>
					</div>
					</form>
						
				</div>
			</div>
			<% } else { %>
			<br /><br /><br /><br /><br /><br /><br />
			<div id="userInfo" style="width : 500px;">
			<h3 class="title"><%= m.getUserName() %>님의 <br /> 방문을 환영합니다.</h3>
			<div class="btns" align="right">
				<div id="changeInfo" onclick="changeInfo()" class="btn btn-warning" >정보수정</div>
				<div id="logoutBtn" onclick='logout()' class="btn btn-warning" >로그아웃</div> 

			</div>
			
		</div>
	<% } %>

		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>
	
	<script>
		function myId(){
			$('#IDForm').submit();
		}
		
		function logout(){
			location.href="/semi/logout.me";
		}
		
		function changeInfo(){
			location.href="/semi/views/young/update.jsp";
		}
		
		$("#userId").keyup(function(e){if(e.keyCode == 13)  login(); })
		$("#userPwd").keyup(function(e){if(e.keyCode == 13)  login(); })

	</script>
</body>
</html>