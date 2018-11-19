<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.buyme.sic.ranking.model.vo.*"%>
<%
	Product p = (Product) request.getAttribute("mRank");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 정보</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<form action="">
	<div style="margin: 100px auto; border: 1px solid black; width: 900px;">
		<table border="1" style="margin: 0 auto;">
			<tr>
				<td>제품명:</td>
				<td><%= p.getPname() %></td>
				<td id='pname'><input type="text" name="pname"/></td>
			</tr>
			<tr>
				<td>제품번호:</td>
				<td><%=p.getPno() %></td>
			</tr>
			<tr>
				<td>제품코드:</td>
				<td><%= p.getPnn() %></td>
			</tr>
			<tr>
				<td>제품분류:</td>
				<td><%= p.getKno() %></td>
			</tr>
			<tr>
				<td>제품가격:</td>
				<td><%= p.getPprice() %></td>
				<td id='pprice'><input type="number" name="pprice"/></td>
			</tr>
			<tr>
				<td>알레르기성분:</td>
				<td><%= p.getPindg() %></td>
				<td id='pindg'>
				<input type="checkbox" id="buckweat" name="pindg" value="메밀"/>
						<label for="buckwheat">메밀</label>
						<input type="checkbox" id="wheat" name="pindg" value="밀"/>
						<label for="wheat">밀</label>
						<input type="checkbox" id="bean" name="pindg" value="콩"/>
						<label for="bean">콩</label>
						<input type="checkbox" id="nuts" name="pindg" value="견과류"/>
						<label for="nuts">견과류</label>
						<br />
						<input type="checkbox" id="clam" name="pindg" value="조개류"/>
						<label for="clam">조개류</label>
						<input type="checkbox" id="peach" name="pindg" value="복숭아"/>
						<label for="peach">복숭아</label>
						<input type="checkbox" id="tomato" name="pindg" value="토마토"/>
						<label for="tomato">토마토</label>
						<br />
						<input type="checkbox" id="turbulence" name="pindg" value="난류"/>
						<label for="turbulence">난류</label>
						<input type="checkbox" id="milk" name="pindg" value="우유"/>
						<label for="milk">우유</label>
						<input type="checkbox" id="sulfite" name="pindg" value="아황산"/>
						<label for="sulfite">아황산</label>
						<input type="checkbox" id="meat" name="pindg" value="육류"/>
						<label for="meat">육류</label>
						<input type="checkbox" id="shellfish" name="pindg" value="갑각류"/>
						<label for="shellfish">갑각류</label>
						<input type="checkbox" id="Mackerel" name="pindg" value="고등어"/>
						<label for="Mackerel">고등어</label>
						<input type="checkbox" id="squid" name="pindg" value="오징어"/>
						<label for="squid">오징어</label>
						<br />
						<input type="checkbox" id="oyster" name="pindg" value="굴"/>
						<label for="oyster">굴</label>
						<input type="checkbox" id="abalone" name="pindg" value="전복"/>
						<label for="abalone">전복</label>
						<input type="checkbox" id="mussel" name="pindg" value="홍합"/>
						<label for="mussel">홍합</label>
				</td>
			</tr>
			<tr>
				<td>제품브랜드:</td>
				<td><%= p.getBrand() %></td>
				<td id='brand'><input type="text" name="brand"/></td>
			</tr>
			<tr>
				<td>제품용량:</td>
				<td><%= p.getPcap() %></td>
				<td id='pcap'><input type="text" name="pcap"/></td>
			</tr>
			<tr>
				<td>제품평점</td>
				<td><%= p.getRank() %></td>
			</tr>
			<tr>
				<td>제품수량:</td>
				<td><%= p.getCount() %></td>
				<td id='count'><input type="number" name="count"/></td>
			</tr>
			<tr>
				<td>제품설명:</td>
				<td><%= p.getPexp() %></td>
				<td id='pexp'><input type="text" name="pexp"/></td>
			</tr>
			<tr>
				<td>제품이미지:</td>
				<td><img src="/semi/resources/productImg/<%=p.getCname()%>"
						width="300px" height="300px"
						style="max-height: 100%; max-width: 100%; max-height: 100%; max-width: 100%; margin-left: 50px"></td>
			</tr>
		</table>
		<input type="button" onclick="startUp()" style="margin: 0 auto;" value="수정하기"/>
	</div>

</form>

</body>
<script>
$(function name() {
	$('table tr').children('#pname').hide();
	$('table tr').children('#pprice').hide();
	$('table tr').children('#pindg').hide();
	$('table tr').children('#brand').hide();
	$('table tr').children('#pcap').hide();
	$('table tr').children('#count').hide();
	$('table tr').children('#pexp').hide();

});
	function startUp() {
		$('table tr').children().eq(1).hide();
		$('table tr').children('#pname').show();
		$('table tr').children().eq(10).hide();
		$('table tr').children('#pprice').show();
		$('table tr').children().eq(13).hide();
		$('table tr').children('#pindg').show();
		$('table tr').children().eq(16).hide();
		$('table tr').children('#brand').show();
		$('table tr').children().eq(19).hide();
		$('table tr').children('#pcap').show();
		$('table tr').children().eq(24).hide();
		$('table tr').children('#count').show();
		$('table tr').children().eq(27).hide();
		$('table tr').children('#pexp').show();
	}

</script>
</html>
























