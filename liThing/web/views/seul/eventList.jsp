<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.buyme.seul.event.model.vo.*"%>
<%
	ArrayList<Event> list = (ArrayList<Event>) request.getAttribute("list");
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

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/event.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
@font-face {
	font-family: 'NanumSquareRoundR';
	src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
}

body {
	box-sizing: border-box;
	font-family: NanumSquareRoundR !important;
}
.thumbnailori:hover {
		opacity:0.8;
		cursor:pointer;
	}

.endevt {
	width:790px;
	text-shadow: 1px 1px 2px #666;
	color: white;
	position:absolute;
	margin: 80px auto;
	text-align: center;
	font-size: 20px;
	line-height: 24px;
}
.image-cover{
	/* 이벤트 기간 지날 시 어두운색으로 가리고 종료된 이벤트입니다 문자 띄우기 */

	position: relative;
	background:rgba(0, 0, 0, 0.6);
} 
.image-cover:HOVER {
	opacity:1;
}
</style>

</head>

<body>

	<%@ include file="../common/header.jsp" %>

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
		<br>
		<h2>Event</h2>
		<p>혜택이 가득한 리띵박스의 이벤트에 참여해보세요^_^</p>
		<br>

		<ul class="nav nav-tabs">
			<li class="active"><a href="/semi/selectList.ev">&nbsp; 이벤트 &nbsp;</a></li>
			<li><a href="/semi/selectWinList.ev">당첨자발표</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<!--   이벤트 창    -->
				<div id="lithingevt">
					<br>
					<br>
					
					<% if(mh != null && mh.getUserId().equals("admin")){ %> 
					<!-- <a href="views/seul/eventPageInsertForm.jsp" class="listbtn">이벤트 추가</a> -->
					<a href="/semi/eventManager.ev" class="listbtn">이벤트 관리</a>
					<% } %>

					<br>
					<br>
					<div class="row">
						<%
							for (Event evt : list) {
								if(evt.getDday() >0){
						%>
						<div class="thumbnail thumbnailori">
							<input type="hidden" name="eno" value="<%= evt.getEno() %>"/>
								<p class="evtImg">
									<img
										src="/semi/resources/eventUploadFiles/<%=evt.getE_cname()%>"
										width="770px">
								</p> <span class="dday">D-<%=evt.getDday()%></span>
								<div class="evtText">
									<h3><%=evt.getEvttitle()%></h3>
									<p><%=evt.getEvtdate()%>
										~
										<%=evt.getEvtdateend()%>까지
									</p>
								</div>
							
						</div>
						<%  }else if(evt.getDday() ==0){  %>
							<div class="thumbnail thumbnailori">
							<input type="hidden" name="eno" value="<%= evt.getEno() %>"/>
								<p class="evtImg">
									<img
										src="/semi/resources/eventUploadFiles/<%=evt.getE_cname()%>"
										width="770px">
								</p> <span class="dday">D-day</span>
								<div class="evtText">
									<h3><%=evt.getEvttitle()%></h3>
									<p><%=evt.getEvtdate()%>
										~
										<%=evt.getEvtdateend()%>까지
									</p>
								</div>
							
						</div>
						<%  }else{  %>
							<div class="thumbnail image-cover" >
							<p class="endevt">종료된 이벤트 입니다 ^_^</p>
							<input type="hidden" name="eno" value="<%= evt.getEno() %>"/>
								<p class="evtImg">
									<img style="opacity:0.5;"
										src="/semi/resources/eventUploadFiles/<%=evt.getE_cname()%>"
										width="770px">
								<div class="evtText">
									<h3><%=evt.getEvttitle()%></h3>
									<p><%=evt.getEvtdate()%>
										~
										<%=evt.getEvtdateend()%>까지
									</p>
								</div>
							</div>
						<% 		}
							}
						%>
					<br>
					<br>
					<br>
					<br>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		$(".thumbnailori").click(function(){
			var eno = $(this).children().eq(0).val();
			location.href="<%=request.getContextPath()%>/selectOne.ev?eno="+ eno;
			console.log(eno);
			});
		});
	</script>



	<%@ include file="../common/footer.jsp"%>



</body>
</html>