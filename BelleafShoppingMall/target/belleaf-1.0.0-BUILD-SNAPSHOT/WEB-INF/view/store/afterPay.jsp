<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/small_logo.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/shopping.css">
<meta charset="UTF-8">
<title>결제완료</title>
</head>
<body  oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	<div class="Paymentbody" style="margin-top: 50px;text-align: center; padding-top: 80px;">
		<strong>${user.user_nickname}님의 주문과 결제가 <span style="color:#B90000;">정상적으로 완료되었습니다.</span></strong><br><br><br>
		<strong>이용해주셔서 감사합니다</strong><br><br><br>
		<strong>주문 번호 : <span style="color:#B90000;">${orderInfo.order_id}</span></strong><br><br><br>
		
		<div class="payBtnArea" style="margin-bottom: 100px;">
			<button id="paymemt" type="button" onclick="location.href='${pageContext.request.contextPath}/myinfo/order'">주문내역 확인하기</button>
			<button id="paymemt" type="button" onclick="location.href='${pageContext.request.contextPath}/'">홈으로 돌아가기</button>
		</div>
		
	</div>
	
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>