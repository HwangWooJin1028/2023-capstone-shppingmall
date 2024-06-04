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
<title>나의 후기 목록 보기</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/small_logo.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myinfoReview.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.s1').html("&#10029");
	$('.s2').html("&#10029&#10029");
	$('.s3').html("&#10029&#10029&#10029");
	$('.s4').html("&#10029&#10029&#10029&#10029");
	$('.s5').html("&#10029&#10029&#10029&#10029&#10029");
})
function editMyReview(review_id) {
	window.open("/myinfo/review/edit?review_id="+review_id,"pop1",
	"width=600, height=700 top=100, left=150");
}
function removeMyReview(review_id) {
	var cf = confirm("리뷰를 삭제하시겠습니까?");
	if(cf) {
		let f = document.createElement('form');
		
		let obj;
		obj = document.createElement('input');
		obj.setAttribute('type', 'hidden');
		obj.setAttribute('name', 'review_id');
		obj.setAttribute('value', review_id);
		
		f.appendChild(obj);
		f.setAttribute('method', 'post');
		f.setAttribute('action', '/myinfo/review/delete');
		document.body.appendChild(f);
		f.submit();
	}
}
</script>
<style type="text/css">
.header {
    background-color: #fff !important;
    border-bottom: 0px !important; 
}

@media all and (max-width:1500px) {
	.myinfo-body { 
		width: 80%; 
		margin: auto; 
	}
	.review-card {
	    border: 1px solid #dfd8d4;
	    padding: 50px;
	    border-radius: 10px;
	    vertical-align: top;
	    margin: 0 2px;
	    width: auto;
	    margin: 10px 8px;
	}


}
@media all and (max-width:931px) {
	.myinfo-body { 
		width: 100%; 
		margin: auto; 
	}
	.review-container {
	
		display: flex;
		flex-direction: column;
		flex-wrap: wrap;
	}
	.review-card {
	    
	    border: 1px solid #dfd8d4;
	    padding: 50px;
	    border-radius: 10px;
	    vertical-align: top;
	    margin: 0 2px;
	    width: 100%;
	    margin: 10px 8px;
	}
	.reviewcard-top {
	    display: block;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    vertical-align: middle;
	}
	.review-buttonarea {
	    display: flex;
	    flex-direction: row;
	    margin-left: auto;
	    margin-top:3px;
	    margin-bottom: auto;
	}
	.review-producttext {
	    border-left: 1px;
	    border-left-style: solid;
	    border-left-color: rgb(225, 228, 230);
	    margin: 0px 10px 10px 10px;
	    display: flex;
	    flex-direction: column;
	    padding-top: 3px;
	    padding-left: 0px; 
	    text-align: left;
	}
}
</style>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	<!-- body -->
	<div class="body">
		<div class="myinfo-body" style="padding-top: 100px;">
			<!-- 제목 부분 -->
			<div class="page-nav">홈><a href="${pageContext.request.contextPath}/myinfo">마이페이지</a>><a href="${pageContext.request.contextPath}/myinfo/review">상품후기 내역</a></div>
			<div class="page-title">상품후기 내역</div>
			
							
				<!-- 여기서부터 본론 -->
				<div class="content-body">
					<c:if test="${empty myReviewList}">
							<br>
							<h2>후기 목록이 없습니다</h2>
							<br>
							<br>
					</c:if>
					<div class="review-container">
					<c:if test="${not empty myReviewList}">
						<c:forEach items="${myReviewList}" var="myReviewList">
						<div class="review-card">
						
							<div class="reviewcard-top">
								<div class="reviewcard-content">
									<img src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${myReviewList.PRODUCT_PIC}">
							
									<div class="review-producttext">
										<span><b>[${myReviewList.PRODUCT_NAME}]</b> <fmt:formatNumber value="${myReviewList.PRODUCT_PRICE}" pattern="###,###,###"/>원</span>
										<span><b>구매날짜</b></span>
										<span><fmt:formatDate value="${myReviewList.ORDER_DATE}" pattern="yyyy-MM-dd"/></span>
										<span class="s${myReviewList.REVIEW_GRADE}"></span>
									</div>
									
								</div>
								
								<div class="review-buttonarea">

									<button class="review-button" type="button" onclick="editMyReview(${myReviewList.REVIEW_ID})">리뷰 수정</button><br>
									<button class="review-button" type="button" onclick="removeMyReview(${myReviewList.REVIEW_ID})">리뷰 삭제</button>

								</div>
							</div>
							
							<div class="reviewcard-bottom">
								<span>${myReviewList.REVIEW_CONTENT}</span>
							</div>
							
						</div>
						</c:forEach>
					</c:if>
				</div>
					<div class="pagingArea">
						<ul>
							<c:if test="${paging.nowPageNum>1}">
								<li>
									<a href="/myinfo/review?nowPage=${paging.nowPageNum-1}&cntPageItemNum=${cntPageItemNum}">
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
										<li><a href="/myinfo/review?nowPage=${p}&cntPageItemNum=${cntPageItemNum}">${p}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.nowPageNum < paging.lastPageNum}">
								<li>
									<a class="pagingItem" href="/myinfo/review?nowPage=${paging.nowPageNum+1}&cntPageItemNum=${cntPageItemNum}">
									<i class="fa-solid fa-caret-right"></i>
									</a>
								</li>
							</c:if>
						</ul>
					</div>
					
					<div class="floatClearClass"></div>
				
				</div>
			
			
			
			
		</div>
	</div>
	

	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>