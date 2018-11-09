<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>리띵's Pick!</title>
        <script src="../../resources/js/vendor/jquery-3.3.1.min.js"></script>

        <link rel="stylesheet" href="../../resources/css/thema.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-style.css">
        
        <style>
    	@font-face {
          font-family: 'NanumSquareRoundR' ;
          src: url('../../resources/css/fonts/NanumSquareRoundR.ttf');
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
                <h1 style="text-align : left; margin-left: 15px;">테마명</h1>
            <section>
                <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="../../resources/img/big_portfolio_item_2.png" id="thema_view_pic">
                        </div>
                        <p>상품명</p>
                    </a>
                    5.0 <span id="score" style="color:#FFA41F;">★★★★★</span>
                </article>
                 <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="../../resources/img/big_portfolio_item_2.png" id="thema_view_pic">
                        </div>
                        <p>상품명</p>
                    </a>
                    5.0 <span id="score">★★★★★</span>
                </article>
                <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="../../resources/img/big_portfolio_item_2.png" id="thema_view_pic">
                        </div>
                        <p>상품명</p>
                    </a>
                    5.0 <span id="score">★★★★★</span>
                </article>
                <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="../../resources/img/big_portfolio_item_2.png" id="thema_view_pic">
                        </div>
                        <p>상품명</p>
                    </a>
                    5.0 <span id="score">★★★★★</span>
                </article>
                <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="../../resources/img/big_portfolio_item_2.png" id="thema_view_pic">
                        </div>
                        <p>상품명</p>
                    </a>
                    5.0 <span id="score">★★★★★</span>
                </article>
                <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="../../resources/img/big_portfolio_item_2.png" id="thema_view_pic">
                        </div>
                        <p>상품명</p>
                    </a>
                    5.0 <span id="score">★★★★★</span>
                </article>
                <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="../../resources/img/big_portfolio_item_2.png" id="thema_view_pic">
                        </div>
                        <p>상품명</p>
                    </a>
                    5.0 <span id="score">★★★★★</span>
                </article>
                <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="../../resources/img/big_portfolio_item_2.png" id="thema_view_pic">
                        </div>
                        <p>상품명</p>
                    </a>
                    5.0 <span id="score">★★★★★</span>
                </article>
                <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="../../resources/img/big_portfolio_item_2.png" id="thema_view_pic">
                        </div>
                        <p>상품명</p>
                    </a>
                    5.0 <span id="score">★★★★★</span>
                </article>
                <article id="thema_prd">     
                    <a href="#">
                        <div>
                            <img src="../../resources/img/big_portfolio_item_2.png" id="thema_view_pic">
                        </div>
                        <p>상품명</p>
                    </a>
                    5.0 <span id="score">★★★★★</span>
                </article>
            </section>
        </div>

		

        <%@ include file="../common/footer.jsp" %>
    </body>
</html>