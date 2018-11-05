<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리띵 로그인</title>
        <link rel="stylesheet" href="../../resources/css/login.css">
       
		<script src="/semi/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.js"></script>
		<script src="/semi/resources/js/login.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
<div class="container" >
    <div class="row" >
        <div class="col-md-12" >
            <div class="well login-box" style="background : white; opacity : 1;" >
                <form id="loginForm" action="/myWeb/login.me" method="post" >
                    <legend>로그인</legend>
                    <div class="form-group">
                        <label for="username-email"> ID </label>
                        <input value='' id="userID" placeholder="ID" type="text" class="form-control" name="userID" />
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" value='' placeholder="Password" type="text" class="form-control" name="password"/>
                    </div>
                    <div class="form-group text-center">
                        <button class="btn btn-danger btn-cancel-action"  onclick="memberJoin();">회원 가입</button>
                        <button class="btn btn-success btn-login-submit" onclick='login();'  >로그인 </button>
                    </div>
                </form>
            </div>
            <br /><br />
            
          <div class="logged-in well">
            <h1>환영합니다! <div class="pull-right"><button class="btn-logout btn btn-danger"><span class="glyphicon glyphicon-off"></span> Logout</button></div></h1>
          </div>
        </div>
    </div>
</div>
<script>
		function login(){
			$('#loginForm').submit();
		}
		
		function logout(){
			location.href="/myWeb/logout.me";
		}
		
		function memberJoin(){
			location.href="/myWeb/views/member/memberJoinForm.jsp";
		}
		
		function changeInfo(){
			location.href="/myWeb/views/member/memberUpdateForm.jsp";
		}
	</script>

<%@ include file="../common/footer.jsp" %>
</body>
</html>