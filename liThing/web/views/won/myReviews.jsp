<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	%>
<%
	/* ArrayList<Event> list = (ArrayList<Event>) request.getAttribute("list"); */
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
.thumbnail:hover {
		opacity:0.8;
		cursor:pointer;
	}
	



/* #borderBox{

 margin-top: 0px;
        background-color: rgb(255, 230, 161);
        width: 100%;
        height: 700;
        margin-bottom:0px;
} */

#paging{
    background-color: white;
	color: black;
	border: 0.5px solid #BDBDBD;
	height: 24px;
}

.bubble {
    position: relative;
    background: #ffda91;
    color: #000000;
    font-family: Arial;
    font-size: 19px;
    line-height: 58px;
    box-shadow: 5px 5px 8px -1px #a3a3a3;
    text-align: center;
    width: 700px;
    height: 260px;
    border-radius: 10px;
    padding: 15px;
}
.bubble:after {
    content: '';
    position: absolute;
    display: block;
    width: 0;
    z-index: 1;
    border-style: solid;
    border-color: transparent #ffda91;
    border-width: 24px 0 24px 62px;
    top: 33%;
    right: -60px;
    margin-top: -24px;
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
		<h2>Mypage</h2>

		<br>

		<ul class="nav nav-tabs">
			<li ><a href="/semi/views/won/myPage.jsp">&nbsp;
					위시리스트 &nbsp;</a></li>
			<li><a href="/semi/orderList.mp">주문내역</a></li>
			<li class="active"><a href=" ">내가 작성한 리뷰</a></li>
		</ul>

		<br /> 
		<br /> 

		
		
		<!-- <div id= "borderBox"> -->
<br />
<br />
<br />

<div class="row">
<div class="col-sm-9">
<div class="bubble">맛있어요</div>
</div>
<br />	

<img src="../../resources/img/portfolio_item_8.png" width="220px" height="220px" >
</div>
	
<br />
<br />
<br />

<div class="row">
<div class="col-sm-9">
<div class="bubble">맛있어요</div>
</div>
<br />	

<img src="../../resources/img/portfolio_item_8.png" width="220px" height="220px" >
</div>

	<br />
	<br />
	<br />
	
	
	
	<button id="paging"><<<</button>&nbsp;<button id="paging">1</button> &nbsp;<button id="paging">2</button> &nbsp;<button id="paging">>>></button>
		<%-- <div class="pagingArea" align="center">
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
			
		</div> --%>
	
	<br />
	<br />
	<br />
	
	
		</div>
	<!-- </div> -->
<br />
<br />


	<%@ include file="../common/footer.jsp"%>



</body>
</html>