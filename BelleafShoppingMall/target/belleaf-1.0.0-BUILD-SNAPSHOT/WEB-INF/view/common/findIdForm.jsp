<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }

    .container {
        width: 50%;
        margin: 5% auto 0;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
        border-radius: 8px;
    }

    header, .container {
        text-align: center;
    }

    .form-label {
        float: left;
        margin-bottom: 5px;
    }

    .email-input, .phone-input, .phone-select {
        width: calc(100% - 22px);
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .submit-btn {
        width: 100%;
        padding: 10px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .submit-btn:hover {
        background-color: #218838;
    }

    .text-muted {
        font-size: 0.8em;
        margin-top: -5px;
        display: block;
    }

    .link-text {
        color: #28a745;
        text-decoration: none;
    }

    .link-text:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
	<header>
	    <jsp:include page="../common/header.jsp"></jsp:include>
	</header> 
	<div class="container" style="margin-top: 100px;">
	    <h1 class="header-title">아이디를 모르시나요?</h1>
	    <p class="intro-text"><small>이메일을 입력해주세요!</small></p>
	    <div class="card border-success mb-3">
	    <div class="card-header">이메일 주소</div>
	        <form class="user-form" action="/finIdAction" method="POST">
	            <div class="form-group email-group">
	                <label for="user_email" class="form-label email-label">이메일 주소</label>
	                <input type="email" id="user_email" class="form-control email-input" name="user_email" aria-describedby="emailHelp" placeholder="이메일 주소 전체를 입력해주세요">
	                <small id="emailHelp" class="text-muted email-help-text">귀하의 이메일을 다른 사람과 공유하지 않습니다.</small>
	            </div>
	            <div class="form-group phone-group">
	                <label for="user_phone" class="form-label phone-label">전화번호</label>
	                <select name="user_phone1" class="phone-select">
	                    <option value="010">010</option>
	                    <option value="02">02</option>
	                    <option value="031">031</option>
	                    <option value="070">070</option>
	                </select>
	                <input type="text" name="user_phone2" class="form-control phone-input">
	                <input type="text" name="user_phone3" class="form-control phone-input">
	            </div>
	            <input type="submit" class="btn submit-btn" value="아이디찾기">
	        </form>
	        <p class="password-recovery"><a href="findpwview" class="link-text">비밀번호찾기</a></p>
	    </div>
	</div>
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
