<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<form action="<%= request.getContextPath() %>/mUpdate.mu" method="post" enctype="multipart/form-data">
		<div style="margin: 100px auto; border: 1px solid black; width: 600px;">
			<table style="margin: 0 auto;">
				<tr>
					<td>종류코드 :</td>
					<td>
						<select name="kno" id="sel" onchange="ChangeItem()">
							<option value="간편식" selected="selected">간편식</option>
							<option value="스낵" >스낵</option>
							<option value="라면">라면</option>
						</select>
					
					</td>
				</tr>
				<tr>
					<td>상품코드 :</td>
					<td>
						<select name="pnn" id="sel2">
							<option value="FF">냉동식품</option>
							<option value="RF">냉장식품</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>상품명 :</td>
					<td><input type="text" name="pname"></td>
				</tr>
				<tr>
					<td>상품가격 :</td>
					<td><input type="number" name="pprice"></td>
				</tr>
				<tr>
					<td>상품성분 :</td>
					<td>
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
						<input type="checkbox" id="no" name="pindg" value="없음"/>
						<label for="no">없음</label>
						
					</td>
				</tr>

				
				<tr>
					<td>브랜드 :</td>
					<td><input type="text" name="brand"></td>
				</tr>
				<tr>
					<td>용량 :</td>
					<td><input type="text" name="pcap"></td>
				</tr>
				<tr>
					<td>수량 :</td>
					<td><input type="text" name="pcount"></td>
				</tr>
				<tr>
					<td><input type="file" id="productImg" name="productImg" onchange="LoadImg(this)"></td>
					<td>
						<img id="proImg" width="200" height="200">
					</td>
				</tr>
				<tr>
					<td>설명 : </td>
					<td>
						<textarea name="pexp" id="pexp" cols="30" rows="10"></textarea>
					</td>
					
				</tr>
				<tr>
					<td colspan="2" style="text-align: center"><button type="submit">작성완료</button></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>