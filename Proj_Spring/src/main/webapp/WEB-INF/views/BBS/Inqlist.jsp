<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="readCnt" value="0" />


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>고객문의 리스트</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/resources/style/common_style.css">
<link rel="stylesheet" href="/resources/style/style_BBS_Inq.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/script/script_Inquire.js"></script>
</head>
<body>

	<header>
		<!--  헤더템플릿 시작, iframe으로 변경 -->
		<iframe src="/header" scrolling="no" width="100%" frameborder=0
			id="headerIfm"></iframe>
		<!--  헤더템플릿 끝 -->
	</header>
	<div id="wrap" class="dFlex InqlistWrap">

		<div id="sideMenu">
			<ul class="List">
				<li><a href="/cartList" id="cart">장바구니</a></li>
				<li><a href="/wishlist" id="wish">찜 제품</a></li>
				<li><a href="/orderList">주문내역</a></li>
				<li><a href="/Inqlist" id="inq">1대1문의</a></li>
				<hr>
				<li><a href="/Member/MemberMod.jsp" id="mod">회원정보수정</a></li>
				<li><a href="/Member/MemberDel.jsp" id="del">회원탈퇴</a></li>
			</ul>
		</div>

		<hr>

		<div id="contents" class="bbsList">
			<div class="moveMenu">
				<button id="noticeBtn" class="headBtn">공지사항</button>
				<button id="personalBtn" class="headBtn">1:1문의</button>
			</div>

			<table id="InquireTbl">
				<thead>
					<tr>
						<th>번호</th>
						<th>ID</th>
						<th>제목</th>

					</tr>
				</thead>

				<tbody>

					<c:forEach var="row" items="${data}">
						<tr class="listTr">
							<td><a href="/Inqdetail?num=${row.num}">${row.num}</a></td>
							<td><a href="/Inqdetail?num=${row.num}">${row.uName}</a></td>
							<td><a href="/Inqdetail?num=${row.num}">${row.subject}</a></td>

						</tr>
					</c:forEach>

				</tbody>
			</table>

			<c:choose>

				<c:when test="${user.uId != null}">
									<button type="button" id="inqBtn">글쓰기</button>
				</c:when>
				<c:when test="${user.uId == null}">
									<button type="button" id="loginAlertBtn">글쓰기</button>

				</c:when>
			</c:choose>
		</div>



	</div>
	<!-- div#wrap -->

</body>
</html>