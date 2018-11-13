<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리띵 회원 정보 수정</title>

        <link rel="stylesheet" href="../../resources/css/coocha-member.min.css">
        <link rel="stylesheet" href="../../resources/css/sub.css">
        <script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
        <script src="../../resources/js/coomember.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        
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
	<form id="updateForm" action="<%=request.getContextPath()%>/mUpdate.me" method="post">
	<div class="member-container join-container"><div class="w"> 
    <div class="img"></div>
    <div class="bg" style="opacity : 0.3;" ></div>
    <div class="member-wrap">
        <div class="member-inner">
            <div class="contents">
                <h1 class="logo"><a href="/semi/index.jsp"><span class="blind">리띵</span></a></h1>
                <h2 class="title" >정보 수정</h2>
                <div class="join">
                    <div class="forms">
                        <div class="row id">
                            <div class="input-wrap">
                                <div class="input tooltip-wrap">
                                    <span class="input" ><input type="text" id="userId" name="userId" value="<%= mh.getUserId() %>" style="font-size:2em;" readonly >
                                    </span>
                                    
                                    <div class="tooltip blind" id="idTooltip"></div>
                                </div>
                            </div>
                            <div class="input tooltip-wrap">
                                <input type="password" placeholder="비밀번호" maxlength="15" id="userPwd" name="userPwd">
                                <div class="tooltip blind" id="pwdTooltip"></div>
                            </div>
                            <span class="input">
                                <input type="password" placeholder="비밀번호 재확인" maxlength="15" id="userPwd2" name="userPwd2">
                            </span>
                            <span class="input">
                                <input type="text" placeholder="이름" id="userName" name="userName" value="<%= mh.getUserName() %>">
                            </span>
                        </div>
                        <div class="row domain">
                            <div class="col tooltip-wrap">
                                <span class="input">
<!--                                 <input type="email" name="email" id="email" /> -->
                                    <input type="email" placeholder="이메일주소" maxlength="30" id="email" name="email" style="border : none" value="<%= mh.getEmail() %>">
                                </span>

                                    <div class="tooltip blind" id="mailTooltip"></div>

                            </div>
                            <span class="checkbox">
                                    	<input type="radio" name="gender" value="M">&nbsp;남 &nbsp;&nbsp;&nbsp;
										<input type="radio" name="gender" value="F">&nbsp;여 &nbsp;
                                </span>
                        </div>
                        <div class="row tel">
                            <div class="col tooltip-wrap">
                            	<input style="margin-left : 25px; margin-top:15px;" type="text" placeholder="ex) 010" maxlength="3" name="tel1" size="2" value="<%= mh.getPhone().substring(0, 3) %>"/>
								
                                <span class="input">
                                    <input type="text" placeholder="휴대폰 뒷 번호 8자리" maxlength="8" id="tel2" name="tel2" value="<%= mh.getPhone().substring(3) %>" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"  style="IME-MODE : disabled;">
                                </span>
                                <div class="tooltip blind" id="telTooltip"></div>
                            </div>
                            
                            <span class="checkbox">
                                <input type="checkbox" id="checkbox2" checked="checked" />
                                <label for="checkbox2">정확한 휴대폰 번호를 입력해주세요.</label>
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
                                    <input style="margin-left : 25px; margin-bottom: 15px;" type="text" name="birthyear" id="birthyear" value="<%= mh.getBirth().getYear() %>년" style="font-size: 1em;"  readonly />
                                    </span>
                                <span class="select-wrap">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span> <!-- class="selectbox" -->
                                        	<input style="margin-left : 25px; margin-bottom: 15px;" type="text" name="birthmon" id="birthmon"  value="<%= mh.getBirth().getMonth()+1 %>월" style="font-size: 1em;" readonly />
											
                                        </span>
                                    </span>
                                <span class="select-wrap">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span> <!-- class="selectbox" -->
                                        <input style="margin-left : 25px; margin-bottom: 15px;" type="text" name="birthdate" id="birthdate"  value="<%= mh.getBirth().getDate() %>일" style="font-size: 1em;" readonly />
                                        </span>
                                    </span>
                                <div class="tooltip blind" id="birthTooltip"></div>
                            </div>
                            <span class="info-txt">생일은 변경 할 수 없습니다.</span>
                        </div>

                        </div>
                    </div>

                    <div class="btns">
                        <button type="button" class="btn-confirm" id="updateBtn" onclick="updateMember();">회원 정보 수정</button>
                        <br /><br />
                        
                         <button type="button"  id="deleteBtn" onclick="deleteMember();">회원 탈퇴</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div></div>
</form>


			<script>
				$(function(){
					$('input:radio').each(function(){
						if( $(this).val() == '<%=mh.getGender()%>')
						  $(this).prop('checked', true);
						else 
						  $(this).prop('checked', false);
					});
					
					
					var addressArr = '<%= mh.getAddress() %>'.split(', ');
					
					$('#zipCode').val(addressArr[0]);
					$('#address1').val(addressArr[1]);
					$('#address2').val(addressArr[2]);
					
				});
				
				function updateMember() {
					$("#updateForm").submit();
				}
				
				function deleteMember() {
					location.href = "/semi/mDelete.me?mid=<%=mh.getUserId()%>";
				}
				
				// 참조 API : http://postcode.map.daum.net/guide
				function addrSearch() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var fullAddr = ''; // 최종 주소 변수
			                var extraAddr = ''; // 조합형 주소 변수

			                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    fullAddr = data.roadAddress;

			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    fullAddr = data.jibunAddress;
			                }

			                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			                if(data.userSelectedType === 'R'){
			                    //법정동명이 있을 경우 추가한다.
			                    if(data.bname !== ''){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있을 경우 추가한다.
			                    if(data.buildingName !== ''){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			                }

			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
			                
			                $('#address1').val(fullAddr);

			                // 커서를 상세주소 필드로 이동한다.
			                $('#address2').focus();
			            }
			        }).open();
			    };
				
				function goMain(){
					location.href='/myWeb/index.jsp';
				};
				
			</script>
</body>
</html>