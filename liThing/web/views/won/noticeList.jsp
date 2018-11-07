<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.buyme.won.notice.model.vo.*"%>
    
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Highway Masonry CSS Template</title>
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

 <link href="https://fonts.googleapis.com/css?family=Gugi|Itim" rel="stylesheet">

        <script src="../../resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!--     Fonts and icons     -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
  <!-- ------------------------------------------------------------------------------------------------------- -->      
        
        
        <script src="/resources/js/jquery-3.3.1.min.js"></script>
        
        <style>
	.template_faq {
    background: #edf3fe none repeat scroll 0 0;
}
.panel-group {
    background: #fff none repeat scroll 0 0;
    border-radius: 3px;
    box-shadow: 0 5px 30px 0 rgba(0, 0, 0, 0.04);
    margin-bottom: 0;
    padding: 30px;
}
#accordion .panel {
    border: medium none;
    border-radius: 0;
    box-shadow: none;
    margin: 0 0 15px 10px;
}
#accordion .panel-heading {
    border-radius: 30px;
    padding: 0;
}
#accordion .panel-title a {
    background: #ffb900 none repeat scroll 0 0;
    border: 1px solid transparent;
    border-radius: 30px;
    color: #fff;
    display: block;
    font-size: 18px;
    font-weight: 600;
    padding: 12px 20px 12px 50px;
    position: relative;
    transition: all 0.3s ease 0s;
}
#accordion .panel-title a.collapsed {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #ddd;
    color: #333;
}
#accordion .panel-title a::after, #accordion .panel-title a.collapsed::after {
    background: #ffb900 none repeat scroll 0 0;
    border: 1px solid transparent;
    border-radius: 50%;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.58);
    color: #fff;
    content: "";
    font-family: fontawesome;
    font-size: 25px;
    height: 55px;
    left: -20px;
    line-height: 55px;
    position: absolute;
    text-align: center;
    top: -5px;
    transition: all 0.3s ease 0s;
    width: 55px;
}
#accordion .panel-title a.collapsed::after {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #ddd;
    box-shadow: none;
    color: #333;
    content: "";
}
#accordion .panel-body {
    background: transparent none repeat scroll 0 0;
    border-top: medium none;
    padding: 20px 25px 10px 9px;
    position: relative;
}
#accordion .panel-body p {
    border-left: 1px dashed #8c8c8c;
    padding-left: 25px;
}

.searchArea {
		width:650px;
		margin-left:auto;
		margin-right:auto;
	}
	
@font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
          }

body { box-sizing: border-box;
            font-family: NanumSquareRoundR !important; 
      }
      
#searchBtn {
    background-color: white;
    color: black;
    border: 0.5px solid #BDBDBD;
     height: 24px;
}

#searchCondition {
 background-color: white;
    color: black;
    border: 0.5px solid #BDBDBD;
    height: 24px;
 }
 

</style>
    </head>

<body>

   <%@ include file="../common/header.jsp" %>
   
   
   
    <div class="page-heading2">
        <div class="container">
            <div class="heading-content">
                <h1>list of<em>thing :)</em></h1>
            </div>
        </div>
    </div>

        
        <div class="outer" style=" height: 610px;" >
		
		
		
	
		 <div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center wow zoomIn">
					<br />
					
						<h1 style="font-family: Gugi;">공지사항</h1>
						<span></span>
						<!-- <p>Our Frequently Asked Questions here.</p> -->
					</div>
				</div>
			</div>
			<div class="row">				
				<div class="col-md-12">
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										신종금융사기인 스미싱! 주의
									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<p>안녕하세요. 리띵입니다.<br>
										오늘도 리띵을 찾아주신 여러분께 감사드립니다.<br> 
										<br>
										문자메시지 혹은 인터넷주소를 클릭하면 휴대폰에 악성코드가 설치되어 피해자가 모르는 사이에 소액결제 피해를 주거나 개인정보를 탈취해갈 수 있는 스미싱(Smishing)
										사례가 증가하고있습니다.<br>
										<br>
										 리띵은 절대 다음과 같은 문자 메시지를 발송하지 않습니다.<br>
										 <br>
										(지금 리띵 모바일 앱 설치하시면 '착한 점심'공짜! 선착순 팡팡 lithing coupon.com)
										<br>
										<br>
										해당 메시지를 확인하셨을 경우, 즉시 삭제하시고<br>
										출처가 확인되지 않은 문자 메시지의 인터넷 주소 URL은 클릭을 금지하시기 바랍니다.<br>
										또한 쿠폰,상품권,무료,조회,공짜 등의 문구를 스팸문구로 등록해서 차단을 하거나 확인되지 않은 앱 설치를 방지 및
										스마트폰 보안설정을 강화하시기 바랍니다.<br>
										피해발생 시에는 경찰청사이버테러 대응센터(182)에 신고하시어 조치하시기 바랍니다. <br>
										<br>
										여러분의 안전을 위해 더욱 노력하는 리띵이 되겠습니다.<br>
										감사합니다.<br> </p>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										 고객센터 문의 메일 변경 안내
									</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<p>안녕하세요. 리띵입니다.<br>
										오늘도 리띵을 찾아주신 여러분께 감사드립니다.<br> 
										<br>
										리띵 고객센터 문의 메일주소가 변경됨을 알려드립니다.<br>
										<br>
										 2018년 11월 23일 이전---> nottest@test.com
										<br>
										 2018년 11월 23일 이후---> test@test.com
										<br>
										고객센터에 문의가 필요하신 여러분께서는 위와 같은 내용을 잘 숙지하시어 문의 주시길 부탁드립니다.<br>
										<br>
										여러분의 불편사항을 누구보다 발빠르게 처리할 수 있도록 노력하는 리띵이 되겠습니다.<br>
										감사합니다.<br> </p>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
										사칭 악성코드 피해 주의
									</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									<p>안녕하세요. 리띵입니다.<br>
										오늘도 리띵을 찾아주신 여러분께 감사드립니다.<br> 
										<br>
										최근 인터넷 이용 시 리띵을 비롯한 타 인터넷 사이트에 방문할 경우 금융감독원 및 저희 리띵을 사칭하여
										보안인증을 가장한 팝업 악성코드가 지속적으로 유포되어 주의 말씀 드립니다.<br>
										<br>
										해당 악성코드는 시스템에서 사용하는 hosts 파일을 변조하는 방법으로 피싱 사이트 접속을 유도하는 파밍 악성코드입니다.
										이 악성코드에 감염되면, 리띵 홈페이지 접속 시 원할한 접속이 되지 않는 증상이 발생할 수 있습니다.<br>
										<br>
										해당 팝업을 확인하셨을 경우, 절대 금융 정보를 입력하지 마시고<br>
										만약 금융정보까지 입력하셨다면, 금융정보 유출로 인한 금전적 피해 등의 금융사고로 이어질 수 있으므로,<br>
										1) 보호나라(www.boho.or.kr)를 통해 해킹피해신고(전화:118)를 접수하시고<br>
										2) 해당 금융사에 연락하여 ‘비밀번호’와 ‘보안카드’를 변경해 주시기 바랍니다. <br>
										<br>
										악성코드 감염시에는 KISA 보호나라(http://boho.or.kr/kor/download/download_01.jsp) 및 신뢰 할 수 있는 
										백신 프로그램을 설치하고, 최신 엔진으로 업데이트한 후 검사/치료로 조치하시기 바랍니다.<br>
										<br>
										여러분의 안전을 위해 더욱 노력하는 리띵이 되겠습니다.<br>
										감사합니다.<br> </p>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFour">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
										ID와 비밀번호 등 개인정보 관리 유의 안내
									</a>
								</h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
								<div class="panel-body">
									<p>안녕하세요. 리띵입니다.<br>
										오늘도 리띵을 찾아주신 여러분께 감사의 말씀드립니다.<br> 
										성인 이용자의 ID와 비밀번호를 미성년자가 알게 될 경우 미성년자에게 유해정보가 노출될 수 있다는 사실 알고계신가요?<br>
										<br>
										ID와 비밀번호는 소중한 나의 개인정보라는 사실! 유념해주시고 노출되지 않도록 주의 요청드립니다.<br>
										<br>
										저희 리띵은 개인정보보호에 만전을 기하고 있으며 여러분께 더욱더 만족스러운 서비를 제공할 수 있도록 노력하겠습니다. <br>
										<br>
										다양한 식품리뷰와 함께 풍만한 하루 보내시길 바랍니다.<br>
										감사합니다.<br></p>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFive">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
										리띵 시작합니다. 
									</a>
								</h4>
							</div>
							<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
								<div class="panel-body">
									<p>안녕하세요.<br> 
										리띵을 찾아주신 여러분께 진심으로 감사드립니다.<br> 
										많은 여러분의 성원에 힘입어 드디어 저희 List of thing 사이트가 문을 열었습니다!<br>
										<br>
										혹시 먹어보고 싶은 식품의 리뷰를 검색하느라 힘들었던 적 있으신가요?<br>
										혹은 다른 사람들에게 나의 인생 식품을 소개하고 싶지만 마땅한 공간이 없어서 안타까웠던 적 있으신가요?<br>
										바로 이런 분들을 위해 리띵이 탄생했습니다!<br>
										<br>
										저희 리띵은 한 곳에서 다양한 식품군의 음식들을 직접 리뷰하고 공유할 수 있는 신개념 공간으로써, 리띵 박스를 통해 인기 테마 식품들을 
										직접 받아보실 수 있습니다. <br>
										<br>
										앞으로 부디 많은 관심 부탁드리며 여러분을 위해 최선을 다하는 리띵이 되겠습니다.<br>
										감사합니다. </p>
								</div>
							</div>
						</div>
					</div>
				</div><!--- END COL -->		
			</div><!--- END ROW -->			
		</div>
	</div>
  
        	<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option value="">---</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" id="keyword" placeholder="키워드를 입력하세요:)"> 
			<button type="button" id="searchBtn" onclick="search();">검색하기</button>
			<%--인라인 방식 --%>
			
			
			
			<%-- <% if(m != null && m.getUserId().equals("admin")){ %>
				<button onclick="location.href='views/notice/noticeInsertForm.jsp'">작성하기</button>
			<% } %> --%>
			

		</div>
        		
  


    <br />
    <br />
    
    
    
    
    
    
    
    
    
    
    
    

<%@ include file="../common/footer.jsp" %>

<!-- ------------------------------------------------------------------------------------------------------- -->
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
<!-- ------------------------------------------------------------------------------------------------------- -->


<script>
	<%-- 	$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"black"});
			}).click(function(){
				//console.log($(this).parent().children().eq(0).text());
				// 현재 클릭된 에의 형제
				//var nno = $(this).siblings().eq(0).text();
				var nno = $(this).parent().children().eq(0).text();
				// getContextPath()절대경로를 지정하는 것 = myWeb이라고 주는 거랑 같음 알아서 변경해서 가져감 최상위경로로
				location.href="<%=request.getContextPath()%>/selectOne.no?nno=" + nno;
			});
		});
		
		function search(){
			location.href="<%=request.getContextPath()%>/searchNotice.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		} --%>
		
		(function($) {
			'use strict';
			
			jQuery(document).on('ready', function(){
			
					$('a.page-scroll').on('click', function(e){
						var anchor = $(this);
						$('html, body').stop().animate({
							scrollTop: $(anchor.attr('href')).offset().top - 50
						}, 1500);
						e.preventDefault();
					});		

			}); 	

						
		})(jQuery);
		
	</script>



</body>
</html>