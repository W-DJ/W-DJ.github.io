<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문현황</title>
		<link rel="stylesheet" href="resources/style/common_style.css">
		<link rel="stylesheet" href="resources/style/order_style.css">
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="resources/script/script_Order.js"></script>
		<script>
		$(function(){
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
			<iframe src="/header" scrolling="no" width="100%" frameborder=0 id="headerIfm"></iframe>
	    <!--  헤더템플릿 끝 -->   
  		</header>
		<div id="wrap" class="dFlex orderListWrap" >
		<!-- 수정함 -->
    		<div id="sideMenu">
          <ul class="List">
	     <li><a href="/cartList" id="cart">장바구니</a></li>
	     <li><a href="/wishlist" id="wish">찜 제품</a></li>
	     <li><a href="/orderList">주문내역</a></li>
	     <li><a href="/bbs_Inquire/list.jsp" id="inq">1대1문의</a></li>  
	       <hr>
	      <li><a href="/Member/MemberMod.jsp" id="mod">회원정보수정</a></li>
	      <li><a href="/Member/MemberDel.jsp" id="del">회원탈퇴</a></li>
	   </ul>
    	</div>
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="bbsList">
	    			<div id="title" class="dFlex">
	    				<img src="resources/img/주문내역.png" alt="주문내역 이미지" width="40" height="40">
	    				<!-- 수정함 -->
		    			<h1>주문내역</h1>
	    			
	    			</div>
	    			<div id="pageInfo" class="dFlex">
						<span>총 :  ${pageMaker.totalCount} 개</span>
						<span>페이지 :  ${pageMaker.cri.page} / ${pageMaker.tempEndPage}</span>  
					</div>	
		    			<table id="orderListTbl">
							<tbody>
								<tr>
									<th>주문번호</th>
									<th>주문상품</th>
									<th>총지불금액</th>
									<th>결제수단</th>
									<th>주문상태</th>
									<th>주문일시</th>
								</tr>
<c:choose>
		<c:when test="${fn:length(uOrderList) > 0}">
					<c:forEach items="${uOrderList}" var="board" varStatus="status">

								<tr>
									<td>${board.num}</td>
									<td>
							<c:choose>
								<c:when test="${fn:length(board.orderGoodsList) > 0}">
									<c:forEach items="${board.orderGoodsList}" var="goods">
										<div class="dFlex oNameVolumn">
											<div class="oName"><a href="/prodRead?num=${goods.pNum}">${goods.pName}</a></div>
											<div class="oVolumn">${goods.pVolumn}개</div>
										</div>
									</c:forEach>
								</c:when>
							</c:choose>
									</td>
									<td class="totalPay"></td>
									<td>${board.payWay}</td>
									<td>${board.ordetStatus}</td>
									<td>${board.orderTM}</td>
		
								</tr>
								<script>
									$(function () {
										let index = "${status.index}";
										let totalPay = "${board.totalPay}";
										$("td.totalPay").eq(index).text(parseInt(totalPay).toLocaleString()+"원");
									});
								</script>
					</c:forEach>
		</c:when>
		<c:otherwise>
								<tr>
									<td colspan="6">주문내역이 없습니다.</td>
								</tr>
		</c:otherwise>
</c:choose>
					
					
						</tbody>
						<tfoot>
														<tr id="listPagingArea">
							
						<!-- 페이징 시작 -->
								<td colspan="6" id="pagingTd">
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
						</tfoot>
					</table>
			

	    		</div>
	    	<!-- 실제 작업 영역 끝 -->
    		
    		</div>
    		
    			<iframe src="/footer" scrolling="no" width="100%" frameborder=0 id="footerIfm"></iframe>
    		    	
	</body>
</html>