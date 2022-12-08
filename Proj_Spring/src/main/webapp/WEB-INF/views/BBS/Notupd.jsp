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
</head>
<body>

	<div id="wrap_bbs">
		<h1>공지사항 수정</h1>
		<hr>
		
		<form method="post" action="/Notupd">

						<!-- 안녕하세요 -->

			<main id="main">

				<div class="bbsUpd">
					<table>
						<tbody>
							<tr>

								<td>이름<input type="text" name="aName" value="${data.aName}" readonly></td>
								
							</tr>
							<tr>
								<td>제목<input type="text" name="asubject"  required="required" value="${data.asubject}"></td>
								
							</tr>



							<tr>
								<td>사진첨부<input type="file" name="aupFileName"></td>

							</tr>

						</tbody>

					</table>
					
				</div>

					<textarea name="acontent" id="acontent" rows="10" placeholder="내용을 입력해주세요" required="required">${data.acontent}</textarea>
					<hr>
		<input type="hidden" name="num" value="${data.num}">
			</main>
			<aside id="aside" class="dFlex">

				<div id="submitBtn">
					<a href="/Notlist">목록으로</a>
					<button type="submit">수정완료</button>
					<button type="reset" id="reset">되돌리기</button>
				</div>
			</aside>


		</form>
	</div>
	<!-- div#wrap -->
</body>
</html>