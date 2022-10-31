<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 수정</title>
	<link rel="stylesheet" href="/resources/style/style_Common.css">
	<link rel="stylesheet" href="/resources/style/style_Template.css">
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
    <div id="modify_wrap">

	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="mod">

				
				<!--  뷰페이지 내용 출력 시작 -->			
				
				<form name="modifyFrm" action="/Often_modify"
						method="post" id="modifyFrm">
			
						
					<table id="modTbl">
						<tbody id="modTblBody">
							<tr>
								<th class="req">작성자</td>
								<td>
								${admin.aId}
								<input type="hidden" name="aId" value="${data.aId}" id="aId">	
								</td>
							</tr>
							<tr>
								<th class="req">제목</th>
								<td>
									<input type="text" name="subject" value="${data.subject}"
										size="50" id="subject">
								</td>
							</tr>
							<tr>
								<th style="vertical-align: top;">내용</th>
								<td>
									<textarea name="content" id="txtArea"  cols="89" wrap="hard">${data.content}</textarea>
								</td>
							</tr>			
						</tbody>
						 
						<tfoot>	
							<tr>
								<td colspan="2" id="footTopSpace"></td>							
							</tr>	
							<tr>
								<td colspan="2" id="hrTd"><hr></td>							
							</tr>
							<tr>
							
								<td colspan="2" id="btnAreaTd" class="update">
									<button type="button" id="modProcBtn">수정하기</button>
									<input type="hidden" name="num" value="${data.num}">
									<button type="button" id="backBtn">뒤 로</button>							
								</td>
							</tr>
						</tfoot>
						 
					</table>
					<%-- <input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
					<input type="hidden" name="num" value="<%=num%>" id="num">
					
					<!-- 검색어전송 시작 -->
					<input type="hidden" name="keyField" id="keyField" value="<%=keyField%>">
					<input type="hidden" name="keyWord" id="keyWord" value="<%=keyWord%>">
					<!-- 검색어전송 끝 -->
 --%>			
				</form>
				<!--  뷰페이지 내용 출력 끝 -->

    		</div>
    		<!-- 실제 작업 영역 끝 -->   
    </div>
    <!-- div#wrap -->

</body>
<iframe src="/footer" scrolling="no" width="100%" frameborder=0></iframe>
</html>