<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>수정하기</title>
	<link rel="stylesheet" href="resources/style/style_Common.css">
	<link rel="stylesheet" href="resources/style/review_style.css">
	<script src="resources/source/jquery-3.6.0.min.js"></script>
	<script src="resources/script/script_Review.js"></script>
</head>

<body>
    <div id="wrap">
    	

	    	<form action="/reviewMod" method="post">
						  
			<main id="main">
				<div class="bbsWrite">
					<h2>후기 수정</h2>
					<table class="bbsWrite">
						<tbody>
							<tr>
								<td>이름</td>
								<td>
									${reviewBoardBean.regName}
								</td>
								
							</tr>
		
							<tr>
								<td class="req">제목</td>
								<td>
									<input type="text" name="subject" id="subject" value="${reviewBoardBean.subject}">
								</td>
							</tr>
								
	<!-- 					<tr>
								<td>사진첨부</td>
								<td><input type="file" name="upFileName"></td>
							</tr> -->
							<tr>
								<td class="contentTD">내용</td>
								<td>
									<textarea name="content" id="content" rows="10">${reviewBoardBean.content}</textarea>
								</td>
							</tr>
						</tbody>
	
					</table>
				</div>

					
				
			<hr>

			</main>
			<aside id="aside">
				<div id="submitBtn">
					<button type="submit" id="regBtn">작성완료</button>
					<button type="reset" id="reset">취소</button>
				</div>
			</aside>

			<input type="hidden" name ="prodNum" value="${reviewBoardBean.prodNum}">
			<input type="hidden" name = "totalReviewNum" value="${reviewBoardBean.totalReviewNum}">
			
			<input type="hidden" name="page" value="${search.page}" id="nowPage">
			<!-- 검색어전송 시작 -->
			<input type="hidden" name="keyField" id="keyField" value="${search.keyField}">
			<input type="hidden" name="keyWord" id="keyWord" value="${search.keyWord}">
			<!-- 검색어전송 끝 -->
			

		</form>
    		    	
    
        
    </div>
    <!-- div#wrap -->

</body>

</html>