<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.buyme.seul.event.model.vo.*, java.util.*"%>
<%
	ArrayList<Event> list = (ArrayList<Event>) request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
		<br>
		<h2>Event</h2>
		<p>혜택이 가득한 리띵박스의 이벤트에 참여해보세요^_^</p>
		<br>

		<ul class="nav nav-tabs">
			<li><a href="/semi/selectList.ev">&nbsp; 이벤트 &nbsp;</a></li>
			<li class="active"><a href="eventWin.jsp">당첨자발표</a></li>
		</ul>
		<br /><br />
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">

				<div id="lithingevt">
					<!--   이벤트 창    -->
					<% if(mh != null && mh.getUserId().equals("admin")){ %> 
					<a href="views/seul/winnerPageInsertForm.jsp" class="listbtn" >작성하기</a>
					<% } %>
			
					<table class="table table-hover" id="listArea">
						<thead>
							<tr>
								<th style="text-align: center;">No</th>
								<th style="text-align: center;">이멘트명</th>
								<th style="text-align: center;">등록일</th>
							</tr>
						</thead>
						<tbody>
						<% for(Event evt : list){ %>
							<tr>
								<td style="display: none;"><%= evt.getEvtEno() %></td>
								<td><%= evt.getEno() %></td>
								<td><%= evt.getEvttitle() %></td>
								<td><%= evt.getEvtdate() %></td>
							</tr>
						<% } %>

						</tbody>
					</table>
					<br>
					<br>
					<!-- 페이지 이동 버튼 -->
					<!-- <div class="row mb-2"> -->
					<div class="pagingArea">
						<!--  <nav aria-label="Page"> -->
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/selectWinList.ev?currentPage=1" aria-label="Previous"> <span aria-hidden="true">«</span> <span
									class="sr-only">Previous</span>
							</a></li>
							<%  if(currentPage <= 1){  %>
							<li class="page-item"><a class="page-link" style="text-decoration:none; color: #333; cursor: default;"><</a></li>
							<%  }else{ %>
							<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/selectWinList.ev?currentPage=<%=currentPage - 1 %>"><</a></li>
							<%  } %>
							
							<% for(int p = startPage; p <= endPage; p++){
									if(p == currentPage){	
							%>
								<li class="page-item"><a class="page-link" style="text-decoration:none; color: #333; cursor: default;" ><%= p %></a></li>
							<%      }else{ %>
							<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/selectWinList.ev?currentPage=<%= p %>"><%= p %></a></li>
							<%      } %>
							<% } %>
								
							<%  if(currentPage >= maxPage){  %>
							<li class="page-item"><a class="page-link" style="text-decoration:none; color: #333; cursor: default;" >></a></li>
							<%  }else{ %>
							<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/selectWinList.ev?currentPage=<%=currentPage + 1 %>">></a></li>
							<%  } %>
							<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/selectWinList.ev?currentPage=<%= maxPage %>"
								aria-label="Next"> <span aria-hidden="true">»</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
						<!--  </nav> -->
					</div>
					<!-- </div> -->

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
			$("#listArea td").click(function(){
				var evtEno =  $(this).parent().children().eq(0).text();
				var eno = $(this).parent().children().eq(1).text();
				console.log(evtEno);
				location.href="/semi/eSelectWin.ev?eno="+ eno+"&evtEno="+evtEno;			
			});
		});
	</script>

	<%@ include file="../common/footer.jsp"%>


</body>
</html>