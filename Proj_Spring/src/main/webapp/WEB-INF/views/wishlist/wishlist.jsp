<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/err/errorProc.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>위시리스트 페이지</title>
		<link rel="stylesheet" href="resources/style/common_style.css">
		<link rel="stylesheet" href="resources/style/wishlist_style.css">
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="resources/script/script_Wishlist.js"></script>
	</head>
	<body>
	  	<header>
	    <!--  헤더템플릿 시작, iframe으로 변경 -->
			<iframe src="/header" scrolling="no" width="100%" frameborder=0 id="headerIfm"></iframe>
	    <!--  헤더템플릿 끝 -->   
  		</header>
		<div id="wrap" class="dFlex wishlistWrap" >
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
	    				<img src="resources/img/wishlist_icon.png" alt="위시리스트 이미지" width="40" height="40">
	    				<!-- 수정함 -->
		    			<h1>위시리스트</h1>
	    			
	    			</div>
	    			<div id="pageInfo" class="dFlex">
						<span>총 :  ${pageMaker.totalCount} 개</span>
						<span>페이지 :  ${pageMaker.cri.page} / ${pageMaker.tempEndPage}</span>  
					</div>	
		    			<table id="wishlistTbl">
							<tbody>
								<tr>
									<th>
										<label>
											<input type="checkbox" id="chkAll">
											<span>전체선택</span>								
										</label>
									</th>
									<th>상품정보</th>
									<th>상품금액</th>
									<th>&nbsp;</th>
								</tr>
<c:choose>
		<c:when test="${fn:length(wishlist) > 0}">
					<c:forEach items="${wishlist}" var="board" varStatus="status">
								<tr class = "wishProd">
									<td>
										<label>
											<input type="checkbox" class="chkOne">
											<img src="resources/fileUpload/${board.sysFileName}" alt="상품이미지" width="100" height="100">
										</label>
									</td>
									<td>
										<a href="/prodRead?num=${board.pNum}" class="pNamePrn">${board.pName}</a>
										<!-- 수정함 -->
										<input type="hidden" name ="pName" value="${board.pName}">
										<input type="hidden" value="${board.num}" form="multiDelFrm" class="delNum">
										<input type="hidden" value="${board.pNum}" form="cartMulInsertFrm" class="pNum">
									</td>
									<td class="sPrice"></td>
									<td>
										<button type="button" class="oneDelBtn">&times;</button>
									</td>
								</tr>
								<script>
								$(function () {
									let index = "${status.index}";
						
									
									let sellPrice = "${board.sellPrice}";
									$("tr.wishProd").eq(index).find("td.sPrice").text(parseInt(sellPrice).toLocaleString()+"원");
								});
							</script>
						</c:forEach>
		</c:when>
		<c:otherwise>
								<tr>
									<td colspan="4">위시리스트가 비어있습니다.</td>
								</tr>
		</c:otherwise>
</c:choose>
					
					
						</tbody>
						<tfoot>
							<tr>
								<td colspan="1">
									<button type="button" id="multiDelBtn" form="multiDelFrm">선택삭제</button>
								</td>
								<td colspan="3">
									<button type="submit" class="cartInsertBtn" form="cartMulInsertFrm">장바구니에 담기</button>
								</td>
							</tr>
							<tr id="listPagingArea">
							
						<!-- 페이징 시작 -->
								<td colspan="4" id="pagingTd">
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
		<!-- div#wrap -->
		<iframe src="/footer" scrolling="no" width="100%" frameborder=0 id="footerIfm"></iframe>
		
		<form action="/wishlist/wishMulDelProc.jsp" id="multiDelFrm"></form>
		<form action="/cart/cartMulInsertProc.jsp" id="cartMulInsertFrm"></form>
	</body>
</html>