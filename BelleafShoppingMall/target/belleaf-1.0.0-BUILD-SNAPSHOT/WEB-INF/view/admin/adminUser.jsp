<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminUserInfo.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>회원상세보기</title>
<script type="text/javascript">
$(document).ready(function() {
	$(".us0").html("휴면회원")
	$(".us1").html("일반회원")
	$(".us2").html("관리자")
})

</script>
<style type="text/css">
body {
	background-color: white !important;
}
</style>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/testadminHeader.jsp"></jsp:include>
	</header>
	<div id="bodyContainer">
		<div class="pageTitleArea">
			<h1>회원상세보기</h1>
		</div>
		<hr>
		<table class="userAddTable">
			<tr>
				<th class="ItemTitleArea">회원아이디</th>
				<td>${user.user_id}</td>
			</tr>
			<tr>
				<th class="ItemTitleArea">회원이름</th>
				<td>${user.user_name}님</td>
			</tr>
			<tr>
				<th class="ItemTitleArea">회원닉네임</th>
				<td>${user.user_nickname}</td>
			</tr>
			<tr>
				<th class="ItemTitleArea">회원이메일</th>
				<td>${user.user_email}</td>
			</tr>
			<c:if test="${not empty user.user_phone}">
				<tr>
					<th class="ItemTitleArea">휴대폰번호</th>
					<td>${user.user_phone}</td>
				</tr>
			</c:if>
			<tr>
				<th class="ItemTitleArea">회원상태</th>
				<td class="us${user.user_state}"></td>
			</tr>
			<c:if test="${not empty user.user_addr}">
				<tr>
					<th class="ItemTitleArea">회원주소</th>
					<td>${user.user_addr}</td>
				</tr>
			</c:if>
			<c:if test="${not empty user.user_addr_d}">
				<tr>
					<th class="ItemTitleArea">회원상세주소</th>
					<td>${user.user_addr_d}</td>
				</tr>
			</c:if>
			<c:if test="${not empty user.user_zipcode}">
				<tr>
					<th class="ItemTitleArea">우편번호</th>
					<td>${user.user_zipcode}</td>
				</tr>
			</c:if>
			<c:if test="${not empty user.user_point}">
				<tr>
					<th class="ItemTitleArea">포인트</th>
					<td><fmt:formatNumber value="${user.user_point}" pattern="###,###,###"/></td>
				</tr>
			</c:if>
		</table>
		<div class="buttonArea">
			<input class="UserInfoItemBtn" type="button" value="회원목록" onclick="location.href='${pageContext.request.contextPath}/admin/user/list'">
            <input class="UserDeleteItemBtn" type="button" value="회원탈퇴" onclick="location.href='${pageContext.request.contextPath}/admin/user/delete?user_id=${user.user_id}'">
		</div>
		
		
	</div>
</body>
</html>