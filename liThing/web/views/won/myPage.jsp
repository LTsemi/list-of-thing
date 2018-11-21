<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.buyme.sic.ranking.model.vo.*, java.util.*, com.buyme.won.notice.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");

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
}


#borderBox{

 margin-top: 0px;
        background-color: rgb(255, 230, 161);
        width: 100%;
        height: 700;
        margin-bottom:0px;
}

#paging{
    background-color: white;
	color: black;
	border: 0.5px solid #BDBDBD;
	height: 24px;
}

table {
	
	table-layout: fixed;
	width: 659px;
	height: 150px; 
	text-align: center; 
	border-radius: 4px
}

.delBtn {

-webkit-border-radius: 4;
  -moz-border-radius: 4;
  border-radius: 4px;
  font-family: Arial;
  color: #ffffff;
  
 
  background: #ffbe3b;
  text-decoration: none;

}

.delBtn:hover {
  background: #fcb63c;
  text-decoration: none;
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
			<li class="active"><a href=" ">&nbsp;
					위시리스트 &nbsp;</a></li>
			<li><a href="/semi/sOrder.mp?userid=<%= mh.getUserId() %>">주문내역</a></li>
			<li><a href="/semi/sMyreview.mp?userid=<%= mh.getUserId()%>">내가 작성한 리뷰</a></li>
		</ul>

		<br /> 
		<br /> 

		
		
		<div id= "borderBox">
<br />
<br />
<br />
	<% for(Product pr : list) {%>
		<div id="dbox" class="box"
			style="margin-left: 20px; width: 660px; background: white; vertical-align: top; border: 1px solid #D0D0D0; border-radius: 4px">
			<table id="rList">
				<tr>

					<td style="width: 100px; height: 150px;"><img
						src="/semi/resources/productImg/<%= pr.getCname() %>" width="140px" height="150px"
						style="max-height: 97%;  background-color: transparent; !important" />
					</td>
					<td style="text-align: left">
						<ul style="text-align: left; list-style: none;">
							<li><h5 style="color: red"><%=pr.getBrand() %></h5></li>
							<li><h4><%= pr.getPname() %></h4></li>
							<li><h5><%= pr.getPprice() %></h5></li>
						</ul>
					</td>
					<td style="width: 250px; height: 150px;"><%= pr.getRank() %></td>
					<td><button class="delBtn" onclick="deleteWish(this);" id="<%= pr.getPno() %>">삭제하기</button></td>
				</tr>


			</table>
			
		</div>
		
		<% } %>
<br />
<br />
<br />
	<script>
		function deleteWish(obj){
			var val = confirm("정말로 위시리스트에서 삭제하시겠습니까? ");
			if(val == true){
				var thisid = $(obj).attr('id');
				
/* 				console.log(thisid);
				console.log($('#userid'+thisid).val()); */

				location.href='<%= request.getContextPath() %>/mdeleteWish.mp?userid=<%= mh.getUserId() %>&pno='+ thisid; 
			}
		}
		
	</script>

	<br />
	<br />
	<br />
		<div class="pagingArea" align="center">
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/sWish.mp?currentPage=1&userid=<%= mh.getUserId()%>'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button id="paging" disabled><</button>
			<%  }else{ %>
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/sWish.mp?currentPage=<%=currentPage - 1 %>&userid=<%= mh.getUserId()%>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button id="paging" disabled><%= p %></button>
			<%      }else{ %>
				<button id="paging" onclick="location.href='<%= request.getContextPath() %>/sWish.mp?currentPage=<%= p %>&userid=<%= mh.getUserId()%>'"><%= p %></button>
			<%  } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button id="paging" disabled>></button>
			<%  }else{ %>
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/sWish.mp?currentPage=<%=currentPage + 1 %>&userid=<%= mh.getUserId()%>'">></button>
			<%  } %>
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/sWish.mp?currentPage=<%= maxPage %>&userid=<%= mh.getUserId()%>'">>></button>
			
		</div>  
	

	<br />
	<br />
	<br />
	
	
		</div>
	</div>
<br />
<br />


	<%@ include file="../common/footer.jsp"%>



</body>
</html>