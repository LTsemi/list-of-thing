<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.buyme.seul.event.model.vo.*, java.util.*"%>
<%
	Event e = (Event)request.getAttribute("event");
	ArrayList<EventWinner> ewlist = (ArrayList<EventWinner>) request.getAttribute("ewlist");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>List of Thing</title>


        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

       	<script src="/semi/resources/js/vendor
       	/jquery-3.3.1.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">

		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/eventPageInsertForm.css">
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
    

  
    <div class="evtEditor">
    <br><br>
    <form action="<%=request.getContextPath()%>/eInsertWin.ev" method="post">
      <h2><input id="title" type="text" size="40" name="title" placeholder="제목" >
          <input type="hidden" name="userId" value="<%= mh.getUserId() %>"/>
          <input type="hidden" name="evtEno" value="<%= e.getEvtEno() %>"/>
      </h2>
      <hr>
      <h5><span class="glyphicon glyphicon-time"></span> &nbsp; <input type="date" name="date"></h5>
        
        <br><br>
        <div id="titleText">
            <textarea name="content" rows="15" cols="120" style="resize:none;" placeholder="내용을 입력하세요."></textarea>
        </div>
        <br>

 		<div class="winTab">
		 <br>
			<table border="1" width="500"  align="center" cellspacing="0" cellpadding="3" >
			    
			    <tr>
			    <td width="140px"> 이벤트 명 </td>
			    <td style="padding: 2px 10px" ><%= e.getEvttitle() %>	
					
				</td>
			    <td width="140px"> 당첨자 수 </td>
			    <td style="padding: 2px 10px">
					<%= e.getWinner_cnt() %></td>
			    </tr>
			    <tr>
			    	<td colspan="4" style="padding: 5px 10px;"> 당첨자 내역 </td>
			    </tr>
			    <tr>
			    	<td colspan="4">
			    		<table width="80%" style="margin: 0 auto">
						  <tr>
						    <th style="text-align: center;"> 당첨자 ID </th>
						    <th style="text-align: center;"> 당첨자 이름 </th>
						  </tr>
						 <%
							for (EventWinner ew : ewlist) {
								
						  %>
						  <tr>
						    <td><%= ew.getCwriter() %></td>
						    <td><%= ew.getUserName() %></td>
						  </tr>
						  <% 		
								}
						   %>
						</table>

			    	</td>
			    	
			    </tr>
			</table>
			
 		</div>
 
        <br />
      <hr>
      <br>
		<button type="button" class="listbtn"  onclick="location.href='/semi/eventManager.ev'">취소하기</button>
		<%-- <% if(m != null && m.getUserName().equals(t.getBwriter())){ %> --%>
		<button type="submit" class="listbtn">작성 완료</button>
		<%-- <% } %>	 --%>
		</form>
    </div>
    </div>
<br /><br />
<br /><br />
</div>
    <script>
        $(function(){
            $('#fileArea').hide();
            
            $('#evtImgArea').click(() => {
                $('#thumbnailImg').click();
            });
            
        });

        function LoadImg(value, num) {
				if(value.files && value.files[0]) {
					var reader = new FileReader();
					
					reader.onload = function(e){
						switch(num){
						case 1: $('#evtImg').attr('src', e.target.result);
							break;
						}
					}
					
					reader.readAsDataURL(value.files[0]);
				}
			}

    <script>
	<%-- function complete(){
		$("#insertForm").attr("action","<%=request.getContextPath() %>/eventManager.ev");
		
	} --%>
</script>
    </script>

<%@ include file="../common/footer.jsp" %>


</body>
</html>