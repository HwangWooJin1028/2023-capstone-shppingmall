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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/cart.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>장바구니</title>
<script type="text/javascript">

</script>
<style>
.noto-sans-kr-category {
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-weight: 300;
  font-style: normal;
}
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
	

	
	<div class="body">
	<div class="myinfo-body" style="padding-top: 100px;">
		<!-- 제목 부분 -->
		<div class="page-nav">홈><a href="${pageContext.request.contextPath}/myinfo">마이페이지</a>><a href="${pageContext.request.contextPath}/cart/list">장바구니</a></div>
		<div class="page-title">장바구니</div>
		<br><br>
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
								<th>빼기</th>
							</tr>
						</thead>
						
						<c:if test="${empty map.list}">
							<tbody>
								<tr>
									<td colspan="8">
									<i class="fa-regular fa-circle-xmark" style="font-size: 48px;padding-bottom:10px;padding-top:15px;"></i>
									<br>
									<h2>장바구니가 존재하지 않습니다</h2>
									</td>
								</tr>
							</tbody>
						</c:if>
						
						<c:if test="${not empty map.list}">
							<tbody>
								<c:forEach items="${map.list}" var="list" varStatus="i">
									<tr style="font-size: medium;">
										<td>
										<c:if test="${empty list.product_pic }">
											<p><span style="width:200px;height:200px;">이미지가 제공되지 않습니다</span></p>
										</c:if>
										<c:if test="${not empty list.product_pic}">
											<span style="padding-top:10px;">
											<img alt="${list.product_pic}" src="${pageContext.request.contextPath}/resources/img/${list.product_pic}" width="200px" height="200px">
											</span>
										</c:if>
										</td>
										<td width="10%"><span> <c:out value="${list.product_name}"/></span></td>
										<td width="10%">
											<fmt:formatNumber value="${list.product_price}" type="number" pattern="###,###,###"/>
										</td>
										<td width="10%">
											<form action="/cart/update" method="post">
												<input type="number" name="cart_product_qty" value="${list.cart_product_qty}" min="1">
												<br>
												<input type="hidden" name="product_id" value="${list.product_id}">
												<input type="submit" value="수량수정">
											</form>
										</td>
										<td width="10%">
											<fmt:formatNumber value="${list.product_price*list.cart_product_qty}" pattern="###,###,###"></fmt:formatNumber>
										</td>
										<td width="10%">
											<fmt:formatNumber value="${list.product_discount}" type="percent"></fmt:formatNumber>
										</td>
										<td width="10%">
											<fmt:formatNumber value="${(list.product_price*list.cart_product_qty)-(list.product_price*list.cart_product_qty)*list.product_discount}"
											pattern="###,###,###"></fmt:formatNumber>
										</td>
										<td width="10%">
											<a href="/cart/delete?cart_id=${list.cart_id}"><i class="fa-solid fa-xmark"></i></a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
					</table>
				</div>
				
				<div class="totalPriceArea" style="margin: 50px 0px 30px 0px;">
					<table class="totalPriceTable">
						<thead style=" font-size: x-large;">
							<tr>	
								<th style="font-weight: 340; font-size:x-large; margin: 0 auto; text-align: center" class="noto-sans-kr-category">총 상품금액</th>
								<th></th>
								<th style="font-weight: 340; font-size:x-large; margin: 0 auto; text-align: center" class="noto-sans-kr-category">배송비</th>
								<th></th>
								<th style="font-weight: 340; font-size:x-large; margin: 0 auto; text-align: center" class="noto-sans-kr-category">총 결제금액</th>
							</tr>
						</thead>
						<tbody style=" font-size: large;">
							<tr>
								<td><b><fmt:formatNumber value="${map.sumMoney}" pattern="###,###,###"></fmt:formatNumber>원</b></td>
								<td><i class="fa-regular fa-square-plus"></i></td>
								<td><b><fmt:formatNumber value="${map.fee}" pattern="###,###,###"></fmt:formatNumber>원</b></td>
								<td><i class="fa-solid fa-equals"></i></td>
								<td><b><fmt:formatNumber value="${map.allSum}" pattern="###,###,###"></fmt:formatNumber>원</b></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="cartBtnArea" style="margin: 50px 0px 150px 0px;">
					<button onclick="location.href='${pageContext.request.contextPath}/'" style="margin-right:10px;">홈으로 돌아가기</button>
					<button onclick="location.href='${pageContext.request.contextPath}/order'" style="margin-left:10px;">주문하러가기</button>
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