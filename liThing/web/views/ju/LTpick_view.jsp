<%@page import="com.buyme.sic.ranking.model.vo.Product"%>
<%@page import="com.buyme.ju.thema.model.vo.Thema"%>
<%@page import="com.buyme.ju.themaDetail.model.vo.ThemaProduct"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ThemaProduct> list = (ArrayList<ThemaProduct>)request.getAttribute("list");
	Thema t = (Thema)request.getAttribute("t");
	ThemaProduct tp = (ThemaProduct)request.getAttribute("themaProduct");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>리띵's Pick!</title>
        <script src="<%=request.getContextPath() %>/resources/js/vendor/jquery-3.3.1.min.js"></script>

        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/thema.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-style.css">
        
        <style>
    	@font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('<%=request.getContextPath() %>/resources/css/fonts/NanumSquareRoundR.ttf');
        }
        body, p { box-sizing: border-box;
            font-family: NanumSquareRoundR !important; 
        }
   </style>

    </head>
    <body>
        <%@ include file="../common/header.jsp" %>
        
        <div class="page-heading">
	        <div class="container">
	            <div class="heading-content">
	                <h1>테마</h1>
	            </div>
	        </div>
        </div>
        
        
      <div id="thema_detail">
      <% if( mh != null && mh.getUserId().equals("admin")) { %>
        <div align="left" style="margin-left:15px;">
        	<button onclick="location.href='tdInView.td'">추가하기</button>
        </div>
        <%} %>
            <h1 style="text-align : left; margin-left: 15px;"><%= t.getTtitle() %></h1>
            <% for(int i = 0; i < list.size(); i++){ %>
            <section id="product">
                <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="<%= request.getContextPath() %>/resources/productImg/<%= list.get(i).getCname() %>" id="thema_view_pic">
                        </div>
                        <p>[<%= list.get(i).getBrand() %>] <%= list.get(i).getPname() %></p>
                        <input type="hidden" name="pno" id="pno" value="<%= list.get(i).getPno() %>"/>
                        <input type="hidden" name="tno" id="tno" value="<%= t.getTno() %>"/>
                    </a><%= list.get(i).getRank() %>
                    <% for(int j = 0; j < list.get(i).getRank() ; j++){ %>
                    <span id="rank" style="color:#FFA41F;">★</span>
                    <%} %> 
                    <% if( mh != null && mh.getUserId().equals("admin")) { %>
                    <button onclick="location.href='tdDelete.td?pno=<%= list.get(i).getPno() %>&tno=<%=t.getTno() %>'">삭제</button>
                    <%} %>
                </article>
                <%} %>
            </section>
        </div>		

        <%@ include file="../common/footer.jsp" %>
    </body>
</html>