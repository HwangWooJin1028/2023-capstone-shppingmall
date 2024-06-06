<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>주문내역 보기</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/small_logo.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/userConfrim.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.header {
    background-color: #fff !important;
    border-bottom: 0px !important; 
}
</style>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	<!-- body -->
	<div class="body">
		<div class="myinfo-body" style="padding-top: 100px;">
			<!-- 제목 부분 -->
			<div class="page-nav">홈><a href="${pageContext.request.contextPath}/myinfo">마이페이지</a>><a href="${pageContext.request.contextPath}/myinfo/confirm">개인정보 수정</a></div>
			
			<!-- 여기서부터 본론 -->
			<div class="content-body">
				<div class="content-confrimbody">
					<strong><span style="color:rgb(231, 76, 60);">${user.user_nickname}님</span>의 정보를 안전하게 보호하기 위하여 비밀번호를 다시 한번 확인해야 합니다.</strong>
					<form action="/myinfo/confirm" method="post">
						<table class="content-idpwcheck">
							<tr>
								<th>아이디</th>
								<td><input type="text" value="${user_id}" readonly style="margin-left: 3px;" placeholder="아이디를 입력해주세요"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pwCheck" placeholder="비밀번호를 입력해주세요" style="margin-left: 3px;"></td>
							</tr>
							<div style="color:rgb(231, 76, 60);margin-bottom: 20px;">${msg}<br></div>
							<tr>
								<td colspan="2"><input type="submit" value="확인" style="margin-top: 20px;"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>

			
		</div>
		
		
	</div>
	
	

	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>