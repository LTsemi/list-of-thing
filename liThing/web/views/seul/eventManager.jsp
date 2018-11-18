<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.buyme.seul.event.model.vo.*,
    		com.buyme.seul.eventComment.model.vo.*"%>
<%
	Event e = (Event)request.getAttribute("event");
	ArrayList<Event> list = (ArrayList<Event>) request.getAttribute("list");
	//댓글 리스트
	ArrayList<EventComment> clist = (ArrayList<EventComment>) request.getAttribute("clist");
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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/templatemo-style.css">


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
button:disabled {
color: lightgray;

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

	<div id="eventPage">



		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<!--   이벤트 창    -->
				<div id="lithingevt">
					<br> <br>

					<Form>
					<div class="thumbnail"
						style="width: 90%; max-width:950px; margin: 0 auto; padding: 20px;">
						<table class="evtMgtBox" border="1"
							style="width: 95%; text-align: center; margin: 20px auto;">
							<caption
								style="text-align: center; font-size: 18px; font-weight: 600">이벤트
								페이지 관리</caption>
							<tr>
								<th style="text-align: center;">
								<!-- <input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();" /> -->
								</th>
								<th style="text-align: center;">No</th>
								<th style="text-align: center;">이벤트 명</th>
								<th style="text-align: center;">당첨자 수</th>
								<th style="text-align: center;">응모자 수</th>
								<th style="text-align: center;">기한</th>
								<th style="text-align: center;">당첨자 추첨</th>
							</tr>
							<%
								for (Event evt : list) {
									if (evt.getDelflag().equals("Y") && evt.getEtype() == 1) {
							%>
							<tr>
								<td><input type="checkbox" value="" name="checkRow" onclick="doOpenCheck(this);CheckBtn(this.form);"></td>
								<td><input type="hidden" value="<%=evt.getEno()%>"/><%=evt.getEno()%></td>
								<td><%=evt.getEvttitle()%></td>
								<td><%=evt.getWinner_cnt()%></td>
								<td><%=evt.getUserCnt()%></td>
								<% if (evt.getDday() > 0) { %>
								<td><%=evt.getDday()%></td>
								<% } else if (evt.getDday() == 0) { %>
								<td>D-day</td>
								<% } else { %>
								<td>종료</td>
								<% } %>
								<td class="checkWinner">O</td>
							</tr>
							<% 		}
								}
							%>

						</table>
						<p>당첨자 추첨 (종료된 이벤트만 클릭 가능 / 한번만 수행 가능하게)<br>
							이벤트 수정하기 (체크박스 체크 없을 시 비활성화)<br>
							이벤트 삭제하기 (체크박스 없을 시 비활성화)</p>
						<div class="box" style="width: 95%; margin: 0 auto; text-align: center;">							
							<button name="chkWinBtn" onclick="chkWin();" disabled>당첨자 추첨</button> &nbsp;
							<button onclick="location.href='views/seul/eventPageInsertForm.jsp'">이벤트 추가</button> &nbsp;
							<button name="udtBtn" onclick="chkUpdate();" disabled>수정하기</button> &nbsp;
							<button name="delBtn" onclick="chkDelete();" disabled>삭제하기</button>
							

						</div>
					</div>
					</Form>
					
					<br> <br> <br> <br>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	/* 체크박스 하나만 선택가능 */
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("checkRow");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
	/* 체크박스 선택 시 버튼 활성화 */
	function CheckBtn(frm)
	{
	   if (frm.delBtn.disabled==true){
	    frm.delBtn.disabled=false		   
	   }else{
	    frm.delBtn.disabled=true		   
	   }
	    
	   if (frm.udtBtn.disabled==true){
	    frm.udtBtn.disabled=false		   
	   }else{
		frm.udtBtn.disabled=true		   
	   }
		
		var checkbox = $("input[name=checkRow]:checked");
	   checkbox.each(function(i) {
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();	
		var dday = td.eq(5).text();
	   console.log(dday);
		if(dday=="종료"){
	    frm.chkWinBtn.disabled=false
	    frm.delBtn.disabled=true
	    frm.udtBtn.disabled=true
		}else{
		frm.chkWinBtn.disabled=true	
		}
	   });
	}

	
	/* 체크박스 전체선택, 전체해제 */
	/* function checkAll(){
	      if( $("#th_checkAll").is(':checked') ){
	        $("input[name=checkRow]").prop("checked", true);
	      }else{
	        $("input[name=checkRow]").prop("checked", false);
	      }
	} */
	
	function chkWin(checkRow) {
	var checkbox = $("input[name=checkRow]:checked");

		
		// 게시글 번호 가져오기
		checkbox.each(function(i) {
		 
		    
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();	
			
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var eno = td.eq(1).text();
			var winner_cut = td.eq(3).text();
			console.log(eno);	
			console.log(winner_cut);	
			
			if(confirm("당첨자 추첨 하시겠습니까?")){
			location.href="/semi/winnerDraw.ev?eno="+eno+"&winner_cut="+winner_cut;	
			}else{
				return;
			}
		});

		
	}
	
	function chkUpdate(checkRow) {
		var checkbox = $("input[name=checkRow]:checked");

		
		// 게시글 번호 가져오기
		checkbox.each(function(i) {
		 
		    
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();	
			
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var eno = td.eq(1).text();
			console.log(eno);	
			if(confirm("수정하시겠습니까?")){
			location.href="/semi/eUpdateView.ev?eno="+eno;				
			}else{
				return;
			}
		});


	}
	
	
	function chkDelete(checkRow) {
		var checkbox = $("input[name=checkRow]:checked");
		// 게시글 번호 가져오기
		
		checkbox.each(function(i) {

			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();	
			
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var eno = td.eq(1).text();
			console.log(eno);	
			if(confirm("삭제하시겠습니까?")){
			location.href="/semi/eDelete.ev?eno="+eno;				
			}else{
				return;
			}
		});
			 
	}

	</script>


	<%@ include file="../common/footer.jsp"%>



</body>
</html>