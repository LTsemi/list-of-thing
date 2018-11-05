<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리띵 회원가입</title>

        <link rel="stylesheet" href="../../resources/css/coocha-member.min.css">
        <link rel="stylesheet" href="../../resources/css/sub.css">
        <script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
        <script src="../../resources/js/coomember.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<form action="">
	<div class="member-container join-container"><div class="w"> 
    <div class="img"></div>
    <div class="bg" style="opacity : 0.3; "></div>
    <div class="member-wrap">
        <div class="member-inner">
            <div class="contents">
                <h1 class="logo"><a href="/semi/index.jsp"><span class="blind">리띵</span></a></h1>
                <h2 class="title" >JOIN</h2>
                <div class="join">
                    <div class="forms">
                        <div class="row id">
                            <div class="input-wrap">
                                <div class="input tooltip-wrap">
                                    <span class="input"><input type="text" placeholder="아이디" maxlength="15" id="mid" name="mid"></span>
                                    <button type="button" class="double-check">중복확인</button>
                                    <div class="tooltip blind" id="idTooltip"></div>
                                </div>
                            </div>
                            <div class="input tooltip-wrap">
                                <input type="password" placeholder="비밀번호" maxlength="15" id="mpwd" name="mpwd">
                                <div class="tooltip blind" id="pwdTooltip"></div>
                            </div>
                            <span class="input">
                                <input type="password" placeholder="비밀번호 재확인" maxlength="15" id="mpwd2" name="mpwd2">
                            </span>
                        </div>
                        <div class="row domain">
                            <div class="col tooltip-wrap">
                                <span class="input">
<!--                                 <input type="email" name="email" id="email" /> -->
                                    <input type="email" placeholder="이메일주소" maxlength="30" id="email1" name="email1" style="border : none">
                                </span>

                                    <div class="tooltip blind" id="mailTooltip"></div>

                            </div>
                            <span class="checkbox">
                                    <input type="checkbox" id="checkbox1" checked="checked"/>
                                    <label for="checkbox1">이메일 수신 동의</label>
                                </span>
                        </div>
                        <div class="row tel">
                            <div class="col tooltip-wrap">
                            	<input style="margin-left : 25px; margin-top:15px;" type="text" placeholder="ex) 010" maxlength="3" name="tel1" size="2"/>

                                <span class="input">
                                    <input type="text" placeholder="휴대폰 뒷 번호 8자리" maxlength="8" id="tel2">
                                </span>
                                <div class="tooltip blind" id="telTooltip"></div>
                            </div>
                            <span class="checkbox">
                                <input type="checkbox" id="checkbox2" checked="checked" />
                                <label for="checkbox2">SMS 수신 동의</label>
                            </span>
                        </div>
                        <div class="row id">
                            <div class="input-wrap">
                                <div class="input tooltip-wrap">
                                    <span class="input"><input type="text" id="zipCode" name="zipCode" placeholder="우편번호"></span>
                                    <button type="button" class="double-check" id="ckZip" onclick="addrSearch();">검색</button>
                                    <div class="tooltip blind" id="idTooltip"></div>
                                </div>
                            </div>
                            <div class="input tooltip-wrap">
                                 <input type="text" id="address1" name="address1"  placeholder="주소">
                                   
                                <div class="tooltip blind" id="pwdTooltip"></div>
                            </div>
                            <span class="input">
                               <input type="text" id="address2" name="address2" placeholder="상세주소">
                            </span>
                        </div>
                        <div class="row birth">
                            <div class="col tooltip-wrap">
                                    <span class="select-wrap"> &nbsp;&nbsp;
                                    <input style="margin-left : 25px; margin-bottom: 15px;" type="text" name="birthyear" id="birthyear" placeholder="출생 년도"/>
     <!--                                    <span align=center> class="selectbox"
                                        </span> -->
                                    </span>
                                <span class="select-wrap">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span> <!-- class="selectbox" -->
                                        	<input style="margin-left : 25px; margin-bottom: 15px;" type="text" name="birthmon" id="birthmon" placeholder="월"/>

                                        </span>
                                    </span>
                                <span class="select-wrap">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span> <!-- class="selectbox" -->
                                        <input style="margin-left : 25px; margin-bottom: 15px;" type="text" name="birthdate" id="birthdate" placeholder="일"/>

                                        </span>
                                    </span>
                                <div class="tooltip blind" id="birthTooltip"></div>
                            </div>
                            <span class="info-txt">정확한 생년월일을 입력해주세요.</span>
                        </div>

                        </div>
                    </div>

                    <div class="btns">
                        <button type="button" class="btn-confirm">회원가입</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div></div>
</form>
</body>
</html>