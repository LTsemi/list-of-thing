window.JoinMember = function(type){
	this.init(type);
}
JoinMember.prototype = {
		
	isIdConfirm : false,
	rUrl : "",
	msg_id_invaid : "5~15자 이내의 영문자 및 숫자 조합으로 입력해주세요.",
	msg_id_use : "이미 사용중인 아이디입니다.",
	msg_id_empty : "아이디를 입력해주세요.",
	msg_id_ok : "사용 가능한 아이디입니다.",
	msg_id_check : "아이디 중복확인을 해주세요.",
	
	msg_agreement : "이용약관에 동의해주세요.",
	msg_location : "위치정보 이용약관에 동의해주세요.",
	msg_privacy : "쿠차 개인정보 수집 및 이용에 동의해주세요.",
	msg_privacy_rule : "개인정보 취급 위탁 동의를 하지 않으면, 이벤트 혜택 증정 등에 불이익이 있을 수 있습니다. 동의 없이 진행하시겠습니까?",
	
	msg_pass_empty : "비밀번호를 입력해주세요.",
	msg_pass_invalid : "비밀번호 는 8~15자 이내의 영문 대소문자 ,\n숫자 및 특수문자 2가지 이상 조합이어야 합니다.",
	msg_pass_unmatch : "입력하신 비밀번호가 일치하지 않습니다.",
	msg_pass_invalid_birthday : "비밀번호는 고객님의 생년월일 숫자를4자 이상 사용할 수 없습니다.",
	msg_pass_invalid_3charactor : "비밀번호는 동일한 문자/숫자를 3자 이상연속으로 사용할 수 없습니다",
	msg_mail_empty : "이메일 주소를 입력해주세요.",
	msg_mail_invalid : "잘못된 이메일 주소입니다.",
	msg_mail_use : "이미 사용중인 이메일 주소입니다.",
	msg_birth_empty : "생년월일을 입력해주세요.",
	
	msg_tel_empty : "휴대폰 번호를 입력해주세요.",
	msg_tel_use : "이미 사용중인 휴대폰번호 입니다.",
	
	msg_join_confirm : "회원가입을 진행하시겠습니까?",
	msg_join_ok : "회원가입이 완료되었습니다.",
	
	msg_error : "잘못된 정보입니다.",
	msg_14 : "만 14세 미만은 가입하실 수 없습니다.",
	
	init : function(type){
		var _this = this;

		//중복 확인 클릭 이벤트
		$("div.member-wrap button.double-check").on("click",function(e){
			e.preventDefault();
			_this.checkIdUse();
		});
		
		//약관 내용보기
		$("#listsTerms .btn").each(function(){
			$(this).on("click",function(){
				var $target = $($(this).attr("href"));
				var top = $target.offset().top;
				$("html,body").animate({
					scrollTop :top + "px"
				},800);
				return false;
			});
		});
		
		// 이메일 SMS 통합 수신 동의
		$("#mailSmsYn").on('change', function(){
			if($(this).prop("checked")){
				$("#mailYn").attr("checked", true);
				$("#smsYn").attr("checked", true);
			} else {
				$("#mailYn").attr("checked", false);
				$("#smsYn").attr("checked", false);
			}
		});
		
		//약관 체크박스
		$("input#termAgrees").on("change",function(){
			if($("input#termAgrees").prop("checked")){
				$(".agree-wrap input[type=checkbox]").prop("checked",true);
			}else{
				$(".agree-wrap input[type=checkbox]").prop("checked",false);
			}
		});
		$(".agree-wrap input[type=checkbox]").each(function(){
			$(this).on("change",function(){
				if(!$(this).prop("checked")){
					$("input#termAgrees").prop("checked",false);
				}
				if($(".agree-wrap input[type=checkbox]:checked").size()==3){
					$("input#termAgrees").prop("checked",true);
				}
			});
		});
		
		//회원가입 클릭 이벤트
		$("div.btns > button.btn-confirm").on("click",function(e){
			e.preventDefault();
			if(type == 'sns') {
				_this.checkJoinBySNSForm();
			} else {
				_this.checkJoinForm();
			}
		});
		
		$("#mid").on("change",function(){
			_this.isIdConfirm = false;
		});
	},
	
	isAlphaNumetic : function(str){
/*		if( /[^a-zA-Z0-9]/.test( str ) ) {
	       return false;
	    }
	    return true;  */
		var ID = /^[a-zA-Z0-9]{5,15}$/;
		return(ID.test(str));
	},

	isCellPhoneFormat : function(str){
		if(str.length == 7) {
			return /(01[016789])(\d{3})(\d{4})/.test(str);	
		}
		return /(01[016789])(\d{4})(\d{4})/.test(str);
	},
	
	checkIdUse : function(){
		var _this = this;
		var inputId = $("#mid").val();
		if(inputId === ""){
			_this.isIdConfirm = false;
			$("#idTooltip").text(_this.msg_id_empty).removeClass("blind");
			$("#mid").focus();
		}
		else if(inputId.length < 5 || inputId.length > 15 || !_this.isAlphaNumetic(inputId))
		{
			_this.isIdConfirm = false;
            $("#idTooltip").text(_this.msg_id_invaid).removeClass("blind");
			$("#mid").focus();
		}
		else
		{
			// $("#mid").parent().next().hide();
			
			$.ajax({
				url : './idChk.do',
				type : "POST",
				data : {"mid" : inputId},
				dataType : "html",
				error : function() {
					_this.isIdConfirm = false;
					alert(_this.msg_error);
				},
				success : function(strData) {
					var seqs = strData.split(",");
					var idChk = seqs[1];
					var chk = seqs[2];
					if (idChk == 0) {
						_this.isIdConfirm = true;
                        $("#idTooltip").text(_this.msg_id_ok).removeClass("blind");
						//setTimeout(function(){ $("#mid").parent().next().hide(); }, 2000);
					} else {
						_this.isIdConfirm = false;
                        $("#idTooltip").text(_this.msg_id_use).removeClass("blind");
					}
				}
			}); 
		}
	},
	/* SNS 회원 여부 체크 */
	checkSNSIdUse : function(object){
		var joinClass = object.joinClass;
		var snsid = object.snsid;
		
		$.ajax({
			url : './idChk.do',
			type : "POST",
			data : {"joinClass" : joinClass, "snsid" : snsid},
			dataType : "html",
			error : function() {
				_this.isIdConfirm = false;
				alert(_this.msg_error);
			},
			success : function(strData) {
				var seqs = strData.split(",");
				var idChk = seqs[1];
				var chk = seqs[2];
				if (idChk == 0) {
					// TODO: 여기 popup으로 변경
					_this.isIdConfirm = true;
					$("#mid").parent().next().text(_this.msg_id_ok).show().focus();
				} else {
					_this.isIdConfirm = false;
					$("#mid").focus().parent().next().text(_this.msg_id_use).show().focus();
				}
			}
		}); 
	},
	
	checkJoinForm : function(){
		var _this = this;
		$joinForm = $("<form />");
		var coochaYn = $("#joinClass").length == 0;

		/* 쿠차회원 가입시에만 사용됨 */
		if(coochaYn) {
			// 쿠차 joinClass 추가
			$("<input />").attr("name","joinClass").attr("value",'CC').appendTo($joinForm);
			
			//아이디 유효성 체크
			var inId = $("#mid").val();
			if(inId == ""){
                $(".tooltip").addClass("blind");
                $("#idTooltip").text(_this.msg_id_empty).removeClass("blind");
                $("#mid").focus();
				return;
			}
			
			//아이디 중복확인 체크
			if(!_this.isIdConfirm){
                $(".tooltip").addClass("blind");
                $("#idTooltip").text(_this.msg_id_check).removeClass("blind");
                $("#mid").focus();
				return;
			}
			else{
				//$("#mid").parent().next().hide();
				$("<input />").attr("name","mid").attr("value",$("#mid").val()).appendTo($joinForm);
			}
			
			//비밀번호 유효성체크
			var inPass = $("#mpwd").val();
//			var passCheck = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9]){8,15}&/;
			if(inPass == ""){
                $(".tooltip").addClass("blind");
                $("#pwdTooltip").text(_this.msg_pass_empty).removeClass("blind");
				return;
			}
			else if(inPass != "" && inPass.length >=8){
				var isValid = true;
				$.ajax({
					url : _PATH + '/member/checkPasswordPattern.do',
					type : "post",
					async : false,
					data : {"newPassword" : inPass},
					dataType : "html",
					error : function() {
						// alert(_this.msg_error);
					},
					success : function(strData) {
						if(strData.trim() != "valid"){
                            $(".tooltip").addClass("blind");
                            $("#pwdTooltip").text(_this.msg_pass_invalid).removeClass("blind");
							$("#mpwd").focus();
							isValid = false;
							return;
						}
					}
				});
				
				$.ajax({
					url : _PATH + '/member/getCheckMemberDuplicate3Charactor.do',
					type : "post",
					async : false,
					data : {"newPassword" : inPass},
					dataType : "html",
					error : function() {
						// alert(_this.msg_error);
					},
					success : function(strData) {
						if(strData.trim() != "valid"){
                            $(".tooltip").addClass("blind");
                            $("#pwdTooltip").text(_this.msg_pass_invalid_3charactor).removeClass("blind");
							$("#mpwd").focus();
							isValid = false;
							return;
						} 
					}
				});
				
				if(isValid == false) {
					return;
				}else {
					$("<input />").attr("name","mpwd").attr("value",$("#mpwd").val()).appendTo($joinForm);
				}
			}else {
                $(".tooltip").addClass("blind");
                $("#pwdTooltip").text(_this.msg_pass_invalid).removeClass("blind");
				$("#mpwd").focus();
				return;
			}
			
			//비밀번호 재확인 체크
			var passConfirm = $("#mpwd2").val();
			if(inPass != passConfirm){
                $(".tooltip").addClass("blind");
                $("#pwdTooltip").text(_this.msg_pass_unmatch).removeClass("blind");
                $("#mpwd").focus();
				return;
			}
			else{
                $(".tooltip").addClass("blind");
                $("#pwdTooltip").addClass("blind");
			}
			
			
			//이메일 유효성 체크
			var email1 = $("#email1").val();
			var email2 = $("#emailDomain").val();

            if($("#emailDomain").val()=="직접입력"){
                var email =$("#email1").val();
            }else {
                var email = email1+"@"+email2;
            }
			var regex=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var isEmailValid = true;
			if(!regex.test(email)){
                $(".tooltip").addClass("blind");
                $("#mailTooltip").text(_this.msg_mail_invalid).removeClass("blind");
				isEmailValid = false;
                $("#email1").focus();
				return;
			}
			else if(email1 === "" || email2 === ""){
                $(".tooltip").addClass("blind");
                $("#mailTooltip").text(_this.msg_mail_empty).removeClass("blind");
				$("#email1").focus();
				isEmailValid = false;
				return;
			}
			else {
                $(".tooltip").addClass("blind");
                $("#mailTooltip").addClass("blind");
				addInputTag("mail", email, $joinForm);
				isEmailValid = true;
				//이메일 사용여부 체크
				if (_this.checkEmailUse($joinForm.serialize())) {
					isEmailValid = false;
					return;
				}
			}
			
			if(!isEmailValid){
				return;
			}
			//전화 번호 유효성 체크
			var tel1 = $("#selectTel").val();
			var tel2 = $("#tel2").val();
			if(tel2.length == 8){
				tel2 = tel2.substring(0,4) + tel2.substring(4,8);
			}
			if(tel2.length == 7){
				tel2 = tel2.substring(0,3) + tel2.substring(4,8);
			}
			var inputTel = tel1+tel2;
			if(!_this.isCellPhoneFormat(inputTel)){
                $(".tooltip").addClass("blind");
                $("#telTooltip").text(_this.msg_tel_empty).removeClass("blind");
				$("#selectTel").focus();
				return;
			}
			else{
                $("#telTooltip").addClass("blind");
				$("<input />").attr("name","mhp").attr("value",inputTel).appendTo($joinForm);
			}
		}
		var date = new Date();
		var userBirthYear = $("#selectYear").val();
		var userBirthMonth =$("#selectMonth").val();
		var userBirthDay = $("#selectDay").val();
		var userBirth = userBirthYear + userBirthMonth + userBirthDay;
		var twoDigitMonth = ((date.getMonth().length+1) == 1)? (date.getMonth()+1) : '0' + (date.getMonth()+1);
		var today = date.getFullYear().toString()+twoDigitMonth.toString()+((date.getDate().toString().length > 1) ? date.getDate().toString() : '0' + date.getDate());

		var result = parseInt(today) - parseInt(userBirth) - 140000;


		if(userBirthYear=="-1"|| userBirthMonth=="-1" || userBirthDay =="-1"){
            $(".tooltip").addClass("blind");
            $("#birthTooltip").text(_this.msg_birth_empty).removeClass("blind");
            $("#selectYear").focus();
			return;
		}

		var pwdBirthChk = true;
		for(i = 0; i <= userBirth.length - 4; i++) {
			var compStr = userBirth.substring(i, i+4);
			if(inPass.indexOf(compStr) > -1) {
                $(".tooltip").addClass("blind");
                $("#birthTooltip").text(_this.msg_pass_invalid_birthday).removeClass("blind");
                $("#selectYear").focus();
				pwdBirthChk = false;
				return;
			}
		}
		if(!pwdBirthChk) {
			return;
		}
		
		//14세 미만 체크
		if(result < 0){
            $(".tooltip").addClass("blind");
            $("#birthTooltip").text(_this.msg_14).removeClass("blind");
			return;
		}
		else{
			$("<input />").attr("name","birthDay").attr("value",userBirth).appendTo($joinForm);
		}

		//서비스 이용약관
		if( !$("#agreement").prop("checked") ){
			alert(_this.msg_agreement);
			return;
		}
		//위치정보 이용약관
		if( !$("#location").prop("checked") ){
			alert(_this.msg_location);
			return;
		}
		//개인정보 이용약관
		if( !$("#privacy").prop("checked") ){
			alert(_this.msg_privacy);
			return;
		}
		
		//이메일 수신 동의
		if( $("#mailYn").prop("checked") ){
			$("<input />").attr("name","mailYn").attr("value","1").appendTo($joinForm);
		}
		else{
			$("<input />").attr("name","mailYn").attr("value","0").appendTo($joinForm);
		}
		
		//문자 수신 동의
		if( $("#smsYn").prop("checked") ){
			$("<input />").attr("name","smsYn").attr("value","1").appendTo($joinForm);
		}
		else{
			$("<input />").attr("name","smsYn").attr("value","0").appendTo($joinForm);
		}
		
		if (confirm(_this.msg_join_confirm)) {
			_this.submitJoinForm($joinForm.serialize());
		}
		
	},
	/* SNS 회원가입 validation 체크 */
	checkJoinBySNSForm : function(){
		var _this = this;
		$joinForm = $("<form />");
		
		//회원가입 선택시 경고 메세지를 기존 그대로 다시 보여줌
		$("#msg14").attr("class","text-info").text(_this.msg_14).show();

		var date = new Date();
        var userBirthYear = $("#selectYear").val();
        var userBirthMonth =$("#selectMonth").val();
        var userBirthDay = $("#selectDay").val();
        var userBirth = userBirthYear + userBirthMonth + userBirthDay;
        var twoDigitMonth = ((date.getMonth().length+1) == 1)? (date.getMonth()+1) : '0' + (date.getMonth()+1);
        var today = date.getFullYear().toString()+twoDigitMonth.toString()+((date.getDate().toString().length > 1) ? date.getDate().toString() : '0' + date.getDate());
		
		var result = parseInt(today) - parseInt(userBirth) - 140000;


        if(userBirthYear=="-1"|| userBirthMonth=="-1" || userBirthDay =="-1"){
            $(".tooltip").addClass("blind");
            $("#birthTooltip").text(_this.msg_birth_empty).removeClass("blind");
            $("#selectYear").focus();
            return;
        }

		//14세 미만 체크
        if(result < 0){
            $(".tooltip").addClass("blind");
            $("#birthTooltip").text(_this.msg_14).removeClass("blind");
            return;
        }
        else{
            $("<input />").attr("name","birthDay").attr("value",userBirth).appendTo($joinForm);
        }

        //서비스 이용약관
        if( !$("#agreement").prop("checked") ){
            alert(_this.msg_agreement);
            return;
        }
        //위치정보 이용약관
        if( !$("#location").prop("checked") ){
            alert(_this.msg_location);
            return;
        }
        //개인정보 이용약관
        if( !$("#privacy").prop("checked") ){
            alert(_this.msg_privacy);
            return;
        }

		//이메일 수신 동의
		if( $("#mailYn").prop("checked") ){
			$("<input />").attr("name","mailYn").attr("value","1").appendTo($joinForm);
		}
		else{
			$("<input />").attr("name","mailYn").attr("value","0").appendTo($joinForm);
		}
		
		//문자 수신 동의
		if( $("#smsYn").prop("checked") ){
			$("<input />").attr("name","smsYn").attr("value","1").appendTo($joinForm);
		}
		else{
			$("<input />").attr("name","smsYn").attr("value","0").appendTo($joinForm);
		}
		
		// 개인 정보 취급 위탁 동의
		if( $("#privacy_rule").parent().hasClass("checked") ){
			$("<input />").attr("name","consignyn").attr("value","1").appendTo($joinForm);
		}
		else{
			$("<input />").attr("name","consignyn").attr("value","0").appendTo($joinForm);
		}
		
		$("<input />").attr("name","joinClass").attr("value",$("#joinClass").val()).appendTo($joinForm);
		$("<input />").attr("name","snsid").attr("value",$("#snsid").val()).appendTo($joinForm);
		$("<input />").attr("name","mail").attr("value",$("#email").val()).appendTo($joinForm);

        if (confirm(_this.msg_join_confirm)) {
            _this.submitJoinForm($joinForm.serialize());
        }
		
	},
	checkEmailUse : function(param){
		var _this = this;
		var checkInvalid = false;
		//이메일 체크
		$.ajax({
			url : './emailChk.do',
			type : "post",
			async : false,
			data : param,
			dataType : "html",
			error : function() {
				alert(_this.msg_error);
				return;
			},
			success : function(strData) {
				var seqs = strData.split(",");
				var emailChk = seqs[1];
				if (Number(emailChk) > 0) {
					$("#mailTooltip").text(_this.msg_mail_use).removeClass("blind");
					$("#email1").focus();
					checkInvalid = true;
				} else {
				}
			}
		});
		return checkInvalid;
	},
	checkPhoneUse : function(param){
		var _this = this;
		var checkInvalid = false;
		//휴대전화 체크
		$.ajax({
			url : './hpChk.do',
			type : "post",
			async : false,
			data : param,
			dataType : "html",
			error : function() {
				alert(_this.msg_error);
			},
			success : function(strData) {
				var seqs = strData.split(",");
				var hpChk = seqs[1];
				if (hpChk != 0) {
					checkInvalid = true;
					$("#msgTel").text(_this.msg_tel_use).show();
					$("#tel2").focus();
				} else {
				}
			}
		});
		return checkInvalid;
	},
	submitJoinForm : function(param){
		var _this = this;
		
		//폼 전송
		$.ajax({
			url : './memberSave.do',
			type : "post",
			async : false,
			data : param,
			dataType : "html",
			error : function() {
				alert(_this.msg_error);
			},
			beforeSend : function() {

			},
			complete : function() {

			},
			success : function(strData) {
				var seqs = strData.split(",");

				var returnCode = $.trim(seqs[0]);
				var validateType = seqs[1];
				
				if (typeof seqs[3] == "undefined")
					seqs[3] = "";
				else 
					seqs[3] = "," + seqs[3]; 
				var invalidMsg = seqs[2] + " " + seqs[3];

				if(returnCode == "fail") {
					if(validateType == "mid") 
						$("#mid").focus().parent().next().text(invalidMsg).show().focus();
					else if(validateType == "password")
						$("#msg1").attr("class","text-alert").text(invalidMsg).show();
					else if(validateType == "mail")
						$("#msgEmail").text(invalidMsg).show();
					else if(validateType == "cellPhone")
						$("#msgTel").text(invalidMsg).show();
					else if(validateType == "birth")
							$("#msg14").attr("class","text-info").text(invalidMsg).show();
					else 
						alert( '회원가입에 실패하였습니다. 잠시 후 다시 시도해 주세요.' );
					
					return ;
				}
				
				var trackObj = {
					scid : 2408
				};
				Tracker.clickLog(trackObj);

        // 네이버 스크립트 추가
				Tracker.naverTrackingScript();
        // 레코벨 롱테일 스크립트
				Tracker.recobelTrackingScript();
				// Facebook Pixel 추가
				fbq('track', 'CompleteRegistration');

				alert(_this.msg_join_ok);
				var referLink = document.createElement('a');
				var url = _this.rUrl;
				if(url == ""){
					url = _COOCHA_WEB_DOMAIN + _PATH ;
				}
				referLink.href = url;
				document.body.appendChild(referLink);
				referLink.click();
				return false;
			}
		});
	},
	goJoinMemberPage : function(object){
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", _PATH + "/member/join/joinMember.do");
		document.body.appendChild(form);
		
		var joinClass = document.createElement("input");
		joinClass.setAttribute("type", "hidden");
		joinClass.setAttribute("name", "joinClass");
		joinClass.setAttribute("value", object.joinClass);
		form.appendChild(joinClass);
		var snsid = document.createElement("input");
		snsid.setAttribute("type", "hidden");
		snsid.setAttribute("name", "snsid");
		snsid.setAttribute("value", object.snsid);
		form.appendChild(snsid);
		var rUrl = document.createElement("input");
		rUrl.setAttribute("type", "hidden");
		rUrl.setAttribute("name", "rUrl");
		rUrl.setAttribute("value", object.rUrl== null ? '' : object.rUrl);
		form.appendChild(rUrl);
		
		//폼전송
		form.submit();  
	},
	setRUrl : function(url){
		var _this = this;
		_this.rUrl = url;
	}
}
window.Login = function(type){
	this.init(type);
}
Login.prototype = {
	/**
	 * 유입 경로
	 */
	rUrl : "",
	type : "",
	msg_error : "잘못된 정보입니다.",
	msg_idpw_invalid : "아이디 또는 비밀번호를 다시 확인하세요.",
	// msg_no_result : '일치하는 정보가 없습니다. \n 정보를 다시 확인해주세요.',
	// msg_sns_member : "SNS 계정 가입 회원입니다. 가입 시 선택한 서비스로 로그인해주세요.",
	// msg_pw_result : "로 임시 비밀번호가 발송되었습니다. 로그인 후 바로 비밀번호를 변경해주세요.",
	isLoading : false,
	/**
	 * 초기화
	 */
	init : function(type){
		var _this = this;
		
		_this.type = type;

		//아이디 패스워드 엔터키 이벤트
		$("#uid").on("keyup",function(e){
			if (e.keyCode == 13) {
				_this.login();
			}
		});
		$("#upw").on("keyup",function(e){
			if (e.keyCode == 13) {
				_this.login();
			}
		});
		//로그인 버튼 이벤트
		$("#loginBtn").on("click",function(){
			_this.login();
		});
		
		//회원가입 버튼 이벤트
		$("#btnJoinMember").on("click",function(e){
			e.preventDefault();
			var referLink = document.createElement('a');
			var url = _COOCHA_LOGIN_DOMAIN + _PATH + "/member/join/joinMember.do";
			referLink.href = url;
			document.body.appendChild(referLink);
			referLink.click();
			return false;
		});

		// ID 찾기 버튼 이벤트
		$("#findIdBtn").on("click",function(){
			_this.findId();
		});

		//PWD 찾기 버튼 이벤트
        $("#findPwdBtn").on("click",function(){
			_this.findPw();
        });
    },
	
	/**
	 * 로그인
	 */
	login : function(){
		var _this = this;
		//console.log("로그인!!");
		
		var uid = $("#uid").val();
		var upw = $("#upw").val();
		
		//아이디 유효성 체크
		if (uid.length == 0) {
			$("#uid").focus();
			alert("아이디를 입력해주세요.");
			return;
		}
		if (uid.length < 5 || uid.length > 15) {
			$("#uid").focus();
			alert("5자 ~ 15자 이내의 아이디를 사용해 주세요.");
			return;
		}
		//패스워드 유효성 체크
		if (upw.length == 0) {
			$("#upw").attr("value","").val("").focus();
			alert("패스워드를 입력해주세요.");
			return;
		} 
		if (upw.length < 5 || upw.length > 15) {
			$("#upw").attr("value","").val("").focus();
			alert("8자 ~ 15자 이내의 패스워드를 사용해 주세요.");
			return;
		}
		if(upw.search(' ') > -1){
            $("#idpwInvalidTooltip").text(_this.msg_idpw_invalid).removeClass("blind");
            $("#upw").attr("value","").val("").focus();
            return;
		}
		//로그인
		$.ajax({
			url : _PATH + "/member/login/loginChk.do",
			type : "POST",
			data : {
				mid : uid,
				mpwd : upw
			},
			error : function(){
			},
			success : function(strData){
				var seqs = strData.split(",");
                var returnCode = $.trim(seqs[0]);
				var idChk = seqs[1];
				var secedeCodeid = seqs[2];
				
					if(returnCode == 'fail'){
							if (typeof seqs[3] == "undefined") 
								seqs[3] = "";
							else 
								seqs[3] = ", " + seqs[3];
							alert(seqs[2] + seqs[3]);
					} else if (secedeCodeid == 1025 || secedeCodeid == 1026 || returnCode != 'success') {
                        	$("#idpwInvalidTooltip").text(_this.msg_idpw_invalid).removeClass("blind");
							$("#uid").attr("value","").val("").focus();
							$("#upw").attr("value","").val("");
						return;
				}
				
				if (idChk == 0) {
					$("#idpwInvalidTooltip").text(_this.msg_idpw_invalid).removeClass("blind");
					$("#uid").attr("value","").val("").focus();
        		    $("#upw").attr("value","").val("");
        		    return;
				}
				else if (idChk == 1) {
					
					$.ajax({
						url : _PATH + "/member/checkLastChangedPassword.do",
						type : "POST",
						data : {
							mid : uid
						},
						error : function(){
						},
						success : function(strData){
							if(strData.trim() == 'Y'){
								if(_this.rUrl == ""){
									var referLink = document.createElement('a');
									var url = _COOCHA_WEB_DOMAIN  + _PATH;
									referLink.href = url;
									document.body.appendChild(referLink);
									referLink.click();
									return false;
			           			}
			           			else if(_this.rUrl.indexOf("member/mypage/mypageCoupon.do") >= 0){
									Tracker.clickLog({scid : 2405});
									var referLink = document.createElement('a');
									var url = _this.rUrl;
									location.href = url;
									return false;
			           			}
			           			else if(_this.rUrl.indexOf("member/mypage/mypageDaily.do") >= 0){
			           				Tracker.clickLog({scid : 2403});
									var referLink = document.createElement('a');
									var url = _this.rUrl;
									location.href = url;
									return false;
			           			}
			           			else{
			           				var referLink = document.createElement('a');
									var url = _this.rUrl;
									location.href = url;
									return false;
			           			}
								
							}else if(strData.trim() == 'N'){
								location.href= _PATH + "/member/changePassword.do?mid="+uid;
								
							}
						}
					});
           			Tracker.clickLog({scid : 2407});
           			if(_this.rUrl == ""){
						var referLink = document.createElement('a');
						var url = _COOCHA_WEB_DOMAIN  + _PATH;
						referLink.href = url;
						document.body.appendChild(referLink);
						referLink.click();
						return false;
           			}
           			else if(_this.rUrl.indexOf("member/mypage/mypageCoupon.do") >= 0){
						Tracker.clickLog({scid : 2405});
						var referLink = document.createElement('a');
						var url = _this.rUrl;
						location.href = url;
						return false;
           			}
           			else if(_this.rUrl.indexOf("member/mypage/mypageDaily.do") >= 0){
           				Tracker.clickLog({scid : 2403});
						var referLink = document.createElement('a');
						var url = _this.rUrl;
						location.href = url;
						return false;
           			}
           			else{
           				var referLink = document.createElement('a');
           				var url = _this.rUrl;
           				location.href = url;
						return false;
           			}
				}
				else if(idChk == 2){
					//휴면계정
					var referLink = document.createElement('a');
					var url = _PATH + "/member/dormant.do";
					referLink.href = url;
					document.body.appendChild(referLink);
					referLink.click();
					return false;
				}
				else if(idChk == 8) {
					alert("비밀번호를 5회 이상 잘못 입력하였습니다.비밀번호 찾기를 통해 새로운 비밀번호를 설정 후, 로그인해 주세요.");
                    var referLink = document.createElement('a');
                    var url = _PATH + "/member/findInfoForm.do?type=PWD";
                    referLink.href = url;
                    document.body.appendChild(referLink);
                    referLink.click()
				}
			}
		});
		
	},
	/**
	 * [SNS] 로그인
	 */
	snsLogin : function(object){
		var _this = this;
		object.rUrl = _this.rUrl;
		if(!_this.isLoading) {
			_this.isLoading = true;
			//로그인
			$.ajax({
				url : _PATH + "/member/login/loginChk.do",
				type : "POST",
				/* IE에서 object 값이 중간에 손실되는 issue 존재하여  */
				async : false,
				data : {
					joinClass : object.joinClass,
					snsid : object.snsid,
					pagetype : _this.type
				},
				beforeSend : function(){
					$(".ico-loading").show();
				},
				complete : function() {
					_this.isLoading = false;
				},
				error : function(){
					alert(_this.msg_error);
				},
				success : function(strData){
					var seqs = strData.split(",");
                    var returnCode = $.trim(seqs[0]);
					var idChk = seqs[1];
					var secedeCodeid = seqs[2];
					
					if (secedeCodeid == 1025 || secedeCodeid == 1026 || returnCode != 'success') {
                        $("#idpwInvalidTooltip").text(_this.msg_idpw_invalid).removeClass("blind");
						$("#uid").attr("value","").val("").focus();
						$("#upw").attr("value","").val("");
						_this.isLoading = false;
						$(".ico-loading").hide();
						return;
					}
					if (idChk == 0) {
						new JoinMember().goJoinMemberPage(object);
					}
					else if (idChk == 1) {
						if(_this.type == 'join') {
							$(".ico-loading").hide();
							if(confirm("이미 쿠차에 가입되어 있는 계정입니다.\n로그인하시겠습니까?")) {
								_this.isLoading = false;
								$(".ico-loading").show();								
								var login = new Login();
								login.setRUrl(object.rUrl);
								login.snsLogin(object);
							} else {
								_this.isLoading = false;
								$(".ico-loading").hide();
								return;
							}
						}
						Tracker.clickLog({scid : 2407});
						if(_this.rUrl == ""){
							var referLink = document.createElement('a');
							var url = _COOCHA_WEB_DOMAIN  + _PATH;
							referLink.href = url;
							document.body.appendChild(referLink);
							referLink.click();
							return false;
						}
						else if(_this.rUrl.indexOf("member/mypage/mypageCoupon.do") >= 0){
							Tracker.clickLog({scid : 2405});
							var referLink = document.createElement('a');
							var url = _this.rUrl;
							referLink.href = url;
							document.body.appendChild(referLink);
							referLink.click();
							return false;
						}
						else if(_this.rUrl.indexOf("member/mypage/mypageDaily.do") >= 0){
							Tracker.clickLog({scid : 2403});
							var referLink = document.createElement('a');
							var url = _this.rUrl;
							referLink.href = url;
							document.body.appendChild(referLink);
							referLink.click();
							return false;
						}
						else{
							var referLink = document.createElement('a');
							var url = _this.rUrl;
							referLink.href = url;
							document.body.appendChild(referLink);
							referLink.click();
							return false;
						}
					}
					else if(idChk == 2){
						//휴면계정
						var referLink = document.createElement('a');
						var url = _PATH + "/member/dormant.do";
						referLink.href = url;
						document.body.appendChild(referLink);
						referLink.click();
						return false;
					}
				}
			});
		}
	},
	addInputTag : function(name,value,targetForm){
		$("<input />").attr("name",name).attr("value",value).appendTo(targetForm);
	},
	
	findId : function(){
		var _this = this;
		
		$findForm = $("<form />");
		_this.addInputTag("gubun", "id", $findForm);
		var telNo =  $("#findIdTel1").val() + $("#findIdTel2").val();
		_this.addInputTag("mhp",telNo, $findForm);

		if($("#emailDomain").val()=="직접입력"){
            var mailAddr =$("#findIdMail1").val();
		}else {
            var mailAddr = $("#findIdMail1").val() + "@" + $("#emailDomain").val();
        }
		_this.addInputTag("mail", mailAddr, $findForm);

		$.ajax({
			url: _PATH+"/member/join/findInfo.do",
			type: "post",
			data: $findForm.serialize(),
			async:false,
			dataType: "html",
			error: function(){
				alert(_this.msg_error);
			},
			success: function( strData ){
				var seqs = strData.split(",");
				var idChk = seqs[1];
				var info = seqs[2];
				var leng = info.length;
				var sum = leng-2;
				var userInfo = info.substring(0, sum); 
				var saveId = seqs[3];
                $(".tooltip").addClass("blind");

				if (idChk == 0) {
					$("#findIdTooltip").removeClass("blind");
				}else{
					if(1== saveId){
                        $(".member-container.login-container").hide();
						$("#findIdResult").show().find(".user").text(userInfo+"**");
					} else if(2 == saveId) {
						$("#idSnsTooltip").removeClass("blind");
					}
				} 
			}
		});  
	},
	
	findPw : function(){
		var _this = this;

		$findForm = $("<form />");
		_this.addInputTag("gubun", "pw", $findForm);
		var telNo =  $("#findPwTel1").val() + $("#findPwTel2").val();;
		_this.addInputTag("mhp",telNo, $findForm);
		var mid = $("#findPwId").val();
		_this.addInputTag("mid", mid, $findForm);
		_this.addInputTag("mail", "", $findForm);
		
		$.ajax({
			url: _PATH+"/member/join/findInfo.do",
			type: "post",
			data: $findForm.serialize(),
			async:false,
			dataType: "html",
			error: function(){
				alert(_this.msg_error);
			},
			success: function( strData ){

				var seqs = strData.split(",");
				var idChk = seqs[1];
				var info = seqs[2];
				var leng = info.length;
				var sum = leng-2;
                $(".tooltip").addClass("blind");

				var saveId = seqs[3];
				if (idChk == 0) {
                    $("#findPwdTooltip").removeClass("blind");
				}else{
					if(3 == saveId) {
						$("#pwdSnsTooltip").removeClass("blind");

					} else if(1 != saveId){
						$(".member-container.login-container").hide();
						$("#findPwResult").show().find(".user").text(info);
					}
				} 
			}
		}); 
	},

    //아이디 찾기결과 팝업 닫기
    closeInfoPopup : function (id){
        $("#" + id).hide();
        $(".member-container.login-container").show();
    },

	setRUrl : function(url){
			var _this = this;
			_this.rUrl = url;
		}
	}
window.Join = function(){
	this.init();
}
/**
 * 초기화
 */
Join.prototype = {
	init : function() {
		var _this = this;
		
		/* 쿠차 회원가입 */
		$("#coochaJoin").on("click", function() {
			var referLink = document.createElement('a');
			var url = _PATH + "/member/join/joinMember.do";
			referLink.href = url;
			document.body.appendChild(referLink);
			referLink.click()
		});
		
	}
}