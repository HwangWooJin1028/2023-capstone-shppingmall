<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>주문내역 보기</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/refundForm.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function submitRefund(refundTotal) {
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/myinfo/refund",
		data: $("#refundForm").serialize() + "&refundTotal=" + refundTotal,
		success: function(data) {
			alert(data);
			location.replace("${pageContext.request.contextPath}/myinfo");
		},
		error: function() {
			alert("환불신청을 실패하였습니다.");
		}
	});
}
</script>
</head>
<body>
	<!-- 현재 날짜 설정.. -->
	<c:set var="now" value="<%= new java.util.Date() %>" />
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
		
	<!-- body -->
	<div class="body">
		<div class="myinfo-body" style="padding-top: 100px;">
			<!-- 제목 부분 -->
			<div class="page-nav">홈><a href="${pageContext.request.contextPath}/myinfo">마이페이지</a>><a href="${pageContext.request.contextPath}/myinfo/order">주문내역</a>><a href="${pageContext.request.contextPath}/myinfo/refund">환불신청</a></div>
			<div class="page-title">환불신청</div>
			
			<!-- 사용자 부분 -->
			<div class="content-refundbody">
				<h3>환불 정보 입력</h3>
				<form id="refundForm" name="refundForm" action="/myinfo/refund" method="post">
					<input type="hidden" name="order_id" value="${oneOrder.order_id}">
					<input type="hidden" name="order_detail_id" value="${oneOrder.order_detail_id}">
					<div class="content-refundInfo">
						<table class="refund-table">
							<fmt:parseNumber var="refundTotal" integerOnly="true" value="${oneOrder.product_price*oneOrder.user_order_cnt*(1-oneOrder.product_discount)}"/>
							<tr>
								<th>아이디</th>
								<td><input name="user_id" type="text" title="아이디" readonly value="${user.user_id}"></td>
							</tr>
							<tr>
								<th>환불신청일</th>
								<td><span><fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 a hh:mm:ss"/></span></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" readonly name="user_name" value="${user.user_name}">
								</td>
							</tr>
							<tr>
								<th>상품명</th>
								<td>
								<input type="text" readonly name="product_name" value="${oneOrder.product_name}">
								</td>
							</tr>
							<tr>
								<th>환불 가격</th>
								<td>
								<input type="text" name="refund_total" value="${refundTotal}" readonly>
								</td>
							</tr>
							<tr>
								<th>환불사유</th>
								<td>
								<textarea rows="10" cols="40" name="refund_reason"  required="required" placeholder="환불사유를 적어주세요.."></textarea>
								</td>
							</tr>
						</table>
					</div>
					<div class="content-refundbutton">
						<input class="refund-button" type="button" value="주문내역으로 돌아가기" onclick="location.href='${pageContext.request.contextPath}/myinfo'">
						<input class="refund-button" type="button" value="환불신청" onclick="submitRefund(${refundTotal})">
					</div>
				</form>
			</div>
	
		
		</div>
	</div>
	
	<br><br><br>
	

	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>