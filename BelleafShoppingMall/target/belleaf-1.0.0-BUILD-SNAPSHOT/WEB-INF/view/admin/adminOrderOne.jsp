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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminSalesOne.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>판매내역 상세보기</title>
<script type="text/javascript">
$(document).ready(function() {
	$(".c1").html("잡곡")
	$(".c2").html("과일")
	$(".c3").html("채소")
	$(".c4").html("수산물")
	$(".c5").html("축산물")
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
	<div class="OrderpageBodyStyle">
		<!-- order table 정보... -->
		<table class="orderTalbeStyle">
			<thead class="orderTitleStyle">
				<tr><th colspan="2">[${orderone[0].order_id}]</th></tr>
			</thead>
			<tbody class="orderBodyStyle">
				<tr>
					<th>주문자ID: </th>
					<td>${orderone[0].user_id}</td>
				</tr>
				<tr>
					<th>수령인: </th>
					<td>${orderone[0].order_receiver}</td>
				</tr>
				<tr>
					<th>총구매가격: </th>
					<td>
						<fmt:formatNumber value="${orderone[0].order_total}" pattern="###,###"/>
					</td>
				</tr>
				<tr>
					<th>주문일자: </th>
					<td>
						<fmt:formatDate value="${orderone[0].order_date}" pattern="yyyy-MM-dd HH:MM"/>
					</td>
				</tr>
				<tr>
					<th>주문자연락처: </th>
					<td>
					<c:if test="${'-' eq fn:substring(orderone[0].order_phone,3,4)}">${orderone[0].order_phone}</c:if>
					<c:if test="${'-' ne fn:substring(orderone[0].order_phone,3,4)}">${fn:substring(orderone[0].order_phone,0,3)}-${fn:substring(orderone[0].order_phone,3,7)}-${fn:substring(orderone[0].order_phone,7,11)}</c:if>
					</td>
				</tr>
				<tr>
					<th rowspan="2">배송주소: </th>
					<td style="text-align:center;">${orderone[0].order_addr}</td>
				</tr>
				<tr>
					<td style="text-align:center;">${orderone[0].order_addr_d}&ensp;${orderone[0].order_zipcode}</td>
				</tr>
			</tbody>
		</table>
		
		<!-- order detail 정보 -->
		<table class="ListTableStyle">
			<!-- 표 제목 부분 -->
			<thead>
				<tr>
					<th>주문상세번호</th>
					<th>상품명</th>
					<th>카테고리</th>
					<th>상품가격</th>
					<th>할인율적용</th>
					<th>수량</th>
					<th>총 적용 가격</th>
					<th>환불 신청 여부</th>
				</tr>
			</thead>
			<!-- c:foreach로 대체 -->
			<tbody id="TablebodyArea">	
				<c:choose>
					<c:when test="${empty orderone}">
						<tr>
							<td colspan="8">등록된 판매내역리스트가 존재하지 않습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${orderone}" var="sales">
							<tr>
								<td>${sales.order_detail_id}</td>
								<td>${sales.product_name}</td>
								<td class="c${sales.category_code}"></td>
								<td>
									<fmt:formatNumber value="${sales.product_price}" pattern="#,###"/>원
								</td>
								<td>
								<c:if test="${sales.product_discount eq 0.0}">[적용없음]</c:if>
								<c:if test="${sales.product_discount ne 0.0 }"><fmt:formatNumber value="${sales.product_discount}" type="percent"/></c:if>
									
								</td>
								<td>${sales.user_order_cnt}개</td>
								<td>
									<c:if test="${sales.product_discount eq 0.0}">
										<fmt:formatNumber value="${(sales.user_order_cnt*sales.product_price)}"
											pattern="###,###"/>원
									</c:if>
									<c:if test="${sales.product_discount ne 0.0}">
										<fmt:formatNumber value="${(sales.user_order_cnt*sales.product_price)-(sales.product_price*sales.product_discount*sales.user_order_cnt)}"
											pattern="###,###"/>원
									</c:if>
								</td>
								<td>
									<c:choose>
										<c:when test="${0 eq sales.refund_id}">정상주문건</c:when>
										<c:otherwise>환불진행중</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose> 
				
			</tbody>
		</table>
		
		<!-- 목록으로 돌아가는 버튼 -->
		<input class="BackBtn" type="button" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/admin/order/list'">
		
	</div>

</body>
</html>