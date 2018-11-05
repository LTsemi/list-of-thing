<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div id="modal" class="modal">
      <!-- Modal Content -->
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="header-title">로그인</h3>
          <div class="close-btn"><img src="resources/img/close_contact.png" alt=""></div>    
        </div>
        <!-- Modal Body -->
        <div class="modal-body">
          <div class="col-md-6 col-md-offset-3">
            <form id="contact" action="" method="post">
                <div class="row">
                    <div class="col-md-12">
                    <fieldset>
                        <h3 style="color : white; text-align : left; padding-left : 150px;"> ID </h3> <input name="userId" type="text" class="form-control" id="name" placeholder="아이디" required="">
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                      <h3 style="color : white; text-align : left; padding-left : 150px; "> PWD </h3>  <input type="password" name="userPwd" class="form-control" id="name" placeholder="비밀번호 " required=""/> <br>
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <button type="submit" id="form-submit"  onclick='login()'>login</button> &nbsp;&nbsp;
                        <button id="memberJoinBtn" onclick="memberJoin()">회원가입</button>
                      </fieldset>
                    </div>
                </div>
            </form>

          </div>
        </div>
      </div>
    </div>
    
    <script>
   	 	function memberJoin(){
			location.href="views/young/memberJoinForm.jsp";
		}
    </script>
</body>
</html>