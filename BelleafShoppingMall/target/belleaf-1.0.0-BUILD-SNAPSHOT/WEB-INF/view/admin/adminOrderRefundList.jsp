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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminNotHoverListStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>환불요청목록</title>
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
			<strong>전체 환불 목록</strong>
		</div>
		<hr>
		<div class="pageBodyArea">
			<!-- body 부분 - 상품 목록 보기 -->
			<table class="ListTableStyle">
				<!-- 표 제목 부분 -->
				<thead>
					<tr>
						<th>No.</th>
						<th>고객아이디</th>
						<th>주문번호</th>
						<th>주문상세번호</th>
						<th>상품번호</th>
						<th>상품명</th>
						<th>구매수량</th>
						<th style="width: 13%;">환불사유</th>
						<th>구매날짜</th>
						<th>답변상태</th>
						<th colspan="2" style="width: 7%;">상태</th>
					</tr>
				</thead>
				<!-- c:foreach로 대체 -->
				<tbody id="TablebodyArea">			
	 				<c:choose>
						<c:when test="${empty refundList}">
							<tr>
								<td colspan="12">등록된 환불내역리스트가 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${refundList}" var="refund">
								<tr>
									<td>${refund.refund_id}</td>
									<td>${refund.user_id}</td>
									<td>${refund.order_id}</td>
									<td>${refund.order_detail_id}</td>
									<td>${refund.product_id}</td>
									<td>${refund.product_name}</td>
									<td>${refund.user_order_cnt}</td>
									<td>${refund.refund_reason}</td>
									<td>
										<fmt:formatDate value="${refund.order_date}" pattern="yyyy-MM-dd HH:MM"/>
									</td>

									<c:if test="${refund.refund_status eq 1}">
										<td>[신청접수]</td>
									</c:if>
									<c:if test="${refund.refund_status eq 2}">
										<td>[환불승인]</td>
									</c:if>
									<c:if test="${refund.refund_status eq 3}">
										<td>[환불불가]</td>
									</c:if>
									<td colspan="2">
										<c:if test="${refund.refund_status eq 1}">
											<form action="/admin/order/refundlist" method="Post">
												<select name="refund_status">
													<option value="2">[환불승인]</option>
													<option value="3">[환불불가]</option>
												</select>
												<input type="hidden" name="refund_id" value="${refund.refund_id}">
												<input type="hidden" name="order_id" value="${refund.order_id}">
												<input type="hidden" name="user_id" value="${refund.user_id}">
												<input type="hidden" name="order_detail_id" value="${refund.order_detail_id}">
												<input id="btnReset" type="submit" value="상태변경하기">
											</form>
										</c:if>
									</td>
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