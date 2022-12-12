<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/style/common_style.css">
<link rel="stylesheet" href="/resources/style/style_BBS.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/resources/script/script_Notice.js"></script>
</head>
<body>

	<div id="wrap_bbs">
		<h1>공지사항</h1>
		<hr>

		<form method="post">

			<!-- 안녕하세요 -->

			<main id="main">

				<div class="bbsWrite">
					<table>

						<tbody>
							<tr>

								<td>이름<input type="text" name="aName" id="aName"
									value="${admin.aId}" readonly>

								</td>
							</tr>
							<tr>
								<td>제목 <input type="text" name="asubject" id="asubject" required="required">
								</td>
							</tr>



							<tr>
								<td>사진첨부<input type="file" name="aupFileName"></td>

							</tr>

						</tbody>

					</table>

				</div>

				<textarea name="acontent" id="acontent" rows="10" placeholder="내용을 입력해주세요" required="required"></textarea>
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