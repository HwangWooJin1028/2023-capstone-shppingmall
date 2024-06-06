<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminBannerList.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>베너 관리</title>
<script type="text/javascript">
function removeBanner(banner_id, banner_content) {
	var cf = confirm("베너를 삭제하시겠습니까?");
	if(cf) {
		let f = document.createElement('form');
		
		let obj;
		obj = document.createElement('input');
		obj.setAttribute('type', 'hidden');
		obj.setAttribute('name', 'banner_id');
		obj.setAttribute('value', banner_id);

		let obj2;
		obj2 = document.createElement('input');
		obj2.setAttribute('type', 'hidden');
		obj2.setAttribute('name', 'before_banner_pic');
		obj2.setAttribute('value', banner_content);
		
		f.appendChild(obj);
		f.appendChild(obj2);
		f.setAttribute('method', 'post');
		f.setAttribute('action', '/admin/banner/delete');
		document.body.appendChild(f);
		f.submit();
	}
}
</script>
<style type="text/css">
body {
	background-color: white !important;
}
</style>
</head>
<body>
	<div class="all-adminbody">
	<!-- header 참조 -->
	<div>
		<header>
			<jsp:include page="../common/header.jsp"></jsp:include>
		</header>
	</div>
	
		
	<div id="bodyContainer">
		<div style="margin-top: 50px; font-size: x-large; cursor: default;">
			<strong>홈페이지 베너 목록</strong>
		</div>
		<hr>
		
		<div class="pageBodyArea">
			
			<!-- 여기서부터 본론 -->
				<div class="content-body">
					<div class="content-bannerbody">
					<c:if test="${empty bannerList}">
							<br>
							<h2>베너 목록이 없습니다</h2>
							<br>
							<br>
					</c:if>
					<div class="banner-container">
						<c:if test="${not empty bannerList}">
							<c:forEach items="${bannerList}" var="bannerList">
							<div class="banner-card">
								<div class="bannercard-content">
									<div class="banner-producttext">
										<span><b>[RowNum: ${bannerList.banner_id}]</b></span><br>
										<span><b>[관리자</b>: ${bannerList.user_id}]</span>
									</div>
									<br>
									<img src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${bannerList.banner_content}" height="60px;">
								</div>
								<div class="order-buttonarea">
									<div class="banner-href">
										<a href="${pageContext.request.contextPath}/admin/banner/edit?banner_id=${bannerList.banner_id}">베너 상세보기 <i class="fa-solid fa-angle-right"></i></a>
									</div>
									<div class="order-move">
										<button class="banner-button" type="button" onclick="removeBanner(${bannerList.banner_id},'${bannerList.banner_content}')">베너 삭제</button>
									</div>
								</div>
							</div>
							</c:forEach>
						</c:if>
					</div>
					</div>
				</div>
			
			<div style="float: right;">
				<button class="addBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/banner/insert'">베너 추가</button>
			</div>
			<div class="floatClearClass"></div>
		
		</div>
	</div>
	</div>
</body>
</html>