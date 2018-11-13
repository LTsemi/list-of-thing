<%@page import="java.util.ArrayList"%>
<%@page import="com.buyme.ju.thema.model.vo.Thema"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Thema> list = (ArrayList<Thema>)request.getAttribute("list");
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>리띵's Pick!</title>
        <script src="<%=request.getContextPath() %>/resources/js/vendor/jquery-3.3.1.min.js"></script>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/thema.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-style.css">
        
		<link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet"> 

        <style>
            @font-face {
                  font-family: 'NanumSquareRoundR' ;
                  src: url("<%=request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf");
                }
                body, h2, p { box-sizing: border-box;
                    font-family: NanumSquareRoundR !important; 
                }
        </style>

    </head>

<body>

  <%@ include file="../common/header.jsp" %>
  
  		<div class="page-heading">
	        <div class="container">
	            <div class="heading-content">
	                <h1 id="title">List of Thing</h1>
	            </div>
	        </div>
    	</div>

        <h1>리띵's Pick!</h1>

        <div>
        	<% if( m != null && m.getUserId().equals("admin")) { %>
    		<div align="center"><button class="insertBtn" onclick="location.href='views/ju/Thema_Insert.jsp'">작성하기</button></div>
    		<% } %>
            <section>
            <% for(int i = 0; i < list.size(); i++){ %>
                <article class="thema">     
                    <a href="views/ju/LTpick_view.jsp"><div>
                        <img src="<%= request.getContextPath()+"/resources/themaUploadFiles/" + list.get(i).getTimage() %>" id="thema_pic">
                        <h2><%= list.get(i).getTtitle() %></h2>
                        <p id="content"><%= list.get(i).getTcontent() %></p>
                    </div></a>
                        <% if( m != null && m.getUserId().equals("admin")) { %>
				    	<button class="updateBtn" onclick="location.href='tUpView.tm?tno=<%= list.get(i).getTno() %>'">수정</button>
				    	<%} %>
                </article>
            <%} %>
            </section> 

        </div> <br /> <br />
        
        
        
        
<%@ include file="../common/footer.jsp" %>

<!-- 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/semi/resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="/semi/resources/js/vendor/bootstrap.min.js"></script>
    
    <script src="/semi/resources/js/plugins.js"></script>
    <script src="/semi/resources/js/main.js"></script> -->

</body>
</html>