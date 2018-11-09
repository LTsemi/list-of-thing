<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.buyme.young.member.model.vo.Member"%>
<%
	Member mh = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Gugi:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <script src="<%=request.getContextPath() %>/resources/js/vendor/jquery-3.3.1.min.js"></script>
		
<style>

nav .logo {
  float: left;
  margin-left: 30px;
}

nav .logo a {
  font-size: 28px;
  line-height: 80px;
  text-transform: uppercase;
  color: #fff;
  text-decoration: none;
  letter-spacing: 0.5px;
}

nav .logo em {
  font-style: normal;
  font-weight: 200;
}

nav {
  background: rgba(250,250,250,0.2);
  height: 80px;
  position: fixed;
  width: 100%;
  left: 0;
  top: 0;
  z-index: 300;
  box-shadow: 0px 2px 10px 0px rgba(0,0,0,0.5);
}

.menu-icon {
  background: transparent ;
  border: 1px solid #fff;
  width: 50px;
  height: 50px;
  margin: 15px 39px 0 auto;
  position: relative;
  cursor: pointer;
  transition: background 0.5s;
  border-radius: 5px;
}

.menu-icon span,
.menu-icon span:before,
.menu-icon span:after {
  cursor: pointer;
  border-radius: 1px;
  height: 2px;
  width: 35px;
  background: white;
  position: absolute;
  left: 15%;
  top: 50%;
  display: block;
  content: '';
  transition: all 0.5s ease-in-out;
}

.menu-icon span:before {
  left: 0;
  top: -10px;
}

.menu-icon span:after {
  left: 0;
  top: 10px;
}

.menu-icon.active {
  background: rgba(250,250,250,0.2);
}

.menu-icon.active span {
  background-color: transparent;
}

.menu-icon.active span:before,
.menu-icon.active span:after {
  top: 0;
}

.menu-icon.active span:before {
  transform: rotate(135deg);
}

.menu-icon.active span:after {
  transform: rotate(-135deg);
}

.overlay-menu {
  background: rgba(0, 0, 0, 0.95);
  color: #ffffff;
  position: fixed;
  z-index: 100;
  left: 0;
  top: 0;
  height: 100%;
  overflow-y: auto;
  -webkit-overflow-scrolling: touch;
  width: 100%;
  padding: 50px 0;
  opacity: 0;
  text-align: center;
  transform: translateY(-100%);
  transition: all 0.5s;
}

.overlay-menu.open {
  opacity: 1;
  transform: translateY(0%);
}

.overlay-menu .main-menu {
  transform: translateY(50%);
  opacity: 0;
  transition: all 0.3s;
  transition-delay: 0s;
}

.overlay-menu.open .main-menu {
  transition: all 0.7s;
  transition-delay: 0.7s;
  opacity: 1;
  transform: translateY(0%);
}

.overlay-menu .main-menu:nth-child(2) {
  transition-delay: 0s;
}

.overlay-menu.open .main-menu:nth-child(2) {
  transition-delay: 1.25s;
}

.overlay-menu {
  overflow: scroll;
}

.overlay-menu::-webkit-scrollbar {
  display: none;
}

.overlay-menu ul {
  list-style: none;
  margin-top: 80px;
  padding: 0px;
}
.overlay-menu ul li {
  padding: 15px 0px;
}

.overlay-menu ul li a {
  font-size: 24px;
  font-weight: 300;
  color: #fff;
  text-decoration: none;
  transition: all 0.5s;
}

.overlay-menu ul li a:hover {
  color: rgba(250,250,250,0.5);
}


.overlay-menu p {
  margin-top: 60px;
  font-size: 13px;
  text-transform: uppercase;
  color: #fff;
  font-weight: 200;
  letter-spacing: 0.5px;
  text-align: center;
}

</style>
</head>
<body>
    <nav style="background : #FFA41F !important;">
        <div class="logo">
            <a href="/semi/index.jsp" style="font-family: 'Gugi'; color : #fff;">리띵</a> &nbsp; &nbsp; &nbsp;
          
        </div>
         
         <div style="float:right; padding-right : 3cm ; padding-top: 25px; font-size : 1.5em; ">
         <%if ( mh == null ) { %>
           <a href="/semi/views/young/login.jsp" style="font-family: 'Gugi'; font-size : 1.2em; color : #fff;"> login</a>
           <% } else { %>
           <label><a href="/semi/views/young/login.jsp" style="color : black;"><%= mh.getUserName() %></a>님</label>
           <% } %>
         </div>
        <div class="menu-icon" style="">
        <span></span>
      	</div>
    </nav>
    
      <section class="overlay-menu">
      <div class="container">
        <div class="row">
          <div class="main-menu">
              <ul>
                  <li>
                      <a href="/semi/views/sic/Ranking.jsp">랭 킹</a>
                  </li>
                  <li>
                      <a href="/semi/selectList.no">공지사항</a>
                  </li>
                  <li>
                      <a href="/semi/views/ju/LTpick.jsp">리띵's pick</a>
                  </li>
                  <li>
                      <a href="/semi/views/seul/lithingbox.jsp">리띵 박스</a>
                  </li>
                  <li>
                      <a href="/semi/views/seul/event.jsp">이벤트</a>
                  </li>
                  <li>
                      <a href="/semi/selectList.cs">고객센터</a>
                  </li>
              </ul>
              <p></p>
          </div>
        </div>
      </div>
    </section>
    
    <script>
    
    $(function(){
        $(".menu-icon").click(function() {
            $(this).toggleClass("active");
            $(".overlay-menu").toggleClass("open");
          });
    });

    </script>

</body>
</html>