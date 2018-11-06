<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Highway Blog - Free CSS Template</title>
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

<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300"
	rel="stylesheet">





<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
@font-face {
    font-family: 'NanumSquareRoundR';
    src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
    }
    
    * 
    { box-sizing: border-box;
    font-family: NanumSquareRoundR; 
    }
.box {
	display: inline-block;
	/* font-family: "Nanum Gothic", sans-serif; */
}

.listcss {
	border: 0.5px solid gray;
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	/* font-family: "Nanum Gothic", sans-serif; */
}
.button {
	background: url('../../resources/img/reload.png') no-repeat;
	background-size: auto 100%;
	width: 100px;
	height: 30px;
	padding-left: 20px;
	border-radius: 4px;
	border: 1px solid #D0D0D0;
	color: #6E6E6E;
	outline: none;
}

.button:hover {
	color: red;
	border: 1px solid red;
}

#ck-button {
	margin: 4px;
	background-color: #EFEFEF;
	
	border: 1px solid #D0D0D0;
	display: inline-block;
	font-size: 15px;
	outline: none;
}

#ck-button label {
	float: left;
	width: 4.2em;
	height: 1.6em;
}

#ck-button label span {
	text-align: center;
	padding: 5px 1px;
	display: block;
}

#ck-button label input {
	position: absolute;
	top: -20px;
}

#ck-button input:checked+span {
	background-color: #911;
	color: #fff;
}

#ck-button:hover {
	background-color: lightcoral
}
.resetBtn{
	margin-left: 8.0em;
	font-size: 18px;
	width: 100px;
	height: 30px;
	border-radius: 4px;
	border: 1px solid #D0D0D0;
	background-color: white;
	color: #6E6E6E;
	outline: none;
}
 .resetBtn span{
	top: 23px;
    width: 15px;  
    height: 15px;     
    margin-top: 5px;
    display: inline-block;
   	margin-right: 5px;
	background-image: url('../../resources/img/reload.png');

} 
.resetBtn:hover{
	background: #CCF2FF;
}
</style>

</head>

<body>

	<%@ include file="../common/header.jsp"%>
	
	<div style="width: 1200px; margin: 200px auto">
		<div style="width: 1100px; margin: 0 auto">
			<div class="box" style="width: 380px">
				<div
					style="border: 1px solid #D0D0D0; padding-left: 20px; font-size: 25px; padding-top: 20px; background: white; border-radius: 4px">
					<span><img src="../../resources/img/list.png"/></span><b>&nbsp;&nbsp;정렬</b><br>
					<br> <select class="listcss" name="" id=""
						style="color: black; font-size: 15px; margin-bottom: 20px; width: 200px; outline: none;">
						<option value="랭킹순">랭킹순</option>
						<option value="평점높은순">평점높은순</option>
						<option value="평점낮은순">평점낮은순</option>
						<option value="리뷰많은순">리뷰많은순</option>
						<option value="리뷰적은순">리뷰적은순</option>
					</select>

				</div>
				<div
					style="border: 1px solid #D0D0D0; padding-left: 20px; font-size: 25px; padding-top: 20px; margin-top: 20px; padding-bottom: 20px; background: white; border-radius: 4px">
					<span><img src="../../resources/img/filter.png"/></span><b>&nbsp;필터</b>
					
					<button class="resetBtn" id="resetFrm"><span></span>초기화</button><br />
				
					<br> 성분 필터<br>
					<br>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck1" id="ck1"><span>메밀</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck2" id="ck2"><span>밀</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck3" id="ck3"><span>콩</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck4" id="ck4"><span>견과류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck5" id="ck5"><span>조개류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck6" id="ck6"><span>복숭아</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck7" id="ck7"><span>토마토</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck8" id="ck8"><span>난류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck9" id="ck9"><span>우유</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck10" id="ck10"><span>아황산</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck11" id="ck11"><span>육류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck12" id="ck12"><span>갑각류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck13" id="ck13"><span>고등어</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck14" id="ck14"><span>오징어</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck15" id="ck15"><span>굴</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck16" id="ck16"><span>전복</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck17" id="ck17"><span>홍합</span>
						</label>
					</div>
				</div>
			</div>
			<div id="dbox" class="box"
				style="margin-left: 20px; width: 660px; background: white; vertical-align: top; border:1px solid #D0D0D0; border-radius: 4px">
				<table id="rList" style=" width: 659px; height: 150px; text-align: center; border-radius: 4px">
					<%-- <% for(int i=1; i<7; i++){ %>
					<tr>
						<td rowspan="3" style="width: 100px; height: 150px;"><b><%= i %></b></td>
						<td rowspan="3" style="width: 100px; height: 150px;">이미지</td>
						<td>브랜드명</td>
						<td rowspan="3" style="width: 250px; height: 150px;">별점</td>
					</tr>
					<tr class="pn">
						<td>제품명</td>
					</tr>
					<tr class="pp">
						<td>가격</td>
					
					</tr>
					<% } %> --%>
					<% for(int i=1; i<7; i++){ %>
					<tr>
						<td style="width: 100px; height: 150px;"><b><%= i %></b></td>
						<td style="width: 100px; height: 150px;">이미지</td>
						<td style="text-align: left">
							<ul style="text-align: left; list-style: none; " >
								<li><h5 style="color: red">브랜드명</h5></li>
								<li><h4>제품명</h4></li>
								<li><h5>가격</h5></li>
							</ul> 
						</td>
						<td style="width: 250px; height: 150px;">별점</td>
					</tr>
					<% } %>
				</table> 
				
			</div>
		</div>
		
	</div>

	
	<%@ include file="../common/footer.jsp"%>


	<!-- Modal button -->
	<div class="popup-icon">
		<button id="modBtn" class="modal-btn">
			<img src="img/contact-icon.png" alt="">
		</button>
	</div>

	<!-- Modal -->
	<div id="modal" class="modal">
		<!-- Modal Content -->
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="header-title">
					Say hello to <em>Highway</em>
				</h3>
				<div class="close-btn">
					<img src="img/close_contact.png" alt="">
				</div>
			</div>
			<!-- Modal Body -->
			<div class="modal-body">
				<div class="col-md-6 col-md-offset-3">
					<form id="contact" action="" method="post">
						<div class="row">
							<div class="col-md-12">
								<fieldset>
									<input name="name" type="text" class="form-control" id="name"
										placeholder="Your name..." required="">
								</fieldset>
							</div>
							<div class="col-md-12">
								<fieldset>
									<input name="email" type="email" class="form-control"
										id="email" placeholder="Your email..." required="">
								</fieldset>
							</div>
							<div class="col-md-12">
								<fieldset>
									<textarea name="message" rows="6" class="form-control"
										id="message" placeholder="Your message..." required=""></textarea>
								</fieldset>
							</div>
							<div class="col-md-12">
								<fieldset>
									<button type="submit" id="form-submit" class="btn">Send
										Message Now</button>
								</fieldset>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="/semi/resources/js/vendor/jquery-1.11.2.min.js"><\/script>')
	</script>

	<script src="/semi/resources/js/vendor/bootstrap.min.js"></script>

	<script src="/semi/resources/js/plugins.js"></script>
	<script src="/semi/resources/js/main.js"></script>

</body>
<script>
	$(function() {
		$('button[id=resetFrm]').click(function() {
			$('input:checkbox').prop('checked', false);
		});
	});
	
	$(function() {
		$('#rList td').mouseenter(function() {
			$(this).parent().css({"background":"#FAF2F0","cursor":"pointer"});
		}).click(function() {
			location.href="rankDetail.jsp";
		}).mouseleave(function() {
			$(this).parent().css({"background":"white"});
		});
	});

</script>
</html>