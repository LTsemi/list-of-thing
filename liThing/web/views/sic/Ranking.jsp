<%@page import="java.util.ArrayList, com.buyme.sic.ranking.model.vo.*, java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	String so = (String)request.getAttribute("sortsts");
	DecimalFormat dc = new DecimalFormat("###,###,###,###");
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


<style>
body{
	margin: 0px !important;
}
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
	cursor: pointer;
}

.button:hover {
	color: red;
	border: 1px solid red;
	cursor: pointer;
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
	cursor: pointer;
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

#ap-button {

	background-color: red;
	
	border: 1px solid #D0D0D0;
	display: inline-block;
	font-size: 15px;
	outline: none;
}

#ap-button label {
	color: white;
	float: left;
	width: 20em;
	height: 1.6em;
	cursor: pointer;
}

#ap-button label span {
	text-align: center;
	padding: 5px 1px;
	display: block;
}


#ap-button label input {
	position: absolute;
	top: -20px;
}

#ap-button:hover {
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
	cursor: pointer;
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

td{
	border-bottom: 1px solid #D0D0D0;
}

.RstarR {
	background: url('/semi/resources/img/ico.png') no-repeat right 0;
	background-size: auto 100%;
	width: 16px;
	height: 16px;
	display: inline-block;
	text-indent: -9999px;
}

.RstarR.on {
	background-position: 0 0;
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
	<div style="width: 1300px; margin: 200px auto">
		<div style="width: 1100px; margin: 0 auto">
			<div class="box" style="width: 380px">
				<div
					style="border: 1px solid #D0D0D0; padding-left: 20px; font-size: 25px; padding-top: 20px; background: white; border-radius: 4px">
					<span><img src="<%= request.getContextPath() %>/resources/img/list.png"/></span><b>&nbsp;&nbsp;정렬</b><br>
					<br> <select class="listcss" name="sortList" id="sortList"
						style="color: black; font-size: 15px; margin-bottom: 20px; width: 200px; outline: none; cursor: pointer;" onchange="selectsort()">>
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
				
					<br>알레르기 유발 성분 제외<br>
					<br>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="메밀"><span>메밀</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="밀"><span>밀</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="콩"><span>콩</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="견과류"><span>견과류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="조개류"><span>조개류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="복숭아"><span>복숭아</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="토마토"><span>토마토</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="난류"><span>난류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="우유"><span>우유</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="아황산"><span>아황산</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="육류"><span>육류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="갑각류"><span>갑각류</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="고등어"><span>고등어</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="오징어"><span>오징어</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="굴"><span>굴</span>
						</label>
					</div>
					<div id="ck-button">
						<label> <input type="checkbox" name="ck" id="ck" value="전복"><span>전복</span>
						</label>
					</div>
					
					<br /><br />
					<div id='ap-button' style="margin-left: 5px;">
						<label><input type="button" onclick="filterProduct()" value="적용"/><span>제외</span>
						</label>
					</div>
				</div>
				
			</div>
			<div id="dbox" class="box"
				style="margin-left: 20px; width: 660px; background: white; vertical-align: top; border-left:1px solid #D0D0D0; border-right:1px solid #D0D0D0; border-top:1px solid #D0D0D0;">
				<table id="rList" style=" width: 658px; height: 150px; text-align: center; border-radius: 4px;  " border="0"  cellpadding="0" cellspacing="0">
				</table> 
			
			</div>
			<h4></h4>
		</div>
		
	</div>

	
	<%@ include file="../common/footer.jsp"%>


</body>
<script>
	$(function() {
		
		
		var contents = '';
	
		<% int cnt = 0; %>
		<% for(Product p : list){ %>
		<% cnt ++; %>
		<% int price = p.getPprice(); %>
		<% String result = dc.format(price); %>
		
		contents += '<tr>';
		contents +=	'<td style="display: none"><b><%= p.getPno() %></b></td>';
		contents +='<td style="width: 100px; height: 150px;"><b><%= cnt %></b></td>';
		contents +='<td style="width: 100px; height: 150px;">';
		contents +='<img src="/semi/resources/productImg/<%=p.getCname() %>"  style="max-height: 100%; max-width: 100%; max-height: 100%; max-width: 100%; background-color: transparent; !important"/>';
		contents +='</td>';
		contents +='<td style="text-align: left">';
		contents +='<ul style="text-align: left; list-style: none; " >';
		contents +='<li><h5 style="color: red"><%= p.getBrand() %></h5></li>';
		contents +='<li><h4><%= p.getPname() %></h4></li>';
		contents +='<li><h5 style="color: gray"><%= result %>원</h5></li>';
		contents +='</ul>';
		contents +='</td>';
	
		<% if(p.getRank() == 5) {%>
			contents +='<td style="width: 250px; height: 150px;"><div class="RstarRev box" style="margin: auto; padding-top: 10px;">'
	        contents +=    '<span class="RstarR on">별1</span>'
	        contents +=     '<span class="RstarR on">별2</span>'
	        contents +=     '<span class="RstarR on">별3</span>' 
	        contents +=   '<span class="RstarR on">별4</span>'
	        contents +=  '<span class="RstarR on">별5</span> '
	        contents +=   '<span><Strong><%= p.getRank() %></Strong></span>'
	        contents += '</div></td>';
		<% } else if(p.getRank() >= 3.99) {%>
			contents +='<td style="width: 250px; height: 150px;"><div class="RstarRev box" style="margin: auto; padding-top: 10px;">'
	        contents +=    '<span class="RstarR on">별1</span>'
	        contents +=     '<span class="RstarR on">별2</span>'
	        contents +=     '<span class="RstarR on">별3</span>' 
	        contents +=   '<span class="RstarR on">별4</span>'
	        contents +=  '<span class="RstarR">별5</span> '
	        contents +=   '<span><Strong><%= p.getRank() %></Strong></span>'
	        contents += '</div></td>';
		<% } else if(p.getRank() >= 2.99) {%>
			contents +='<td style="width: 250px; height: 150px;"><div class="RstarRev box" style="margin: auto; padding-top: 10px;">'
	        contents +=    '<span class="RstarR on">별1</span>'
	        contents +=     '<span class="RstarR on">별2</span>'
	        contents +=     '<span class="RstarR on">별3</span>' 
	        contents +=   '<span class="RstarR">별4</span>'
	        contents +=  '<span class="RstarR">별5</span> '
	        contents +=   '<span><Strong><%= p.getRank() %></Strong></span>'
	        contents += '</div></td>';
		<% } else if(p.getRank() >= 1.99) {%>
			contents +='<td style="width: 250px; height: 150px;"><div class="RstarRev box" style="margin: auto; padding-top: 10px;">'
	        contents +=    '<span class="RstarR on">별1</span>'
	        contents +=     '<span class="RstarR on">별2</span>'
	        contents +=     '<span class="RstarR">별3</span>' 
	        contents +=   '<span class="RstarR">별4</span>'
	        contents +=  '<span class="RstarR">별5</span> '
	        contents +=   '<span><Strong><%= p.getRank() %></Strong></span>'
	        contents += '</div></td>';
		<% } else if(p.getRank() >= 0.99){%>
			contents +='<td style="width: 250px; height: 150px;"><div class="RstarRev box" style="margin: auto; padding-top: 10px;">'
	        contents +=    '<span class="RstarR on">별1</span>'
	        contents +=     '<span class="RstarR">별2</span>'
	        contents +=     '<span class="RstarR">별3</span>' 
	        contents +=   '<span class="RstarR">별4</span>'
	        contents +=  '<span class="RstarR">별5</span> '
	        contents +=   '<span><Strong><%= p.getRank() %></Strong></span>'
	        contents += '</div></td>';
		<% } else { %>
			contents +='<td style="width: 250px; height: 150px;"><div class="RstarRev box" style="margin: auto; padding-top: 10px;">'
	        contents +=    '<span class="RstarR">별1</span>'
	        contents +=     '<span class="RstarR">별2</span>'
	        contents +=     '<span class="RstarR">별3</span>' 
	        contents +=   '<span class="RstarR">별4</span>'
	        contents +=  '<span class="RstarR">별5</span> '
	        contents +=   '<span><Strong><%= p.getRank() %></Strong></span>'
	        contents += '</div></td>';
		<% } %>
		
		contents +='<td id="pnn" style="display: none"><%= p.getPnn() %></td>';
		contents +='</tr>';
		
		
		<% } %>
		
		
		$('#rList').append(contents);
		
		/* var price = $('h5[name^=pr]').html();
		var str = String(price);
		var result = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		$('h5[name^=pr]').html(result); */
		
		if('<%= so %>' == 'null') {
			$('#sortList').val('GradeH').prop('selected', true);
		}else{
			$('#sortList').val('<%= so %>').prop('selected',true);
		}
		$('button[id=resetFrm]').click(function() {
			$('input:checkbox').prop('checked', false);
		});
		
		
	});
	
	
	
	function selectsort() {
		var so = $('#sortList option:selected').val();
		var pnn = $('#pnn').text();
		
		location.href = "<%= request.getContextPath() %>/sProduct.so?pnn="+pnn+"&so="+so;
		
	}
	
	function filterProduct() {
		var indg = new Array;
		var find = '';
		var ckcnt = $('input:checkbox[name=ck]:checked').length;
		
		var i = 0;
		$('#rList').find('tr').remove();
		
		$('#ck:checked').each(function() {
			indg[i] = $(this).val();
			i++;
		});
		console.log(indg);
		var cnt = 0;
		
		<% for(Product p : list){ %>
			var gindg = '<%= p.getPindg() %>'.split(', ');
			console.log(gindg);
			
			find = gindg.filter(a => indg.includes(a));
			if(find == ''){
				console.log('test :' + find);	
				
				var contents = '';				
				cnt ++;
				contents += '<tr>';
				contents +=	'<td style="display: none"><b><%= p.getPno() %></b></td>';
				contents +='<td style="width: 100px; height: 150px;"><b>'+cnt+'</b></td>';
				contents +='<td style="width: 100px; height: 150px;">';
				contents +='<img src="/semi/resources/productImg/<%=p.getCname() %>"  style="max-height: 100%; max-width: 100%; max-height: 100%; max-width: 100%; background-color: transparent; !important"/>';
				contents +='</td>';
				contents +='<td style="text-align: left">';
				contents +='<ul style="text-align: left; list-style: none; " >';
				contents +='<li><h5 style="color: red"><%= p.getBrand() %></h5></li>';
				contents +='<li><h4><%= p.getPname() %></h4></li>';
				contents +='<li><h5 style="color: gray"><%= p.getPprice() %>원</h5></li>';
				contents +='</ul>';
				contents +='</td>';
				contents +='<td style="width: 250px; height: 150px;"><%= p.getRank() %></td>';
				contents +='<td id="pnn" style="display: none"><%= p.getPnn() %></td>';
				contents +='</tr>';
				
				
				$('#rList').append(contents); 
				
				
			}
			
		<% } %>  
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

	}
	
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

</script>
</html>