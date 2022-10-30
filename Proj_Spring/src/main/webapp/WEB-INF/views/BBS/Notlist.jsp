<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 목록 보기</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/resources/style/common_style.css">
<link rel="stylesheet" href="/resources/style/style_BBS.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/script/script_Notice.js"></script>
</head>
<body>

	<header>
		<!--  헤더템플릿 시작, iframe으로 변경 -->
		<iframe src="/header" scrolling="no" width="100%" frameborder=0
			id="headerIfm"></iframe>
		<!--  헤더템플릿 끝 -->
	</header>
	<div id="wrap" class="dFlex">

		<div id="sideMenu">
			<ul class="List">
				<li><a href="/cart/cartList.jsp" id="cart">장바구니</a></li>
				<li><a href="/wishlist/wishlist.jsp" id="wish">찜 제품</a></li>
				<li><a href="/order/orderList.jsp">주문내역</a></li>
				<li><a href="/bbs_Inquire/list.jsp" id="inq">1대1문의</a></li>
				<hr>
				<li><a href="/Member/MemberMod.jsp" id="mod">회원정보수정</a></li>
				<li><a href="/Member/MemberDel.jsp" id="del">회원탈퇴</a></li>
			</ul>
		</div>

		<!-- 			<nav>
				<ul>
					<li><a href="/">메인페이지</a></li>
					<li><a href="/list">목록</a></li>
					<li><a href="/create">회원가입</a></li>
				</ul>
			</nav> -->

		<hr>

		<div class="moveMenu">
			<a href="/Notlist">공지사항</a> <a href="/InqWrite">1:1문의</a>

		</div>
		<table id="NoticeTbl">
			<thead>
				<tr>
					<th>번호</th>
					<th>ID</th>
					<th>제목</th>
					<th>내용</th>
				</tr>
			</thead>
			
			<tbody>

				<c:forEach var="row" items="${data}">
					<tr class="listTr">
						<td>${row.num}</td>
						<td> ${row.aName}</td>
						<td><a href="/Notdetail?num=${row.num}">${row.asubject}</a></td>
						<td>${row.acontent}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div>





			<c:if test="${admin.aId!=null}">
				<a href="/NotWrite">글쓰기</a>
			</c:if>
			<a href="/">메인으로</a>


		</div>


	</div>
	<!-- div#wrap -->

</body>
</html>