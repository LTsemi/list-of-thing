<%@ page contentType="text/html; charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  		<title>List of Thing</title>
<!-- 

Highway Template

http://www.templatemo.com/tm-520-highway

-->
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="resources/css/fontAwesome.css">
        <link rel="stylesheet" href="resources/css/light-box.css">
        <link rel="stylesheet" href="resources/css/templatemo-style.css">
		
        <link href="https://fonts.googleapis.com/css?family=Gugi:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Luckiest+Guy" rel="stylesheet">
		
        <script src="/semi/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        
            <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <script src="/semi/resources/js/vendor/jquery-3.3.1.min.js"></script>
        
        <style>
     #custom-search-input{
    padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
}

#custom-search-input input{
    border: 0;
    box-shadow: none;
}

#custom-search-input button{
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}

#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search{
    font-size: 23px;
}
        
        </style>
        	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
     <script>window.jQuery || document.write('<script src="/semi/resources/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="/semi/resources/js/vendor/bootstrap.min.js"></script>
    
    <script src="/semi/resources/js/plugins.js"></script>
    <script src="/semi/resources/js/main.js"></script>
        
    <script>
    	$(function(){
    		
    		var video = [
    			"bake.mp4",
				"breadSugar.mp4",
				"potatoFries.mp4"
				];
    				
    		var i = Math.floor(Math.random() * 3);
    		
    		var $video = $('<source id="video" type="video/mp4">').attr("src", "/semi/resources/video/" + video[i]);
    		
    		console.log(video[i]);
    		console.log($('#video').attr("src"));
    		
    		$('#videoList').append($video);
    	});
    </script>
        
        
    </head>

<body>

	<%@ include file="views/common/header.jsp" %>

    <div id="video-container">
        <div class="video-overlay"></div>
        <div class="video-content">
            <div class="inner">
              <h1 style="font-family: Luckiest Guy; font-size:9em;">List of Thing</h1>
              <p>리뷰를 하기 위해 <a href="">로그인</a> 하세요! </p>

              
               <div class="col-md-6">
    		
            <div id="custom-search-input">
                <div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg"   placeholder="지금 당신이 먹고 싶은 음식은 바로 이것!  리뷰가 궁금하지 않나요?" />
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>
            </div>
        </div>
        
        

                <div class="scroll-icon">
                    <a class="scrollTo" data-scrollTo="portfolio" href="#"><img src="resources/img/scroll-icon.png" alt=""></a>
                </div>    
            </div>
        </div>
        <video id="videoList" autoplay="" loop="" muted>
        	
        </video>
    </div>









    <div class="grid-portfolio" id="portfolio">
        <div class="container">
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
                    <div class="thumb">
                        <a href="resources/img/big_portfolio_item_4.png" data-lightbox="image-1"><div class="hover-effect">
                            <div class="hover-content">
                                <h1>Biodiesel <em>squid</em></h1>
                                <p>Awesome Subtittle Goes Here</p>
                            </div>
                        </div></a>
                        <div class="image">
                            <img src="resources/img/portfolio_item_4.png">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
                    <div class="thumb">
                        <a href="resources/img/big_portfolio_item_2.png" data-lightbox="image-1"><div class="hover-effect">
                            <div class="hover-content">
                                <h1>raclette <em>taxidermy</em></h1>
                                <p>Awesome Subtittle Goes Here</p>
                            </div>
                        </div></a>
                        <div class="image">
                            <img src="resources/img/portfolio_item_2.png">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
                    <div class="thumb">
                        <a href="resources/img/big_portfolio_item_3.png" data-lightbox="image-1"><div class="hover-effect">
                            <div class="hover-content">
                                <h1>humblebrag <em>brunch</em></h1>
                                <p>Awesome Subtittle Goes Here</p>
                            </div>
                        </div></a>
                        <div class="image">
                            <img src="resources/img/portfolio_item_3.png">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
                    <div class="thumb">
                        <a href="resources/img/big_portfolio_item_1.png" data-lightbox="image-1"><div class="hover-effect">
                            <div class="hover-content">
                                <h1>Succulents <em>chambray</em></h1>
                                <p>Awesome Subtittle Goes Here</p>
                            </div>
                        </div></a>
                        <div class="image">
                            <img src="resources/img/portfolio_item_1.png">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
                    <div class="thumb">
                        <a href="resources/img/big_portfolio_item_5.png" data-lightbox="image-1"><div class="hover-effect">
                            <div class="hover-content">
                                <h1>freegan <em>aesthetic</em></h1>
                                <p>Awesome Subtittle Goes Here</p>
                            </div>
                        </div></a>
                        <div class="image">
                            <img src="resources/img/portfolio_item_5.png">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
                    <div class="thumb">
                        <a href="resources/img/big_portfolio_item_6.png" data-lightbox="image-1"><div class="hover-effect">
                            <div class="hover-content">
                                <h1>taiyaki <em>vegan</em></h1>
                                <p>Awesome Subtittle Goes Here</p>
                            </div>
                        </div></a>
                        <div class="image">
                            <img src="resources/img/portfolio_item_6.png">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
                    <div class="thumb">
                        <a href="resources/img/big_portfolio_item_7.png" data-lightbox="image-1"><div class="hover-effect">
                            <div class="hover-content">
                                <h1>Thundercats <em>santo</em></h1>
                                <p>Awesome Subtittle Goes Here</p>
                            </div>
                        </div></a>
                        <div class="image">
                            <img src="resources/img/portfolio_item_7.png">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
                    <div class="thumb">
                        <a href="resources/img/big_portfolio_item_8.png" data-lightbox="image-1"><div class="hover-effect">
                            <div class="hover-content">
                                <h1>wayfarers <em>yuccie</em></h1>
                                <p>Awesome Subtittle Goes Here</p>
                            </div>
                        </div></a>
                        <div class="image">
                            <img src="resources/img/portfolio_item_8.png">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
                    <div class="thumb">
                        <a href="resources/img/big_portfolio_item_9.png" data-lightbox="image-1"><div class="hover-effect">
                            <div class="hover-content">
                                <h1>disrupt <em>street</em></h1>
                                <p>Awesome Subtittle Goes Here</p>
                            </div>
                        </div></a>
                        <div class="image">
                            <img src="resources/img/portfolio_item_9.png">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="load-more-button">
                    <a href="#">Load More</a>
                </div>
            </div>
        </div>
    </div>

	<%@ include file="views/common/footer.jsp" %>


    
</body>
</html>