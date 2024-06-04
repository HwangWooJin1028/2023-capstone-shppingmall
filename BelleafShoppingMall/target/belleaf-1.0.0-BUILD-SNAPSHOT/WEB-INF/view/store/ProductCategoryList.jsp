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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/ProductCategoryList.css?afters">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>상품 리스트</title>
<script type="text/javascript">
$(document).ready(function() {
	$(".c1").html("쌀 및 잡곡");
	$(".c2").html("과일");
	$(".c3").html("채소");
	$(".c4").html("수산물");
	$(".c5").html("축산물");
	var code = $('input[name=titlecode]').val();
	
	if(code == '1') {
		$(document).attr("title","임부복 상품목록");
	} else if(code == '2') {
		$(document).attr("title","식품 상품목록");
	} else if(code == '3') {
		$(document).attr("title","수유용품 상품목록");
	} else if(code == '4') {
		$(document).attr("title","임산부용품 상품목록");
	}	
})
</script>
<style>
.noto-sans-kr-category {
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-weight: 300;
  font-style: normal;
}
</style>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<input type="hidden" name="titlecode" value="${category_code}">
	<div class="bodyArea" style="padding-top: 100px;">
		
		
		<!-- 제목 부분 -->
		<div class="page-nav"><a href="${pageContext.request.contextPath}/">홈</a>><a class="c${category_code}"></a></div>
		
		<div class="categoryTitleArea noto-sans-kr-category" style="text-align: center">
			<strong style="font-weight: 340; font-size:x-large; margin: 0 auto; text-align: center" class="c${category_code}"></strong>
			<p style="font-size:large; margin: 0 auto;" >전체리스트</p>
		</div>
		
		<div class="ProductArea" style="padding-top: 50px;">
		
			<div class="categoryAllItemArea">
				<c:forEach items="${prdList}" var="product">
					<div class="categoryItemArea">
						<a target="_blank" href="${pageContext.request.contextPath}/product/info?product_id=${product.PRODUCT_ID}">
							<img src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${product.PRODUCT_PIC}" alt="${product.PRODUCT_PIC}" width="800" height="500">
						</a>
						<div class="desc">
							<strong class="noto-sans-kr-category">${product.PRODUCT_NAME}</strong>
							<c:if test="${product.PRODUCT_DISCOUNT ne 0.0}">
								<p>
									<strong style="font-size:large; color:red;"><fmt:formatNumber value="${product.PRODUCT_DISCOUNT}" type="percent"/></strong><br>
									<del><fmt:formatNumber value="${product.PRODUCT_PRICE}" pattern="###,###,###"/>원</del>
									<fmt:formatNumber value="${product.PRODUCT_PRICE*(1-product.PRODUCT_DISCOUNT)}" pattern="###,###,###"/>원
								</p>
							</c:if>
							<c:if test="${product.PRODUCT_DISCOUNT eq 0.0}">
								<p><br><fmt:formatNumber value="${product.PRODUCT_PRICE}" pattern="###,###,###"/>원</p>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		
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
			
		</div>
	</div>
	
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>