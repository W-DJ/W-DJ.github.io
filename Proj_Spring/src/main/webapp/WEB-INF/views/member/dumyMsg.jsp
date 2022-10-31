<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/resources/style/style.css">
		<link rel="shortcut icon" href="#">
		<script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src ="/script/script.js"></script>
	</head>
	<script>
	var msg = "${msg}";
	var url  ="${url}";
	alert(msg);
	location.href = url;
	</script>
	<body>
   <div id ="wrap">
	
    </div>
    <!--div#wrap-->
  </body>
</html>