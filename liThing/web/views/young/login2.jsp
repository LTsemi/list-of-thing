<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

        <link rel="stylesheet" href="../../resources/css/coocha-member.min.css">
        <link rel="stylesheet" href="../../resources/css/sub.css">
        <script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
        <script src="../../resources/js/coomember.js"></script>
</head>
<body>
<div class="member-container login-container">
	<div class="bg"></div>
	<div class="member-wrap">
		<div class="member-inner">
			<div class="contents">
				<h1 class="logo"><a href="/semi/index.jsp"><span class="blind">리띵</span></a></h1>
				<h2 class="title">LOGIN</h2>
				<div class="login">
					<div class="forms">
						<div class="input">
							<input type="text" placeholder="아이디" id="uid" name="mid">
						</div>
						<div class="input">
							<input type="password" placeholder="비밀번호" id="upw" name="mpwd">
						</div>
					</div>
					<div class="btns tooltip-wrap">
						<button type="button" class="btn-confirm" id="loginBtn">로그인</button>
						<div class="tooltip blind" id="idpwInvalidTooltip"></div>
					</div>
					<div class="easy-start">
						<div class="ttl">간편하게 시작하기</div>
						<div class="btns">
							<button type="button" class="btn-n" onclick="javascript:clickSNS('NV');"><span class="blind">네이버 계정으로 로그인</span></button>
							<button type="button" class="btn-k" onclick="javascript:clickSNS('CT');"><span class="blind">카카오 계정으로 로그인</span></button>
							<button type="button" class="btn-f" onclick="javascript:clickSNS('FB');"><span class="blind">페이스북 계정으로 로그인</span></button>
						</div>
					</div>
					<div class="bottom">
						<a href="/member/findInfoForm.do?type=ID" >아이디 찾기</a>
						<a href="/member/findInfoForm.do?type=PWD">비밀번호 찾기</a>
						<a href="javascript:;" id="btnJoinMember">회원가입</a>
					</div>
				</div>
			</div>
			<div id="naver_id_login" style="display:none;"></div>
			<div id="kakao_id_login" style="display:none;"></div>
		</div>
	</div>
</div>
</body>
</html>