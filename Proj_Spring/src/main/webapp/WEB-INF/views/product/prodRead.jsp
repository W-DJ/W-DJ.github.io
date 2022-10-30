<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="resources/style/common_style.css">
		<link rel="stylesheet" href="resources/style/product_style.css">
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script>
			$(function () {
				let sellLabelCode = "${board.sellLabel}";
				let sellLabel = sellLabelCode.split("");
				$("div.label").children("div").each(function(index){
					if(sellLabel[index] == "0") {
						$(this).css("display", "none");
					} 
				});
				
				let sellPrice = "${board.sellPrice}";
				let oriPrice = "${board.oriPrice}";
				let discountRate = 100-sellPrice/oriPrice*100;
				if(oriPrice==sellPrice) {
					$("div.discount").children("div").css("display", "none");
				}
				$("div.discRate").text(Math.round(discountRate)+"%");
				$("div.oPrice").text(parseInt(oriPrice).toLocaleString()+"원");
				$("div.sPrice").text(parseInt(sellPrice).toLocaleString()+"원");
			});
		</script>
		<script src="resources/script/script_Product.js"></script>
	</head>
	<body>
	 	<header>
	    	<!--  헤더템플릿 시작, iframe으로 변경 -->
			<iframe src="/header" scrolling="no" width="100%" frameborder=0 id="headerIfm"></iframe>
	    	<!--  헤더템플릿 끝 -->   
  	  	</header>
		<div id="wrap" class="prodReadWrap">
			<main id="main">
			
				<div id="prodMain" class="dFlex">
					<div id="prodPhoto">
						<img src="resources/fileUpload/${board.sysFileName}" alt="제품 이미지" width="400" height="400">
						<!-- 수정함 -->
					</div>
					
					<div id="prodInfoMain">
						<div id="pType">
							${board.pType}
						</div>
	
						<div class="label dFlex">					
							<div class="bestLabel">BEST</div>
							<div class="newLabel">NEW</div>
							<div class="saleLabel">SALE</div>
							&nbsp;
						</div>
						<div class="pName">${board.pName}</div>
						<hr>
						<div class="priceArea">
							<div class="discount dFlex">
								<div class="discRate"></div> 
								<div class="oPrice"></div>
							</div>
							<div class="sPrice"></div>
							<input type="hidden" value="${board.sellPrice}" id="sellPrice">
						</div>
	
						<div>
							<span>수량</span>
							<button type="button" id="volumnDownBtn">-</button>
							<input type="number" id="orderVolumn" value="1">
							<button type="button" id="volumnUpBtn">+</button>
							<input type="hidden" id ="stockVolumn" value="${board.stockVolumn}">
							<!-- 버튼을 누르면 span안에 있는 숫자가 바뀌는 js구현해야. 1 밑으로는 내려가거나 재고를 초과하지는 않도록 -->
						</div>
						<div>
							<iframe width="0" height="0" class="cartInsertIfr" style="display: none"></iframe>
							<iframe width="0" height="0" class="wishInsertIfr" style="display: none"></iframe>
							<button type="button" class="wishInsertBtn size" >위시리스트 추가</button>
							<button type="button" class="cartInsertBtn size">장바구니 담기</button>
						</div>
						<div>
							<button type="button" class="directOrderBtn size">바로 구매</button>						
						</div>
						<c:if test="${admin.aId!=null}">
						<div>
							<button type="button" id="modBtn" class="size">수 정</button>
							<button type="button" id="delBtn" class="size">삭 제</button>
						</div>
						</c:if>
					</div>
				</div>
				<hr>
				<div id="prodArticle">
					<div id="articleBtnArea">
						<button type="button" id="contentBtn" class="prodDetailBtn">상품상세</button>
						<button type="button" id="reviewBtn" class="prodDetailBtn">후기</button>
						<!-- 버튼을 누르면 div#content와 review의 display 속성값이 바뀌도록 js구현해야-->
					</div>
					<div id="content">
						${board.content}
					</div>
					<div id="review">
						<iframe src="/reviewList?prodNum=${board.num}" 
							scrolling="no" frameborder=0 id="reviewIfm" ></iframe>
					</div>
					<!-- 수정함 -->
				</div>
			</main>

			<input type="hidden" name="page" value="${param.page}" id="nowPage"> 
			<input type="hidden" name="num" value="${board.num}" id="num">
			<input type="hidden" name="uId" id="uId" value="${user.uId}">
	
			<!-- 검색어전송 시작 -->
			<input type="hidden" id="orderBy" value="${search.orderBy}">
			<input type="hidden" id="typeSearch" value="${search.typeSearch}">
			<input type="hidden" id="pKeyWord" value="${serach.keyWord}">
			<!-- 검색어전송 끝 -->
			
			

		</div>
		<!--div#wrap  -->
		<iframe src="/footer" scrolling="no" width="100%" frameborder=0 id="footerIfm"></iframe>
	</body>
</html>
