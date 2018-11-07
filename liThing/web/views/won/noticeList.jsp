<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.buyme.won.notice.model.vo.*"%>
    
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Highway Masonry CSS Template</title>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../resources/css/fontAwesome.css">
        <link rel="stylesheet" href="../resources/css/light-box.css">
        <link rel="stylesheet" href="../resources/css/templatemo-style.css">

 <link href="https://fonts.googleapis.com/css?family=Gugi|Itim" rel="stylesheet">

        <script src="../../resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!--     Fonts and icons     -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
  <!-- ------------------------------------------------------------------------------------------------------- -->      
        
        
        <script src="/resources/js/jquery-3.3.1.min.js"></script>
        
        <style>
	.template_faq {
    background: #edf3fe none repeat scroll 0 0;
}
.panel-group {
    background: #fff none repeat scroll 0 0;
    border-radius: 3px;
    box-shadow: 0 5px 30px 0 rgba(0, 0, 0, 0.04);
    margin-bottom: 0;
    padding: 30px;
}
#accordion .panel {
    border: medium none;
    border-radius: 0;
    box-shadow: none;
    margin: 0 0 15px 10px;
}
#accordion .panel-heading {
    border-radius: 30px;
    padding: 0;
}
#accordion .panel-title a {
    background: #ffb900 none repeat scroll 0 0;
    border: 1px solid transparent;
    border-radius: 30px;
    color: #fff;
    display: block;
    font-size: 18px;
    font-weight: 600;
    padding: 12px 20px 12px 50px;
    position: relative;
    transition: all 0.3s ease 0s;
}
#accordion .panel-title a.collapsed {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #ddd;
    color: #333;
}
#accordion .panel-title a::after, #accordion .panel-title a.collapsed::after {
    background: #ffb900 none repeat scroll 0 0;
    border: 1px solid transparent;
    border-radius: 50%;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.58);
    color: #fff;
    content: "";
    font-family: fontawesome;
    font-size: 25px;
    height: 55px;
    left: -20px;
    line-height: 55px;
    position: absolute;
    text-align: center;
    top: -5px;
    transition: all 0.3s ease 0s;
    width: 55px;
}
#accordion .panel-title a.collapsed::after {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #ddd;
    box-shadow: none;
    color: #333;
    content: "";
}
#accordion .panel-body {
    background: transparent none repeat scroll 0 0;
    border-top: medium none;
    padding: 20px 25px 10px 9px;
    position: relative;
}
#accordion .panel-body p {
    border-left: 1px dashed #8c8c8c;
    padding-left: 25px;
}

.searchArea {
		width:650px;
		margin-left:auto;
		margin-right:auto;
	}
	
@font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
          }

body { box-sizing: border-box;
            font-family: NanumSquareRoundR !important; 
      }
      
#searchBtn {
    background-color: white;
    color: black;
    border: 0.5px solid #BDBDBD;
     height: 24px;
}

#searchCondition {
 background-color: white;
    color: black;
    border: 0.5px solid #BDBDBD;
    height: 24px;
 }
 

</style>
    </head>

<body>

   <%@ include file="../common/header.jsp" %>
   
    
    <div class="page-heading2">
        <div class="container">
            <div class="heading-content">
                <h1>list of<em>thing :)</em></h1>
            </div>
        </div>
    </div>
        
        <div class="outer" style=" height: 610px;" >
	
		 <div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center wow zoomIn">
					<br />
					
						<h1 style="font-family: Gugi;">공지사항</h1>
						<span></span>
						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<% for(Notice n : list){ %>
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne"> <%= n.getNtitle() %>
										&nbsp 조회수 : <%= n.getNcount() %>
									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<p>
										글 번호 : &nbsp
										<%= n.getNno() %>
										작성자 : &nbsp
										<%= n.getNwriter() %>
										작성일 : &nbsp
										<%= n.getNdate() %>
									</p>
									<p><%= n.getNcontent() %>
										<br>
										<% if( n != null && n.getUserId().equals("admin")) { %>
										<button
											onclick="location.href='nUpView.no?nno=<%=n.getNno()%>'">수정하기</button>
										<% } %>
									</p>
								</div>
							</div>
						</div>
						<% } %>
					</div>
				</div>
				<!--- END COL -->
			</div>
			<!--- END ROW -->	
		</div>
	</div>
	
	
	
	
	<%-- 페이지 처리 --%>
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.no?currentPage=<%= maxPage %>'">>></button>
			
		</div>
	
	
	
	
  
        	<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option value="">---</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" id="keyword" placeholder="키워드를 입력하세요:)"> 
			<button type="button" id="searchBtn" onclick="search();">검색하기</button>
			<%--인라인 방식 --%>
			
			
			
			<%-- <% if(m != null && m.getUserId().equals("admin")){ %>
				<button onclick="location.href='views/notice/noticeInsertForm.jsp'">작성하기</button>
			<% } %> --%>
			

		</div>
    <br />
    <br />
    

<%@ include file="../common/footer.jsp" %>

<script>
	<%-- 	$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"black"});
			}).click(function(){
				//console.log($(this).parent().children().eq(0).text());
				// 현재 클릭된 에의 형제
				//var nno = $(this).siblings().eq(0).text();
				var nno = $(this).parent().children().eq(0).text();
				// getContextPath()절대경로를 지정하는 것 = myWeb이라고 주는 거랑 같음 알아서 변경해서 가져감 최상위경로로
				location.href="<%=request.getContextPath()%>/selectOne.no?nno=" + nno;
			});
		});
		
		function search(){
			location.href="<%=request.getContextPath()%>/searchNotice.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		} --%>
		
		(function($) {
			'use strict';
			
			jQuery(document).on('ready', function(){
			
					$('a.page-scroll').on('click', function(e){
						var anchor = $(this);
						$('html, body').stop().animate({
							scrollTop: $(anchor.attr('href')).offset().top - 50
						}, 1500);
						e.preventDefault();
					});		

			}); 	

						
		})(jQuery);
		
	</script>



</body>
</html>