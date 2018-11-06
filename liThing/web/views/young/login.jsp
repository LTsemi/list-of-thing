<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.buyme.young.member.model.vo.Member"%>
<%
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

        <link rel="stylesheet" href="../../resources/css/coocha-member.min.css">
        <link rel="stylesheet" href="../../resources/css/sub.css">
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
				<h2 class="title">LOGIN</h2>
				<form id="loginForm" action="/semi/login.me" method="post">
				<div class="login">
					<%if ( m == null ) { %>
					<div class="forms">
						<div class="input">
							<input type="text" placeholder="아이디" id="userId" name="userId">
						</div>
						<div class="input">
							<input type="password" placeholder="비밀번호" id="userPwd" name="userPwd">
						</div>
					</div>
					<div class="btns tooltip-wrap">
						<button type="button" class="btn-confirm" id="loginBtn" onclick='login()'>로그인</button>
						<div class="tooltip blind" id="idpwInvalidTooltip"></div>
					</div>

					<div class="bottom">
						<a href="/member/findInfoForm.do?type=ID" >아이디 찾기</a>
						<a href="/member/findInfoForm.do?type=PWD">비밀번호 찾기</a>
						<a href="/semi/views/young/join.jsp" id="memberJoinBtn" onclick="memberJoin()">회원가입</a>
					</div>
					</div>
					</form>
						
				</div>
			</div>
			<% } else { %>
			<div id="userInfo" style="width : 500px;">
			<h3 class="title"><%= m.getUserName() %>님의 <br /> 방문을 환영합니다.</h3>
			<div class="btns" align="right">
				<div id="changeInfo" onclick="changeInfo()" class="btn btn-warning" >정보수정</div>
				<div id="logoutBtn" onclick='logout()' class="btn btn-warning" >로그아웃</div> 

			</div>
			
		</div>
	<% } %>
	<script>
		function login(){
			$('#loginForm').submit();
		}
		
		function logout(){
			location.href="/semi/logout.me";
		}
		
		function memberJoin(){
			location.href="/semi/views/young/Join.jsp";
		}
		
		function changeInfo(){
			location.href="/semi/views/young/update.jsp";
		}
	</script>
		</div>
	</div>
</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>