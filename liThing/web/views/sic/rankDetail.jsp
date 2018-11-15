<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.buyme.sic.ranking.model.vo.*, com.buyme.sic.review.model.vo.*, java.util.*"%>
<%
	Product p = (Product) request.getAttribute("dRank");
	AvgReview ar = (AvgReview) request.getAttribute("aReview");
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

.gstarR {
	background: url('/semi/resources/img/ico.png') no-repeat right 0;
	background-size: auto 100%;
	width: 20px;
	height: 20px;
	display: inline-block;
	text-indent: -9999px;

}

.gstarR.on {
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


.ustarR {
	background: url('/semi/resources/img/ico.png') no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
}

.ustarR.on {
	background-position: 0 0;
}

.button {
	background-color: #F7603E;
	border-radius: 4px;
	border: 1px solid #D0D0D0;
	color: white;
	outline: none;
}

.graph { 
		display: inline-block;
        position: relative; 
        width: 300px; 

	
		font-size:11px;
		background-color: lightgray;

    }
    
.gtext {
		display: inline-block;
        position: relative; 
        width: 180px; 
		padding: 2px;
      	border:1px soild black;
		font-size:20px;
		vertical-align: top;
			
}
.graph .bar { 
        display: block;
        position: relative;
        background: #FF7385; 
        text-align: center; 
        color: #333; 
        height: 3em; 
        line-height: 3em;            
    }
    
.gNum{
		margin-left: 5px;
		display: inline-block; 
		text-align: center; 
		font-size: 15px; 
		vertical-align: top;
		width: 40px;
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
						style="border: 1px solid #D0D0D0; padding: 20px; background: white; border-radius: 4px; text-align: left; width: 400px">
						<%=p.getPindg()%></div>
				</div>
			</div>
			<div class="box"
				style="width: 600px; vertical-align: top; text-align: center">
				<div
					style="border: 1px solid #D0D0D0; font-size: 25px; height: 400px; background: white; border-radius: 4px;">
					<div class="RstarRev box" style="margin: auto; padding-top: 50px;">
						<span class="RstarR on">별1</span> 
						<span class="RstarR on">별2</span>
						<span class="RstarR on">별3</span> 
						<span class="RstarR on">별4</span>
						<span class="RstarR">별5</span> 
						<span style="font-size: 30px" id="avgRank"><%= p.getRank()%></span>
					</div>
					<hr style="width: 300px; background-color: #D0D0D0">
					<div style=" height: 250px; padding: 30px;">
						<div>
							<div class="graph">
							<strong class="bar" style="width: 24%;"></strong>
							</div>
							<div class="gtext" >
								<span class="gstarR on">별1</span> 
								<span class="gstarR on">별2</span>
								<span class="gstarR on">별3</span> 
								<span class="gstarR on">별4</span>
								<span class="gstarR on">별5</span> 
								<span class="gNum"><strong>1992</strong></span>
							</div>
							<div class="graph">
							<strong class="bar" style="width: 24%; "></strong>
							</div>
							<div class="gtext" >
								<span class="gstarR on">별1</span> 
								<span class="gstarR on">별2</span>
								<span class="gstarR on">별3</span> 
								<span class="gstarR on">별4</span>
								<span class="gstarR ">별5</span> 
								<span class="gNum"><strong>1992</strong></span>
							</div>
							<div class="graph">
							<strong class="bar" style="width: 24%;"></strong>
							</div>
							<div class="gtext" >
								<span class="gstarR on">별1</span> 
								<span class="gstarR on">별2</span>
								<span class="gstarR on">별3</span> 
								<span class="gstarR ">별4</span>
								<span class="gstarR ">별5</span> 
								<span class="gNum"><strong>1992</strong></span>
							</div>
							<div class="graph">
							<strong class="bar" style="width: 24%;"></strong>
							</div>
							<div class="gtext" >
								<span class="gstarR on">별1</span> 
								<span class="gstarR on">별2</span>
								<span class="gstarR ">별3</span> 
								<span class="gstarR ">별4</span>
								<span class="gstarR ">별5</span> 
								<span class="gNum"><strong>1992</strong></span>
							</div>
							<div class="graph">
							<strong class="bar" style="width: 24%;"></strong>
							</div>
							<div class="gtext" >
								<span class="gstarR on">별1</span> 
								<span class="gstarR ">별2</span>
								<span class="gstarR ">별3</span> 
								<span class="gstarR ">별4</span>
								<span class="gstarR ">별5</span> 
								<span class="gNum"><strong>1992</strong></span>
							</div>
						</div>
						
					</div>
				</div>
				<form action="<%=request.getContextPath()%>/review.rv"
					method="post">
					<input type="hidden" name="userid" value="<%= mh.getUserId() %>" />
					<input type="hidden" name="pno" value=<%= p.getPno() %> />
					<input type="hidden" name="rank" value="1" />
					
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
							<table style="width: 100%">
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
										<textarea cols="50" rows="4" style="resize:none; display: none"></textarea>
										<button type="button" class="button" onclick="uptConfirm(this)" style="vertical-align: top; width: 100px; height: 85px; display:none">수정</button><br />
										<div class="ustarRev" style="display: none">
											<span class="ustarR on">별1</span> 
											<span class="ustarR">별2</span> 
											<span class="ustarR">별3</span> 
											<span class="ustarR">별4</span> 
											<span class="ustarR">별5</span>
										</div>
										<input type="hidden" name="urank" value="1" />
									</td>
								</tr>
								<% if(mh.getUserId().equals(r.getUserid())) { %>
								<tr>
									<td colspan="3">
										<input type="hidden" name="rno" value="<%= r.getRno() %>"/>
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
		<%-- console.log(<%= p.getRank() %>); --%>
		if(<%= p.getRank() %> == 5){
			console.log("5개");	
			$('.RstarRev span').prevAll('span').addClass('on');
		}else if(<%= p.getRank() %> >= 4.0 && <%= p.getRank() %> <= 4.99){
			$('.RstarRev span').prevAll('span').addClass('on');
			$('.RstarRev span').parent().children('span').eq(4).removeClass('on');
		}else if(<%= p.getRank() %> >= 3.0 && <%= p.getRank() %> <= 3.99){
			$('.RstarRev span').prevAll('span').addClass('on');
			$('.RstarRev span').parent().children('span').eq(4).removeClass('on');
			$('.RstarRev span').parent().children('span').eq(3).removeClass('on');
		}else if(<%= p.getRank() %> >= 2.0 && <%= p.getRank() %> <= 2.99){
			$('.RstarRev span').prevAll('span').addClass('on');
			$('.RstarRev span').parent().children('span').eq(4).removeClass('on');
			$('.RstarRev span').parent().children('span').eq(3).removeClass('on');
			$('.RstarRev span').parent().children('span').eq(2).removeClass('on');
		}else{
			$('.RstarRev span').prevAll('span').removeClass('on');
			$('.RstarRev span').parent().children('span').eq(0).addClass('on');
		}
	
		
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			$(this).parent().parent().parent().prev().val($('.starR.on').length);
			
			return false;
		});
		
		$('.ustarRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			$(this).parent().next().val($(this).parent().children('.on').length);
			
			return false;
		});
		
		var cnt5 = 0;
		var cnt4 = 0;
		var cnt3 = 0;
		var cnt2 = 0;
		var cnt1 = 0; 
		var cnt = new Array();
		
		
		<% for(Review r : rlist) { %>
	
			if(<%=r.getRrank()%> == 5){
				cnt[0] = ++cnt5;
			}else if(<%=r.getRrank()%> == 4){
				cnt[1] = ++cnt4;
			}else if(<%=r.getRrank()%> == 3){
				cnt[2] = ++cnt3;
			}else if(<%=r.getRrank()%> == 2){
				cnt[3] = ++cnt2;
			}else{
				cnt[4] = ++cnt1;
			}
		<% } %>
		
		
		var tmp=cnt[0];
		
		// 6,3,2,7,1
		
		
		for(var i=0; i<4; i++){
			if(tmp<cnt[i+1]){
				tmp = cnt[i+1];
			}
		}
		
		
		/* console.log("cnt5:" + cnt5);
		console.log("cnt4:" + cnt4);
		console.log("cnt3:" + cnt3);
		console.log("cnt2:" + cnt2);
		console.log("cnt1:" + cnt1);
		
		
		console.log(cnt[4]);
		console.log(((100 /  tmp) * cnt5)); */
		
		$('.bar').eq(0).css('width', (((100 /  tmp) * cnt5)+'%'));
		$('.bar').eq(1).css('width', (((100 /  tmp)  * cnt4)+'%'));
		$('.bar').eq(2).css('width', (((100 /  tmp)  * cnt3)+'%'));
		$('.bar').eq(3).css('width', (((100 /  tmp) * cnt2)+'%'));
		$('.bar').eq(4).css('width', (((100 /  tmp)  * cnt1)+'%'));
		
		$('.gNum').eq(0).html('<strong>' + cnt5 + '</strong>');
		$('.gNum').eq(1).html('<strong>' + cnt4 + '</strong>');
		$('.gNum').eq(2).html('<strong>' + cnt3 + '</strong>');
		$('.gNum').eq(3).html('<strong>' + cnt2 + '</strong>');
		$('.gNum').eq(4).html('<strong>' + cnt1 + '</strong>');
		
	});
	
	function udtReview(obj) {
		$(obj).parent().parent().prev().find('#conP').css('display','none');
		$(obj).parent().parent().prev().find('textarea').css('display','inline');
		$(obj).parent().parent().prev().find('button').css('display','inline');
		$(obj).parent().parent().prev().find('.ustarRev').css('display','inline');
		$(obj).css('display','none');
		$(obj).siblings().css('display', 'none');
		
	}
	
	function delReview(obj) {
		var result = confirm("리뷰를 삭제하시겠습니까?")
		var rno = $(obj).prev().prev().val();
		if(result){
			var pno = '<%= p.getPno()%>'

			location.href="/semi/delReview.dr?rno="+rno+"&pno="+pno;
			
		}else{
			alert("리뷰삭제를 취소하였습니다.");
		}
	}
	
	function uptConfirm(obj) {
		var content = $(obj).siblings('textarea').val();
		
		var rno = $(obj).parent().parent().next().children().find('input').val();
		
		var rank = $(obj).siblings('input[name=urank]').val();

		var pno = '<%= p.getPno()%>'
		
		location.href= "/semi/upReview.ur?rno="+rno+"&pno="+pno+"&content="+content+"&rank="+rank;
	}
</script>
</html>