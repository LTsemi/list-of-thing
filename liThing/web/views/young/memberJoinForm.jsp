<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

		<div  style="border : 4px solid #FFA41F; width:500px; margin : 200px auto; " >
		<h3 style="margin : 20px;">회원 가입</h3>
		<form id="joinForm" action="<%=request.getContextPath()%>/mInsert.me" method="post">
			
			<table align="center" style="margin-left : 50px; margin-top : 10px;">
				<tr>
					<td width="200px">* 아이디 </td>
					<td><input type="text" name="userId" id="userId" required="required"></td>
					<td width="200px"><div id="idCheck">중복확인</div></td>
				</tr>
				<br />
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" id="userPwd" name="userPwd" required="required"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 비밀번호확인</td>
					<td><input type="password" id="userPwd2" name="userPwd2"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" maxlength="5" name="userName" required="required"></td>
					<td></td>
				</tr>
				<tr>
					<td> 성별 </td>
					<td>
						<input type="radio" name="gender" value="M">남성 &nbsp;
						<input type="radio" name="gender" value="F">여성 &nbsp;
					</td>
					<td></td>
				</tr>
				<tr>
					<td>나이 </td>
					<td><input type="number" name="age" min="10" max="100" value="10"
					      style="width:140px;">&nbsp;세
					</td>
					<td></td>
				</tr>
				<tr>
					<td>연락처 </td>
					<td>
						<input type="text" maxlength="3" name="tel1" size="2">-
						<input type="text" maxlength="4" name="tel2" size="2">-
						<input type="text" maxlength="4" name="tel3" size="2">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>이메일 </td>
					<td><input type="email" name="email"></td>
					<td></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="zipCode" name="zipCode"></td>
					<td><div id="ckZip" onclick="addrSearch();">검색</div></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="address1" name="address1"></td>
					<td></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" id="address2" name="address2"></td>
					<td></td>
				</tr>
			</table>
			<br>
			<div class="btns" align="center">
				<button id="goMain" onclick="goMain();">메인으로</button>
				<button id="joinBtn" onclick="insertMember();">가입하기</button>
				<br />
			</div>
			<br />
			</form>
	</div>
		<%@ include file="../common/footer.jsp" %>
</body>
</html>