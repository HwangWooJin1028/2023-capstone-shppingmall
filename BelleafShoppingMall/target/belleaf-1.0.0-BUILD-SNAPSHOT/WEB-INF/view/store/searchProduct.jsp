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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/ProductCategoryList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>상품검색결과</title>
<script type="text/javascript">
$(document).ready(function() {
	$(".c1").html("임부복");
	$(".c2").html("식품");
	$(".c3").html("수유용품");
	$(".c4").html("임산부용품");
	var code = $('input[name=titlecode]').val();
	var title = searchKeyword+"에 대한 검색결과";
	$(document).attr("title",title);
		
})
</script>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<input type="hidden" name="titlecode" value="${searchKeyword}">
	
	
	<div class="bodyArea" style="padding-top: 53px;">
		<div class="categoryTitleArea noto-sans-kr-category">
		<strong style="font-size:x-large; color:rgb(231, 76, 60);">&nbsp;&nbsp;'${searchKeyword}'&nbsp;&nbsp;</strong><strong style="font-size:x-large;">에 대한 검색결과</strong>
		</div>
		<div class="ProductArea">
		
			<div class="categoryAllItemArea">
				<c:forEach items="${prdList}" var="product">
					<div class="categoryItemArea">
						<a target="_blank" href="${pageContext.request.contextPath}/product/info?product_id=${product.product_id}">
							<img src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${product.product_pic}" alt="${product.product_pic}" width="800" height="500">
						</a>
						<div class="desc">
							<strong>${product.product_name}</strong>
							<c:if test="${product.product_discount ne 0.0}">
								<p>
									<strong style="font-size:large; color:red;"><fmt:formatNumber value="${product.product_discount}" type="percent"/></strong><br>
									<del><fmt:formatNumber value="${product.product_price}" pattern="###,###,###"/>원</del>
									<fmt:formatNumber value="${product.product_price*(1-product.product_discount)}" pattern="###,###,###"/>원
								</p>
							</c:if>
							<c:if test="${product.product_discount eq 0.0}">
								<p><br><fmt:formatNumber value="${product.product_price}" pattern="###,###,###"/>원</p>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		
			
			
		</div>
	</div>
	
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>