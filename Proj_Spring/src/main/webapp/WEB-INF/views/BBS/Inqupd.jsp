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
<script src="/resources/script/script_Inquire.js"></script>
</head>
<body>

	<div id="wrap_bbs">
		<h1>고객문의 수정</h1>
		<hr>

		<form method="post" action="/Inqupd">

			

			<main id="main">

				<div class="bbsUpd">
					<table>

						<tbody>
							<tr>
								<td>아이디<input type="text" name="uid" id="uid"
									value="${data.uid}" readonly="readonly">

								</td>
								<td>이름<input type="text" name="uName" id="uName"
									value="${data.uName}" readonly="readonly">

								</td>
								<td>Q&A종류 <select name="qnaType" id="qnaType">
										<option>배송</option>
										<option>상품</option>
								</select>

								</td>
							</tr>
							<tr>
								<td>제목 <input type="text" name="subject" id="subject"
									required="required" value="${data.subject}">
								</td>
								<td>글 비밀번호 <input type="text" name="bbsPw" id="bbsPw"
									value="${data.bbsPw}">
								</td>
							</tr>



							<tr>
								<td>사진첨부<input type="file" name="upFileName"></td>

							</tr>


						</tbody>

					</table>

				</div>

				<textarea name="content" id="content" rows="10"
					placeholder="내용을 입력해주세요" required="required">${data.content}</textarea>
				<hr>
				<input type="hidden" name="num" value="${data.num}">
			</main>
			<aside id="aside" class="dFlex">

				<div id="submitBtn">
					<a href="/Inqlist">목록으로</a>
					<button type="submit">고객문의 수정완료</button>
					<button type="reset" id="reset">되돌리기</button>
				</div>
			</aside>


		</form>
	</div>
	<!-- div#wrap -->
</body>
</html>