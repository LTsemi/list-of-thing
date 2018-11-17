<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.buyme.won.mypage.model.vo.OrderLT" %>
    
 <%	
	OrderLT o = (OrderLT)request.getAttribute("order");
 
 	String num1 = null;
	String num2 = null;
	String num3 = null; 
	String[] address = null;
	
%>    

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>List of Thing</title>

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
          src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
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

<% if( o != null){ %>
  <% address = o.getUseraddress().split(", "); %>

<br><br><br>
	<div class="cont">
		
		<div id="textTop">
			<h2>OrderList</h2>
			<br>
			<br>
			<p>리띵박스에서 주문하신 내역입니다.</p>
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
						<td><img src="<%= request.getContextPath() %>/resources/img/buybox.png" width="50px"
							height="50px"> &nbsp;리띵박스</td>
						<td><%= o.getPrice()/1000 %>,000</td>
						<td>1</td>
					</tr>
				</table>
				<div class="totalpay">
					<b>결제된 금액</b> &nbsp; <em><%= o.getPrice()/1000 %>,000</em>원
				</div>
			</div>
		</div>
		<br>
		<br>
		<!-- 배송지 정보 -->
			<div class="col-sm-12">
				<div class="panel userInfo">
					<div class="panel-heading">
						&nbsp; <b>배송지 정보</b> &nbsp; &nbsp; &nbsp; &nbsp; 
						<!-- <input
							type="radio" name="deladr" id="radio1" checked="checked"> 주문고객
						정보와 동일 &nbsp; &nbsp; <input type="radio" name="deladr" id="radio2">
						새로운 주소 -->
					</div>
					
					<div class="panel-body" id="div1">
						<table class="userif" width="100%">
							<tr>
								<td width="100px">받으시는 분</td>
								<td width="200px"><%= mh.getUserName() %></td>
							</tr>
							<tr>
								<td width="100px" rowspan="2">주소</td>
								<td width="200px" height="50px">
								<%= address[0] %>
								</td>
							</tr>
							<tr>
								<td><%= address[1] %>
								<%= address[2] %></td>
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
								<td><%= num1 %> - 
									<%= num2 %> - 
									<%= num3 %></td>
							</tr>
							<tr>
								<td width="70px" height="50px">배송시 유의사항</td>
								<td><input type="text" size="100"></td>
							</tr>

						</table>
					</div>

					
					<div class="panel-footer"> 현재 주문된 건의 배송지 변경은 불가 합니다. 자세항 사항은 고객센터로 문의주시기 바랍니다.</div>
						<input type="hidden" id="email"  /> 
				</div>
			</div>
			
			
	 				<div class="col-sm-12">
				<div class="panel userInfo">
					<div class="panel-heading">
						&nbsp; <b>상품 주문 기간</b> &nbsp; &nbsp; &nbsp; &nbsp; 
						
					</div>
					
					<div class="panel-body" id="div1">
						<table class="userif" width="100%">
							<tr>
								<td width="100px">결제일</td>
								<td width="200px"><%= o.getOrderdate() %></td>
							</tr>
							<tr>
								<td width="100px">리띵박스 구매 종료일</td>
								<td width="200px"><input type="text" id="userName" ></td>
							</tr>

						</table>
					</div>

					
					<div class="panel-footer"> 리띵박스 구매 종료일은 결제일로부터 구매 상품에 따라 자동으로 계산되며, 추가 주문은 그 이후부터 가능합니다. &nbsp;
					                           자세한 내용은 공지사항을 참고해 주시길 바랍니다.</div>
						<input type="hidden" id="email"  /> 
				</div>
			</div> 
			
			
			
			<div class="col-sm-12">
				<div class="panel payList">
					<div class="paypic">
						<b>주문 번호</b> 
						<br>
					
						<input type="text" id="orderNumber" value="<%= o.getOrdernum()%>">
						<br />
						<br />
						<b>운송장 번호</b> 
						<br>
						
						<a href="/semi/views/young/delivery.jsp?tnum=<%= o.getTracking_num()%>"><%= o.getTracking_num() %></a>
					</div>
				</div>
			</div>
			<div class="btnbar">
				<input type="button" value="마이페이지로 돌아가기" class="btn backbtn" onclick="location.href='/semi/views/won/myPage.jsp'"> 
				
				<!-- if로 구매종료일이 넘었으면 가능 아니면 불가 알림창 뜨기 -->
				<input type="text" id="order" value="구매하러 가기" class="btn buybtn" onclick="location.href='/semi/views/seul/lithingbox.jsp'">
			</div>
	</div>
	<br>
	
	
	
	<% } else { %>
			<script>
				$(function(){
					alert("구매내역이 없습니다.");
					location.href="/semi/views/seul/lithingbox.jsp"
				})
			
			</script>
	<% } %> 
	
	<%@ include file="../common/footer.jsp" %>


    
</body>
</html>