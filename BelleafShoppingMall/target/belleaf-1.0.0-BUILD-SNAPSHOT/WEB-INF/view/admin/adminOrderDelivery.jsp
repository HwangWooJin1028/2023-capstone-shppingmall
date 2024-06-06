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
<title>배송상태변경</title>
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
			<strong>전체 배송 목록 및 상태 변경</strong>
		</div>
		<hr>
		<div class="pageBodyArea">
			<!-- body 부분 - 상품 목록 보기 -->
			<table class="ListTableStyle">
				<!-- 표 제목 부분 -->
				<thead>
					<tr>
						<th>주문번호</th>
						<th>고객아이디</th>
						<th>주문일자</th>
						<th>수령인</th>
						<th>연락처</th>
						<th>배송주소</th>
						<th>배송상태</th>
					</tr>
				</thead>
				<!-- c:foreach로 대체 -->
				<tbody id="TablebodyArea">			
	 				<c:choose>
						<c:when test="${empty udlist}">
							<tr>
								<td colspan="7">등록된 상품문의 리스트가 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${udlist}" var="userorder">
								<tr>
									<td>${userorder.order_id}</td>
									<td>${userorder.user_id}</td>
									<td>
										<fmt:formatDate value="${userorder.order_date}" pattern="yyyy-MM-dd HH:MM"/>
									</td>
									<td>${userorder.order_receiver}</td>
									<td>${userorder.order_phone}</td>
									<td>${userorder.order_addr}&ensp;${userorder.order_addr_d}&ensp;${userorder.order_zipcode}</td>

									<c:if test="${userorder.user_status eq 1}">
										<td>
											<button class="addBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/order/delivery/update?order_id=${userorder.order_id}'">배송시작</button>
										</td>
									</c:if>
									<c:if test="${userorder.user_status eq 2}">
										<td>배송완료</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose> 
					
				</tbody>
			</table>
		
		
			
			<div class="pagingArea">
				<ul>
					<c:if test="${paging.nowPageNum>1}">
						<li>
							<a href="/admin/product/list?nowPage=${paging.nowPageNum-1}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}">
								<i class="fa-solid fa-caret-left"></i>
							</a>
						</li>
					</c:if>
					<c:forEach begin="${paging.startPageNum}" end="${paging.endPageNum}" var="p">
						<c:choose>
							<c:when test="${p==paging.nowPageNum }">
								<li class="disabled">
	    							<span>${p}</span> <!-- 클릭 불가능한 비활성화된 페이지 -->
								</li>
							</c:when>
							<c:when test="${p!=paging.nowPageNum}">
								<li><a href="/admin/product/list?nowPage=${p}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.nowPageNum < paging.lastPageNum}">
						<li>
							<a class="pagingItem" href="/admin/product/list?nowPage=${paging.nowPageNum+1}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}">
							<i class="fa-solid fa-caret-right"></i>
							</a>
						</li>
					</c:if>
				</ul>
			</div>
			
			<div class="floatClearClass"></div>
		</div>
	</div>

</body>
</html>