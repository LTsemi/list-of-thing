<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품입력</title>
<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>

</head>
<body>
	<form action="<%= request.getContextPath() %>/pInsert.pn" method="post" enctype="multipart/form-data">
		<div style="margin: 0 auto; border: 1px solid black; width: 600px;">
			<table style="margin: 0 auto;">
				<tr>
					<td>상품코드 :</td>
					<td><input type="text" name="pno"></td>
				</tr>
				<tr>
					<td>종류코드 :</td>
					<td><input type="text" name="kno"></td>
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
					<td><input type="text" name="pindg"></td>
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
					<td><input type="file" id="productImg" name="productImg" onchange="LoadImg(this)"></td>
					<td>
						<img id="proImg" width="200" height="200">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center"><button type="submit">작성완료</button></td>
				</tr>
			</table>
		</div>
	</form>
</body>
<script>
	function LoadImg(value) {
		if(value.files && value.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function(e) {
				$('#proImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
</script>
</html>