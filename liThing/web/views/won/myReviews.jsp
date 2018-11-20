<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.buyme.sic.ranking.model.vo.*, com.buyme.sic.review.model.vo.*, java.util.* , com.buyme.won.notice.model.vo.*"%>
<%
	Product p = (Product) request.getAttribute("dRank");
	ArrayList<Review> rlist = (ArrayList<Review>) request.getAttribute("rlist");
	
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
 <title>리띵 마이리뷰</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">


<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/event.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
    background: linear-gradient(137deg, #ffffff 100%, #d6eb3b 100%);
    color: #ffa200;
    font-family: Arial;
    font-size: 17px;
    line-height: 30px; 
    filter: drop-shadow(5px 5px 5px #a3a3a3);
    text-align: center;
    width: 700px;
    height: 260px;
    border-radius: 21px;
    padding: 30px;
}
.bubble:after {
    content: '';
    position: absolute;
    display: block;
    width: 0;
    z-index: 1;
    border-style: solid;
    border-color: transparent #ffffff;
    border-width: 23px 0 23px 46px;
    top: 30%;
    right: -46px;
    margin-top: -23px;
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
			<li ><a href="/semi/sWish.mp?userid=<%=mh.getUserId()%>">&nbsp;
					위시리스트 &nbsp;</a></li>
			<li><a href="/semi/sOrder.mp?userid=<%= mh.getUserId() %>">주문내역</a></li>
			<li class="active"><a href=" ">내가 작성한 리뷰</a></li>
		</ul>

		<br /> 
		<br /> 

		<!-- <div id= "borderBox"> -->

		<%
			for (Review r : rlist) {
		%>
		
<br />
		
		<div class="row">
			<div class="col-sm-9">
				<div class="bubble">

					<%=r.getRcontent()%>

				</div>
			</div>
			<img src="/semi/resources/productImg/<%=r.getC_name()%>"
				width="170px" height="170px"> <br /> <br /> 
			작성자 :&nbsp;<input type="text" id="id" name="id" value="<%=mh.getUserId()%>" style="width: 108px;" readonly /> <br /> 
			작성일 :&nbsp;<input type="text" id="rdate" name="rdate" value= <%=r.getRdate()%> style="width: 108px;" readonly /> <br /> 
			&nbsp;&nbsp;별점 :&nbsp;<input type="text" id="rank" name="rank" value=" <%=r.getRrank()%>" style="width: 30px;" readonly />
			<button class="delBtn" onclick="deleteRview(this);" id="<%= r.getRno() %>">삭제하기</button>


		</div>
		
	<br />
	<br />
		<% } %>
		
		<script>
		
		function deleteRview(obj){
			var val = confirm("정말로 내가 작성한 리뷰를 삭제하시겠습니까?");
			if(val == true){
				var thisid = $(obj).attr('id');
				 
				console.log(thisid);
				console.log($('#userid'+thisid).val());
				
				location.href='<%= request.getContextPath() %>/deleteMyRview.mp?userid=<%= mh.getUserId() %>&rno='+ thisid;
			}
		}
		
		</script>

	
		 <div class="pagingArea" align="center">
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/sMyreview.mp?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button id="paging" disabled><</button>
			<%  }else{ %>
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/sMyreview.mp?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int pg = startPage; pg <= endPage; pg++){
					if(pg == currentPage){	
			%>
				<button id="paging" disabled><%= pg %></button>
			<%      }else{ %>
				<button id="paging" onclick="location.href='<%= request.getContextPath() %>/sMyreview.mp?currentPage=<%= pg %>&userid=<%= mh.getUserId()%>'"><%= pg %></button>
			<%  } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button id="paging" disabled>></button>
			<%  }else{ %>
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/sMyreview.mp?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button id="paging" onclick="location.href='<%= request.getContextPath() %>/sMyreview.mp?currentPage=<%= maxPage %>'">>></button>
			
		</div> 

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