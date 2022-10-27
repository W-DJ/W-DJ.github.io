<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/resources/style/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/script/script_Notice.js"></script>
</head>
<body>
    <div id="wrap">

<h1>서비스 메인 페이지입니다.
리스트 나옵니다.</h1>

<div id="sideMenu">
			<ul class="List">
				<li><a href="/cart/cartList.jsp" id="cart">장바구니</a></li>
				<li><a href="/wishlist/wishlist.jsp" id="wish">찜 제품</a></li>
				<li><a href="/order/orderList.jsp">주문내역</a></li>
				<li><a href="/bbs_Inquire/list.jsp" id="inq">1대1문의</a></li>
				<hr>
				<li><a href="/Member/MemberMod.jsp" id="mod">회원정보수정</a></li>
				<li><a href="/Member/MemberDel.jsp" id="del">회원탈퇴</a></li>
			</ul>
		</div>
		
		<main id="main">
				<div class="moveMenu">
		<a href="/bbs_Notice/noticebbs.jsp">공지사항</a>
		<a href="/bbs_Inquire/list.jsp">1:1문의</a>
				
				</div>	


			<div id="contents" class="bbsList">


		<%-- 		<%
				String prnType = "";
				if (keyWord.equals("null") || keyWord.equals("")) {
					prnType = "전체 게시글";
				} else {
					prnType = "검색 결과";
				}
				%> --%>

				<div id="pageInfo" class="dFlex">


					<%-- <span><%=prnType%> : <%=totalRecord%> 개</span> <span>페이지 : <%=nowPage%>/<%=totalPage%></span>

 --%>
				</div>

				<table id="boardList">
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>제목</th>
							<th>내용</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
						<tr>
							<td colspan="5" class="spaceTd">
							<%-- 	<%
								vList = NoticeList.getBoardList(keyField, keyWord, start, end); // DB에서 데이터 불러오기
								listSize = vList.size();

								if (vList.isEmpty()) {
								%> --%>
							
						<tr>
							<td colspan="5"><%-- <%="게시물이 없습니다."%> --%></td>
						</tr>
						<%-- <%
						// 데이터가 없을 경우 출력 끝
						} else {
						// 데이터가 있을 경우 출력 시작
						%> --%>

					</thead>
					<tbody>



						<%-- <%
						BoardBean bean = null;
						for (int i = 0; i < listSize; i++) {
							if (i == listSize)
								break;
							bean = vList.get(i);
						%>
 --%>


						<tr class="listTr"
							onclick="modify('<%-- <%=bean.getNum()%>','<%=nowPage%> --%>')">

							<!-- <script>
								function modify(p1, p2) {

									let param = "/bbs_Notice/read.jsp?num="
											+ p1;
									param += "&nowPage=" + p2;

									location.href = param;

								}
							</script> -->
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>

						<%-- 	<td><%=bean.getNum()%></td>
							<td><%=bean.getaName()%></td>
							<td><%=bean.getAsubject()%></td>
							<td><%=bean.getAcontent()%></td>
							<td><%=bean.getRegTM()%></td>
							<td><%=bean.getReadCnt()%></td> --%>
						</tr>
						<%-- <input type="hidden" id="aName" value="<%=bean.getaName()%>"> --%>
						<%-- <%
						}

						}
						%> --%>

					</tbody>
					<tfoot>

						<tr id="listBtnArea">
							<td>
								<%-- <%
								if (aId_Session != null) {
								%>
 --%>
								<button type="button" id="NoticeWriteBtn" class="listBtnStyle">글쓰기</button>
							
								<!-- 회원이라도 안되고 오로지 관리자만 가능  --> <%-- <%
 }
 %>

 --%>


							</td>

							<td colspan="5">


								<form name="searchFrm" id="searchFrm" class="dFlex">


									<div id="keySelect">
										<select name="keyField" id="keyField">
											<option value="asubject"
												<%-- <%if (keyField.equals("asubject"))
	out.print("selected");%> --%>>제
												목</option>
											<option value="aName"
												<%-- <%if (keyField.equals("aName"))
	out.print("selected");%> --%>>이
												름</option>
											<option value="acontent"
												<%-- <%if (keyField.equals("acontent"))
	out.print("selected");%> --%>>내
												용</option>
										</select>
									</div>
									<div>
										<input type="text" name="keyWord" id="keyWord" size="20"
											maxlength="30" value="<%-- <%=keyWord%> --%>">


									</div>

									<div>
										<button type="button" id="searchBtn" class="listBtnStyle">검색</button>
									</div>


								</form> <!-- 검색결과 유지용 매개변수 데이터시작 --> <input type="hidden"
								id="pKeyField" value="<%-- <%=keyField%> --%>"> <input
								type="hidden" id="pKeyWord" value="<%-- <%=keyWord%> --%>"> <!-- 검색결과 유지용 매개변수 데이터끝 -->

							</td>

						</tr>

						<tr id="listPagingArea">
							<td colspan="5" id="pagingTd">
							<%-- 	<%
								int pageStart = (nowBlock - 1) * pagePerBlock + 1;

								int pageEnd = (nowBlock < totalBlock) ? pageStart + pagePerBlock - 1 : totalPage;

								if (totalPage != 0) {
								%> --%> <%-- <%
 if (nowBlock > 1) { // 페이지 블럭이 2이상이면 => 2개이상의 블럭이 있어야 가능
 %> --%> <span class="moveBlockArea"
								onclick="moveBlock('<%-- <%=nowBlock - 1%>', '<%=pagePerBlock%> --%>','pb')">
									&lt; <!-- 이 전 페이지 마지막으로 이동하는 것으로 수정하기  -->
							</span> <!-- <script>
								function moveBlock(p1, p2, param3) { // 블럭 이동 ,전 블럭의  ''마지막'' 페이지로 이동함 p1: nowBlock-1 

									let pageNum = parseInt(p1); // 이전 블럭의 시작페이지로 이동할 때 사용
									let pagePerBlock = parseInt(p2); //5

									alert("p1(moveBlock) : " + p1
											+ "\np2(pagePerBlock) : " + p2);

									let p3 = $("#pKeyField").val().trim(); // p3 : keyField
									let p4 = $("#pKeyWord").val().trim(); // p4 : keyWord

									if (param3 == 'pb') {
										param = "/bbs_Notice/ServiceMain.jsp?nowPage="
												+ (moveBlock * pagePerBlock);
										param += "&keyField=" + p3;
										param += "&keyWord=" + p4;

									} else if (param3 == 'nb') {
										param = "/bbs_Notice/ServiceMain.jsp?nowPage="
												+ (pagePerBlock
														* (moveBlock - 1) + 1);
										param += "&keyField=" + p3;
										param += "&keyWord=" + p4;

									}

									location.href = param;
								}
							</script> --> <%-- <%
 } else {
 %> --%> <span class="moveBlockArea"></span> <%-- <%
 }
 %> --%> <!-- 페이지 나누기용 페이지 번호 출력 시작  --> <%-- <%
 // 2        <     6       
 // for (초기식; 조건식 ; 증감식 ){}
 // for (          ; 조건식; 증감식;){} 초기식은 조건식의 변수가
 //for 구문 사용 이전에 명시되어 있으므로 그 변수를 활용한다.
 //너무 길어서 못넣어 ㅠㅠ
 for (int i = pageStart; i <= pageEnd; i++) {
 %> <%
 if (i == nowPage) { // 현재 사용자가 보고 있는 페이지
 %> <span class="nowPageNum"><%=i%></span> <%
 } else { // 현재 사용자가 보고 있지 않은 페이지
 %> <span class="pageNum" onclick="movePage('<%=i%>')"> <%=i%>
							</span> <script>
								function movePage(p1) { // 페이지 이동

									let p3 = $("#pKeyField").val().trim(); // p3 : keyField
									let p4 = $("#pKeyWord").val().trim(); // p4 : keyWord

									let param = "/bbs_Notice/ServiceMain.jsp?nowPage="
											+ p1;
									param += "&keyField=" + p3;
									param += "&keyWord=" + p4;
									location.href = param;

								}
							</script> <%
 } // End If
 %> <%
 } // End For
 %> <!-- 페이지 나누기용 페이지 번호 출력 끝  --> <%
 if (totalBlock > nowBlock) { // 다음 블럭이 남아 있다면
 %> <span class="moveBlockArea"
								onclick="moveBlock('<%=nowBlock + 1%>', '<%=pagePerBlock%>', 'nb')">
									&gt; </span> <script>
										function moveBlock(p1, p2, param3) { // 블럭 이동 ,전 블럭의  ''마지막'' 페이지로 이동함 p1: nowBlock-1 

											let pageNum = parseInt(p1); // 이전 블럭의 시작페이지로 이동할 때 사용
											let pagePerBlock = parseInt(p2); //5

											alert("p1(moveBlock) : " + p1
													+ "\np2(pagePerBlock) : "
													+ p2);

											let p3 = $("#pKeyField").val()
													.trim(); // p3 : keyField
											let p4 = $("#pKeyWord").val()
													.trim(); // p4 : keyWord

											if (param3 == 'pb') {
												param = "/bbs_Notice/ServiceMain.jsp?nowPage="
														+ (moveBlock * pagePerBlock);
												param += "&keyField=" + p3;
												param += "&keyWord=" + p4;

											} else if (param3 == 'nb') {
												param = "/bbs_Notice/ServiceMain.jsp?nowPage="
														+ (pagePerBlock
																* (moveBlock - 1) + 1);
												param += "&keyField=" + p3;
												param += "&keyWord=" + p4;

											}

											location.href = param;
										}
									</script> <%
 } else {
 %> <span class="moveBlockArea"></span> <%
 }
 %> <%
 } else {
 out.print("<b>[ Paging Area ]</b>"); // End if 1이라고 표현하기도 함
 }
 %>
 --%>









							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</main>
    </div>
    <!-- div#wrap  -->
</body>
</html>
