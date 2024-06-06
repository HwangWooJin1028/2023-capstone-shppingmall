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
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/shopping.css?after">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<title>결제정보 입력</title>
</head>
<body  oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
		
	<div class="Paymentbody" style="padding-top: 80px;">
		<div class="pageTitleArea">
			<h1>결제</h1>
		</div>
		<hr>
		<div class="payArea">
			<div class="payUserArea">
				<h3>주문자 정보</h3>
				<table class="payUserTable">
					<tr>	
						<td style="padding-right:10px;">이름:</td>
						<td>${orderInfo.order_receiver}</td>
					</tr>
					<tr>	
						<td style="padding-right:10px;">이메일:</td>
						<td>${user.user_email}</td>
					</tr>
					<tr>	
						<td style="padding-right:10px;">전화번호:</td>
						<td>${orderInfo.order_receiver}</td>
					</tr>
					<tr>	
						<td style="padding-right:10px;">배송지:</td>
						<td>${orderInfo.order_addr} ${orderInfo.order_addr_d}</td>
					</tr>
					<tr>	
						<td style="padding-right:10px;">우편번호:</td>
						<td>${orderInfo.order_zipcode}</td>
					</tr>
				</table>
			</div>
			<hr>
			<div class="payProductArea">
				<h3>주문상품 정보</h3>
				<table class="payProductTable" style="width:98%;">
					<tr>
						<th>상품 이름</th>
						<th>가격</th>
						<th>수량</th>
						<th>할인율 반영 전 금액</th>
						<th>할인율</th>
						<th>금액</th>
					</tr>
					<tr>
						<td>${productDirectMap.product.product_name}</td>
						<td><fmt:formatNumber type="number" pattern="###,###,###" value="${productDirectMap.product.product_price}"/>원</td>
						<td>${productDirectMap.cnt}</td>
						<td><fmt:formatNumber type="number" pattern="###,###,###" value="${productDirectMap.product.product_price*productDirectMap.cnt}"/>원</td>
						<td><fmt:formatNumber type="percent" value="${productDirectMap.product.product_discount}"/></td>
						<td><fmt:formatNumber type="number" pattern="###,###,###" value="${(productDirectMap.product.product_price*productDirectMap.cnt)-(productDirectMap.product.product_price*productDirectMap.cnt*productDirectMap.product.product_discount) }"/>
						</td>
					</tr>
				</table>
			</div>
			<hr>
			<div class="payMoneyArea">
			<h3>결제 금액 정보</h3>
				<table class="payMoneyTable">
					<tr>
						<td style="padding-right:10px;">총 상품금액: </td>
						<td><fmt:formatNumber type="number" pattern="###,###,###" value="${productDirectMap.sumMoney*(1-productDirectMap.discount)}"/>원</td>
					</tr>
					<tr>
						<td style="padding-right:10px;">배송비: </td>
						<td><fmt:formatNumber type="number" pattern="###,###,###" value="${productDirectMap.fee}"/>원</td>
					</tr>
					<tr>
						<td style="padding-right:10px;">총 결제금액: </td>
						<td><fmt:formatNumber type="number" pattern="###,###,###" value="${productDirectMap.allSum}"/>원</td>
					</tr>
				</table>
			</div>
			<hr>
			<div>
				<br>
				<p>결제 및 계좌 안내 시, 상호명은 BELLEAF으로 표기가 되니 참고 부탁드립니다.</p>
				<p>이용약관 및 개인정보 제3자 제공사항에 대해 확인하였으며 결제에 동의합니다.</p>
				<p>서비스 이용약관 <a style="color:gray;" href="https://www.inicis.com/terms">(주)KG이니시스</a></p>
				<br>
			</div>
			<div class="payBtnArea">
				<input type="hidden" name="product_id" id="product_id" value="${productDirectMap.product.product_id}">
				<input type="hidden" name="inven_stock" id="inven_stock" value="${productDirectMap.cnt}">
				<button id="paymemt">결제하기</button>
				<script type="text/javascript">
					$("#paymemt").click(function() {
						var IMP = window.IMP;
						// 포트원에서 가맹점 식별코드 가져오기
						IMP.init('imp38200852');
						IMP.request_pay({
							pg: "html5_inicis.INIpayTest",
							pay_method: "card",
							merchant_uid: 'TC0ONETIME' + new Date().getTime(),
							name: 'BELLEAF',
							amount: ${productDirectMap.allSum},
							buyer_name: '${user.user_name}'
						}, function(rsp) {
							console.log(rsp);
							if(rsp.success) {
								var msg = '결제가 완료되었습니다.';
								msg += '결제금액: ' + rsp.paid_amount;
								document.location.href="paydirect?product_id="+$("#product_id").val()+"&inven_stock="+$("#inven_stock").val();
							} else {
								var msg = '결제에 실패하였습니다.';
								mag += '에러내용: ' + rsp.error_msg;
								// 테스트를 위해 결제에 실패해도 이동이 되도록함
								document.location.href="paydirect?product_id="+$("#product_id").val()+"&inven_stock="+$("#inven_stock").val();
							}
							alert(msg);
						});
					});
				</script>
			</div>
		</div>
	
	</div>
	
	
	
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>