<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminProductInfo.css">
<title>관리자 페이지 상품 상세 목록</title>
<script>
var category = ${product.category_code}
var state = ${product.product_state}

$(document).ready(function() {
	$(".CategorySelect option:eq(" + (category-1) + ")").prop("selected",true);
	$(".SaleSelect option:eq(" + (state-1) + ")").prop("selected",true);
})

function editProduct() {
	var dc = $("input[name='product_name']").val();
	var price = $("input[name='product_price']").val();
	var stock = $("input[name='product_stock']").val();
	var length = $('input').length;
	var prd = $('.productEditForm');
	
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
	
	for(let i=2; i<length; i++) {
		if($.trim($('input').eq(i).val()) == "") {
			if(!( $('input').eq(i).attr('name').includes("File"))) {
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
@media all and (max-width:1339px) {
	#prdInfoBodyContainer {
		width: 100%; 
		margin: auto; 
	}
	.prdAddTable {
	    width: 100%;
	    margin: 0 auto;
	}
	.proProductInfo {
	    width: 100%;
	    text-align: left;
	    margin: 0 auto;
	    display: flex;
	    flex-direction: column;
	}
	.ProimageArea {
	    width: 100%;
	    float: none;
	    background-color: #f5f5f5;
	    height: 440px;
	    margin: 0 10px;
	    text-align: center;
	}
	.ProItemDetailArea {
		padding-left: 3px;
		margin: 0px;
	    width: 100%;
	    float: none;
	}
	.buttonArea {
	    width: 100%;
	    padding-top: 3px;
	    padding-left: 3px;
	    margin: 0 auto;
	    display: flex;
	    justify-content: space-between;
	}
}
</style>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div id="prdInfoBodyContainer">
		<div class="pageTitleArea">
			<h1>상품정보</h1>
		</div>
		<hr>
	
		<form class="productEditForm" action="/admin/product/info" method="post" enctype="multipart/form-data">
			<div class="proProductInfo">	
				<div class="ProimageArea">
					<img alt="..." src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${product.product_pic}"
					style="width: 100%;height: 100%;">
				</div>
				<input type="hidden" name="before_pic" value="${product.product_pic}">
				<input type="hidden" name="before_info" value="${product.product_info}">
				<div class="ProItemDetailArea">
					<table class="prdAddTable">
						<tr>
							<th class="ItemTitleArea">상품번호</th>
							<td><input name="product_id" class="ItemContentArea" type="text" readonly value="${product.product_id}"></td>
						</tr>
						<tr>
							<th class="ItemTitleArea">상품명</th>
							<td><input name="product_name" class="ItemContentArea" type="text" value="${product.product_name}">	</td>
						</tr>
						<tr>
							<th class="ItemTitleArea">카테고리</th>
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
							<th class="ItemTitleArea">정가</th>
							<td><input name="product_price" class="ItemContentArea" type="number" value="${product.product_price}" step="1"></td>
						</tr>
						<tr>
							<th class="ItemTitleArea">재고</th>
							<td><input name="product_stock" class="ItemContentArea" type="number" value="${product.product_stock}" step="1"></td>
						</tr>
						<tr>
							<th class="ItemTitleArea">할인율</th>
							<td>
								<input name="product_discount" step="0.01" class="ItemContentArea" type="number" value="${product.product_discount*100}" step="1">
							</td>
						</tr>
						<tr>
							<th class="ItemTitleArea">판매상태</th>
							<td>
								<select id="product_state" name="product_state" class="SaleSelect">
									<option value="1">판매중</option>
									<option value="2">판매중지</option>
								</select>
							</td>			
						</tr>
						<tr>
							<th>상품이미지</th>
							<td>
							<input type="file" name="pic_File" title="상품이미지" multiple="multiple"/>
							</td>
						</tr>
						<tr>
							<th>상품정보</th>
							<td><input type="file" name="info_File" multiple="multiple" title="상품정보" multiple="multiple"></td>
						</tr>
					</table>
				</div>
				<div class="buttonArea">
					<input class="ProInfoItemBtn" type="button" value="상품목록" onclick="location.href='${pageContext.request.contextPath}/admin/product/list'">
		            <input class="ProInfoItemBtn" type="button" value="상품수정" onclick="editProduct()">
				</div>
				<div class="ProductInfoArea">
					<div class="pageTitleArea">
						<h1>상품정보 이미지</h1>
					</div>
					<hr>
					<img alt="..." src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${product.product_info}"
					style="width: 100%;height: 100%;">
				</div>
			</div>
		</form>			
	</div>
</body>
</html>