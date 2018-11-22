<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	String num1 = null;
	String num2 = null;
	String num3 = null; 
	String[] address = null;
	int price = Integer.parseInt(request.getParameter("price"));
	String buyMonth = request.getParameter("buyMonth");
	
%>

    

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>List of Thing</title>
<!-- 

Highway Template

http://www.templatemo.com/tm-520-highway

-->
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        

    	<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/orderBox.css">
 		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">
 		
 		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>	
 		        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 	<style>
	 @font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('<%= request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf');
        }
        body { box-sizing: border-box;
            font-family: NanumSquareRoundR !important; 
        }
        
        .hide {
        	visibility : hidden;
        }
        
        .visi {
        	visibility : visible;
        }
	</style>
	
	<script>

		
		function orderClick(){
			
		console.log($('#tel1').val() + '-' + $('#tel2').val() + '-' + $('#tel1').val());
		IMP.init('imp22647459'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
			IMP.request_pay({
			    pg : 'ihtml5_inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '리띵 박스 구매',
			    amount : <%= price%>*1000 ,
			    buyer_email : $('#email').val(),
			    buyer_name : $('#userName').val(),
			    buyer_tel : $('#tel1').val() + '-' + $('#tel2').val() + '-' + $('#tel1').val(),
			    buyer_addr : $('#address1').val() + ' ' + $('#address2').val(),
			    buyer_postcode : $('#zipCode').val(),
			    m_redirect_url : '/orderList.mp'
			}, function(rsp) {
				if ( rsp.success ) {
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
			    		type: 'POST',
			    		dataType: 'json',
			    		data: {
				    		imp_uid : rsp.imp_uid
				    		//기타 필요한 데이터가 있으면 추가 전달
			    		}, success : orderSubmit() ,
			    	}).done(function(data) {
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    		if ( everythings_fine ) {
			    			var msg = '결제가 완료되었습니다.';
			    			msg += '\n고유ID : ' + rsp.imp_uid;
			    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			    			msg += '\n결제 금액 : ' + rsp.paid_amount;
			    			msg += '카드 승인번호 : ' + rsp.apply_num;
			    			
			    			alert(msg);

			    			
			    		} else {
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			    		}
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        
			        alert(msg);
			    }
			});
		console.log(i);
		if(i == 1){
			$("#orderForm").submit();
		}

		};
		
		function orderSubmit(){
			$("#orderForm").submit();
			location
		}
		

		//참조 API : http://postcode.map.daum.net/guide
		function addrSearch() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName : data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' (' + extraAddr
										+ ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							$('#zipCode').val(data.zonecode); //5자리 새우편번호 사용

							$('#address1').val(fullAddr);

							// 커서를 상세주소 필드로 이동한다.
							$('#address2').focus();
						}
					}).open();
		};
		
		$(function(){
			$('input:radio[name=deladr]').change(deladr);
			
			function deladr(){
				if($('input:radio[id=radio1]').prop('checked')){
					location.reload();
				}else if($('input:radio[id=radio2]').prop('checked')){
					$('td').children('input:text').val("");
				}
				
			};

		});



	</script>
	
    </head>
    

<body>

      <%@ include file="../common/header.jsp" %>

    <div class="page-heading">
        <div class="container">
            <div class="heading-content">
                <h1>list of<em>thing ;)</em></h1>
            </div>
        </div>
    </div>

 <%if ( mh != null ) { %>
<form action="<%=request.getContextPath() %>/orderList.mp" id="orderForm">
 	<input type="hidden" name="address" value="<%= mh.getAddress() %>" /> 
 <% address = mh.getAddress().split(", "); %>
<br><br><br>
	<div class="cont">
		<br>
		<br>
		<div id="textTop">
			<h2>Order</h2>
			<br>
			<br>
			<p>리띵박스에서 주문하실 내역입니다.</p>
		</div>
		<br>
		<br>
		<div class="col-sm-12">
			<div class="panel orderList">
				<table class="odlist">
					<tr>
						<th>상품정보</th>
						<th>판매가</th>
						<th>구매수량/월</th>
					</tr>
					<tr>
						<td><img src="<%=request.getContextPath() %>/resources/img/buybox.png" width="50px"
							height="50px"> &nbsp;리띵박스</td>
						<td><%= price%>,000</td> <input type="hidden" name="price" value="<%= price %>" />
						<td><%= buyMonth %></td>
					</tr>
				</table>
				<div class="totalpay">
					<b>결제예정금액</b> &nbsp; <em><%= price%>,000</em>원
				</div>
			</div>
		</div>
		<br>
		<br>
		<!-- 배송지 정보 -->
			<div class="col-sm-12">
				<div class="panel userInfo">
					<div class="panel-heading">
						&nbsp; <b>배송지 정보</b> &nbsp; &nbsp; &nbsp; &nbsp; <input
							type="radio" name="deladr" id="radio1" checked="checked"> 주문고객
						정보와 동일 &nbsp; &nbsp; <input type="radio" name="deladr" id="radio2">
						새로운 주소
					</div>
					
					<div class="panel-body" id="div1">
						<table class="userif" width="100%">
							<tr>
								<td width="100px">받으시는 분</td>
								<td width="200px"><input type="text" id="userName" value="<%= mh.getUserName() %>"></td>
								<input type="hidden" name="userid" value="<%= mh.getUserId() %>" />
							</tr>
							<tr>
								<td width="100px" rowspan="2">주소</td>
								<td width="200px" height="50px">
								<input type="text" id="zipCode"  value="<%= address[0] %>" readonly>
								<input type="button" value="우편번호 찾기" onclick="addrSearch();"><br></td>
							</tr>
							<tr>
								<td><input type="text" id="address1" size="40" value="<%= address[1] %> ">
								<input type="text" id="address2" size="40" value="<%= address[2] %>"></td>
							</tr>
							<tr>
								<td>연락처</td>
								<% if( mh.getPhone().length() == 11){
									num1 = mh.getPhone().substring(0, 3);
									num2 = mh.getPhone().substring(3, 7);
									num3 = mh.getPhone().substring(7 , 11);
								 } else { 
									 num1 = mh.getPhone().substring(0, 3);
									 num2 = mh.getPhone().substring(3, 6);
									 num3 = mh.getPhone().substring(6 ,10);
								 }
								 %>
								<td><input type="text" id="tel1" value="<%= num1 %>"> - 
									<input type="text" id="tel2" value="<%= num2 %>"> - 
									<input type="text" id="tel3" value="<%= num3 %>"></td>
							</tr>
							<tr>
								<td width="70px" height="50px">배송시 유의사항</td>
								<td><input type="text" size="100"></td>
							</tr>

						</table>
					</div>

					
					<div class="panel-footer"> 주문시 요청사항은 배송기사가 배송시 참고하는 사항으로써, 사전에
						협의되지 않은 지정일 배송 등의 요청사항은 반영되지 않을 수 있습니다.</div>
						<input type="hidden" id="email" value="<%= mh.getEmail() %>" /> 
				</div>
				<br />
			</div>
			
			<!-- <div class="col-sm-12">
				<div class="panel payList">
					<div class="paypic">
						<b>결제 수단</b> <br> <input type="radio" name="pay" id="1"
							checked="checked"> 계좌 이체 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="radio" name="pay" id="2"> 휴대폰 결제
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="pay"
							id="3"> 카카오페이 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="radio" name="pay" id="4"> 페이코 간편결제
					</div>
				</div>
			</div> -->
			
			<div class="btnbar">
			
				<input type="button" value="이전 페이지" class="btn backbtn" onclick="location.href='lithingbox.jsp'"> 
				<input type="text" id="order"  value="구매하기" class="btn buybtn" onclick="orderClick();">
			</div>
			<br /><br />
	</div>
	<br><br />
	</form>
	<% } else { %>
			<script>
				$(function(){
					alert("로그인 하셔야 구매 할 수 있습니다.");
					location.href="/semi/views/young/login.jsp"
				})
			
			</script>
	<% } %>
	<%@ include file="../common/footer.jsp" %>


    
</body>
</html>