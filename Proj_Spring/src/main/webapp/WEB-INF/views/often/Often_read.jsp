<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>글내용 보기</title>
	<link rel="stylesheet" href="resources/style/Often.css">
	<link rel="stylesheet" href="resources/style/style_BBS.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="resources/script/script_Often.js"></script>
</head>

<body>
<header>
	    <!--  헤더템플릿 시작, iframe으로 변경 -->
		<iframe src="/header" scrolling="no" width="100%" frameborder=0 id="headerIfm"></iframe>
	    <!--  헤더템플릿 끝 -->   
  	</header>
    <div id="wrap">
    	

    		<div id="contents" class="bbsRead">

				<!--  게시글 상세보기 페이지 내용 출력 시작 -->
				<h2>${data.subject}</h2>
				<table id="readTbl">
					<tbody id="readTblBody">
						<tr class="listName">
							<td class="read_line">작성자</td> 
							<td class="read_line">${data.aName}</td>
							<td class="read_line">등록일</td>  
							<td class="read_line regTMtd">${data.regTM}</td>
							<td class="read_line">조회수</td>
							<td class="read_line">${data.readCnt}<td>
						</tr>
						
						<tr>
							<td colspan="4" id="readContentTd"><pre>${data.content}</pre></td>
						</tr>					
					</tbody>
					 
					<tfoot id="readTblFoot">	
						<tr>
							<td colspan="4" id="footTopSpace"></td>							
						</tr>			     
					
						<tr>
							<td colspan="4" id="hrTd"><hr></td>							
						</tr>
					
						<tr>
							<td colspan="4" id="btnAreaTd" class="read">
								<button type="button" id="listBtn" onclick="location.href='/OftenList'">목록보기</button>
								
								

								<c:if test="${admin.aId !=null}">
								<button type="button" id="modBtn">수 정</button>
								<button type="button" id="delBtn" onclick="${data.num}">삭 제</button>
								</c:if>
								
							</td>
						</tr>
					</tfoot>
					 
				</table>
				<input type="hidden" name="num" value="${data.num}" id="num">
        			
<%-- 				<input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
				<!-- 검색어전송 시작 -->
				<input type="hidden" id="pKeyField" value="<%=keyField%>">
				<input type="hidden" id="pKeyWord" value="<%=keyWord%>"> --%>
				<!-- 검색어전송 끝 -->
			  
				<!--  게시글 상세보기 페이지 내용 출력 끝 -->

    		</div>
    		<!-- 실제 작업 영역 끝 -->  
         <iframe src="/footer" scrolling="no" width="100%" frameborder=0></iframe>
    </div>
    <!-- div#wrap -->

</body>

</html>