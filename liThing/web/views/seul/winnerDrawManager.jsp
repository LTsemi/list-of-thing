<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.buyme.seul.event.model.vo.*,
    		com.buyme.seul.eventComment.model.vo.*"%>
<%
	Event e = (Event)request.getAttribute("event");
	//댓글 리스트
	ArrayList<EventComment> clist = (ArrayList<EventComment>) request.getAttribute("clist");
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
	href="<%=request.getContextPath()%>/resources/css/templatemo-style.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
@font-face {
	font-family: 'NanumSquareRoundR';
	src: url('<%= request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf');
}

body {
	box-sizing: border-box;
	font-family: NanumSquareRoundR !important;
}
</style>

</head>

<body>

	<%@ include file="../common/header.jsp"%>

	<div class="page-heading">
		<div class="container">
			<div class="heading-content">
				<h1>
					list of<em>thing ;)</em>
				</h1>
			</div>
		</div>
	</div>

	<div id="eventPage">



		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<!--   이벤트 창    -->
				<div id="lithingevt">
					<br> <br>

				<form action="<%=request.getContextPath()%>/winnerSave.ev" method="post">
					<div class="thumbnail"
						style="width: 90%; max-width:950px; margin: 0 auto; padding: 20px;">
						
						<%-- <input type="hidden"  name="winner_cut" value="<%=e.getWinner_cnt()%>"/> --%>
						<table class="evtMgtBox" border="1"
							style="width: 95%; text-align: center; margin: 20px auto;">
							<caption
								style="text-align: center; font-size: 18px; font-weight: 600">이벤트 응모자 조회</caption>
							<tr>
								<th style="text-align: center;">응모자 ID</th>
								<th style="text-align: center;">응모자 이름</th>
							</tr>
							<% for(EventComment ec : clist){ %>
							<tr>
								<td>
								<input type="hidden"  name="winner_cut" value="<%=ec.getUserCnt()%>"/>
								<input type="hidden"  name="cwriter" value="<%=ec.getCwriter()%>"/>								
								<%= ec.getCwriter() %></td>
								<td><input type="hidden"  name="eno" value="<%=ec.getEno()%>"/><%= ec.getUserName() %></td>
							</tr>
							<% } %>

						</table>
						
						<div class="box" style="width: 95%; margin: 0 auto; text-align: center;">							
							<button type="submit">추첨 확인</button> &nbsp;
							<button type="reset" class="udtBtn" onclick="location.href='eventManager.ev'">돌아가기</button>
						</div>
					</div>
				</form>
				
					<br> <br> <br> <br>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="../common/footer.jsp"%>



</body>
</html>