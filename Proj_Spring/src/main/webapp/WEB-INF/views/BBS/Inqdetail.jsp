<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/style/common_style.css">
<link rel="stylesheet" href="/resources/style/style_BBS_Inq.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/resources/script/script_Inquire.js"></script>
</head>

<body>

	<div id="wrap_bbs">

		<h2>${data.subject}</h2>
		<hr>

		<form method="post">

			<!-- 안녕하세요 -->

			<main id="main">

				<div class="bbsDetail">

					<table>

						<tbody>
							<tr>
								<td>아이디</td>
								<td>${data.uid}</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${data.uName}</td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td><input type="hidden" name="upFileName"></td>
							</tr>

						</tbody>

					</table>

				</div>
				<hr>
				<textarea name="content" id="content" rows="10"
					placeholder="내용을 입력해주세요" required="required">${data.content}</textarea>
				<hr>
			</main>
			<aside id="aside" class="dFlex">

				<div id="submitBtn">
					<a href="/Inqlist">목록으로</a>

					<c:if test="${data.uid == user.uId}">
						<a href="/Inqupd?num=${data.num}">수정하기</a>
						<a href="/Inqdel?num=${data.num}">삭제하기</a>
					</c:if>


				</div>
			</aside>

		</form>
	</div>
	<!-- div#wrap -->
</body>
</html>