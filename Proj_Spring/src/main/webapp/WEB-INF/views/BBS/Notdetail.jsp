<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/style/common_style.css">
<link rel="stylesheet" href="/resources/style/style_BBS.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/script/script_Notice.js"></script>
</head>

<body>

	<div id="wrap_bbs">
		<h1>공지사항</h1>
		<hr>

		<form>



			<main id="main">

				<div class="bbsDetail">
					<table>

						<tbody>
							<tr>

								<td>이름<input type="text" name="aName" id="aName"
									value="${data.aName}" readonly>
							</tr>
							<tr>
								<td>제목<input type="text" name="asubject" id="asubject"
									required="required" value="${data.asubject}"></td>

							</tr>



							<tr>
								<td>사진첨부<input type="file" name="aupFileName"></td>

							</tr>

						</tbody>

					</table>

				</div>

				<textarea name="acontent" id="acontent" rows="10"
					placeholder="내용을 입력해주세요" required="required">${data.acontent}</textarea>
				<hr>
			</main>
			<aside id="aside" class="dFlex">

				<div id="submitBtn">
					<a href="/Notlist">목록으로</a>

					<c:if test="${admin.aId != null}">
						<%--1번. a링크를 통해 바로 삭제 <a href="/Notupd?num=${data.num}">수정하기</a> --%>
						<!--2번. 버튼으로 js를 통해 삭제 -->
						<button type="button" id="updNotBtn">수정하기</button>

						<%--1번. a링크를 통해 바로 삭제 <a href="/Notdel?num=${data.num}">삭제하기</a> --%>
						<!--2번. 버튼으로 js를 통해 삭제 -->
						<button type="button" id="delNotBtn">삭제하기</button>

					</c:if>
				</div>
			</aside>
			<input type="hidden" name="num" value="${data.num}" id="num">
		</form>
	</div>
	<!-- div#wrap -->
</body>
</html>