<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.buyme.won.notice.model.vo.*, java.util.*"%>

<% 
   ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	int i = 0;
	int endnum = listCount;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>공지사항</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/evtPage.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">

<link href="https://fonts.googleapis.com/css?family=Gugi|Itim"
	rel="stylesheet">

<script
	src="<%= request.getContextPath() %>/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

<script src="<%= request.getContextPath() %>/resources/js/vendor/jquery-3.3.1.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--     Fonts and icons     -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />


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

#accordion .panel-title a::after, #accordion .panel-title a.collapsed::after
	{
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
	width: 650px;
	margin-left: auto;
	margin-right: auto;
}

@font-face {
	font-family: 'NanumSquareRoundR';
	src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
}

body {
	box-sizing: border-box;
	font-family: NanumSquareRoundR !important;
}

#searchBtn, #searchCondition, #insertBtn, #updateBtn, #paging, .numBtn {
	background-color: white;
	color: black;
	border: 0.5px solid #BDBDBD;
	height: 24px;
}

</style>

</head>

<body>

	<%@ include file="../common/header.jsp"%>


	<div class="page-heading2">
		<div class="container">
			<div class="heading-content">
				<h1>
					list of<em>thing :)</em>
				</h1>
			</div>
		</div>
	</div>

	<div class="outer" style="auto">

		
	 <div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center wow zoomIn">
					<br />
					
						<h1 id="ttitle" style="font-family: Gugi;" onclick="repage();">공지사항</h1>
						
						<span></span>
						<!-- <p>Our Frequently Asked Questions here.</p> -->
					</div>
				</div>
			</div>
			

			<div class="row">				
				<div class="col-md-12">
        
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<% for(Notice n : list){ %>
					<% if((i%5 == 0)){ %>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										<span name="title"><%= n.getNtitle() %></span>
									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<p name="nno">No.<%= endnum %></p>
									<p><hr /></p>
									<p name="content"><%= n.getNcontent() %></p>
									<p><hr /></p>
									<p>작성자 : <%= n.getNwriter() %> &nbsp;  작성일 : <%= n.getNdate() %>&nbsp;&nbsp;
									<% if( mh != null && mh.getUserId().equals("admin")) { %>
						            <button id="updateBtn" onclick="location.href='nUpView.no?nno=<%=n.getNno()%>'">수정하기</button>
					                <% } %>
									 </p>
								</div>
							</div>
						</div>
					<% } else if(i%5 == 1 || i%5 == 6){%>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										<span name="title"><%= n.getNtitle() %></span>
									</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<p>No.<%= endnum %></p>
									<p><hr /></p>
									<p name="content"><%= n.getNcontent() %></p>
									<p><hr /></p>
									<p>작성자 : <%= n.getNwriter() %> &nbsp;  작성일 : <%= n.getNdate() %>&nbsp;&nbsp;
									<% if( mh != null && mh.getUserId().equals("admin")) { %>
						            <button id="updateBtn" onclick="location.href='nUpView.no?nno=<%=n.getNno()%>'">수정하기</button>
					                <% } %>
									 </p>
								</div>
							</div>
						</div>
						<% }else if(i%5 == 2 || i%5 == 7){ %>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
										<span name="title"><%= n.getNtitle() %></span>
									</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									<p>No.<%= endnum %>></p>
									<p><hr /></p>
									<p name="content"><%= n.getNcontent() %></p>
									<p><hr /></p>
									<p>작성자 : <%= n.getNwriter() %> &nbsp;  작성일 : <%= n.getNdate() %>&nbsp;&nbsp;
									<% if( mh != null && mh.getUserId().equals("admin")) { %>
						            <button id="updateBtn" onclick="location.href='nUpView.no?nno=<%=n.getNno()%>'">수정하기</button>
					                <% } %>
									</p>
								</div>
							</div>
						</div>
						<% }else if(i%5 == 3 || i%5 == 8){ %>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFour">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
										<span name="title"><%= n.getNtitle() %></span>
									</a>
								</h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
								<div class="panel-body">
									<p>No.<%= endnum %></p>
									<p><hr /></p>
									<p name="content"><%= n.getNcontent() %></p>
									<p><hr /></p>
									<p>작성자 : <%= n.getNwriter() %> &nbsp;  작성일 : <%= n.getNdate() %>&nbsp;&nbsp;
									<% if( mh != null && mh.getUserId().equals("admin")) { %>
						            <button id="updateBtn" onclick="location.href='nUpView.no?nno=<%=n.getNno()%>'">수정하기</button>
					                <% } %>
									</p>
								</div>
							</div>
						</div>
						<% }else if(i%5 == 4 || i%5 == 9){ %>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFive">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
										<%= n.getNtitle() %>
									</a>
								</h4>
							</div>
							<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
								<div class="panel-body">
									<p>No.<%= endnum %></p>
									<p><hr /></p>
									<p name="content"><%= n.getNcontent() %></p>
									<p><hr /></p>
									<p>작성자 : <%= n.getNwriter() %> &nbsp;  작성일 : <%= n.getNdate() %>&nbsp;&nbsp;
									<% if( mh != null && mh.getUserId().equals("admin")) { %>
						            <button id="updateBtn" onclick="location.href='nUpView.no?nno=<%=n.getNno()%>'">수정하기</button>
					                <% } %>
									</p>
								</div>
							</div>
						</div>
						<%} %>
						<% i++;%>
						<% endnum--; %>
					<% } %>	
					</div>
				</div><!--- END COL -->	
				
			</div><!--- END ROW -->		
			
		</div>
	</div>
	
	<br />
		<%-- 페이지 처리 --%>
		<div class="pagingArea" align="center">
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button id="paging" disabled><</button>
			<%  }else{ %>
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button id="paging" disabled><%= p %></button>
			<%      }else{ %>
				<button id="paging" onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=<%= p %>'"><%= p %></button>
			<%  } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button id="paging" disabled>></button>
			<%  }else{ %>
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=<%= maxPage %>'">>></button>
			
		</div>
	
	<br />

	<div class="searchArea" align="center">
		<select id="searchCondition" name="searchCondition">
			<option value="">---</option>
			<option value="writer">작성자</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select> 
		<input type="search" id="keyword" placeholder="키워드를 입력하세요:)">
		<button type="button" id="searchBtn" onclick="search();">검색하기</button>
		<% if(mh != null){ %>
		<button id="insertBtn" onclick="location.href='views/won/noticeInsertForm.jsp'">작성하기</button>
		<% } %>

	</div>
	<br />
	<br />

	<%@ include file="../common/footer.jsp"%>
	
	<script>
		
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
		
		function search(){
			location.href="<%=request.getContextPath()%>/searchNotice.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
		
		function repage(){
			location.href="/semi/selectList.no"; 

		};

	</script>

</body>
</html>