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
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/small_logo.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/cart.css">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>바로주문하기</title>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	<div id="bodyContainer" style="padding-top: 80px;">
	
		<div class="pageTitleArea">
			<strong style="font-weight: 340; font-size:xx-large; margin: 0 auto; text-align: center; color: black;" class="noto-sans-kr-category">주문 정보 입력</strong>
		</div>
		<hr>
		<br>
		<div class="cartBody">

			
				<div class="carttable">
				
					<table>
						<thead>
							<tr>
								<th></th>
								<th>상품 이름</th>
								<th>개당 가격</th>
								<th>수량</th>
								<th>가격</th>
								<th>할인율</th>
								<th>결제금액</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>
								<c:if test="${empty productDirectMap.product.product_pic }">
									<p><span style="width:200px;height:200px;">이미지가 제공되지 않습니다</span></p>
								</c:if>
								<c:if test="${not empty productDirectMap.product.product_pic}">
									<span style="padding-top:10px;">
									<img alt="${productDirectMap.product.product_pic}" src="${pageContext.request.contextPath}/resources/img/${productDirectMap.product.product_pic}" width="200px" height="200px">
									</span>
								</c:if>
								</td>
								<td width="10%"><span> <c:out value="${productDirectMap.product.product_name}"/></span></td>
								<td width="10%">
									<fmt:formatNumber value="${productDirectMap.product.product_price}" type="number" pattern="###,###,###"/>
								</td>
								<td width="10%">
										${productDirectMap.cnt}
										<br>
										<input type="hidden" name="product_id" value="${productDirectMap.product.product_id}">
								</td>
								<td width="10%">
									<fmt:formatNumber value="${productDirectMap.product.product_price*productDirectMap.cnt}" pattern="###,###,###"></fmt:formatNumber>
								</td>
								<td width="10%">
									<fmt:formatNumber value="${productDirectMap.product.product_discount}" type="percent"></fmt:formatNumber>
								</td>
								<td width="10%">
									<fmt:formatNumber value="${(productDirectMap.product.product_price*productDirectMap.cnt)-(productDirectMap.product.product_price*productDirectMap.cnt)*productDirectMap.product.product_discount}" pattern="###,###,###"></fmt:formatNumber>
								</td>
							</tr>

						</tbody>

					</table>
				</div>
				
				<div class="totalPriceArea" style="margin: 50px 0px 30px 0px;">
					<table class="totalPriceTable">
						<thead style=" font-size: x-large;">
							<tr>	
								<th>총 상품금액</th>
								<th>배송비</th>
								<th>총 결제금액</th>
							</tr>
						</thead>
						<tbody style=" font-size: large;">
							<tr>
								<td><b><fmt:formatNumber value="${productDirectMap.sumMoney}" pattern="###,###,###"></fmt:formatNumber>원</b></td>
								<td><b><fmt:formatNumber value="${productDirectMap.fee}" pattern="###,###,###"></fmt:formatNumber>원</b></td>
								<td><b><fmt:formatNumber value="${productDirectMap.allSum}" pattern="###,###,###"></fmt:formatNumber>원</b></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="cartBtnArea" style="margin: 50px 0px 150px 0px;">
					<button onclick="location.href='${pageContext.request.contextPath}/'" style="margin-right:10px;">홈으로 돌아가기</button>
					<button onclick="location.href='${pageContext.request.contextPath}/order/direct'" style="margin-left:10px;">주문하러가기</button>
				</div>
				
		</div>
	
		
	
	</div>
	
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>