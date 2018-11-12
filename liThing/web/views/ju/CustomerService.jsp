<%@page import="java.util.ArrayList"%>
<%@page import="com.buyme.ju.customerService.model.vo.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<CustomerService> list = (ArrayList<CustomerService>)request.getAttribute("list");
	Member m = (Member)session.getAttribute("member");
%>    

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>고객센터</title>
        <script src="<%=request.getContextPath() %>/resources/js/vendor/jquery-3.3.1.min.js"></script>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/CustomerService.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-style.css">
        
		<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">

        <style>
                @font-face {
                      font-family: 'NanumSquareRoundR' ;
                      src: url('<%=request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf');
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
	                <h1 id="ctitle">List of Thing</h1>
	            </div>
	        </div>
    	</div>
    	
    	<h1>고객센터</h1>
    	
    	
    <div id="help" align="center">
    <% if( m != null && m.getUserId().equals("admin")) { %>
    	<button class="insertBtn" onclick="location.href='views/ju/CustomerService_Insert.jsp'">작성하기</button>
    <% } %>
    <% for(int i = 0; i < list.size(); i++) { %>       
        <div class="question"><span>Q</span>
        <%= list.get(i).getCtitle() %>
        
        <% if( m != null && m.getUserId().equals("admin")) { %>
    	<button class="updateBtn" onclick="location.href='csUpView.cs?cno=<%= list.get(i).getCno() %>'">수정</button>
    	<%} %>
    	
        </div>
        <p class="content" ><span>A</span>
        	<%= list.get(i).getCcontent() %>
        </p>
	<%} %>   
        
    </div>
        <br />
        
        <script>
            $(function(){
                $('.content').slideUp();

                $('.question').click(function(){
                    $(this).next('p').slideToggle(500,function(){
                        
                    });
                });
            });
            
            
        </script>
<%@ include file="../common/footer.jsp" %>        
</body>
</html>