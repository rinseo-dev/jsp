<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey"); // 깃허브
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
 <style>
    *{margin:0 auto; padding:0;}
    header{display:flex;
          justify-content: space-between;
          margin-top:20px;
          align-items: center;
    }
    nav>ul{
      display:flex;
      width:300px;
      list-style: none;
    }
    ul>li{align-items: center;}
    div>img{width:1000px;}
    div > img:first-child { display: block; }
    
    #imgslide{position:relative;}
   	#imgslide img{
   	position:absolute;
   	left:50%;
   	transform:translateX(-50%);
      display: none;
    }
  
    #logo{width:100px;}
  </style>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
  <header>
    <div>
      <img src="resources/img/logo.png" alt="logo" id="logo">
    </div>
    <nav>
      <ul>
        <li><a href="vote/voteList.jsp">투표하기</a></li>
        <li><a href="board/list.jsp">게시판</a></li>
       <% if(id==null){ %>
        <li><a href="member/login.jsp">로그인</a></li>
       <%}else{ %>
        <li><a href="member/logout.jsp">로그아웃</a><li>
       <%} %>
      </ul>
    </nav>
    <div id="login">
    	<%if(id != null) {%>
    	<p>[<%=id %>님 로그인 상태]</p>
    	<%} %>
    </div>
  </header>
  <section id="imgslide">
      <img src="resources/img/I.png" alt="1번">
      <img src="resources/img/S.png" alt="2번">
      <img src="resources/img/F.png" alt="3번">
      <img src="resources/img/P.png" alt="4번">
  </section>
  
  <script>
 	/*  $(()=>{
 		let x = $('#imgslide>div img');
 		  let count = 3;
 		  setInterval(function() {
 			 count = (count + 1) % x.length;

 		    x.fadeOut();
 		    x.eq(count).fadeIn();
 		  }, 500);
    }); */
    
    /*
    $(document).ready(function() {
        let currentImageIndex = 0;
        const images = $('#imgslide img');

        function showNextImage() {
          images.eq(currentImageIndex).fadeOut(500); // 1초 동안 fadeOut 효과
          currentImageIndex = (currentImageIndex + 1) % images.length;
          images.eq(currentImageIndex).fadeIn(500); // 1초 동안 fadeIn 효과
        }

        // 이미지를 3초마다 교체하도록 설정
        const intervalId = setInterval(showNextImage, 500);

        // 페이지를 벗어날 때 interval 정리
        $(window).on('beforeunload', function() {
          clearInterval(intervalId);
        });
      });
    */
    
    $(()=>{
    	let x = $('#imgslide>img');
    	  let count = 4;
    	  setInterval(function() {
    	    count--;
    	    if(count==0) {
    	      x.fadeIn();
    	      count = 4;
    	    } else {
    	      x.eq(count).fadeOut();
    	    }
    	  }, 500);
    })
    
    
  </script>
</body>
</html>