<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminProductAdd.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>답변작성</title>
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
		<div class="pageTitleArea">
			<h1>상품등록</h1>
		</div>
		<hr>
		<div class="prdAddFormArea">
			<form action="/admin/product/ask" method="post" class="prdAddForm" enctype="multipart/form-data">
				<table class="prdAddTable">

					<tr>
						<th>상품명</th>
						<td><input name="product_name" type="text" title="상품이름"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<select name="category_code" class="CategorySelect">
								<option value="1">쌀</option>
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
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>