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

        <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../resources/css/fontAwesome.css">
        <link rel="stylesheet" href="../resources/css/light-box.css">
        <link rel="stylesheet" href="../resources/css/templatemo-style.css">

        <link rel="stylesheet" href="../../resources/css/CustumerService.css">

        <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>

<body>

<%@ include file="../common/header.jsp" %>
    <h1 style="margin-top:95px;">고객센터</h1>
        
        <div class="menu">Q. 리뷰를 수정하고 싶어요.</div>
        <p class="content">A. test@test.com </p>

        <div class="menu">Q. 리뷰를 신고하고 싶어요.</div>
        <p class="content">A. test@test.com</p>

        <div class="menu">Q. 리띵박스 배송조회를 하고 싶어요.</div>
        <p class="content">A. </p>

        <div class="menu">Q. </div>
        <p class="content">A. </p>

        <div class="menu">Q. </div>
        <p class="content">A. </p>
        
        <br />
        
        <script>
            $(function(){
                $('.content').slideUp();

                $('.menu').click(function(){
                    $(this).next('p').slideToggle(500,function(){
                        
                    });
                });
            });
        </script>
<%@ include file="../common/footer.jsp" %>        
</body>
</html>