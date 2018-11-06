<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Highway Masonry CSS Template</title>
<!-- 

Highway Template

http://www.templatemo.com/tm-520-highway

-->
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../resources/css/fontAwesome.css">
        <link rel="stylesheet" href="../resources/css/light-box.css">
        <link rel="stylesheet" href="../resources/css/templatemo-style.css">

        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">

        <script src="../../resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
  <!-- ------------------------------------------------------------------------------------------------------- -->      
        
        
        <script src="/resources/js/jquery-3.3.1.min.js"></script>
        
        <style>
	.outer{
		width:900px;
		height:600px;
		background:white;
		color:black;
		margin-left:auto;
		margin-right:auto;
		margin-top:150px;
		
	}
	table {
		border:1px solid navy;
		text-align:center;
	}
	.tableArea {
		width:950px;
		height:650px;
		margin-left:auto;
		margin-right:auto;
	}
	.searchArea {
		width:750px;
		margin-left:auto;
		margin-right:auto;
	}
</style>
    </head>

<body>

   <%@ include file="../common/header.jsp" %>

    <div id="video-container">
        <!-- <div class="video-overlay"></div> -->
       <!--  <div class="video-content">
            <div class="inner">
              <h1 >공지사항</h1>
              <p>FREE CSS TEMPLATE by <a href="http://www.templatemo.com" rel="nofollow">templatemo</a></p>
              <p>Homepage with masonry image gallery</p>
                <div class="scroll-icon">
                    <a class="scrollTo" data-scrollTo="masonry" href="#"><img src="img/scroll-icon.png" alt=""></a>
                </div>    
            </div>
        </div>
       <video autoplay="" loop="" muted>
        	<source src="highway-loop.mp4" type="video/mp4" />
        </video> --> 
        
        <div class="outer">
		
		
		
	
		<h2 align="left">공지사항</h2>
		<div class="tableArea">
			<table align="center" id="listArea" class="table table-striped table-hover">
			<tr>
				<th>글번호</th>
				<th width="300px">글제목</th>
				<th width="100px">작성자</th>
				<th>조회수</th>
				<th width="100px">작성일</th>
			</tr>
			
			
			
		<%-- 	<% for(Notice n : list){ %>
			<tr>
				<td><%= n.getNno() %></td>
				<td><%= n.getNtitle() %></td>
				<td><%= n.getNwriter() %></td>
				<td><%= n.getNcount() %></td>
				<td><%= n.getNdate() %></td>
			</tr>
			<% } %> --%>
			
		
			
			<tbody>
					<tr>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							admin
						</td>
						<td>
							1
						</td>
                        <td>
							01/04/2012
						</td>
					</tr>
					<tr class="table-active">
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							admin
						</td>
						<td>
							2
						</td>
                        <td>
							01/04/2012
						</td>
					</tr>
					<tr class="table-success">
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							admin
						</td>
						<td>
							3
						</td>
                        <td>
							01/04/2012
						</td>
					</tr>
					<tr class="table-warning">
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							admin
						</td>
						<td>
							4
						</td>
                        <td>
							01/04/2012
						</td>
					</tr>
					<tr class="table-danger">
						<td>
							4
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							admin
						</td>
						<td>
							5
						</td>
                        <td>
							01/04/2012
						</td>
					</tr>
                    
				</tbody>
			
		</table>
		</div>
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option value="">---</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" id="keyword" placeholder="키워드 입력창:)!"> 
			<button type="button" onclick="search();">검색하기</button>
			<%--인라인 방식 --%>
			
			
			
			<%-- <% if(m != null && m.getUserId().equals("admin")){ %>
				<button onclick="location.href='views/notice/noticeInsertForm.jsp'">작성하기</button>
			<% } %> --%>
			
			
			
		</div>
	</div>
  
        
        		
    </div>

<!-- ------------------------------------------------------------------------------------------------------- -->
   <!--  <div class="masonry-portfolio" id="masonry">
        <div class="container-fluid">
            <div class="masonry">
                <div class="item first-item col-md-4 col-sm-6 col-xs-12">
                  <a href="img/big_portfolio_item_1.png" data-lightbox="image-1"><div class="thumb">
                      <div class="hover-effect">
                          <div class="hover-content">
                              <h1>Succulents <em>chambray</em></h1>
                              <p>Awesome Subtittle Goes Here</p>
                          </div>
                      </div>
                      <div class="image">
                          <img src="img/masonry_item_1.png">
                      </div>
                  </div></a>
                </div>
                <div class="item col-md-4 col-sm-6 col-xs-12">
                  <a href="img/big_portfolio_item_2.png" data-lightbox="image-1"><div class="thumb">
                      <div class="hover-effect">
                          <div class="hover-content">
                              <h1>Biodiesel <em>squid</em></h1>
                              <p>Awesome Subtittle Goes Here</p>
                          </div>
                      </div>
                      <div class="image">
                          <img src="img/masonry_item_2.png">
                      </div>
                  </div></a>
                </div>
                <div class="item col-md-4 col-sm-6 col-xs-12">
                  <a href="img/big_portfolio_item_3.png" data-lightbox="image-1"><div class="thumb">
                      <div class="hover-effect">
                          <div class="hover-content">
                              <h1>raclette <em>taxidermy</em></h1>
                              <p>Awesome Subtittle Goes Here</p>
                          </div>
                      </div>
                      <div class="image">
                          <img src="img/masonry_item_3.png">
                      </div>
                  </div></a>
                </div>
                <div class="item col-md-4 col-sm-6 col-xs-12">
                  <a href="img/big_portfolio_item_5.png" data-lightbox="image-1"><div class="thumb">
                      <div class="hover-effect">
                          <div class="hover-content">
                              <h1>freegan <em>aesthetic</em></h1>
                              <p>Awesome Subtittle Goes Here</p>
                          </div>
                      </div>
                      <div class="image">
                          <img src="img/masonry_item_4.png">
                      </div>
                  </div></a>
                </div>
                <div class="item col-md-4 col-sm-6 col-xs-12">
                  <a href="img/big_portfolio_item_6.png" data-lightbox="image-1"><div class="thumb">
                      <div class="hover-effect">
                          <div class="hover-content">
                              <h1>taiyaki <em>vegan</em></h1>
                              <p>Awesome Subtittle Goes Here</p>
                          </div>
                      </div>
                      <div class="image">
                          <img src="img/masonry_item_5.png">
                      </div>
                  </div></a>
                </div>
                <div class="item col-md-4 col-sm-6 col-xs-12">
                  <a href="img/big_portfolio_item_9.png" data-lightbox="image-1"><div class="thumb">
                      <div class="hover-effect">
                          <div class="hover-content">
                              <h1>disrupt <em>street</em></h1>
                              <p>Awesome Subtittle Goes Here</p>
                          </div>
                      </div>
                      <div class="image">
                          <img src="img/masonry_item_6.png">
                      </div>
                  </div></a>
                </div>
                <div class="item last-item col-md-8 col-sm-6 col-xs-12">
                  <a href="img/big_portfolio_item_4.png" data-lightbox="image-1"><div class="thumb">
                      <div class="hover-effect">
                          <div class="hover-content">
                              <h1>humblebrag <em>brunch</em></h1>
                              <p>Awesome Subtittle Goes Here</p>
                          </div>
                      </div>
                      <div class="image">
                          <img src="img/masonry_item_7.png">
                      </div>
                  </div></a>
                </div>
            </div>
        </div>
    </div> -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- ------------------------------------------------------------------------------------------------------- -->

<%@ include file="../common/footer.jsp" %>

<!-- ------------------------------------------------------------------------------------------------------- -->
      <!-- Modal button -->
    <div class="popup-icon">
      <button id="modBtn" class="modal-btn"><img src="img/contact-icon.png" alt=""></button>
    </div>  

    <!-- Modal -->
    <div id="modal" class="modal">
      <!-- Modal Content -->
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="header-title">Say hello to <em>Highway</em></h3>
          <div class="close-btn"><img src="img/close_contact.png" alt=""></div>    
        </div>
        <!-- Modal Body -->
        <div class="modal-body">
          <div class="col-md-6 col-md-offset-3">
            <form id="contact" action="" method="post">
                <div class="row">
                    <div class="col-md-12">
                      <fieldset>
                        <input name="name" type="text" class="form-control" id="name" placeholder="Your name..." required="">
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <input name="email" type="email" class="form-control" id="email" placeholder="Your email..." required="">
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <textarea name="message" rows="6" class="form-control" id="message" placeholder="Your message..." required=""></textarea>
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <button type="submit" id="form-submit" class="btn">Send Message Now</button>
                      </fieldset>
                    </div>
                </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    

    <section class="overlay-menu">
      <div class="container">
        <div class="row">
          <div class="main-menu">
              <ul>
                  <li>
                      <a href="../index.jsp">랭 킹</a>
                  </li>
                  <li>
                      <a href="../views/notice.jsp">공지사항</a>
                  </li>
                  <li>
                      <a href="../views/LTpick.jsp">리띵's pick</a>
                  </li>
                  <li>
                      <a href="../views/lithingbox.jsp">리띵 박스  구매 </a>
                  </li>
                  <li>
                      <a href="../views/event.jsp">이벤트</a>
                  </li>
                  <li>
                      <a href="../views/CustomerService.jsp">고객센터</a>
                  </li>
              </ul>
              <p>We create awesome templates for you.</p>
          </div>
        </div>
      </div>
    </section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/semi/resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="/semi/resources/js/vendor/bootstrap.min.js"></script>
    
    <script src="/semi/resources/js/plugins.js"></script>
    <script src="/semi/resources/js/main.js"></script>
<!-- ------------------------------------------------------------------------------------------------------- -->


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
		
	</script>











</body>
</html>