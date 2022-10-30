<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/err/errorProc.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니 페이지</title>
		<link rel="stylesheet" href="resources/style/common_style.css">
		<link rel="stylesheet" href="resources/style/cartList_style.css">
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="resources/script/script_Cart.js"></script>
		<script>
		if('${param.cart_Msg}') {
			window.parent.alert('${param.cart_Msg}');
	  	}
		if('${param.del_Msg}') {
			window.parent.alert('${param.del_Msg}');
	  	}
		</script>
	</head>
	<body>
	  	<header>
	    <!--  헤더템플릿 시작, iframe으로 변경 -->
			<iframe src="/header" scrolling="no" width="100%" frameborder=0 id="headerIfm"></iframe>
	    <!--  헤더템플릿 끝 -->   
  		</header>

		<div id="wrap" class="dFlex cartListWrap">
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
    		<main id="main">
	    	
	    		<div id="contents" class="bbsList">
	    			<div id="title"  class="dFlex">
		    			<img src="resources/img/Cart.png" alt="장바구니 이미지"  width="40" height="40"/>
		    			<h1>장바구니</h1>		
	    			</div>
		    		<table id="cartTbl">
							<tbody>
								<tr>
									<th>
										<label>
											<input type="checkbox" id="chkAll">
											<span>전체선택</span>								
										</label>
									</th>
									<th colspan="3">상품정보</th>
									<th>상품금액</th>
									<th>&nbsp;</th>
								</tr>
<c:choose>
		<c:when test="${fn:length(cartList) > 0}">
					<c:forEach items="${cartList}" var="board" varStatus="status">
								<tr>
									<td>
										<label>
											<input type="checkbox" class="chkOne">
											<input type="hidden" value="${board.sellPrice*board.pVolumn}" class="prodPay">
											<input type="hidden" value="${board.sellPrice}" class="sellPrice">
											<img src="resources/fileUpload/${board.sysFileName}" alt="상품이미지" width="100" height="100">
										</label>
									</td>
									<td>
										<a href="/prodRead?num=${board.pNum}" class="pNamePrn">${board.pName}</a>
										<input type="hidden" value="${board.num}" form="multiDelFrm" class="num">
										<input type="hidden" value="${board.num}" form="orderFrm" class="cartNumOrder">
									</td>
									<td class="sPriceTd"></td>
									<td>
										<button type="button" class="volumnDownBtn">-</button>
										<input type="number" class="orderVolumn" value="${board.pVolumn}">
										<button type="button" class="volumnUpBtn">+</button>
										<input type="hidden" class ="stockVolumn" value="${board.stockVolumn}">
									</td>
									<td class="prodPay"></td>
									<td>
										<button type="button" class="oneDelBtn">&times;</button>
									</td>
								</tr>
								<script>
								$(function () {
									let index = "${status.index}";
									let sellPrice = "${board.sellPrice}";
									let pVolumn = "${board.pVolumn}";
									let prodPay = sellPrice * pVolumn;
									$("td.sPriceTd").eq(index).text(parseInt(sellPrice).toLocaleString()+"원");
									$("td.prodPay").eq(index).text(parseInt(prodPay).toLocaleString()+"원");
								});
								</script>
					</c:forEach>
		</c:when>
		<c:otherwise>
								<tr>
									<td colspan="6" id="nullCart">장바구니가 비어있습니다.</td>
								</tr>
		</c:otherwise>
</c:choose>
					
					
					
						</tbody>
						<tfoot>
							<tr>
								<td>
									<button type="button" id="multiDelBtn" form="multiDelFrm">선택삭제</button>
								</td>
								<td colspan="5">
								 	<span>총 상품가격</span>
								 	<span class="totalProdPrice">0원</span>
								 	<input type="hidden" name="goodsPay" class="totalProdPrice" form="orderFrm">
								 	<span>+</span>
								 	<span>총 배송비</span>
								 	<span class="totaldelivFee">0원</span>
								 	<input type="hidden" name="delivFee" class="totaldelivFee" form="orderFrm">
								 	<span>=</span>
								 	<span>총 주문금액</span>
								 	<span class="totalPayment">0원</span>
								 	<input type="hidden" name="totalPay" class="totalPayment" form="orderFrm">
	
								</td><!--  -->
							</tr>
							<tr>
								<td colspan="6">
									<!-- <input type="hidden" name="flag" value="m" form="orderFrm"> -->
									<button type="submit" id="orderMoveBtn" form="orderFrm">구매하기</button>
								</td>
							</tr>
						</tfoot>
				</table> 	
			
			
	    		</div>
	    	<!-- 실제 작업 영역 끝 -->
	    	</main>
	    	<!-- main#main -->
    		    	

		
		
		</div>
		<!-- div#wrap -->
		
		<iframe src="/footer" scrolling="no" width="100%" frameborder=0 id="footerIfm"></iframe>
		
		<form action="/cartOrder" id="orderFrm"></form>
		<form action="/cartDel" id="multiDelFrm"></form>
		<iframe width="0" height="0" class="cartModIfr" style="display: none"></iframe>
	</body>
</html>