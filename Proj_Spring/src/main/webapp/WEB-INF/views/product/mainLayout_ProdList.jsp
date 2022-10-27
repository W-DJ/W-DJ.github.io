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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="resources/script/script_main_Script.js"></script>
	</head>
	<body>
	<div id="wrap" class="prodListWrap mainLayout">
    	
	
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


			
			
		</div>
		<!--div#wrap  -->
	</body>
</html>
