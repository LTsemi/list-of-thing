<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.*, com.buyme.seul.event.model.vo.*,
    		com.buyme.seul.eventComment.model.vo.*"%>
<%
	Event e = (Event)request.getAttribute("event");
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

		<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">

		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/evtPage.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">	
		
	<style>
@font-face {
	font-family: 'NanumSquareRoundR';
	src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
}

body {
	box-sizing: border-box;
	font-family: NanumSquareRoundR !important;
}
.rebtn {
	margin-top:10px;
    padding: 2px 5px;
    border: 1px solid lightgray;
    background-color: white;
    color: gray;
    border-radius: 0;
    transition: .2s;

}
  .rebtn:hover, .btn:focus {
   border: 1px solid gray;
   background-color:  gray;
   color: rgb(255, 255, 255) !important;
  }
.replyUpdateBox{
	width:600px;
	height: 50px;
}
.rightbtn{
	margin-left: 400px;
}
.reUpbtn {
	width: 65px;
	height: 65px;
	padding: 2px 5px;
	margin-top:20px;
    border: 1px solid lightgray;
    background-color: white;
    color: gray;
    border-radius: 0;
    transition: .2s;
}
.reUpbtn:hover, .btn:focus {
   border: 1px solid rgb(255, 230, 161);
      background-color: rgb(255, 230, 161);
      color: rgb(255, 255, 255) !important;
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
      <div class="replyArea comment">
		<div class="replyWriteArea">
			<form action="/semi/insertComment.co" method="post">
				<input type="hidden" name="writer" value="<%=mh.getUserId()%>"/>
				<input type="hidden" name="eno" value="<%=e.getEno() %>" />
				

					<div class="form-group">
					  <textarea class="form-control" rows="3" required
					  			id="replyContent" name="replyContent"
					  			style="outline: none; overflow:visible;resize: none;"></textarea>
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
	      	
	      	<div id="replySelectTable" class="replyList" >

				<div class="col-sm-2 text-center">
	            	<h4><%= eco.getCwriter() %></h4>
	            	<small><%= eco.getCdate() %></small>
	            </div>
	            
	            <div class="col-sm-10">  
	             
	            <div class="replyBox">    	
	            	<textarea class="reply-content autosize" cols="85" rows="3"
					 readonly="readonly" style="border: 0px solid black;
					  resize: none; outline: none; overflow:visible;background: transparent; cursor: default; " >
					 <%= eco.getCcontent() %></textarea>					 
				<%if(mh.getUserName().equals(eco.getCwriter())) { %>			
					<input type="hidden" name="cno" value="<%=eco.getCno()%>"/>							  
					<button type="button" class="updateBtn rebtn rightbtn" 
						onclick="updateReply(this);">수정하기</button> &nbsp;	
						
					<button type="button" class="deleteBtn rebtn"
						onclick="deleteReply(this);">삭제하기</button>
				<% } %>
				</div>  				 		
				<div class="replyUpdateBox" style="display: none;">
					 <input type="hidden" name="cno" value="<%=eco.getCno()%>"/>	
					 <textarea class="reply-content autosize" cols="70" rows="3"
						style="border: 1px solid rgb(255, 230, 161); resize: none;
						overflow:visible; " ><%= eco.getCcontent() %></textarea>	&nbsp;
					 <button type="button" class="updateConfirm reUpbtn" 
						 onclick="updateConfirm(this);" style="position: absolute; margin-top: 0px" >
						 	수정<br>완료</button>
				</div>				
								            
				<hr />
	            </div>	

			</div>
	  		<% } } %> 
		</div>
	</div>
	
      
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

		$(function () {
			$('.badge').html(<%= clist.size() %>);
		});
		function updateReply(obj) {
			// 현재 위치와 가장 근접한 textarea 접근하기
			$(obj).parent().parent().next().find('textarea')
			.removeAttr('readonly');
			
			// 수정 완료 버튼을 화면 보이게 하기
			$(obj).parent().next('.replyUpdateBox').css('display','inline');
			
			// 수정하기 버튼 숨기기
			$(obj).parent('.replyBox').css('display','none');
		}
		
		
		function updateConfirm(obj) {
			// 댓글의 내용 가져오기
			/* var content
			  = $(obj).parent().parent().next().find('textarea').val(); */
			  var content
			  = $(obj).siblings('textarea').val();
			console.log(content); // 못받아온다 ㅜㅜ
			
			// 댓글의 번호 가져오기
			var cno = $(obj).siblings('input').val();
			
			// 게시글 번호 가져오기
			var eno = '<%=e.getEno()%>';

			location.href="/semi/updateComment.co?"
					 +"cno="+cno+"&eno="+eno+"&content="+content;
		}
		
		function deleteReply(obj){
			// 댓글의 번호 가져오기
			var cno = $(obj).siblings('input').val();
			
			// 게시글 번호 가져오기
			var eno = '<%=e.getEno()%>';
			
			location.href="/semi/deleteComment.co"
			+"?eno="+eno+"&cno="+cno;
		}
	
		
		/* $("textarea.autosize").on('keydown keyup', function () {
			  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
			}); */
	</script>

<%@ include file="../common/footer.jsp" %>



</body>
</html>