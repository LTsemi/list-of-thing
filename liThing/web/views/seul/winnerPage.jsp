<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.buyme.seul.event.model.vo.*" %>
    
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
        
		<script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Gugi|Jua|Noto+Sans+KR:300" rel="stylesheet">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/templatemo-style.css">	


    </head>

<body>

  <style>
    @font-face {
        font-family: 'NanumSquareRoundR';
        src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
    }
    * { box-sizing: border-box;
        font-family: NanumSquareRoundR; 
        color:#333;
    }
    
    a{
    text-decoration-line: none !important;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {
        /* background-color: aquamarine; */
        margin: 0 auto;
        width: 1000px;
        /* height: 1000px; */
        }


    .evtbanner{
        text-align: center;
        width: 1000px;
        margin: 0 auto;
        margin-bottom:70px;
    }

    .winner-tab{
        /* border: 1px solid #333; */
        width: 200px;
        text-align: center;
        margin: 0 auto;
        line-height: 170%;        
    }
    .winner-tab .first {
        border-bottom: 2px solid #333;

    }

    .winner-tab tr th{
        text-align: center;
        /* padding-bottom: 3px; */
    }
    .comment{
        width: 800px;
        margin: 0 auto;
    }
    
    .listbtn {
      padding: 10px 20px;
      background-color: white;
      border: 1px solid lightgray;
      color: gray;
      border-radius: 0;
      transition: .2s;
      margin: 0 auto;

  }
  .listbtn:hover, .btn:focus {
      border: 1px solid rgb(255, 208, 56);
      background-color: rgb(255, 208, 56);
      color: rgb(255, 255, 255);
  }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
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
	  <h5><span class="glyphicon glyphicon-time"></span><%= e.getEvtdate() %></h5>
      <br><br>
      <p>
        <%= e.getEvtcontent() %>

      </p>    

	<div class="winTab">
		 <br>
		 <input type="hidden" name="evtEno" value="<%=e.getEvtEno()%>"/>
			<table border="1" width="500"  align="center" cellspacing="0" cellpadding="3" >
			    
			    
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
								if(e.getEvtEno() == ew.getEvtEno()){
						  %>
						  <tr>
						    <td><%= ew.getCwriter() %></td>
						    <td><%= ew.getUserName() %></td>
						  </tr>
						  <% 		}
								}
						   %>
						</table>

			    	</td>
			    	
			    </tr>
			</table>
			
 		</div>
      <br /><br />
      <hr>
      <br>
      <a href="/semi/selectWinList.ev" class="listbtn">목록으로</a>
      <% if(mh != null && mh.getUserId().equals("admin")){ %>	
      <button class="listbtn" onclick="location.href='eWinUpdateView.ev?eno=<%=e.getEno()%>'">수정하기</button>	
      <button class="listbtn" onclick="location.href='eWinDelete.ev?eno=<%=e.getEno()%>'">삭제하기</button>	  
	  <% } %>
    </div>
    </div>

</div>

<%@ include file="../common/footer.jsp" %>


</body>
</html>