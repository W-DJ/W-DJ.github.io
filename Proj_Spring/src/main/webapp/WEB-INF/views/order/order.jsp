<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="resources/style/common_style.css">
		<link rel="stylesheet" href="resources/style/order_style.css">
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script src ="resources/script/script_Common.js"></script>
		<script src="resources/script/script_Order.js"></script>
	</head>
	<body>
	<header>
	    <!--  헤더템플릿 시작, iframe으로 변경 -->
			<iframe src="/header" scrolling="no" width="100%" frameborder=0 id="headerIfm"></iframe>
	    <!--  헤더템플릿 끝 -->   
  		</header>
		<div id="wrap" class="orderWrap">
			<h1>주문/결제</h1>
			<hr>
			<form action="/orderProc" method="post" id="orderFrm">
			
				<table>
					<tbody>
						<tr>
							<th>이름</th>
							<td>${user.uName}</td>
						</tr>
						<tr>
		     				<th>배송지 우편번호</th>
		     				<td>
						     <input type="text" id="postcode" placeholder="우편번호">
					         <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" ><br>
						    </td>
				       </tr>
				       <tr>
				        	<th>배송지 주소</th>
					     	<td>
				         		<input type="text" id="address" placeholder="주소"><br>
				         		<input type="hidden" name="delivAdd" id="uAddr" value="${user.uAddr}" />
				         	</td>
			          </tr>
			          <tr>
			          	<th>상품명/개수</th>
			          	<td>&nbsp;</td>
			          </tr>
<c:choose>
	<c:when test="${fn:length(cartBeanList) > 0}">
			<c:forEach items="${cartBeanList}" var="board" varStatus="status">
						<tr>
			     			<th>&nbsp;</th>
							<td class="dFlex center">
								<div>
									${board.pName}
									<input type="hidden" value="${board.pName}">
									<input type="hidden" name="orderGoodsList[${status.index}].pNum" value="${board.pNum}">
								</div>
								<div>
									${board.pVolumn}개
									<input type="hidden" name="orderGoodsList[${status.index}].pVolumn" value="${board.pVolumn}">
								</div>
							</td>
						</tr>
			</c:forEach>
	</c:when>
	<c:when test="${order.pVolumn != null}">
			     		<tr>
			     			<th>&nbsp;</th>
							<td class="dFlex center">
								<div>
									${order.pName}
									<input type="hidden" value="${order.pName}">
									<input type="hidden" name="orderGoodsList[0].pNum" value="${order.pNum}">
								</div>
								<div>
									${order.pVolumn}개
									<input type="hidden" name="orderGoodsList[0].pVolumn" value="${order.pVolumn}">
								</div>
							</td>
						</tr>
	</c:when>
</c:choose>
						<tr>
							<th>총상품가격</th>
							<td>
								<span class="goodsPay"></span>
								<input type="hidden" name="goodsPay" value="${order.goodsPay}" class="goodsPay">
							</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>
								<span class="delivFee"></span>
								<input type="hidden" name="delivFee" value="${order.delivFee}" class="delivFee">
							</td>
						</tr>
						<tr>
							<th>총결제금액</th>
							<td>
								<span class="totalPay"></span>
								<input type="hidden" name="totalPay" value="${order.totalPay}" class="totalPay">
							</td>
						</tr>
						<tr>
							<th>결제수단</th>
							<td>
								<label>
									<span>계좌이체</span>
									<input type="radio" name="payWay" class="payWay" value="계좌이체">
								</label>
								<label>
									<span>신용/체크카드</span>
									<input type="radio" name="payWay" class="payWay" value="신용/체크카드">
								</label>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<input type="hidden" name="orderId" value="${user.uId}">
								<button id="orderBtn">결제하기</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
		<!-- div#wrap -->
			<iframe src="/footer" scrolling="no" width="100%" frameborder=0 id="footerIfm"></iframe>
	</body>
</html>
