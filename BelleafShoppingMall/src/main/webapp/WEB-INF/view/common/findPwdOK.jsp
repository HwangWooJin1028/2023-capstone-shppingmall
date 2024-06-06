<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 완료</title>
<link href="common/styles.css" rel="stylesheet">
<style>
    body, html {
        height: 100%;
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa; /* Light gray background */
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
        width: 150px;
        padding: 10px;
        margin: 5px;
        color: black;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
    }

    .btn-ok:hover {
        opacity: 0.9; /* Slight opacity on hover for button interaction */
    }
</style>
</head>
<body>
    <header>
        <jsp:include page="../common/header.jsp"></jsp:include>
    </header>    
    <div class="container" style="margin-top: 100px;">
        <div class="heading-strong">비밀번호 찾기가 완료되었습니다</div><br>
        <div class="card">
            <div class="card-header">
                <div class="user-pw-display"><strong>${getUser.user_pw}</strong></div>
                <hr>
                <div class="button-group">
                    <a class="btn btn-ok" href="${pageContext.request.contextPath}/login.do">로그인</a>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
</body>
</html>
