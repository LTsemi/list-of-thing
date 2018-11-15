<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.*, com.buyme.seul.event.model.vo.*,
    		com.buyme.seul.eventComment.model.vo.*"%>
<%
	Event e = (Event)request.getAttribute("event");
//댓글 리스트
//	ArrayList<EventComment> clist = (ArrayList<EventComment>) request.getAttribute("clist"); 

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

		<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">

		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/evtPage.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">	
		
	<style>
	 @font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
        }
        body { box-sizing: border-box;
            font-family: NanumSquareRoundR !important; 
        }
	</style>
        
    </head>

<body>

  <%@ include file="../common/header.jsp" %>

    <div class="page-heading">
        <div class="container">
            <div class="heading-content">
                <h1>list of<em>thing ;)</em></h1>
            </div>
        </div>
    </div>

<div class="container-fluid">
  <div class="row content">
    

  
    <div class="evtbanner">
    <br><br>
      <h4><small>list of thing - 리띵!</small></h4>   
      <hr>
      
      <h2><%= e.getEvttitle() %></h2>
      <h5><span class="glyphicon glyphicon-time"></span> &nbsp; <%= e.getEvtdate() %></h5>
      <br><br>
      <img src="/semi/resources/eventUploadFiles/<%=e.getE_dtl_cname()%>" width="700px">
      <br><br>
      <hr>
      <br />
    </div>
      <!-- <h4>Leave a Comment:</h4> -->     
     <%--<div class="replyArea comment">
		<div class="replyWriteArea">
			<form action="/semi/insertComment.eo" method="post">
				<input type="hidden" name="userId" value="user01"/>
				<input type="hidden" name="eno" value="01" />
				

					<div class="form-group">
					  <textarea class="form-control" rows="3" required
					  			id="replyContent" name="replyContent"></textarea>
					</div>
					 <button type="submit" class="btn pull-right" id="addReply">응모하기</button>				
			</form>
		</div>
		<br /><br /><br />
		<div id="replySelectArea" class="row cmtbar">
		<br>
        <p><span class="badge">1</span> Comments:</p><br>
	     <% if( clist != null ) { %>
	      	<% for(EventComment eco : clist) { %> 
	      	
	      	<div id="replySelectTable" class="replyList">

				<div class="col-sm-2 text-center">
	            	<h4>김길동</h4>
	            	<small> 2018-11-11</small>
	            </div>
	            
	            <div class="col-sm-6">
	            	
	            	<textarea class="reply-content" cols="80" rows="2"
					 readonly="readonly">응모합니다 ^_^ 저 주세요~!~!</textarea>	
					 				 
				<div class="text-right" style="width: 550px">		
				<%if(mh.getUserName().equals(eco.getName())) { %>			
						<input type="hidden" name="cno" value="01"/>							  
						<button type="button" class="updateBtn" 
							onclick="updateReply(this);">수정하기</button>
							
						<button type="button" class="updateConfirm"
							onclick="updateConfirm(this);"
							style="display:none;" >수정완료</button> &nbsp;&nbsp; 
							
						<button type="button" class="deleteBtn"
							onclick="deleteReply(this);">삭제하기</button>
				<% } %>
				</div>
				
	            <br>
	            <br /><br />
	            </div>	

			</div>
	  	<% } } %>
		</div>
	</div>--%>
	
      
        <br><br>
    </div>
    <div class="listGo">
        <a href="/semi/selectList.ev" class="listbtn">목록으로</a> 
        <% if(mh != null && mh.getUserId().equals("admin")){ %>
         <button class="listbtn" onclick="location.href='eUpdateView.ev?eno=<%=e.getEno()%>'">수정하기</button>	
         <button class="listbtn" onclick="location.href='eDelete.ev?eno=<%=e.getEno()%>'">삭제하기</button>		  
		<% } %>
    </div>
        
        <br><br><br><br>
     </div>

</div>
<script>
		function updateReply(obj) {
			// 현재 위치와 가장 근접한 textarea 접근하기
			$(obj).parent().parent().next().find('textarea')
			.removeAttr('readonly');
			
			// 수정 완료 버튼을 화면 보이게 하기
			$(obj).siblings('.updateConfirm').css('display','inline');
			
			// 수정하기 버튼 숨기기
			$(obj).css('display', 'none');
		}
		
		function updateConfirm(obj) {
			// 댓글의 내용 가져오기
			var content
			  = $(obj).parent().parent().next().find('textarea').val();
			
			// 댓글의 번호 가져오기
			var cno = $(obj).siblings('input').val();
			
			// 게시글 번호 가져오기
			var eno = '<%=e.getEno()%>';
			
			location.href="/myWeb/updateComment.bo?"
					 +"cno="+cno+"&eno="+eno+"&content="+content;
		}
		
		function deleteReply(obj){
			// 댓글의 번호 가져오기
			var cno = $(obj).siblings('input').val();
			
			// 게시글 번호 가져오기
			var eno = '<%=e.getEno()%>';
			
			location.href="/myWeb/deleteComment.bo"
			+"?cno="+cno+"&eno="+eno;
		}
		
		function reComment(obj){
			// 추가 완료 버튼을 화면 보이게 하기
			$(obj).siblings('.insertConfirm').css('display','inline');
			
			// 클릭한 버튼 숨기기
			$(obj).css('display', 'none');
			
			// 내용 입력 공간 만들기
			var htmlForm = 
				'<tr class="comment"><td></td>'
					+'<td colspan="3" style="background : transparent;">'
						+ '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3"></textarea>'
					+ '</td>'
				+ '</tr>';
			
			$(obj).parents('table').append(htmlForm);
			
		}
		
		function reConfirm(obj) {
			// 댓글의 내용 가져오기
			
			// 참조할 댓글의 번호 가져오기
			var refcno = $(obj).siblings('input[name="refcno"]').val();
			
			
			// 게시글 번호 가져오기
			var eno = '<%=e.getEno()%>';
			
			var parent = $(obj).parent();
			var grandparent = parent.parent();
			var siblingsTR = grandparent.siblings().last();
			
			var content = siblingsTR.find('textarea').val();
			
			location.href='/myWeb/insertComment.bo'
			           + '?writer=<%= mh.getUserId() %>' 
			           + '&replyContent=' + content
			           + '&eno=' + eno
			           + '&refcno=' + refcno;
		}
	</script>

<%@ include file="../common/footer.jsp" %>



</body>
</html>