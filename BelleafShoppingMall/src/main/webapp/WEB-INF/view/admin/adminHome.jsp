<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminHome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminListStyle.css">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>관리자 홈페이지</title>
<script type="text/javascript">
$(document).ready(function() {
	$(".c1").html("잡곡")
	$(".c2").html("과일")
	$(".c3").html("채소")
	$(".c4").html("수산물")
	$(".c5").html("축산물")
	
	$(".s1").html("판매중")
	$(".s2").html("판매중지")
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
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
		
		
	<div id="bodyContainer">
		<div style="margin-top: 50px; font-size: x-large; cursor: default;">
			<strong style="color: rgb(231, 76, 60)">안녕하세요! ${user.user_nickname}님<br>BELLEAF몰에 오신것을 환영합니다.</strong>
		</div>
	
		<div style="margin-top: 50px; font-size: x-large; cursor: default;">
			<strong>최근 등록된 상품 목록</strong>
		</div>
		<hr>
		
		<div class="pageBodyArea">
			<!-- body 부분 - 상품 목록 보기 -->
			<table class="ListTableStyle">
				<!-- 표 제목 부분 -->
				<thead>
					<tr>
						<th>No.</th>
						<th>상품분류</th>
						<th>상품번호</th>
						<th>상품명</th>
						<th>가격</th>
						<th>할인율</th>
						<th>상품상태</th>
						
					</tr>
				</thead>
				<!-- c:foreach로 대체 -->
				<tbody id="TablebodyArea">
				<c:choose>
					<c:when test="${empty prdlist}">
						<tr>
							<td colspan="7">등록된 상품 리스트가 존재하지 않습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="prolist" items="${prdlist}">
							<tr onClick="location.href='${pageContext.request.contextPath}/admin/product/info?product_id=${prolist.PRODUCT_ID}'">
								<td>${prolist.R_NUM}</td>
								<td class="c${prolist.CATEGORY_CODE}"></td>
								<td>${prolist.PRODUCT_ID}</td>
								<td>${prolist.PRODUCT_NAME}</td>
								<td>
									<fmt:formatNumber value="${prolist.PRODUCT_PRICE}" pattern="#,###"/>
								</td>
								<td>
									<fmt:formatNumber value="${prolist.PRODUCT_DISCOUNT}" type="percent"/>
								</td>
								<td class="s${prolist.PRODUCT_STATE}"></td>
							</tr>						
						</c:forEach>
					</c:otherwise>
				</c:choose>
					
				</tbody>
			</table>
			
			<div class="floatClearClass"></div>
		</div>
	
		<div style="margin-top: 100px; font-size: x-large; cursor: default;">
			<strong>최근 회원가입한 회원 목록</strong>
		</div>
		<hr>

		<div class="pageBodyArea">
			<!-- body 부분 - 상품 목록 보기 -->
			<table class="ListTableStyle">
				<!-- 표 제목 부분 -->
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>회원등급</th>
					</tr>
				</thead>
				<!-- c:foreach로 대체 -->
				<tbody id="TablebodyArea">
				<c:choose>
					<c:when test="${empty userlist}">
						<tr>
							<td colspan="7">등록된 회원 리스트가 존재하지 않습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="users" items="${userlist}">
							<tr onClick="location.href='${pageContext.request.contextPath}/admin/user/info?user_id=${users.USER_ID}'">
								<td>${users.USER_ID}</td>
								<td>${users.USER_NAME}</td>
								<td>${users.USER_NICKNAME}</td>
								<td class="us${users.USER_STATE}"></td>
							</tr>						
						</c:forEach>
					</c:otherwise>
				</c:choose>
					
				</tbody>
			</table>
			<div class="floatClearClass"></div>
		</div>
	
	</div>
	

</body>
</html>