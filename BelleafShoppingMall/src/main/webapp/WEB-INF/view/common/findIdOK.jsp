<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이디 찾기 완료</title>
<style>
    body, html {
        height: 100%;
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa; /* Light gray background */
    }

    .body-wrapper {
        min-height: 100%;
        position: relative;
    }

    .body-content {
        margin-top: 100px;
        padding: 0 200px 170px; /* Padding for footer height, left-right padding */
    }

    .container {
        text-align: center;
        margin: 50px auto;
        max-width: 600px;
        background-color: #fff; /* White background for the card */
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Box shadow for depth */
        border-radius: 10px; /* Rounded corners for container */
    }

    .heading-strong {
        font-size: 24px; /* Larger font size for emphasis */
    }

    .card {
        background: #f8f9fa; /* Light gray background for contrast */
        border-radius: 8px; /* Rounded corners */
        padding: 20px;
        text-align: center;
    }

    .card-header {
        font-size: 20px;
        font-weight: bold;
        color: #007bff; /* Bootstrap primary color */
    }

    .btn-ok {
        width: 120px;
        padding: 10px;
        margin: 5px;
        border-color: #28a745; /* Success green background */
        color: black;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
    }

    .btn-secondary {
         border-color: #28a745; /* Success green background */
        color: black;
    }

    .btn-ok:hover, .btn-secondary:hover {
        opacity: 0.9; /* Slight opacity on hover for button interaction */
    }

    .message-text {
        color: red;
        margin-top: 20px;
    }
</style>
</head>
<body>
<header>
    <jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div class="body-wrapper">
    <div class="body-content">
        <div class="container">
            <div class="card">
                <div class="card-header">아이디 찾기가 완료되었습니다</div>
                <div class="user-id-display">사용자 ID: <strong>${getUser.user_id}</strong></div>
                <hr>
                <div class="button-group">
                    <a class="btn btn-ok" href="${pageContext.request.contextPath}/login">로그인</a>
                    <a class="btn btn-secondary btn-ok" href="${pageContext.request.contextPath}/findpwview">비밀번호 찾기</a>
                </div>
                <p class="message-text">${msg}</p>
            </div>
        </div>
    </div>
    <!-- footer -->
    <footer>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
</div>
</body>
</html>
