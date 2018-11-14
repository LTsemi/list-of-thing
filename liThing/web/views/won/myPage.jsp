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
	
	.box {
	display: inline-block;
	/* font-family: "Nanum Gothic", sans-serif; */
}


#borderBox{

 margin-top: 0px;
        background-color: rgb(255, 230, 161);
        width: 100%;
        height: 700;
        margin-bottom:0px;
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
			<li class="active"><a href="/semi/selectList.ev">&nbsp;
					위시리스트 &nbsp;</a></li>
			<li><a href="/semi/selectWinList.ev">주문내역</a></li>
		</ul>

		<br /> 
		<br /> 

		
		
		<div id= "borderBox">
<br />
<br />
<br />
		<div id="dbox" class="box"
			style="margin-left: 20px; width: 660px; background: white; vertical-align: top; border: 1px solid #D0D0D0; border-radius: 4px">
			<table id="rList"
				style="width: 659px; height: 150px; text-align: center; border-radius: 4px">


				<tr>
					<td style="display: none"><b> p.getPno() %></b></td>
					<td style="width: 100px; height: 150px;"><b>번호</b></td>
					<td style="width: 100px; height: 150px;"><img
						src="/semi/resources/productImg/" width="200px" height="150px"
						style="max-height: 100%; max-width: 100%; max-height: 100%; max-width: 100%; background-color: transparent; !important" />
					</td>
					<td style="text-align: left">
						<ul style="text-align: left; list-style: none;">
							<li><h5 style="color: red">p.getBrand() %></h5></li>
							<li><h4>p.getPname() %></h4></li>
							<li><h5>p.getPprice() %></h5></li>
						</ul>
					</td>
					<td style="width: 250px; height: 150px;">p.getRank() %></td>
				</tr>


			</table>

		</div>
		
		

<br />
<br />
<br />


		<div id="dbox2" class="box"
			style="margin-left: 20px; width: 660px; background: white; vertical-align: top; border: 1px solid #D0D0D0; border-radius: 4px">
			<table id="rList"
				style="width: 659px; height: 150px; text-align: center; border-radius: 4px">


				<tr>
					<td style="display: none"><b> p.getPno() %></b></td>
					<td style="width: 100px; height: 150px;"><b>번호</b></td>
					<td style="width: 100px; height: 150px;"><img
						src="/semi/resources/productImg/" width="200px" height="150px"
						style="max-height: 100%; max-width: 100%; max-height: 100%; max-width: 100%; background-color: transparent; !important" />
					</td>
					<td style="text-align: left">
						<ul style="text-align: left; list-style: none;">
							<li><h5 style="color: red">p.getBrand() %></h5></li>
							<li><h4>p.getPname() %></h4></li>
							<li><h5>p.getPprice() %></h5></li>
						</ul>
					</td>
					<td style="width: 250px; height: 150px;">p.getRank() %></td>
				</tr>


			</table>

		</div>
	</div>

	<br />
	
	
	
	<button><<<</button>&nbsp;<button>1</button> &nbsp;<button>2</button> &nbsp;<button>>>></button>
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
	
	
	
	
	
	</div>
<br />
<br />


	<%@ include file="../common/footer.jsp"%>



</body>
</html>