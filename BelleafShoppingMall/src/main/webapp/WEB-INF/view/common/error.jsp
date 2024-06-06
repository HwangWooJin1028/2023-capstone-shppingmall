<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 화면</title>
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
<style>
	* {font-family: 'NanumSquare', sans-serif; }
	#container{width: 700px; margin: 0 auto; padding-top:100px;
	text-align: center;}
	a {text-decoration: none; color: black;}
	a:hover {
		color:rgb(229, 170, 163);
		text-decoration: underline;
	}
</style>
</head>
<body>

<div id="container" >
	<i class="fa-solid fa-triangle-exclamation fa-2xl" style="color: #e74c3c;"></i>
	<h2>에러 화면</h2>
	<hr>
	<p><b>시스템 담당자에게 연락바랍니다.</b><br><a href="https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=jrjtXLCdQQhbbQrdHFQnXzGQtLhKRxfdQsKWKkJKnzblKdPKDvvffLnpBCnlnnhWwTGNLpsq">담당자 연락처: hwangujin1028@gmail.com</a></p>
	<a href="${pageContext.request.contextPath}/">홈으로 가기</a>
</div>

</body>
</html>