<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true" %>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>회원 목록 보기</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/resources/style/style_BBS.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/resources/script/script.js"></script>		
	</head>
	<body>
		<div id="wrap">
		
		
			<nav>
				<ul>
					<li><a href="/">메인페이지</a></li>
					<li><a href="/list">목록</a></li>
					<li><a href="/create">회원가입</a></li>
				</ul>
			</nav>
		
		
			<h1>회원 목록 화면</h1>
			<hr>
			<table id="NoticeTbl">
				<thead>
					<tr>
						<th>번호</th>
						<th>ID</th>
						<th>이름</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach var="row" items="${data}">
					<tr>
						<td>	${row.num}</td>
						<td>
							<a href="/Notdetail?num=${row.num}">
								${row.aName}
							</a>
						</td>
						<td>${row.asubject}</td>
						<td>${row.acontent}</td>
					</tr>
				</c:forEach>
				
				</tbody>
			</table>
			<div>
			
				<a href="/NotWrite">글쓰기</a>
				<a href="/">메인으로</a>

				
			</div>
					
			
		</div>
		<!-- div#wrap -->
			
	</body>
</html>