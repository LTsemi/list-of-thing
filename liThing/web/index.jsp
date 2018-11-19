<%@ page contentType="text/html; charset=UTF-8" language="java"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.buyme.sic.ranking.model.vo.*, com.buyme.ju.thema.model.vo.Thema"%>
    
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");

%>
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
        <link href="https://fonts.googleapis.com/css?family=Gaegu" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet">
		
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
    opacity : 0.7;
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

* {
  box-sizing: border-box;
}

body {
  font: 16px Arial;  
}

.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9; 
}

.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important; 
  color: #ffffff; 
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
    		
    		$('#videoList').append($video);
    	});
    </script>
    <style>
* {
  box-sizing: border-box;
}

body {
  font: 16px Arial;  
}

.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9; 
}

.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
</style>
        
    </head>

<body>

	<%@ include file="views/common/header.jsp" %>

    <div id="video-container">
        <div class="video-overlay"></div>
        <div class="video-content">
            <div class="inner">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
              <h1 style="font-family: Luckiest Guy; font-size:9em;">List of Thing</h1>
              <!-- <p >리뷰를 하기 위해 <a href="">로그인</a> 하세요! </p>-->             
                 <p style="font-family: Gaegu;font-size:4em;">맛있는 세상을 찾아서:) </p>  
               <!--   <p style="font-family: Itim;font-size:4em;">Looking for a tasty world:) </p>  -->
                <br />

              
               <div class="col-md-6">
    		
            <div id="custom-search-input">
                <div class="input-group col-md-12">
                
                    <input type="text" class="form-control input-lg" id="search" name="search" placeholder="지금 당신이 먹고 싶은 바로 그 음식!  리뷰가 궁금하지 않나요?" />
                   <!--  style="background-color:transparent" -->
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button" onclick="searchProduct();">
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
        <div class="container" >
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
					<a href="/semi/selectList.tm">
                    <div class="thumb" id="Themadiv0">
                        <div class="hover-effect">
                            <div class="hover-content">

                            </div>
                        </div>

                    </div>
                     </a>
                </div>
            </div>
            
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
					<a href="/semi/selectList.tm">
                    <div class="thumb" id="Themadiv1">
                        <div class="hover-effect">
                            <div class="hover-content">

                            </div>
                        </div>

                    </div>
                     </a>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
					<a href="/semi/selectList.tm">
                    <div class="thumb" id="Themadiv2">
                        <div class="hover-effect">
                            <div class="hover-content">

                            </div>
                        </div>

                    </div>
                     </a>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
					<a href="/semi/selectList.tm">
                    <div class="thumb" id="Themadiv3">
                        <div class="hover-effect">
                            <div class="hover-content">

                            </div>
                        </div>

                    </div>
                     </a>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
					<a href="/semi/selectList.tm">
                    <div class="thumb" id="Themadiv4">
                        <div class="hover-effect">
                            <div class="hover-content">

                            </div>
                        </div>

                    </div>
                     </a>
                </div>
            </div>
            
            <div class="col-md-4 col-sm-6">
                <div class="portfolio-item">
					<a href="/semi/selectList.tm">
                    <div class="thumb" id="Themadiv5">
                        <div class="hover-effect">
                            <div class="hover-content">

                            </div>
                        </div>

                    </div>
                     </a>
                </div>
            </div>
		

        </div>
    </div>

	<%@ include file="views/common/footer.jsp" %>




 	<script>
 	
 	$(function(){
 		$.ajax({
			url : '/semi/mThema.ma',
			type : 'get',
			success : function(data){
				
				var j = 0;
				for(var i in data){
				$thema = $("#Themadiv"+i);
				
				// 테마 서블릿가서 gson 추가하기 boardTop5servlet 확인하기
				
					var $title = $('<h1>').text(data[i].ttitle);
					var $content = $('<p>').text(data[i].tcontent);
					var $themaimg = $('<img>').attr("src" , "<%= request.getContextPath()+"/resources/themaUploadFiles/"%>" + data[i].timage).css({ 'width':'350','height':'200'})
	
					$('#Themadiv'+i).append($title);
					$('#Themadiv'+i).append($content);
					$('#Themadiv'+i).append($themaimg);
					
				}
				
			}, error : function(data){
				console.log("테마 조회 실패");
			}
		});
 	})
		
		
 	var searchP = [];
 	
 		function autocomplete(inp, arr) {
			/*the autocomplete function takes two arguments,
			the text field element and an array of possible autocompleted values:*/
			//searchP 채우기

			
			var currentFocus;
			/*execute a function when someone writes in the text field:*/
			inp.addEventListener("input",	function(e) {
				

								var a, b, i, val = this.value;
								/*close any already open lists of autocompleted values*/
								closeAllLists();
								if (!val) {
									return false;
								}
								currentFocus = -1;
								/*create a DIV element that will contain the items (values):*/
								a = document.createElement("DIV");
								a.setAttribute("id", this.id
										+ "autocomplete-list");
								a.setAttribute("class", "autocomplete-items");
								/*append the DIV element as a child of the autocomplete container:*/
								this.after(a);
							      /*for each item in the array...*/
								var j = 0;
							      for (i = 0; i < arr.length; i++) {
							        /*check if the item starts with the same letters as the text field value:*/
							        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
							          /*create a DIV element for each matching element:*/
							          b = document.createElement("DIV");
							          /*make the matching letters bold:*/
							          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
							          b.innerHTML += arr[i].substr(val.length);
							          /*insert a input field that will hold the current array item's value:*/
							          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
							          /*execute a function when someone clicks on the item value (DIV element):*/
							          b.addEventListener("click", function(e) {
							              /*insert the value for the autocomplete text field:*/
							              inp.value = this.getElementsByTagName("input")[0].value;
							              /*close the list of autocompleted values,
							              (or any other open lists of autocompleted values:*/
							              closeAllLists();
							          });
							          a.appendChild(b);
										j++;
										if(j >= 7){
											break;
										}
							        }
							      }
							  });
							  /*execute a function presses a key on the keyboard:*/
							  inp.addEventListener("keydown", function(e) {
							      var x = document.getElementById(this.id + "autocomplete-list");
							      if (x) x = x.getElementsByTagName("div");
							      if (e.keyCode == 40) {
							        /*If the arrow DOWN key is pressed,
							        increase the currentFocus variable:*/
							        currentFocus++;
							        /*and and make the current item more visible:*/
							        addActive(x);
							      } else if (e.keyCode == 38) { //up
							        /*If the arrow UP key is pressed,
							        decrease the currentFocus variable:*/
							        currentFocus--;
							        /*and and make the current item more visible:*/
							        addActive(x);
							      } else if (e.keyCode == 13) {
							        /*If the ENTER key is pressed, prevent the form from being submitted,*/
							        e.preventDefault();
							        if (currentFocus > -1) {
							          /*and simulate a click on the "active" item:*/
							          if (x) x[currentFocus].click();
							        }
							      }
							  });
							  function addActive(x) {
							    /*a function to classify an item as "active":*/
							    if (!x) return false;
							    /*start by removing the "active" class on all items:*/
							    removeActive(x);
							    if (currentFocus >= x.length) currentFocus = 0;
							    if (currentFocus < 0) currentFocus = (x.length - 1);
							    /*add class "autocomplete-active":*/
							    x[currentFocus].classList.add("autocomplete-active");
							  }
							  function removeActive(x) {
							    /*a function to remove the "active" class from all autocomplete items:*/
							    for (var i = 0; i < x.length; i++) {
							      x[i].classList.remove("autocomplete-active");
							    }
							  }
							  function closeAllLists(elmnt) {
							    /*close all autocomplete lists in the document,
							    except the one passed as an argument:*/
							    var x = document.getElementsByClassName("autocomplete-items");
							    for (var i = 0; i < x.length; i++) {
							      if (elmnt != x[i] && elmnt != inp) {
							        x[i].parentNode.removeChild(x[i]);
							      }
							    }
							  }
							  /*execute a function when someone clicks in the document:*/
							  document.addEventListener("click", function (e) {
							      closeAllLists(e.target);
							  });
							}
		/*An array containing all the country names in the world:*/
			
				$.ajax({
		 			url : 'mSearch.pd',
		 			type : 'GET',
		 			data : {keyword : $('#search').val()},
		 			async : false,
		 			success : function(data){
		 				

		 				searchP = data;
		 				
		 			}, error : function(data) {
		 				console.log("자동 완성이 안돼요!!! ㅠㅜ");

		 			}
		 		 });
		
   		/* var searchP = [ "Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua & Barbuda","Argentina",
 			"Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus",
 			"Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil",
 			"British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands",
 			"Central Arfrican Republic","Chad","Chile","China","Colombia","Congo","Cook Islands",
 			"Costa Rica","Cote D Ivoire","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Denmark",
 			"Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea",
 			"Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France",
 			"French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar",
 			"Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau",
 			"Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq",
 			"Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan",
 			"Kenya","Kiribati","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho",
 			"Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia",
 			"Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania",
 			"Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat",
 			"Morocco","Mozambique","Myanmar","Namibia","Nauro","Nepal","Netherlands","Netherlands Antilles",
 			"New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","North Korea","Norway","Oman",
 			"Pakistan","Palau","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines",
 			"Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda",
 			"Saint Pierre & Miquelon","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia",
 			"Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia",
 			"Solomon Islands","Somalia","South Africa","South Korea","South Sudan","Spain","Sri Lanka",
 			"St Kitts & Nevis","St Lucia","St Vincent","Sudan","Suriname","Swaziland","Sweden",
 			"Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand",
 			"Timor L'Este","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey",
 			"Turkmenistan","Turks & Caicos","Tuvalu","Uganda","Ukraine",
 			"United Arab Emirates","United Kingdom","United States of America",
 			"Uruguay","Uzbekistan","Vanuatu","Vatican City",
 			"Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]; */
		   

		//  나중에 for문으로 위의 searchP에 다가 상품 이름들 추가하기
		
		
		/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
		autocomplete(document.getElementById("search"), searchP);
 		
 	 		$("#search").keyup(function(e){
 	 			var pName = $('#search').val();
 	 			
 	 			console.log(pName);
 	 			if(e.keyCode == 13)  {
 	 				location.href="/semi/sMain.po?pname=" + pName;
 	 			}
 	 			
 	 		});  

 		
 		function searchProduct(){
 			var pName = $('#search').val();
 			
 			location.href="<%=request.getContextPath()%>/sMain.po?pname=" + pName;
 		}
 				
	</script>

</body>
</html>