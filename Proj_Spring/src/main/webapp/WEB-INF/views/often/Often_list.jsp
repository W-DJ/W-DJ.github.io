<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시판 목록</title>
	<link rel="stylesheet" href="/resources/style/Often.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/resources/script/script_Often.js"></script>
</head>

<body>
  <header>
	    <!--  헤더템플릿 시작, iframe으로 변경 -->
		<iframe src="/header" scrolling="no" width="100%" frameborder=0 id="headerIfm"></iframe>
	    <!--  헤더템플릿 끝 -->   
  	</header>
    <div id="wrap">
    	
    		<div id="contents" class="bbsList">
    		
			
			<table id="boardList">
				<thead>
					<tr>
						<th id="num">번호</th>
						<th>제목</th>
						<th id="thname">이름</th>
						<th id="Day">날짜</th>
						<th id="viewCnt">조회수</th>
					</tr>		
					<tr>
						<td colspan="5" class="spaceTd"></td>
					</tr>		
				</thead>
				<tbody>
	<c:choose>			
			<c:when test ="${fn:length(list)>0}">
			   <c:forEach var="row" items="${list}">
                   <tr>
                        <td>${row.num}</td>
                        <td>${row.subject}</td>
						<td>${row.aId}</td>
						<td>${row.regTM}</td>
						<td>${readCnt}</td>
					</tr>
               </c:forEach>
           </c:when>
           <c:otherwise>
           <td>게시물이 없습니다</td>
           </c:otherwise>
   </c:choose>					
				</tbody>
			</table>
		<div id="listBtnArea">
				<c:if test="${admin.aId!=null}">
					<button type="button" onclick="location.href='/Often_write'">글쓰기</button>
				</c:if>
		</div>
    		</div>
    		<!-- 실제 작업 영역 끝 -->
    </div>
    <!-- div#wrap -->
<iframe src="/footer" scrolling="no" width="100%" frameborder=0 id="footerIfm"></iframe>
    		    	

        

</body>

</html>