<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.buyme.sic.ranking.model.vo.*, com.buyme.sic.review.model.vo.*, java.util.*"%>
<%
	Product p = (Product) request.getAttribute("dRank");
	
	ArrayList<Review> rlist = (ArrayList<Review>) request.getAttribute("rlist");
%>
<!DOCTYPE html>
<html>
<head>
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
	src: url('/semi/resources/css/fonts/NanumSquareRoundR.ttf');
}

* {
	box-sizing: border-box;
	font-family: NanumSquareRoundR !important;
}

.box {
	display: inline-block;
}

.text {
	font-size: 15px;
}

.starR {
	background: url('/semi/resources/img/ico.png') no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
}

.RstarR {
	background: url('/semi/resources/img/ico.png') no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
}

.RstarR.on {
	background-position: 0 0;
}

.button {
	background-color: #F7603E;
	border-radius: 4px;
	border: 1px solid #D0D0D0;
	color: white;
	outline: none;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<div style="width: 1200px; margin: 200px auto;">
		<div style="width: 1100px; margin: 0 auto;">
			<div class="box">
				<div
					style="border: 1px solid #D0D0D0; padding: 20px; font-size: 25px; padding-top: 20px; background: white; border-radius: 4px; width: 430px;">
					<img src="/semi/resources/productImg/<%=p.getCname()%>"
						width="300px" height="300px"
						style="max-height: 100%; max-width: 100%; max-height: 100%; max-width: 100%; margin-left: 50px">
				</div>
				<div
					style="border: 1px solid #D0D0D0; padding: 20px; font-size: 25px; background: white; border-radius: 4px; text-align: center; margin-top: 10px">
					<h2><%=p.getPname()%></h2>
					<div style="padding: 20px; text-align: left">
						<h4>제품 설명</h4>
						<p class="text"><%=p.getPexp()%></p>
					</div>
					<div
						style="border: 1px solid #D0D0D0; padding: 20px; background: white; border-radius: 4px; text-align: left">
						<%=p.getPindg()%></div>
				</div>
			</div>
			<div class="box"
				style="width: 600px; vertical-align: top; text-align: center">
				<div
					style="border: 1px solid #D0D0D0; font-size: 25px; height: 400px; background: white; border-radius: 4px;">
					<div class="RstarRev box" style="margin: auto; padding-top: 50px;">
						<span class="RstarR on">별1</span> <span class="RstarR on">별2</span>
						<span class="RstarR on">별3</span> <span class="RstarR on">별4</span>
						<span class="RstarR">별5</span> <span style="font-size: 30px">4.0</span>
					</div>
					<hr style="width: 300px; background-color: #D0D0D0">
					<div style="border: 1px solid black; height: 250px;">그래프 들어갈
						공간</div>
				</div>
				<form action="<%=request.getContextPath()%>/review.rv"
					method="post">
					<input name="userid" value="<%= mh.getUserId() %>" />
					<input name="pno" value=<%= p.getPno() %> />
					<input name="rank" value="1" />
					
					<div style="border: 1px solid #D0D0D0; margin-top: 10px; background: white; border-radius: 4px;">
						<div class="box" style="padding-top: 10px">
							<textarea name="content" id="content" cols="50" rows="4"
								style="display: inline-block; resize: none;"></textarea>
						</div>
						<div class="box" style="vertical-align: top; width: 150px; height: 94px; padding-top: 10px">
							<input class="button" type="submit" value="작성하기"  style="vertical-align: top; width: 100%; height: 100%;">
						</div>
						<div>
							<div class="starRev">
								<span class="starR on">별1</span> 
								<span class="starR">별2</span> 
								<span class="starR">별3</span> 
								<span class="starR">별4</span> 
								<span class="starR">별5</span>
							</div>
						</div>

						<div>
						<% if(rlist != null) { %>
							<% for(Review r : rlist) { %>
							<table style="width: 100%" border="1">
								<tr>
									<td colspan="3" style="text-align: right; padding: 10px"><%= r.getRdate() %></td>

								</tr>
								<tr>
									<td style="width: 200px; padding: 10px"><%= r.getUserid() %></td>
									<td colspan="2" style="text-align: left"><%= r.getRrank() %></td>
								</tr>
								<tr>
									<td colspan="3">
										<p id="conP" style="padding-left: 80px; text-align: left"><%= r.getRcontent() %></p>
										<textarea name="" id="" cols="50" rows="4" style="resize:none; display: none"></textarea>
										<button type="button" class="button" onclick="uptConfirm(this)" style="vertical-align: top; width: 100px; height: 85px; display:none">수정</button>
									</td>
								</tr>
								<% if(mh.getUserId().equals(r.getUserid())) { %>
								<tr>
									<td colspan="3">
										<input name="rno" value="<%= r.getRno() %>"/>
										<button type="button" onclick="udtReview(this)">수정하기</button>
									<!-- 	<button type="button" onclick="cancelUdt(this)">수정취소</button> -->
										<button type="button" onclick="delReview(this)">삭제하기</button>						
									</td>
								</tr>
								<% } %>
							</table>
							<br>
							<hr style="width: 550px; background-color: #D0D0D0">
							<% } %>
						<% } %>
							
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
<script>
	$(function() {
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});
	});
	
	function udtReview(obj) {
		$(obj).parent().parent().prev().find('#conP').css('display','none');
		$(obj).parent().parent().prev().find('textarea').css('display','inline');
		$(obj).parent().parent().prev().find('button').css('display','inline');
		$(obj).css('display','none');
		$(obj).siblings().css('display', 'none');
		
	}
	
	function delReview(obj) {
		var result = confirm("리뷰를 삭제하시겠습니까?")
		if(result){
			alert("삭제");
		}else{
			alert("취소");
		}
	}
	
	function uptConfirm(obj) {
		var content = $(obj).siblings('textarea').val();
		
		var rno = $(obj).parent().parent().next().children().find('input').val();
		
		var pno = '<%= p.getPno()%>'
		
		location.href= "/semi/upReview.ur?rno="+rno+"&pno="+pno+"&content="+content;
	}
</script>
</html>