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
<title>마이페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poetsen+One&display=swap" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.s1').html("현재 일반회원 입니다.");
	$('.s2').html("현재 VIP 입니다.");
	$('.s').html("현재 일반회원 입니다.");
})
function deleteUser(user_id) {
	let cf = confirm("회원 탈퇴를 하시겠습니까?");
	if(cf) {
		window.open("/myinfo/user/delete?user_id="+user_id,"pop1",
		"width=600, height=700 top=100, left=150");
	}
}
</script>

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
		<div class="page-nav">홈><a href="/myinfo">마이페이지</a></div>
		<div class="page-title">마이페이지</div>
		
		<!-- 사용자 부분 -->
		<div class="myinfo-top">
			<div class="top-usercontent">
				<div class="top-info">
					<div class="top-circle"><br><br><b>me</b></div>
					<div class="top-text">
						<div class="name">${user.user_id}님</div>
						<div class="s${user.user_grade}"></div>
						<div>포인트 
							<c:choose>
							<c:when test="${not empty user.user_point}">
								${user.user_point}원
							</c:when>
							<c:otherwise>
								0원
							</c:otherwise>
						</c:choose>
						</div>
					</div>
					
				</div>
				<div class="nav-a top-url"><a href="/myinfo/confirm">나의 정보 수정하기</a></div>
			</div>
	
			<div class="top-ordercontent">
				<div class="order-title">주문 현황</div>
				<div class="order-state">
					<span class="topmenu-name">주문</span>
					<c:set var="sum" value="0"/>
					<c:forEach var="list" items="${myOrderList}">
						<c:if test="${list.user_status == 2}">
							<c:set var="sum" value="${sum+1}"/>
						</c:if>
					</c:forEach>
					<c:if test="${sum eq 0}">
						<span class="topmenu-value">0건</span>
					</c:if>
					<c:if test="${sum ne 0}">
						<span class="topmenu-value">${sum}건</span>
					</c:if>
				</div>
			</div>
		</div>
		
		<div class="myinfo-menu">
			<div class="menu-item">
				<div class="menu-title"><span>나의정보</span></div>
				<div class="menu-content">
					<ul>
						<li><a href="${pageContext.request.contextPath}/myinfo/confirm">개인정보 수정</a></li>
						<li><a onclick="deleteUser('${user.user_id}')">회원 탈퇴</a></li>
					</ul>
				</div>
			</div>
			<div class="menu-item">
				<div class="menu-title"><span>나의쇼핑</span></div>
				<div class="menu-content">
					<ul>
						<li><a href="${pageContext.request.contextPath}/myinfo/order">주문내역</a></li>
						<li><a href="${pageContext.request.contextPath}/cart/list">장바구니</a></li>
					</ul>
				</div>
			</div>
			<div class="menu-item">
				<div class="menu-title"><span>나의활동</span></div>
				<div class="menu-content">
					<ul>
						<li><a href="${pageContext.request.contextPath}/myinfo/prdqna/list">상품문의 내역</a></li>
						<li><a href="${pageContext.request.contextPath}/myinfo/review">상품후기 내역</a></li>
						<li><a>문의 내역</a></li>
					</ul>
				</div>
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