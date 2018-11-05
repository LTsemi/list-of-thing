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

	<%@ include file="../common/header.jsp" %>

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
                                    <input type="text" placeholder="이메일주소" maxlength="30" id="email1" name="email1">
                                </span>
                                <span class="select-wrap"> &nbsp;&nbsp;&nbsp;&nbsp;
                                        <span> <!-- class="selectbox" -->
                                            <select data-size="10" maxlength="30" id="emailDomain">
                                                <option value="-1">선택</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="naver.com">naver.com</option>
                                                <option value="nate.com">nate.com</option>
                                                <option value="chol.com">chol.com</option>
                                                <option value="dreamwiz.com">dreamwiz.com</option>
                                                <option value="empal.com">empal.com</option>
                                                <option value="hananet.net">hananet.net</option>
                                                <option value="hanmail.net">hanmail.net</option>
                                                <option value="hotmail.com">hotmail.com</option>
                                                <option value="korea.com">korea.com</option>
                                                <option value="lycos.co.kr">lycos.co.kr</option>
                                                <option value="netian.com">netian.com</option>
                                                <option value="netsgo.com">netsgo.com</option>
                                                <option value="yahoo.co.kr">yahoo.co.kr</option>
                                                <option value="yahoo.com">yahoo.com</option>
                                                <option value="직접입력">직접입력</option>
                                            </select>
                                        </span>
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
                                    <span class="select-wrap">&nbsp;&nbsp;
                                        <span> <!-- class="selectbox" -->
                                            <select id="selectTel" data-scroll="false">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                            </select>
                                        </span>
                                    </span>
                                <span class="input">
                                    <input type="text" placeholder="휴대폰 번호" maxlength="8" id="tel2">
                                </span>
                                <div class="tooltip blind" id="telTooltip"></div>
                            </div>
                            <span class="checkbox">
                                <input type="checkbox" id="checkbox2" checked="checked" />
                                <label for="checkbox2">SMS 수신 동의</label>
                            </span>
                        </div>
                        <div class="row birth">
                            <div class="col tooltip-wrap">
                                    <span class="select-wrap"> &nbsp;&nbsp;
                                        <span align=center> <!-- class="selectbox" -->
                                            <select id="selectYear" data-size="10">
                                                <option value="-1">출생연도</option>
                                            </select>
                                        </span>
                                    </span>
                                <span class="select-wrap">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span> <!-- class="selectbox" -->
                                            <select id="selectMonth" data-size="10">
                                                <option value="-1">월</option>
                                                <option value="01">01</option>
                                                <option value="02">02</option>
                                                <option value="03">03</option>
                                                <option value="04">04</option>
                                                <option value="05">05</option>
                                                <option value="06">06</option>
                                                <option value="07">07</option>
                                                <option value="08">08</option>
                                                <option value="09">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                            </select>
                                        </span>
                                    </span>
                                <span class="select-wrap">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span> <!-- class="selectbox" -->
                                            <select id="selectDay" data-size="10">
                                                <option value="-1">일</option>
                                                <option value="01">01</option>
                                                <option value="02">02</option>
                                                <option value="03">03</option>
                                                <option value="04">04</option>
                                                <option value="05">05</option>
                                                <option value="06">06</option>
                                                <option value="07">07</option>
                                                <option value="08">08</option>
                                                <option value="09">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                                <option value="21">21</option>
                                                <option value="22">22</option>
                                                <option value="23">23</option>
                                                <option value="24">24</option>
                                                <option value="25">25</option>
                                                <option value="26">26</option>
                                                <option value="27">27</option>
                                                <option value="28">28</option>
                                                <option value="29">29</option>
                                                <option value="30">30</option>
                                                <option value="31">31</option>
                                            </select>
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

</body>
</html>