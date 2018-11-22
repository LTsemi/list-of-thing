<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">
</head>
<style>
body{
margin: 0 auto !important;
}
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
.leftbtn {
	padding: 8px 18px;
	background-color: white;
	border: 1px solid lightgray;
	color: gray;
	border-radius: 0;
	transition: .2s;
	margin: 5px auto;
}

.leftbtn:hover, .btn:focus {
	border: 1px solid rgb(255, 208, 56);
	background-color: rgb(255, 208, 56);
	color: rgb(255, 255, 255);
}
</style>
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
	<!--  왼쪽 네비    -->
	<div id="left-nav" style="width: 100%; margin:0 auto; text-align:center; border-bottom:1px solid #FFBF00; background-color: #FAF9F0;">
	<br />
	<p style="font-weight: 600; font-size: 16px; color:#333; margin:5px; ">관리자 페이지</p>
	<button class="leftbtn" onclick="location.href='<%= request.getContextPath() %>/mList.me'">회원 관리</button> &nbsp;
	<button class="leftbtn" onclick="location.href='<%= request.getContextPath() %>/views/sic/ManagerPage.jsp'">제품 관리</button> &nbsp;
	<button class="leftbtn" onclick="location.href='<%= request.getContextPath() %>/eventManager.ev'">이벤트 관리</button><br />
	<br />
	</div>
	
	
	<div class="thumbnail" style="margin: 50px 50px;  width: 90%;">
		<div style=" margin: 10px 10px; width: 100%;">
			
		</div>
		<p style="text-align: center; font-size: 20px; font-weight: 600;">
			관리자 페이지</p> 
		<table style="margin: 10px auto; width: 95%; font-size: 11px;" id="mtable" >
			<thead style="font-weight: 600">
			
				<tr>
					<td width="50px" height="25px" style="text-align: center">
						
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
		<input type="button" id="delbtn" value="삭제" style="margin-left: 25px; margin-bottom: 5px;" disabled="disabled" onclick="deleteItem()">
		<input type="button" value="제품 추가"  onclick="insertItem()"/>
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
				

				
			}, error : function (result) {
				alert("제품삭제 실패!");
			}
		}); 
	
		$(this).parent().parent().remove();
		
	});
	alert("제품이 삭제되었습니다.");
	buttonOff();
	
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

















