<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="common/styles.css" rel="stylesheet">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #ffffff; /* White background for the body */
        margin: 0;
        padding: 0;
        color: #333;
    }

    .container {
        text-align: center;
        max-width: 600px;
        margin: 40px auto;
        padding: 20px;
        background-color: #fff; /* White background for the container */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        border-radius: 10px;
    }

    .logo-image {
        width: 50%; /* Adaptive size for the logo */
        margin-bottom: 20px;
    }

    .heading-strong {
        font-size: 24px;
        color: #007bff; /* Bootstrap primary blue */
        margin-bottom: 10px;
    }

    .small-text {
        font-size: 16px;
        margin-bottom: 20px;
    }

    .card {
        background: #f8f9fa; /* Slightly grey background for the card */
        border: none;
        padding: 20px;
        border-radius: 8px;
    }

    .input-group {
        margin-bottom: 20px;
    }

    .input-field {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box; /* Makes sure padding doesn't affect width */
    }

    .submit-button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s; /* Smooth transition for button hover */
    }

    .submit-button:hover {
        background-color: #0056b3; /* Darker blue on hover */
    }

    .link-text {
        color: #28a745;
        text-decoration: none;
        font-size: 16px;
    }

    .link-text:hover {
        text-decoration: underline;
    }

    .muted-text {
        font-size: 14px;
        color: #6c757d;
    }

</style>
</head>
<body>
	<header>
	    <jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div class="container" style="margin-top: 100px;">
	    <div class="heading-strong">암호를 모르시나요?</div>
	    <p class="small-text">아이디와 메일을 입력해주세요</p>
	    <div class="card">
	        <form class="user form-section" action="findPwdAction" method="POST">
	            <div class="form-group input-group">
	              <label for="user_id" class="form-label mt-4">아이디</label>
	              <input type="text" class="form-control form-control-user input-field" id="user_id" name="user_id" aria-describedby="emailHelp" placeholder="아이디를 입력해주세요.">
	              <label for="user_email" class="form-label mt-4">이메일 주소</label>
	              <input type="email" class="form-control form-control-user input-field" id="user_email" name="user_email" aria-describedby="emailHelp" placeholder="이메일 주소 전체를 입력해주세요.">
	              <small id="emailHelp" class="form-text text-muted muted-text">귀하의 이메일을 다른 사람과 공유하지 않습니다.</small>
	            </div>
	            <input type="submit" class="btn submit-button" value="비밀번호 찾기">
	        </form>
	        <p><a href="findIdview" class="link-text">아이디 찾기</a></p>
	    </div>
	</div>
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
