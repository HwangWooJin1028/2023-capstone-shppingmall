<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 베너 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminProductAdd.css?after">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function insertProduct() {
	var length = $('input').length;
	var prd = $('.prdAddForm');
	var imgFile = $('#banner_pic').val();
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
			<strong>베너 추가</strong>
		</div>
		<hr>
		<div class="prdAddFormArea">
			<form action="/admin/banner/insert" method="post" class="prdAddForm" enctype="multipart/form-data">
				<table class="prdAddTable">
					<tr>
						<th>관리자</th>
						<td><input name="user_id" type="text" title="관리자 아이디" value="${user.user_id}" disabled="disabled"></td>
					</tr>
					
					<tr>
						<th>베너이미지</th>
						<td><input type="file" id="banner_pic" name="banner_pic" multiple="multiple" title="상품이미지"></td>
					</tr>
				</table>
				<div class="floatClearClass"></div>
				<div class="buttonArea" style="width:40%; margin:0 auto;">
					<input class="btnProductAdd" type="reset" value="초기화">
					<input class="btnProductAdd" type="button" value="베너추가" onclick="insertProduct()">
				</div>
				
			</form>
		</div>
		
	</div>
</body>
</html>