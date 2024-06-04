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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminProductAdd.css?after">
<title>베너 상세보기</title>
<script type="text/javascript">
function EditBanner() {
	var length = $('input').length;
	var prd = $('.prdAddFormArea');
	var imgFile = $('#banner_pic').val();
	alert(imgFile);
	prd.submit();
}
</script>

<style type="text/css">
body {
	background-color: white !important;
}
.buttonArea {
	padding-top: 3px;	
	padding-left: 30px;
	margin: 0 auto;
	display: flex;
  	justify-content: space-between;
}

.btn-banner {
margin-right: 4px;
	float: left;
	margin-right: 2px;
	width: 46%;
	text-align: center;
	padding: 8px 8px;
	background: white;
	border: 1px solid;
	border-color: rgb(229, 170, 163);
	color: rgb(229, 170, 163);
	border-radius: 2px;
	cursor: pointer;
}

.btn-banner:hover, .btn-banner:focus{
	background-color: rgb(229, 170, 163);
	border-color: rgb(229, 170, 163);
	color:white;
	transition: 0.7s;
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
	
		<form class="prdAddFormArea" action="/admin/banner/edit" method="post" enctype="multipart/form-data">
		<input name="banner_id" type="hidden" value="${banner.banner_id}">
		<input type="hidden" name="before_pic" value="${banner.banner_content}">
			<div class="proProductInfo">				
				<table class="prdAddTable">
					<tr>
						<th>관리자</th>
						<td><input name="user_id" type="text" title="관리자 아이디" value="${user.user_id}" disabled="disabled"></td>
					</tr>
					<tr>
						<th>베너이미지</th>
						<td><input type="file" id="banner_pic" name="banner_pic" title="베너이미지" multiple="multiple"/></td>
					</tr>
				</table>
				<div class="buttonArea">
					<input class="btn-banner" type="button" value="베너목록" onclick="location.href='${pageContext.request.contextPath}/admin/banner'">
		            <input class="btn-banner" type="button" value="베너수정" onclick="EditBanner()">
				</div>
				
			</div>
			<div class="ProductInfoArea">
					<div class="pageTitleArea">
						<h1>베너 이미지</h1>
					</div>
					<hr>
					<div style="width: 100%;margin: auto;">
					<img alt="..." src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${banner.banner_content}"
					style="width:100%; ">
					</div>
				</div>
		</form>			
	</div>
</body>
</html>