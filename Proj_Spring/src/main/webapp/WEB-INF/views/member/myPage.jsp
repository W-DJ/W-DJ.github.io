<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush = "true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	  <meta charset="UTF-8">
	  <title>Insert title here</title>
	  <link rel="stylesheet" href="/resources/style/common_style.css">
	  <link rel="stylesheet" href="/resources/style/Mypage.css">
	  <link rel="shortcut icon" href="#">
	  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  <script src="/resources/script/script_Member.js"></script>
	</head>
  <body>
	  <header>

		<iframe src="/header" scrolling="no" width="100%" frameborder=0 id="headerIfm"></iframe>
 
  	</header>
	<div id="wrap">
  	<c:choose>
	<c:when test="${user.uId != null}">
	<div id="wrap" class="dFlex">
		<div id="sideMenu">
          <ul class="List">
	     <li><a href="/cartList" id="cart">장바구니</a></li>
	     <li><a href="/wishlist" id="wish">찜 제품</a></li>
	     <li><a href="">주문현황</a></li>
	     <li><a href="/Inqlist" id="inq">1대1문의</a></li>  
	       <hr>
	      <li><a href="/mod" id="mod">회원정보수정</a></li>
	      <li><a href="/memberDel" id="del">회원탈퇴</a></li>
	   </ul>
    	</div>
	      <div id="myPageContent">
	      <h2>마이페이지</h2>
	      <h3> ${user.uId}님 반갑습니다</h3>
	      <div id="myContent">
	      <div id="reviewArea">
	       <h3>마이 리뷰</h3>
  	       <p>리뷰 작성하고 혜택까지</p>
  	       <span><a href="#">리뷰작성하러가기</a></span>
	      </div>

	      </div>

	      </div>
	</div>

	</c:when>
	<c:when test="${aId_Session != null }">
	     <div id="sideMenu">
          <ul class="List">
	     <li><a href="/cartList" id="cart">장바구니</a></li>
	     <li><a href="/wishlist" id="wish">찜 제품</a></li>
	     <li><a href="">주문현황</a></li>
	     <li><a href="/Inqlist" id="inq">1대1문의</a></li>  
	       <hr>
	      <li><a href="/mod" id="mod">회원정보수정</a></li>
	      <li><a href="/memberDel" id="del">회원탈퇴</a></li>
	   </ul>
    	</div>
    	</c:when>


	<c:otherwise>
	 <script>
	 alert("로그인 후 이용이 가능합니다")
	 location.href="/login";
	 </script>
	</c:otherwise>
	</c:choose>
	</div>
	<iframe src="/footer" scrolling="no" width="100%" frameborder=0 id="footerIfm"></iframe>
	<!--div#wrap-->
	
  </body>
</html>