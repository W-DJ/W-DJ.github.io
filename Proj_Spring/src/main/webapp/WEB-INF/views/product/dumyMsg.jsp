<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush = "true"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script>
		if('${wish_Msg}') {
			window.parent.alert('${wish_Msg}');
	  	}
		if('${cart_Msg}') {
			window.parent.alert('${cart_Msg}');
	  	}
		</script>
	</head>
	<body>
		<div id="wrap">
		</div>
		<!--div#wrap  -->
	</body>
</html>
