<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.buyme.seul.event.model.vo.*,
    		com.buyme.seul.eventComment.model.vo.*"%>
<%
	Event e = (Event)request.getAttribute("event");
	ArrayList<Event> list = (ArrayList<Event>) request.getAttribute("list");
	ArrayList<Event> ewlist = (ArrayList<Event>) request.getAttribute("ewlist");
	//댓글 리스트
	ArrayList<EventComment> clist = (ArrayList<EventComment>) request.getAttribute("clist");
	int i =0;
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
th{
cursor: default;
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
			<% if(mh != null && mh.getUserId().equals("admin")){ %> 
				<!--   이벤트 창    -->
				<div id="lithingevt">
					<br> <br>

					
					
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
								<th style="text-align: center;">당첨글 유무</th>
							</tr>
							<%
								for (Event evt : list) {
									if (evt.getDelflag().equals("Y") && evt.getEtype() == 1) {
							%>
							<tr>
								<td><input type="checkbox" name="checkRow" /></td>
								<td><input type="hidden" value="<%=evt.getEno()%>"/><%=evt.getEno()%></td>
								<td><%=evt.getEvttitle()%></td>
								<td><%=evt.getWinner_cnt()%></td>
								<td><%=evt.getUserCnt()%></td>
								<% if (evt.getDday() > 0) { %>
								<td id="dDay"><span><%=evt.getDday()%></span></td>
								<% } else if (evt.getDday() == 0) { %>
								<td id="dDay"><span>D-day</span></td>
								<% } else { %>
								<td id="dDay"><span>종료</span></td>
								<% } %>
								
								<% if (evt.getWinResult().equals("YES")){ %>
								<td><b id="checkWinner">O</b></td>
								<% } else { %>
								<td><b id="checkWinner">X</b></td>
								<% } %>
								
								<% if (evt.getEvteno_cnt() == 1) { %>
								<td><strong>X</strong></td>
								<% }else{ %>
								<td><strong>O</strong></td>
								<% }  %>
							</tr>
							<% 		}
								}
							%>

						</table>

						<p style="color: red; text-align: center;">※ 당첨자 추첨 : 기한 종료된 이벤트만 클릭 가능<br>
						※ 당첨자 페이지 : 당첨자가 추첨된 글만 작성 가능</p>
						<div class="box" style="width: 95%; margin: 0 auto; text-align: center;">							
							<button onclick="location.href='views/seul/eventPageInsertForm.jsp'">이벤트페이지 작성</button> &nbsp;
							<button id="chkWinBtn" onclick="chkWin();" disabled>당첨자 추첨</button> &nbsp;
							<button id="winIstBtn" onclick="chkWinIst();" disabled>당첨자페이지 작성</button> &nbsp;
							<button id="udtBtn" onclick="chkUpdate();" disabled>수정하기</button> &nbsp;
							<button id="delBtn" onclick="chkDelete();" disabled>삭제하기</button>
							

						</div>
					</div>
					<br />
					
					<div class="thumbnail"
						style="width: 90%; max-width:950px; margin: 0 auto; padding: 20px;">

						<table class="winMgtBox" border="1"
							style="width: 95%; text-align: center; margin: 20px auto;">
							<caption
								style="text-align: center; font-size: 18px; font-weight: 600">
								당첨자 페이지 관리</caption>
							<tr>
								<th style="text-align: center;">
								<!-- <input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();" /> -->
								</th>
								<th style="text-align: center;">이벤트No</th>
								<th style="text-align: center;">No</th>
								<th style="text-align: center;">이벤트 명</th>
								<th style="text-align: center;">작성일</th>
							</tr>
							<%
								for (Event evtw : ewlist) {
									if (evtw.getDelflag().equals("Y") && evtw.getEtype() == 0) {
							%>
							<tr>
								<td><input type="checkbox" value="" name="checkRow2" /></td>
								<td><%=evtw.getEvtEno() %></td>
								<td><input type="hidden" value="<%=evtw.getEno()%>"/><%=evtw.getEno()%></td>
								<td><%=evtw.getEvttitle()%></td>
								<td><%=evtw.getEvtdate()%></td>
							</tr>
							<% 		}
								}
							%>

						</table>

						
						<div class="box" style="width: 95%; margin: 0 auto; text-align: center;">							
							<button id="udtWinBtn" onclick="chkWinUpdate();" disabled>수정하기</button> &nbsp;
							<button id="delWinBtn" onclick="chkWinDelete();" disabled>삭제하기</button>
							

						</div>
					</div>
					
					<br> <br> <br> <br>
				</div>
				<% }else {%>
				
				<p style="text-align: center; margin: 100px 0">
				관리자 전용 페이지 입니다. <br />
				접근하실 수 없습니다 ! <br /><br />
				</p>
				<% } %>
			</div>
		</div>
	</div>
	<script>
	
	
	/* 이벤트 목록 클릭시 상세페이지로 이동 */
	$('.evtMgtBox tr').eq(0).siblings().mouseenter(function () {
		$(this).children().not(':first').css({'background':'#F7D58B', 'cursor':'pointer'});
		$(this).children().not(':first').click(function () {
			var eno = $(this).parent().children().eq(1).text()
			viewSelectOne(eno);
		});
			
	}).mouseleave(function () {
		$(this).children().not(':first').css({'background':'white'});
	});
	
	function viewSelectOne(eno) {
		var veno = eno;
		console.log(veno);
		location.href="<%=request.getContextPath()%>/selectOne.ev?eno=" + veno;
	}
	
	/* 당첨자 목록 클릭시 상세페이지로 이동 */
	$('.winMgtBox tr').eq(0).siblings().mouseenter(function () {
		$(this).children().not(':first').css({'background':'#F7D58B', 'cursor':'pointer'});
		$(this).children().not(':first').click(function () {
			
			var eno = $(this).parent().children().eq(2).text()
			viewSelectWinOne(eno, evtEno);
			var evtEno = $(this).parent().children().eq(1).text()
			viewSelectWinOne(eno, evtEno);
		});
			
	}).mouseleave(function () {
		$(this).children().not(':first').css({'background':'white'});
	});
	
	function viewSelectWinOne(eno, evtEno) {
		var veno = eno;
		var vevtEno = evtEno;
		console.log(veno);
		console.log(vevtEno);
		location.href="<%=request.getContextPath()%>/eSelectWin.ev?eno=" + veno+"&evtEno="+vevtEno;
	}
	
	
	/* 체크박스 선택 시 버튼 활성화 */
	$('checkRow').ready(function() {
	
		//라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
	    $('input[type="checkbox"][name="checkRow"]').click(function(){
	        //클릭 이벤트 발생한 요소가 체크 상태인 경우

	        if ($(this).prop('checked')) {

	            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
	            $('input[type="checkbox"][name="checkRow"]').prop('checked', false);
	            $(this).prop('checked', true);
	            $('#udtBtn').attr('disabled',false);
	            $('#delBtn').attr('disabled',false);
	            
	            var dDay = $("input[name=checkRow]:checked").parents('td').siblings().find('span').text();
	            var end = "종료";
	            //console.log(dDay);            
	            var chkWin = $("input[name=checkRow]:checked").parents('td').siblings().find('b').text();
	            var chkO = "O";
	            //console.log(chkWin);
	            var evtCount = $("input[name=checkRow]:checked").parents('td').siblings().find('strong').text();
	            var cntO = "O";
	            //console.log(evtCount);
	            
	            if(evtCount ==cntO){
		            $('#chkWinBtn').attr('disabled',true);
		            $('#winIstBtn').attr('disabled',true);
	            }else{
	            	$('#chkWinBtn').attr('disabled',true);
	            	$('#winIstBtn').attr('disabled',true);
	            }
	            
	            if(dDay==end && chkWin==chkO && evtCount !=cntO){
		            $('#chkWinBtn').attr('disabled',true);	            	
	            }else{
	            	$('#chkWinBtn').attr('disabled',true);	
	            }
	            
	            if(dDay==end && !(chkWin==chkO)){
		            $('#chkWinBtn').attr('disabled',false);	            	
	            }else{
	            	$('#chkWinBtn').attr('disabled',true);	
	            }

	                 
	            if(chkWin==chkO && evtCount !=cntO){
		            $('#winIstBtn').attr('disabled',false);	            	
	            }else{
	            	$('#winIstBtn').attr('disabled',true);	
	            } 
	            
	        }else{
	            $('#udtBtn').attr('disabled',true);
	        	$('#delBtn').attr('disabled',true);
	            $('#chkWinBtn').attr('disabled',true);	
	            $('#winIstBtn').attr('disabled',true);
			}
	    });
		
	});

	/* 당첨자 체크박스 선택 시 버튼 활성화 */
	$('checkRow2').ready(function() {

		//라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
	    $('input[type="checkbox"][name="checkRow2"]').click(function(){
	        //클릭 이벤트 발생한 요소가 체크 상태인 경우

	        if ($(this).prop('checked')) {

	            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
	            $('input[type="checkbox"][name="checkRow2"]').prop('checked', false);
	            $(this).prop('checked', true);
	            $('#udtWinBtn').attr('disabled',false);
	            $('#delWinBtn').attr('disabled',false);
	            
	            
	        }else{
	        	$('#udtWinBtn').attr('disabled',true);
	            $('#delWinBtn').attr('disabled',true);
			}
	    });
		
	});

	
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
	
	function chkWinIst(checkRow) {
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
			if(confirm("당첨자 페이지 작성창으로 이동하시겠습니까?")){
			location.href="/semi/eWinInsertView.ev?eno="+eno+"&winner_cut="+winner_cut;				
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
			console.log("eno"+eno);	
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
			if(confirm("정말 삭제하시겠습니까?")){
			location.href="/semi/eDelete.ev?eno="+eno;				
			}else{
				return;
			}
		});
	}
	
		/* 당첨자 페이지용 버튼 */
		function chkWinUpdate(checkRow) {
		var checkbox = $("input[name=checkRow2]:checked");

		
		// 게시글 번호 가져오기
		checkbox.each(function(i) {
		 
		    
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();	
			
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var eno = td.eq(1).text();
			var evtEno = td.eq(4).text();
			console.log("eno"+eno);	
			if(confirm("수정하시겠습니까?")){
			location.href="/semi/eWinUpdateView.ev?eno="+eno+"&evtEno="+evtEno;				
			}else{
				return;
			}
		});


	}
	
	
	function chkWinDelete(checkRow) {
		var checkbox = $("input[name=checkRow2]:checked");
		// 게시글 번호 가져오기
		
		checkbox.each(function(i) {

			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();	
			
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var eno = td.eq(2).text();
			console.log(eno);	
			if(confirm("정말 삭제하시겠습니까?")){
			location.href="/semi/eWinDelete.ev?eno="+eno;				
			}else{
				return;
			}
		});
	}

	</script>


	<%@ include file="../common/footer.jsp"%>



</body>
</html>