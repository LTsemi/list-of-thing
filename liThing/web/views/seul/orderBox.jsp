<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>About Highway - Free CSS Template</title>
<!-- 

Highway Template

http://www.templatemo.com/tm-520-highway

-->
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../resources/css/fontAwesome.css">
        <link rel="stylesheet" href="../resources/css/light-box.css">
        <link rel="stylesheet" href="../resources/css/templatemo-style.css">

        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        

    	<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">
		<link rel="stylesheet" href="../../resources/css/orderBox.css">
 		
 
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

    <div class="page-heading">
        <div class="container">
            <div class="heading-content">
                <h1>list of<em>thing ;)</em></h1>
            </div>
        </div>
    </div>

 
<br><br><br>
<div class="cont">    
    <br><br>
    <div id="textTop">
        <h2>Order</h2>
        <br><br>
        <p>리띵박스에서 주문하실 내역입니다.</p>
    </div>
    <br><br>
    <div class="col-sm-12">
        <div class="panel orderList">
            <table class="odlist">
                <tr>
                    <th>상품정보</th>
                    <th>판매가</th>
                    <th>구매수량/월</th>
                </tr>
                <tr>
                    <td><img src="../../resources/img/buybox.png" width="50px" height="50px"> &nbsp;리띵박스</td>
                    <td>12,000원</td>
                    <td>1</td>
                </tr>
            </table>
            <div class="totalpay"><b>결제예정금액</b> &nbsp; <em>12,000</em>원</div>
        </div>
    </div>
    <br><br>
    <!-- 배송지 정보 -->
    <div class="col-sm-12"> 
      <div class="panel userInfo">
        <div class="panel-heading">
            &nbsp; <b>배송지 정보</b> &nbsp; &nbsp; &nbsp; &nbsp;
            <input type="radio" name="deladr" id="1" checked="checked"> 주문고객 정보와 동일
            &nbsp; &nbsp;
            <input type="radio" name="deladr" id="2"> 새로운 주소
        </div>
        <div class="panel-body">
                <table class="userif"  width="100%" >
                        <tr>
                            <td width="100px">받으시는 분</td>
                            <td width="200px"> <input type="text" id="userName"></td>
                        </tr>
                        <tr>
                            <td width="100px"rowspan="2">주소</td>
                            <td width="200px" height="50px">
                                 <input type="number" id="">
                                 <input type="button" value="우편번호 찾기"><br>
                                </td>                          
                        </tr>
                        <tr>
                            <td>    
                                <input type="text" id="" size="40">
                                <input type="text" id="" size="40">
                            </td>
                        </tr>
                        <tr>
                            <td>연락처</td>
                            <td>
                                <input type="number"id="" > -
                                <input type="number"id=""> - 
                                <input type="number"id="">
                            </td>
                        </tr>
                        <tr>
                            <td width="70px" height="50px">배송시 유의사항</td>
                            <td><input type="text" size="100"></td>
                        </tr>
                        
                    </table>
            

        </div>
        <div class="panel-footer">주문시 요청사항은 배송기사가 배송시 참고하는 사항으로써, 사전에 협의되지 않은 지정일 배송 등의 요청사항은 반영되지 않을 수 있습니다.</div>
        </div>
    </div>

    <div class="col-sm-12">
            <div class="panel payList">
                <div class="paypic">
                    <b>결제 수단</b> <br>
                    <input type="radio" name="pay" id="1" checked="checked"> 계좌 이체
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pay" id="2"> 휴대폰 결제
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
                    <input type="radio" name="pay" id="3"> 카카오페이
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
                    <input type="radio" name="pay" id="4"> 페이코 간편결제
                </div>
            </div>
    </div>
    <div class="btnbar">
        <input type="button" value="이전 페이지" class="btn backbtn" onclick="location.href='lithingbox.jsp'">
        <input type="submit" value="구매하기" class="btn buybtn" onclick="location.href='../../index.jsp'">
    </div>

</div><br>


<%@ include file="../common/footer.jsp" %>


      <!-- Modal button -->
    <div class="popup-icon">
      <button id="modBtn" class="modal-btn"><img src="img/contact-icon.png" alt=""></button>
    </div>  

    <!-- Modal -->
    <div id="modal" class="modal">
      <!-- Modal Content -->
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="header-title">Say hello to <em>Highway</em></h3>
          <div class="close-btn"><img src="img/close_contact.png" alt=""></div>    
        </div>
        <!-- Modal Body -->
        <div class="modal-body">
          <div class="col-md-6 col-md-offset-3">
            <form id="contact" action="" method="post">
                <div class="row">
                    <div class="col-md-12">
                      <fieldset>
                        <input name="name" type="text" class="form-control" id="name" placeholder="Your name..." required="">
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <input name="email" type="email" class="form-control" id="email" placeholder="Your email..." required="">
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <textarea name="message" rows="6" class="form-control" id="message" placeholder="Your message..." required=""></textarea>
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <button type="submit" id="form-submit" class="btn">Send Message Now</button>
                      </fieldset>
                    </div>
                </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/semi/resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="/semi/resources/js/vendor/bootstrap.min.js"></script>
    
    <script src="/semi/resources/js/plugins.js"></script>
    <script src="/semi/resources/js/main.js"></script>

</body>
</html>