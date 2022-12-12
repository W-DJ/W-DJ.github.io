<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/style/common_style.css">
<link rel="stylesheet" href="/resources/style/style_BBS_Inq.css">
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/resources/script/script_Inquire.js"></script> -->
</head>
<body>

	<div id="wrap_bbs">
		<h1>고객문의</h1>
		<hr>

		<form method="post">

			<!-- 안녕하세요 -->

			<main id="main">

				<div class="bbsWrite">


					<table>

						<tbody>
							<tr>
								<td>아이디<input type="text" name="uid" id="uid"
									value="${user.uId}" readonly="readonly">

								</td>
							</tr>
							<tr>
								<td>이름<input type="text" name="uName" id="uName"
									value="${user.uName}" readonly="readonly">

								</td>
							</tr>
							<tr>
								<td>Q&A종류 <select name="qnaType" id="qnaType">
										<option>배송</option>
										<option>상품</option>
								</select>

								</td>

							</tr>
							<tr>
								<td>제목 <input type="text" name="subject" id="subject"
									required="required">
								</td>
							</tr>
							<tr>
								<td>글 비밀번호 <input type="text" name="bbsPw" id="bbsPw">
								</td>
							</tr>



							<tr>
								<td>사진첨부<input type="file" name="upFileName"></td>

							</tr>

						</tbody>

					</table>

				</div>

				<textarea name="content" id="content" rows="10"
					placeholder="내용을 입력해주세요" required="required"></textarea>

				<input type="hidden" name="pos" id="pos" value="0"> <input type="hidden"
					name="ref" id="ref" value="0"> <input type="hidden" name="depth"
					id="depth" value="0"> <input type="hidden" name="ip" id="ip" value="0"> <input
					type="hidden" name="readCnt" id="readCnt" value="0">



				<hr>
			</main>
			<aside id="aside" class="dFlex">

				<div id="submitBtn">
					<script>
						$(function() {
							$("button#InquireBtn").click(function() {
								location.href = "/BBS/Inqlist.jsp";
							})

						});
					</script>
					<button type="submit" id="InquireBtn">작성완료</button>
					<button type="button" id="cancel">작성취소</button>
				</div>
			</aside>

		</form>
	</div>
	<!-- div#wrap -->
</body>
</html>