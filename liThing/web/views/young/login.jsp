<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리띵 로그인</title>
        <link rel="stylesheet" href="../../resources/css/login.css">
        
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="/semi/resources/js/login.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
<div class="container" >
    <div class="row" >
        <div class="col-md-12" >
            <div class="well login-box" >
                <form action="" >
                    <legend>로그인</legend>
                    <div class="form-group">
                        <label for="username-email"> ID </label>
                        <input value='' id="userID" placeholder="ID" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" value='' placeholder="Password" type="text" class="form-control" />
                    </div>
                    <div class="form-group text-center">
                        <button class="btn btn-danger btn-cancel-action">Cancel</button>
                        <input type="submit" class="btn btn-success btn-login-submit" value="Login" />
                    </div>
                </form>
            </div>
          <div class="logged-in well">
            <h1>환영합니다! <div class="pull-right"><button class="btn-logout btn btn-danger"><span class="glyphicon glyphicon-off"></span> Logout</button></div></h1>
          </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>