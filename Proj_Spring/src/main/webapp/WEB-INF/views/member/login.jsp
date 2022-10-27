<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/style/common_style.css">
	<link rel="stylesheet" href="resources/style/login_style.css">
	<link rel = "shortcut icon" href="#">
	<script src ="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	  <header>
	    <!--  헤더템플릿 시작, iframe으로 변경 -->
		<iframe src="/header" scrolling="no" width="100%" frameborder=0 id="headerIfm"></iframe>
	    <!--  헤더템플릿 끝 -->   
  	</header>
	<div id="loginWrap">
     <form action="login" method="post">
     <table id="loginTBL">
                    <tbody>
                        <tr>
                            <td>
                                 <input type="text" name="uId" id="uId"
                                 placeholder="아이디" />
                            </td>
                            <td rowspan="2" id="tdLogInBtn">
                                <button>LOG IN</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="password" name="uPw" id="uPw"
                                placeholder="비밀번호" />
                            </td>
                        </tr>
                    </tbody>
                </table>
     </form>
	</div>
	<iframe src="/footer" scrolling="no" width="100%" frameborder=0></iframe>
</body>
</html>