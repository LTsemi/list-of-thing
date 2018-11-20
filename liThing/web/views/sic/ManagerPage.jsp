<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<style>
@font-face {
	font-family: 'NanumSquareRoundR';
	src: url('/semi/resources/css/fonts/NanumSquareRoundR.ttf');
}

* {
	box-sizing: border-box;
	font-family: NanumSquareRoundR !important;
}

td{
	padding: 3px 3px;
	text-align: center;
	border-bottom: 1px solid lightgray;
	border-left: 1px solid lightgray;
}

table{
	border: 1px solid lightgray;
	border-radius: 4px;
	border-collapse: collapse;
}
</style>
<body>
<%@ include file="../common/header.jsp"%>
	<h1 style="text-align: center; margin:100px">관리자 페이지</h1>
	
	<div style="margin: 100px auto;  width: 1200px;">
		<div style=" margin: 0 auto; width: 1200px;">
			<input type="button" id="delbtn" value="삭제" disabled="disabled" onclick="deleteItem()">
			<input type="button" value="제품 추가" onclick="insertItem()"/>
		</div>
		<table style="margin: 0 auto; width: 1200px; font-size: 11px;" id="mtable" >
			<thead style="font-weight: 600">
				<tr>
					<td width="50px" style="text-align: center">
						<input type="checkbox" name="allChk" id="allChk"  />
					</td>
					<td>제품 번호</td>
					<td>제품 코드</td>
					<td>제품 분류</td>
					<td>제품명</td>
					<td>제품 가격</td>
					<td>알레르기 성분</td>
					<td>제품 브랜드</td>
					<td>제품 용량</td>
					<td>제품 평점</td>
					<td>제품 수량</td>
					
				</tr>
			</thead>
			<tbody >
			</tbody>
		</table>
	</div>
</body>
<script>

$(function(){
	
	$.ajax({
		url : '/semi/mSelect.ms',
		type : 'get',
		success : function(data){
			
			$table = $('#mtable tbody');
			
			for(var i in data){
				
				var $tdCheck = $('<td style="text-align: center">').html($('<input type="checkbox" name="chk'+i+'" style="text-align: center;">'));
				var $trBoard = $('<tr>');
				var $tdBpNo = $('<td>').text(data[i].pno);
				var $tdBpNN = $('<td>').text(data[i].pnn);
				var $tdBkNo = $('<td>').text(data[i].kno);
				var $tdBpName = $('<td>').text(data[i].pname);
				var $tdBpPrice = $('<td>').text(data[i].pprice);
				var $tdBpIngd = $('<td>').text(data[i].pindg);
				var $tdBBrand = $('<td>').text(data[i].brand);
				var $tdBpCap = $('<td>').text(data[i].pcap);
				var $tdBRank = $('<td>').text(data[i].rank);
				var $tdBCount = $('<td id="test">').text(data[i].count);
				
				
				
				$trBoard.append($tdCheck).append($tdBpNo).append($tdBpNN).append($tdBkNo).append($tdBpName).append($tdBpPrice)
				.append($tdBpIngd).append($tdBBrand).append($tdBpCap).append($tdBRank).append($tdBCount);
				
				
				$table.append($trBoard);
				
				
				//$('#mtable tbody').children().find('td:last').prepend('<input type="button">');
			}
			
			$('input[name^=chk]').click(function() {
				if($('input[name^=chk]').is(':checked')==true){
					buttonOn();
				}else{
					buttonOff();
				}
			});
			$('#mtable tbody').children().mouseenter(function () {
				$(this).children().not(':first').css({'background':'#F7D58B', 'cursor':'pointer'});
				$(this).children().not(':first').click(function () {
					var pno = $(this).parent().children().eq(1).text()
					updateItem(pno);
				});
					
			}).mouseleave(function () {
				$(this).children().not(':first').css({'background':'white'});
			});
			
			
		}, error : function(data){
			console.log("제품 조회 실패!!");
		}

		
	});
	
	
	
});


function buttonOn() {
	$('#delbtn').attr("disabled", false);
}
function buttonOff() {
	$('#delbtn').attr("disabled", true);
}

function deleteItem() {

	$('input[name^=chk]:checked').each(function() {
		var pno = $(this).parent().next().text();

		$.ajax({
			url : '/semi/dProduct.dp',
			type : 'get',
			data : {
				pno : pno
			},
			success : function (result) {
				
				console.log(result);
				
			}, error : function (result) {
				console.log("제품삭제 실패!");
			}
		}); 
		
		$(this).parent().parent().remove();
		
	});
	
	
}

function insertItem(){
	location.href="UploadProduct.jsp";
}

function updateItem(pno) {
	var dpno = pno;
	console.log(dpno);
	location.href="<%=request.getContextPath()%>/mselectOne.mo?pno=" + dpno;
}


</script>
</html>

















