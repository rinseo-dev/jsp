<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	/* String id = (String)session.getAttribute("idKey"); 필요없음
	   ${idKey}를 하면 page->application 까지 훑어서 있는 값 가져옴 */
	
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
		<!--
			ch10_homepage를 jstl버전으로 바꿈
			session.setAttribute("idKey",id);에서 id값을 idKey로 가져옴
        -->
        
        <!-- test="${empty idKey}" -> idKey == null도 가능 -->
       <c:choose>
         <c:when test="${empty idKey}">
         	<li><a href="member/login.jsp">로그인</a></li>
         </c:when>
         <c:otherwise>
         	<li><a href="member/logout.jsp">로그아웃</a><li>
         </c:otherwise>
       </c:choose>
       <!--
       < % if(id==null){ % >
        <li><a href="member/login.jsp">로그인</a></li>
       < %}else{ % >
        <li><a href="member/logout.jsp">로그아웃</a><li>
       < %} % >
       -->
      </ul>
    </nav>
    <div id="login">
    <!-- else가 없는 if 한개짜리라 if로 씀
    	test="${!empty idKey} or ${not empty idKey}도 가능
    -->
    	<c:if test="${idKey != null }">
    		<p>[${idKey }님 로그인 상태]</p>
    	</c:if>
    <!-- 
    	< %if(id != null) {%>
    	<p>[< %=id %>님 로그인 상태]</p>
    	< %} %>
    -->
    </div>
  </header>
  <section id="imgslide">
      <img src="resources/img/I.png" alt="1번">
      <img src="resources/img/S.png" alt="2번">
      <img src="resources/img/F.png" alt="3번">
      <img src="resources/img/P.png" alt="4번">
  </section>
  
  <script> 
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
    	  }, 1000);
    })
 
  </script>
</body>
</html>