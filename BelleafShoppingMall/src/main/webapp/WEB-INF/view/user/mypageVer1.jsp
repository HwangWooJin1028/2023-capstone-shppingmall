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
<title>마이페이지 템플릿</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/small_logo.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	<!-- body -->
	<div class="myinfo-body" style="padding-top: 80px;">
		<div class="all-body">
			
			
			<div class="left-area" oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
				<div class="leftmenu-title">
					<span>MYPAGE</span>
				</div>
				<div class="leftmenu-items">
					<div class="menu-item endmenu-borderbottom">
						<div class="menu-title"><strong>나의정보</strong></div>
						<div class="menu-content">
							<ul>
								<li><a>개인정보 확인</a></li>
							</ul>
						</div>
					</div>
					<div class="menu-item endmenu-borderbottom">
						<div class="menu-title"><strong>나의쇼핑</strong></div>
						<div class="menu-content">
							<ul>
								<li><a>주문내역</a></li>
								<li><a>장바구니</a></li>
							</ul>
						</div>
					</div>
					<div class="menu-item">
						<div class="menu-title"><strong>나의활동</strong></div>
						<div class="menu-content">
							<ul>
								<li><a>상품문의 내역</a></li>
								<li><a>상품후기 내역</a></li>
								<li><a>문의 내역</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		
			<div class="right-area">
				<div class="topmenu-area">
					<div class="topmenu-content">
						<span class="topmenu-key"><strong>회원등급</strong></span>
						<span class="topmenu-value">일반회원</span>
					</div>
					<div class="floatClearClass"></div>
					<div class="topmenu-content">
						<span class="topmenu-key"><strong>배송상태</strong></span>
						<span class="topmenu-value">배송중</span>
					</div>
					<div class="floatClearClass"></div>
					<div class="topmenu-content">
						<span class="topmenu-key"><strong>포인트</strong></span>
						<span class="topmenu-value">0원</span>
					</div>
				</div>
				
				<!-- 여기서부터 본론 -->
				<div class="content-body">
					<p>ddddddddddddddddddd</p>
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