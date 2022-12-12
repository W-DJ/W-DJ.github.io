<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="readCnt" value="0" />


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
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
	<div id="wrap" class="dFlex NotlistWrap">

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
		<!-- 실제 작업 영역 시작 -->
		<hr>

		<div id="contents" class="bbsList">
			<div class="moveMenu">
				<button id="noticeBtn" class="headBtn">공지사항</button>
				<button id="personalBtn" class="headBtn">1:1문의</button>

			</div>

			<table id="NoticeTbl">
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
							<td><a href="/Notdetail?num=${row.num}">${row.num}</td>
							<td><a href="/Notdetail?num=${row.num}">${row.aName}</td>
							<td><a href="/Notdetail?num=${row.num}">${row.asubject}</a></td>

						</tr>
					</c:forEach>

				</tbody>
			</table>

			<c:if test="${admin.aId != null}">
								<button type="button" id="NotBtn" class="listBtnStyle">글쓰기</button>
			</c:if>
			
			<button type="button" id="MainHome" class="listBtnStyle">메인으로</button>
		</div>



	</div>
	<!-- div#wrap -->

</body>
</html>