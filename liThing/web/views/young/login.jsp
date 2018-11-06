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

					<div class="bottom">
						<a href="/member/findInfoForm.do?type=ID" >아이디 찾기</a>
						<a href="/member/findInfoForm.do?type=PWD">비밀번호 찾기</a>
						<a href="/semi/views/young/join.jsp" id="btnJoinMember">회원가입</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>