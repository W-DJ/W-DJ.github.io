<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

								<td>이름<input type="text" name="aName" id="aName">

								</td>
							</tr>
							<tr>
								<td>제목 <input type="text" name="asubject" id="asubject">
								</td>
							</tr>



							<tr>
								<td>사진첨부<input type="file" name="aupFileName"></td>

							</tr>

						</tbody>

					</table>
					<hr>
				</div>

					<textarea name="acontent" id="acontent" rows="10"></textarea>
					<hr>
			</main>
			<aside id="aside" class="dFlex">

				<div id="submitBtn">
					<button type="submit" id="NoticeBtn">작성완료</button>
					<button type="reset" id="reset">취소</button>
				</div>
			</aside>

		</form>
	</div>
	<!-- div#wrap -->
</body>
</html>