<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style/common_style.css">
<link rel="stylesheet" href="resources/style/product_style.css">
<link rel="shortcut icon" href="#">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="resources/script/script_Product.js"></script>
<script>
$(function(){
	if('${param.del_Msg}') {
  		alert('${param.del_Msg}');
  	}
	if('${param.mod_Msg}') {
  		alert('${param.mod_Msg}');
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
	<header>
		<!--  헤더템플릿 시작, iframe으로 변경 -->
		<iframe src="/header" scrolling="no" width="100%" frameborder=0
			id="headerIfm"></iframe>
		<!--  헤더템플릿 끝 -->
	</header>
	<div id="wrap" class="prodListWrap">
		<main id="main">

			<div id="pageInfo" class="dFlex">
				<div id="tblNumInfo">
					<span> <c:choose>
							<c:when test="${search.keyWord == null || search.keyWord ==''}">
						 	전체 상품
						 </c:when>
							<c:otherwise>
							검색 결과
						 </c:otherwise>
						</c:choose> : ${pageMaker.totalCount} 개
					</span> <span>현재 페이지 : ${pageMaker.cri.page} / ${pageMaker.tempEndPage}</span>
				</div>
				<div id="orderArea">
					<ul class="dFlex">
						<li><label> <input type="radio" class="orderBy"
								name="orderBy" value="salesVolumn_desc"> <span>판매량순</span>
						</label></li>
						<li>|</li>
						<li><label> <input type="radio" class="orderBy"
								name="orderBy" value="sellPrice_asc"> <span>낮은
									가격순</span>
						</label></li>
						<li>|</li>
						<li><label> <input type="radio" class="orderBy"
								name="orderBy" value="sellPrice_desc"> <span>높은
									가격순</span>
						</label></li>
						<li>|</li>
						<li><label> <input type="radio" class="orderBy"
								name="orderBy" value="num_desc"> <span>최신 등록순</span>
						</label></li>
					</ul>
				</div>
			</div>
			<ul id="prodBBS" class="dFlex">
				<c:choose>
					<c:when test="${fn:length(prodList) > 0}">
						<c:forEach items="${prodList}" var="board" varStatus="status">
				<li class="prod" onclick="read('${board.num}', '${pageMaker.cri.page}')">
					<div class="prodThum">
						<img src="resources/fileUpload/${board.sysFileName}" alt="제품 썸네일" width="230"
							height="230">
					</div>
					<div class="prodDetail">
						<div class="label dFlex">
							<div class="bestLabel">BEST</div>
							<div class="newLabel">NEW</div>
							<div class="saleLabel">SALE</div>
							&nbsp;
						</div>
						<div class="pName">${board.pName}</div>
						<div class="priceArea">
							<div class="discount dFlex">
								<div class="discRate"></div> 
								<div class="oPrice"></div>
							</div>
							<div class="sPrice"></div>
						</div>
					</div>
					<script>
					$(function () {
						let index = "${status.index}";
						let sellLabelCode = "${board.sellLabel}";
						let sellLabel = sellLabelCode.split("");
						$("li.prod").eq(index).find("div.label").children("div").each(function(index){
							if(sellLabel[index] == "0") {
								$(this).css("display", "none");
							} 
						});
						
						let sellPrice = "${board.sellPrice}";
						let oriPrice = "${board.oriPrice}";
						let discountRate = 100-sellPrice/oriPrice*100;
						if(oriPrice==sellPrice) {
							$("li.prod").eq(index).find("div.discount").children("div").css("display", "none");
						}
						$("li.prod").eq(index).find("div.discRate").text(Math.round(discountRate)+"%");
						$("li.prod").eq(index).find("div.oPrice").text(parseInt(oriPrice).toLocaleString()+"원");
						$("li.prod").eq(index).find("div.sPrice").text(parseInt(sellPrice).toLocaleString()+"원");
					});
				</script>
				</li>
						
						</c:forEach>
					</c:when>
					<c:otherwise>
	
				<li>게시물이 없습니다.</li>
					</c:otherwise>
				</c:choose>

		
						



			</ul>
			<div id="listBtnArea">
				<c:if test="${admin.aId!=null}">
					<button type="button" onclick="location.href='/prodPost'">글쓰기</button>
				</c:if>

				<form name="searchFrm" class="dFlex" id="searchFrm">

					<div>
						<select name="typeSearch" id="typeSearch">
							<option value="전체"
								<c:if test="${search.typeSearch=='전체'}">
								selected
							</c:if>>전체</option>
							<option value="스킨케어"
								<c:if test="${search.typeSearch=='스킨케어'}">
								selected
							</c:if>>스킨케어</option>
							<option value="로션"
								<c:if test="${search.typeSearch=='로션'}">
								selected
							</c:if>>로션</option>
							<option value="핸드크림"
								<c:if test="${search.typeSearch=='핸드크림'}">
								selected
							</c:if>>핸드크림</option>
							<option value="기타"
								<c:if test="${search.typeSearch=='기타'}">
								selected
							</c:if>>기타</option>
						</select>
					</div>
					<div>
						<input type="text" name="keyWord" id="keyWord"
							size="20" maxlength="30" value="${search.keyWord}">
					</div>
					<div>
						<button type="button" id="searchBtn" class="listBtnStyle">검색</button>
					</div>

				</form>

				
				<!-- 검색결과 유지용 매개변수 데이터시작 -->
				<input type="hidden" id="nowPage" value="${pageMaker.cri.page}">
				<input type="hidden" id="pKeyWord" value="${search.keyWord}">
				<input type="hidden" id="orderBy" value="${search.orderBy}">
				<input type="hidden" id="typeSearch" value="${search.typeSearch}">
				<!-- 검색결과 유지용 매개변수 데이터끝 -->
			</div>

			<div id="listPagingArea">

				<!-- 페이징 시작 -->


				<c:if test="${pageMaker.prev}">
					<span class="moveBlockArea"
						onclick="movePage('${pageMaker.startPage-1}')"> &lt; </span>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}"
					end="${pageMaker.endPage }" var="pageNum">
					<span class="pageNum" onclick="movePage('${pageNum}')">${pageNum}</span>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">

					<span class="moveBlockArea"
						onclick="movePage('${pageMaker.endPage+1}')"> &gt; </span>
				</c:if>

			</div>


		</main>
		<!-- main#main -->
	</div>
	<!--div#wrap  -->
	<iframe src="/footer" scrolling="no" width="100%" frameborder=0
		id="footerIfm"></iframe>
</body>
</html>
