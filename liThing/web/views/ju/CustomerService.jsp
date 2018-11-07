<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>고객센터</title>
        <script src="../../resources/js/vendor/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="../../resources/css/CustumerService.css">

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="../../resources/css/CustumerService.css">
        <link rel="stylesheet" href="../../resources/css/templatemo-style.css">
        
		<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">

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
	                <h1 id="ctitle">List of Thing</h1>
	            </div>
	        </div>
    	</div>
    	
    	<h1>고객센터</h1>
    	
    <div id="help">        
        <div class="question"><span>Q</span>리뷰를 수정하고 싶어요.</div>
        <p class="content" style=""><span>A</span>
        	수정할 리뷰의 제목과 작성자, 수정할 내용을 관리자 메일로 보내주시면 수정해드립니다. <br />
        	관리자 메일 : test@test.com
        </p>
        
        <div class="question"><span>Q</span>리뷰하고 싶은 상품이 있습니다.</div>
        <p class="content"><span>A</span>
        	추가 되었으면 하는 상품의 정보를 관리자 메일로 보내주시면 추가 해드리겠습니다. <br />
        	관리자 메일 : test@test.com
        </p>

        <div class="question"><span>Q</span>리뷰를 신고하고 싶어요.</div>
        <p class="content"><span>A</span>
        	신고할 리뷰의 제목과 작성자, 신고 사유를 관리자 메일로 보내주시면 처리 해드립니다. <br />
        	관리자 메일 : test@test.com
        </p>

        <div class="question"><span>Q</span>리띵박스를 주문했는데 언제 배송되나요?</div>
        <p class="content"><span>A</span>
			리띵박스는 결제완료 후 안내된 배송예정일까지 배송됩니다. <br />
			배송예정일은 배송지에 따라 차이가 있을 수 있으며 배송조회는 마이페이지에서 확인하실 수 있습니다. <br />
                        단, 도서산간 지역 배송 및 천재지변으로 인해 배송일정이 변경될 수 있습니다.			
		</p>

        <div class="question"><span>Q</span>배송지를 변경하고 싶습니다.</div>
        <p class="content"><span>A</span>
			배송지 변경은 주문 전에 변경하실 수 있고 주문 후에 변경하고자 하는 경우 <br />
			마이페이지에서 주문내역을 조회하여 변경하실 수 있습니다.
		</p>

        <div class="question"><span>Q</span>운송장번호로 배송조회를 했는데 배송정보가 없다고 나와요.</div>
        <p class="content"><span>A</span>
        	당일에 발송되는 경우에 다음 날부터 배송 조회가 가능합니다.
        </p>

        <div class="question"><span>Q</span>제가 작성한 리뷰가 삭제되었습니다.</div>
        <p class="content"><span>A</span>
        	욕설, 비방, 명예훼손의 내용이 담긴 리뷰 또는 불성실한 내용이나 관련 없는 내용, 광고성 내용일 경우에 관리자의 검수를 거친 후 삭제될 수 있습니다.
        </p>

        <div class="question"><span>Q</span>제가 작성한 리뷰는 어디서 확인하나요?</div>
        <p class="content"><span>A</span>
        	직접 작성한 리뷰는 마이페이지에서 확인할 수 있습니다.
        </p>

        <div class="question"><span>Q</span>이벤트 등록을 하고 싶습니다.</div>
        <p class="content"><span>A</span>
            담당자에게 연락 주시면 자세하게 안내 해드리도록 하겠습니다. <br>
            담당자 : test@test.com
        </p>
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