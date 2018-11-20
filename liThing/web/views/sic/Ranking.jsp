<%@page import="java.util.ArrayList, com.buyme.sic.ranking.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	String so = (String)request.getAttribute("sortsts");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리띵 :: 랭킹</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">


<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">   


<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>


<
<style>
@font-face {
    font-family: 'NanumSquareRoundR';
    src: url('<%= request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf');
    }
    
    * 
    { box-sizing: border-box;
    font-family: NanumSquareRoundR; 
    }
.box {
	display: inline-block;
	/* font-family: "Nanum Gothic", sans-serif; */
}

.listcss {
	border: 0.5px solid gray;
	border-top-right-radius: 4px;
	border-top-left-radius: 4px;
	border-bottom-right-radius: 4px;
	border-bottom-left-radius: 4px;
	padding: 5px;
	/* font-family: "Nanum Gothic", sans-serif; */
}

o
.button {
	background: url('<%= request.getContextPath() %>resources/img/reload.png') no-repeat;
	background-size: auto 100%;
	width: 100px;
	height: 30px;
	padding-left: 20px;
	border-radius: 4px;
	border: 1px solid #D0D0D0;
	color: #6E6E6E;
	outline: none;
}

.button:hover {
	color: red;
	border: 1px solid red;
}

#ck-button {
	margin: 4px;
	background-color: #EFEFEF;
	
	border: 1px solid #D0D0D0;
	display: inline-block;
	font-size: 15px;
	outline: none;
}

#ck-button label {
	float: left;
	width: 4.2em;
	height: 1.6em;
}

#ck-button label span {
	text-align: center;
	padding: 5px 1px;
	display: block;
}

#ck-button label input {
	position: absolute;
	top: -20px;
}

#ck-button input:checked+span {
	background-color: #911;
	color: #fff;
}

#ck-button:hover {
	background-color: lightcoral
}
.resetBtn{
	margin-left: 8.0em;
	font-size: 18px;
	width: 100px;
	height: 30px;
	border-radius: 4px;
	border: 1px solid #D0D0D0;
	background-color: white;
	color: #6E6E6E;
	outline: none;
}
 .resetBtn span{
	top: 23px;
    width: 15px;  
    height: 15px;     
    margin-top: 5px;
    display: inline-block;
   	margin-right: 5px;
	background-image: url('<%= request.getContextPath() %>/resources/img/reload.png');

} 
.resetBtn:hover{
	background: #CCF2FF;
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
	<div style="width: 1200px; margin: 200px auto">
		<div style="width: 1100px; margin: 0 auto">
			<div class="box" style="width: 380px">
				<div
					style="border: 1px solid #D0D0D0; padding-left: 20px; font-size: 25px; padding-top: 20px; background: white; border-radius: 4px">
					<span><img src="<%= request.getContextPath() %>/resources/img/list.png"/></span><b>&nbsp;&nbsp;정렬</b><br>
					<br> <select class="listcss" name="sortList" id="sortList"
						style="color: black; font-size: 15px; margin-bottom: 20px; width: 200px; outline: none;" onchange="selectsort()">>
						<option value="GradeH" selected="selected">평점높은순</option>
						<option value="GradeR">평점낮은순</option>
						<option value="ReviewM">리뷰많은순</option>
						<option value="ReviewL">리뷰적은순</option>
						<option value="PriceH">가격높은순</option>
						<option value="PriceL">가격낮은순</option>
					</select>

				</div>
				<div
					style="border: 1px solid #D0D0D0; padding-left: 20px; font-size: 25px; padding-top: 20px; margin-top: 20px; padding-bottom: 20px; background: white; border-radius: 4px">
					<span><img src="<%= request.getContextPath() %>/resources/img/filter.png"/></span><b>&nbsp;필터</b>
					
					<button class="resetBtn" id="resetFrm"><span></span>초기화</button><br />
				
					<br> 성분 필터<br>
					<br>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck1" id="ck1"><span>메밀</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck2" id="ck2"><span>밀</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck3" id="ck3"><span>콩</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck4" id="ck4"><span>견과류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck5" id="ck5"><span>조개류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck6" id="ck6"><span>복숭아</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck7" id="ck7"><span>토마토</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck8" id="ck8"><span>난류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck9" id="ck9"><span>우유</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck10" id="ck10"><span>아황산</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck11" id="ck11"><span>육류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck12" id="ck12"><span>갑각류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck13" id="ck13"><span>고등어</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck14" id="ck14"><span>오징어</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck15" id="ck15"><span>굴</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck16" id="ck16"><span>전복</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck17" id="ck17"><span>홍합</span>
						</label>
					</div>
				</div>
				
			</div>
			<div id="dbox" class="box"
				style="margin-left: 20px; width: 660px; background: white; vertical-align: top; border:1px solid #D0D0D0; border-radius: 4px">
				<table id="rList" style=" width: 659px; height: 150px; text-align: center; border-radius: 4px" border="0"  cellpadding="0" cellspacing="0">
					<% int cnt = 0; %>
					<% for(Product p : list){ %>
					<% cnt ++; %>
					<tr>
						<td style="display: none"><b><%= p.getPno() %></b></td>
						<td style="width: 100px; height: 150px;"><b><%= cnt %></b></td>
						<td style="width: 100px; height: 150px;">
							<img src="/semi/resources/productImg/<%=p.getCname() %>"  style="max-height: 100%; max-width: 100%; max-height: 100%; max-width: 100%; background-color: transparent; !important"/>
						</td>
						<td style="text-align: left">
							<ul style="text-align: left; list-style: none; " >
								<li><h5 style="color: red"><%= p.getBrand() %></h5></li>
								<li><h4><%= p.getPname() %></h4></li>
								<li><h5><%= p.getPprice() %></h5></li>
							</ul> 
						</td>
						<td style="width: 250px; height: 150px;"><%= p.getRank() %></td>
						<td id="pnn" style="display: none"><%= p.getPnn() %></td>
					</tr>
					<% } %>
				</table> 
				
			</div>
		</div>
		
	</div>

	
	<%@ include file="../common/footer.jsp"%>


</body>
<script>
	$(function() {
		
		if('<%= so %>' == 'null') {
			$('#sortList').val('GradeH').prop('selected', true);
		}else{
			$('#sortList').val('<%= so %>').prop('selected',true);
		}
		$('button[id=resetFrm]').click(function() {
			$('input:checkbox').prop('checked', false);
		});
		
	});
	
	$(function() {
		$('#rList td').mouseenter(function() {
			$(this).parent().css({"background":"#FAF2F0","cursor":"pointer"});
		}).click(function() {
			var pno = $(this).parent().children().eq(0).text();
			location.href="<%=request.getContextPath()%>/selectOne.po?pno=" + pno;
		}).mouseleave(function() {
			$(this).parent().css({"background":"white"});
		});
	});
	
	
	
	function selectsort() {
		var so = $('#sortList option:selected').val();
		var pnn = $('#pnn').text();
		
		location.href = "<%= request.getContextPath() %>/sProduct.so?pnn="+pnn+"&so="+so;
		
	}
	
	

</script>
</html>