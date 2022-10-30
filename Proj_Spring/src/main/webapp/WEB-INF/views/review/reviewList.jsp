<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/err/errorProc.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰페이지</title>
<link rel="stylesheet" href="resources/style/common_style.css">
<link rel="stylesheet" href="resources/style/review_style.css">
<link rel="shortcut icon" href="#">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="resources/script/script_Review.js"></script>
<script>
$(function(){
	if('${param.reviewMod_Msg}') {
  		alert('${param.reviewMod_Msg}');
  	}
	if('${param.recommend_Msg}') {
  		alert('${param.recommend_Msg}');
  	}
	$("span.pageNum").each(function(index){
		if($(this).text() == "${pageMaker.cri.page}") {
			$(this).addClass("nowPageNum");
		} 
	});
});
</script>
</head>
<body>
	<div id="wrap" class="reviewListWrap">
		<main id="main">
			<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="bbsList">

				<h1>후기</h1>

				<div id="pageInfo" class="dFlex">
					<span> <c:choose>
							<c:when test="${search.keyWord == null || search.keyWord ==''}">
						 	전체 리뷰
		</c:when>
							<c:otherwise>
							검색 결과
		</c:otherwise>
						</c:choose> : ${pageMaker.totalCount} 개
					</span> <span>현재 페이지 : ${pageMaker.cri.page} /
						${pageMaker.tempEndPage}</span>
				</div>
					<c:choose>
						<c:when test="${fn:length(reviewList) > 0}">
							<c:forEach items="${reviewList}" var="board" varStatus="status">
								<h2>${board.subject}</h2>
								<table class="reviewListTbl">
									<tbody id="readTblBody">
										<tr>
											<td colspan="2">작성자 : ${board.regName}</td>
										</tr>
								
										<tr>
											<td colspan="2" class="regDate"></td>
										</tr>
								 <c:choose>
									<c:when test="${board.sysFileName}">
										<tr>
											<td colspan="2">
												<img src="resources/fileUpload/${board.sysFileName}" alt="리뷰이미지" width="100" height="100"> 
											</td>
										</tr>
									</c:when>
								 </c:choose>
										<tr>
											<td colspan="2" id="readContentTd"><pre>${board.content}</pre></td>
										</tr>
										<tr>
											<td colspan="2" id="btnAreaTd" class="read">
								<c:choose>
								 <c:when test="${user.uId != null && board.regId != user.uId}">
												<button type="button" class="recommendBtn">도움이 돼요</button> 
								 </c:when>
								 </c:choose>
												<span>${board.love}명이 추천하셨습니다.</span> 
												<br><br> 
 												<input type="hidden" class="totalReviewNum" name="totalReviewNum" value="${board.totalReviewNum}"> 
								 <c:choose>
								 <c:when test="${board.regId == user.uId || admin.aId != null}">
												<button type="button" class="modBtn">수 정</button>
												<button type="button" class="delBtn">삭 제</button>
								 </c:when>
								 </c:choose>
											</td>
										</tr>
									</tbody>
								</table>
								<hr>
								<script>
									$(function () {
										let index = "${status.index}";
										let regDate = "${board.regDate}";
										regDate = regDate.substr(0, 10);
										$("td.regDate").text(regDate);
									});
								</script>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<table class="reviewNoTbl">
								<tbody>
									<tr>
										<td>등록된 상품평이 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>






					<table>
						<tbody>
							<tr id="listBtnArea">
								<td colspan="5">

									<form class="dFlex" id="searchFrm" action="/reviewList">

										<div>
											<select name="keyField" id="keyField">
												<option value="subject"
													<c:if test="${search.keyField=='subject'}"> 
													selected </c:if>
													>제목</option>
												<option value="regName"
													<c:if test="${search.keyField=='regName'}"> 
													selected </c:if>
													>이름</option>
												<option value="content"
													<c:if test="${search.keyField=='content'}"> 
													selected </c:if>
													>내용</option>
											</select>
										</div>
										<div>
											<input type="text" name="keyWord" id="keyWord"
												size="20" maxlength="30" value="${search.keyWord}">
										</div>
										<div>
											<button type="submit" id="searchBtn" class="listBtnStyle">검색</button>
										</div>

									<input type="hidden" name="prodNum" id="prodNum" value="${search.prodNum}"> 
									</form> <!-- 상품번호 유지용 매개변수 데이터시작 --> 
									<!-- 상품번호 유지용 매개변수 데이터끝 --> 
									<!-- 검색결과 유지용 매개변수 데이터시작 -->
									<input type="hidden" id="nowPage" value="${pageMaker.cri.page}">
									<input type="hidden" id="pKeyField" value="${search.keyField}">
									<input type="hidden" id="pKeyWord" value="${search.keyWord}">
									<!-- 검색결과 유지용 매개변수 데이터끝 -->

								</td>
							</tr>
							<!-- tr#listBtnArea -->

							<tr id="listPagingArea">

								<!-- 페이징 시작 -->
								<td colspan="5" id="pagingTd">
<c:if test="${pageMaker.prev}">
										<span class="moveBlockArea"
											onclick="movePage('${pageMaker.startPage-1}')"> &lt; </span>
</c:if> 
<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
										<span class="pageNum" onclick="movePage('${pageNum}')">${pageNum}</span>
</c:forEach> 
<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
										<span class="moveBlockArea"
											onclick="movePage('${pageMaker.endPage+1}')"> &gt; </span>
</c:if>
								</td>
							</tr>

						</tbody>
					</table>

				</div>

			<!-- 실제 작업 영역 끝 -->
		</main>




	</div>
	<!-- div#wrap -->
</body>
</html>