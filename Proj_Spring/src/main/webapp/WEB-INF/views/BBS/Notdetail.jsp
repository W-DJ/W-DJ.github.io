<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
div#wrap {
	width: 600px;
	padding: 20px;
	border: 3px solid #aaa;
	border-radius: 6px;
	margin: 10px auto;
}

hr {
	margin: 10px;
}

table#memberTbl td {
	padding: 10px;
}

table#memberTbl td:first-child {
	width: 120px;
	font-size: 17px;
	text-align: right:
}

table#memberTbl td:last-child {
	width: 400px;
}

table#memberTbl td input {
	font-size: 17px;
	padding: 4px 10px;
}

button {
	font-size: 18px;
	padding: 4px 10px;
	cursor: pointer;
}
</style>
<body>

	<div id="wrap">
		<h1>입력 양식 화면</h1>
		<hr>
		
		<form method="post">

						<!-- 안녕하세요 -->

			<main id="main">

				<div class="bbsWrite">
					<table>
						<caption>공지사항</caption>
						<tbody>
							<tr>

								<td>이름</td>
								<td>${data.aName}</td>
							</tr>
							<tr>
								<td>제목</td>
								<td>${data.asubject}</td>
							</tr>



							<tr>
								<td>사진첨부<input type="file" name="aupFileName"></td>

							</tr>

						</tbody>

					</table>
					<hr>
				</div>

					<textarea name="acontent" id="acontent" rows="10" style="border: none;text-align: center;">${data.acontent}</textarea>
					<hr>
			</main>
			<aside id="aside" class="dFlex">

				<div id="submitBtn">
					<a href="/Notlist">목록으로</a>
					<a href="/Notupd?num=${data.num}">수정하기</a>
					<a href="/Notdel?num=${data.num}">삭제하기</a>
					<button type="reset" id="reset">취소</button>
				</div>
			</aside>

		</form>
	</div>
	<!-- div#wrap -->
</body>
</html>