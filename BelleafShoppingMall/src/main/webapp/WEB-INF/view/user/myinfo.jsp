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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myinfoOrder.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function refundView(order_detail_id) {
	location.href = "/myinfo/refund?order_detail_id="+order_detail_id;
}
function goMyReview(order_detail_id) {
	window.open("/myinfo/review/insert?order_detail_id="+order_detail_id,"pop1",
			"width=600, height=700 top=100, left=150");
}
</script>
<style type="text/css">
.header {
    background-color: #fff !important;
    border-bottom: 0px !important; 
}
@media all and (max-width:931px) {
	.myinfo-body { 
		width: 100%; 
		margin: auto; 
	}
	.content-orderbody {
	    display: flex;
	    flex-direction: column;
	    flex-wrap: wrap;
	}
	.order-href {
	    font-size: 9px;
	    margin-left: auto;
	    margin-bottom: 75px;
	    margin-top: 25px;
	}
	.ordercard-subtitle {
	    color: #a1a5b6;
	    font-size: 12px;
	}
	.order-move {
	    margin-left: auto;
	    margin-bottom: auto;
	    display: flex;
	    flex-direction: column;
	}
	.ordercontent-button {
	    padding: 10px 10px;
	    border: solid rgb(207, 207, 207);
	    border-width: 1px;
	    background: transparent;
	    cursor: pointer;
	    margin: auto !important;
	    font-size: 10px;
	}
	.order-card {
	    display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    justify-content: space-between;
	    border: 1px solid #dfd8d4;
	    vertical-align: top;
	    margin: 0 2px;
	    width: 100%;
	    margin: 10px 8px;
	    padding: 0 50px;
	}
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
		<div class="page-nav">홈><a href="${pageContext.request.contextPath}/myinfo">마이페이지</a>><a href="${pageContext.request.contextPath}/myinfo/order">주문내역</a></div>
		<div class="page-title">주문내역</div>
		
		<!-- 사용자 부분 -->

		
			<!-- 여기서부터 본론 -->
			<div class="content-body">
				<div class="content-orderbody">
					<c:if test="${empty orderList}">
						<br>
						<h2>주문 내역이 없습니다</h2>
						<br>
						<br>
					</c:if>
					<c:if test="${not empty orderList}">
						<c:forEach var="order" items="${orderList}" varStatus="status">
							<div class="order-card">
								<div class="ordercard-content">
									<br>
									<b class="ordercard-title">${order.product_name}&nbsp;&nbsp;</b>
									<br><br>
									<span class="ordercard-subtitle">주문번호:${order.order_id}</span>
									<br>
									<span class="ordercard-subtitle">결제금액:${order.product_price*order.user_order_cnt}원 | <fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd"/> 주문</span>
									<br>
									<c:choose>
										<c:when test="${order.user_status == 1}"><span>배송중</span></c:when>
										<c:when test="${order.user_status == 2}"><span>배송완료</span></c:when>
										<c:otherwise><span>배송완료</span></c:otherwise>
									</c:choose>
									<br>
									<span class="ordercard-subcontent">결제해주셔서 감사합니다</span>
								</div>
								<div class="order-buttonarea">
									<div class="order-href">
										<a href="${pageContext.request.contextPath}/product/info?product_id=${order.product_id}">상품 상세보기 <i class="fa-solid fa-angle-right"></i></a>
										
									</div>
									<div class="order-move">
										<c:if test="${order.refund_id != 0}">
											<c:if test="${order.refund_status == 1}">
												<button class="ordercontent-button" type="button" disabled="disabled">환불신청중</button>
											</c:if>
											<c:if test="${order.refund_status == 2}">
												<button class="ordercontent-button" type="button" disabled="disabled">환불 승인</button>
											</c:if>
											<c:if test="${order.refund_status == 3}">
												<button class="ordercontent-button" type="button" disabled="disabled">환불 불가</button>
											</c:if>
										</c:if>
										<c:if test="${order.refund_id == 0}">
											<button class="ordercontent-button" type="button" onclick="refundView(${order.order_detail_id})">환불 신청</button>
										</c:if>
										<c:if test="${existList[status.index] eq 1}">
											<button class="ordercontent-button" type="button" disabled="disabled">리뷰 완료</button>
										</c:if>
										<c:if test="${existList[status.index] eq 0}">
											<c:if test="${order.user_status != 1 }">
												<button class="ordercontent-button" type="button" onclick="goMyReview(${order.order_detail_id})">리뷰 작성</button>
											</c:if>
											<c:if test="${order.user_status == 1 }">
												<button class="ordercontent-button" type="button" disabled="disabled">&nbsp;&nbsp;리뷰&nbsp;&nbsp;</button>
											</c:if>
										</c:if>
									</div>
									<br>
								</div>
							</div>
							
							
							<div class="floatClearClass"></div>
						</c:forEach>
					</c:if>
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