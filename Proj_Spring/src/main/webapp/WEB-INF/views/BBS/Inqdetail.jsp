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
		<h1>고객문의</h1>
		<hr>
		
		<form method="post">

						<!-- 안녕하세요 -->

			<main id="main">

				<div class="bbsDetail">
					<table>
					
						<tbody>
							<tr>
<td>아이디<input type="text" name="uid" id="uid"
									value="${data.uid}" readonly>
								
							</tr>
							<tr><td>이름<input type="text" name="uName" id="uName"
									value="${data.uName}" readonly></tr>
							<tr>
								<td>제목<input type="text" name="subject" id="subject" required="required" value="${data.subject}"></td>
								
							</tr>



							<tr>
								<td>사진첨부<input type="file" name="upFileName"></td>

							</tr>

						</tbody>

					</table>
				
				</div>

					<textarea name="content" id="content" rows="10" placeholder="내용을 입력해주세요" required="required">${data.content}</textarea>
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