<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.buyme.young.member.model.vo.Member"%>
<%
	Member m = (Member)session.getAttribute("member");
%>
<%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	return random;
} %>
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
				<%if ( m == null) { %>
				<h2 class="title">PW 찾기</h2>
				<form id="PWForm" action="<%= request.getContextPath() %>/eSend.mp" method="post">
				<div class="login">
					
					<div class="forms">
						<div class="input">
							<input type="text" name="id" id="id" placeholder="아이디를 입력해 주세요."/>
						</div>
						<div class="input">
							<input type="text" name="email" id="email" placeholder="가입시 사용했던 이메일을 입력해주세요"/>
							<input type="hidden" name="code_check" id="code_check" value="<%= getRandom()%>"/>
						</div>
					</div>
					<div class="btns tooltip-wrap">
						<button type="button" class="btn-confirm" id="loginBtn" onclick='myPW();'>인증번호 발송 </button>
						<div class="tooltip blind" id="idpwInvalidTooltip"></div>
					</div>
					</div>
					</form>
						
				</div>
			</div>
			<% } %>
			

		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>
	
 	<script>
		function myPW(){

				var val = confirm("인증코드를 발송하면 기존의 비밀번호는 사용하실 수 없습니다. 인증번호를 보내겠습니까? ");
				if(val == true){
					$('#PWForm').submit();
					alert("1회 로그인 가능한 페이지로 이동합니다. 다음 페이지에서 로그인 하지 않을시 새로 인증코드를 받아야합니다. 페이지 로딩까지 기다려주세요. 발송된 인증번호로 로그인 후 비밀번호를 꼭 변경해주세요.");
				}
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