<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminProductAdd.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>관리자 페이지 상품 등록</title>
<script type="text/javascript">
function insertProduct() {
	var dc = $("input[name='product_discount']").val()
	var price = $("input[name='product_price']").val();
	var stock = $("input[name='price_stock']").val();
	var length = $('input').length;
	var prd = $('.prdAddForm');
	
	// 할인율, 가격, 수량 검사 
	if(price<0) {
		alert("가격은 0이상으로 주세요");
		return false;
	}
	if(stock<0) {
		alert("남은 수량은 0이상으로 주세요");
		return false;
	}
	if(dc > 100 || dc < 0) {
		alert("할인율은 0에서 100까지만 쳐주세요");
		return false;
	}
	
	// input 전체 공백 검사
	for(let i = 2; i<length; i++) {
		if($.trim($('input').eq(i).val()) == "") {
			if(!( $('input').eq(i).attr('name').includes("email"))) {
				alert($('input').eq(i).attr('title') + "을 입력하세요" );
				$('input').eq(i).focus();
				return;
			}
		}
	}
	prd.submit();
}
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
	<div id="prdInfoBodyContainer">
		<div style="margin-top: 50px; font-size: x-large; cursor: default;">
			<strong>상품 추가</strong>
		</div>
		<hr>
		<div class="prdAddFormArea">
			<form action="/admin/product/add" method="post" class="prdAddForm" enctype="multipart/form-data">
				<table class="prdAddTable">

					<tr>
						<th>상품명</th>
						<td><input name="product_name" type="text" title="상품이름"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<select name="category_code" class="CategorySelect">
								<option value="1">잡곡</option>
								<option value="2">과일</option>
								<option value="3">채소</option>
								<option value="4">수산물</option>
								<option value="5">축산물</option>
							</select>	
						</td>
					</tr>
					<tr>
						<th>금액</th>
						<td><input name="product_price" type="number" title="상품금액" step="1"></td>
					</tr>
					<tr>
						<th>입고수량</th>
						<td><input name="product_stock" type="number" title="입고수량" step="1"></td>
					</tr>
					<tr>
						<th>할인율</th>
						<td><input name="product_discount" type="number" title="할인율" step="1"></td>
					</tr>
					<tr>
						<th>상품이미지</th>
						<td><input type="file" name="picFile" multiple="multiple" title="상품이미지"></td>
					</tr>
					<tr>
						<th>상품정보</th>
						<td><input type="file" name="infoFile" multiple="multiple" title="상품정보"></td>
					</tr>

					
				</table>
				<div class="floatClearClass"></div>
				<div class="buttonArea" style="width:40%; margin:0 auto;">
					<input class="btnProductAdd" type="reset" value="초기화">
					<input class="btnProductAdd" type="button" value="상품추가" onclick="insertProduct()">
				</div>
				
			</form>
		</div>
		
	</div>

</body>
</html>