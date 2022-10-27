 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush = "true"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="resources/style/common_style.css">
		<link rel="stylesheet" href="resources/style/product_style.css">
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="resources/script/script_Product.js"></script>
		<script>
		$(function(){
			if('${param.mod_Msg}') {
		  		alert('${param.mod_Msg}');
		  	}
			let sellLabelCode = "${board.sellLabel}";
			let sellLabel = sellLabelCode.split("");
			$("input.sellLabel").each(function(index){
				if(sellLabel[index] == "1") {
					$(this).prop("checked", true);
				} 
			});
			let pType = "${board.pType}";
			$("select#pType").children("option").each(function(){
				if($(this).text()==pType) {
					$(this).prop("selected", true);
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
		<div id="wrap">
			<main id="main">
				<div class="bbsWrite">
					<h2>상품 수정</h2>
					<form action="/prodMod" method="post">
						<table id="prodPostTbl">
							<tbody>
								<tr>
									<th class="req">상품명</th>
									<td>
										<input type="text" name="pName" id="pName" value="${board.pName}">
									</td>
								</tr>
								<tr>
									<th class="req">상품종류</th>
									<td>
										<select name="pType" id="pType">
											<option value="">선택해주세요</option>     
											<!-- 선택해주세요를 선택하면 전송 못하도록  JavaScript로 구현하기-->
											<option>스킨케어</option>
											<option>로션</option>
											<option>핸드크림</option>
											<option>기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<th class="req">재고</th>
									<td>
										<input type="number" name="stockVolumn" id="stockVolumn" value="${board.stockVolumn}">
									</td>
								</tr>
								<tr>
									<th>판매량</th>
									<td>
										<input type="number" name="salesVolumn" id="salesVolumn" value="${board.salesVolumn}">
									</td>
								</tr>
								<tr>
									<th class="req">가격</th>
									<td>
										<label>
											원래 가격
											<input type="number" name="oriPrice" id="oriPrice" value="${board.oriPrice}">
										</label>
										<label>
											판매 가격
											<input type="number" name="sellPrice" id="sellPrice" value="${board.sellPrice}">
										</label>
									</td>
								</tr>
								<tr>
									<th class="req">상품라벨</th>
									<td>
										<label>
											베스트상품
											<input type="checkbox" name="sellLabelCode" class="sellLabel" value="BEST">	
										</label>
										<label>
											신상품
											<input type="checkbox" name="sellLabelCode" class="sellLabel" value="NEW">	
										</label>
										<label>
											할인상품
											<input type="checkbox" name="sellLabelCode" class="sellLabel" value="SALE">	
										</label>
										<label>
											해당없음
											<input type="checkbox" name="sellLabelCode" class="sellLabel" value="NONE">	  
											<!--해당없음 누르면 다른 것을 중복 선택 못하도록 JavaScript로 구현하기 -->
										</label>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td>
										<textarea name="content" id="content" cols="80" rows="10">${board.content}</textarea>
									</td>
								</tr>
		<!-- 						<tr>
									<th>이미지</th>
									<td>
										<input type="file" name="imgFile" id="imgFile">
									</td>
								</tr> -->
							</tbody>
							<tfoot>
								<tr>
									<td>
										<button type="submit">전송</button>
									</td>
								</tr>
							</tfoot>
						</table>
							<input type="hidden" name="page" value="${param.page}" id="nowPage">
							<input type="hidden" name="num" value="${param.num}" id="num">
							
							<!-- 검색어전송 시작 -->
							<input type="hidden" name="orderBy" id="orderBy" value="${search.orderBy}">
							<input type="hidden" name="typeSearch" id="typeSearch" value="${search.typeSearch}">
							<input type="hidden" name="keyWord" id="pKeyWord" value="${serach.keyWord}">
							<!-- 검색어전송 끝 -->
					</form>			
				</div>
			</main>
			
		</div>
		<!--div#wrap  -->
		<iframe src="/footer" scrolling="no" width="100%" frameborder=0 id="footerIfm"></iframe>
	</body>
</html>