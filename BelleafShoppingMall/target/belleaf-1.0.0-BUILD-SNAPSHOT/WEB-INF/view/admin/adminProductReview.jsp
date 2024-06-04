<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminNotHoverListStyle.css">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>상품리뷰목록</title>
<script type="text/javascript">
$(document).ready(function() {
	$(".c1").html("잡곡")
	$(".c2").html("과일")
	$(".c3").html("채소")
	$(".c4").html("수산물")
	$(".c5").html("축산물")
	
	$('.s1').html("&#10029")
	$('.s2').html("&#10029&#10029")
	$('.s3').html("&#10029&#10029&#10029")
	$('.s4').html("&#10029&#10029&#10029&#10029")
	$('.s5').html("&#10029&#10029&#10029&#10029&#10029")
})
function resetOption() {
	$('#textSearch').val('');
	$("#product_category").val("");
	$('input[name="product_state"]').prop('checked', false);
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
	
	<div id="bodyContainer">
		<div style="margin-top: 50px; font-size: x-large; cursor: default;">
			<strong>전체 리뷰 목록</strong>
		</div>
		<hr>
		<div class="pageSearchArea">
			
			<form action="${pageContext.request.contextPath}/admin/product/review" method="get">
				<table class="searchTableStyle">
					<tr>
						<td colspan="4">
							<select name="searchCondition" class="searchSelect">
							 	<option value="REVIEW_CONTENT">리뷰내용</option>
								<option value="PRODUCT_NAME">상품명</option>
								<option value="PRODUCT_ID">상품번호</option>
							</select>
							<!-- 실제 검색어 -->
							<input id="textSearch" type="text" name="searchKeyword">
							<input id="btnSearch" type="submit" value="검색">
						</td>
					</tr>
					<tr class="SearchTableCategoryArea">
						<th>카테고리</th>
						<td style="margin:5px;">
							<select id="product_category" name="product_category" 
							style="width: 95%;padding: 8px;text-align: center;">
								<option value="1">잡곡</option>
								<option value="2">과일</option>
								<option value="3">채소</option>
								<option value="4">수산물</option>
								<option value="5">축산물</option>
							</select>
						</td>
						<td style="vertical-align: middle;">
							<button id="btnReset" type="button" onclick="resetOption()">초기화</button>
						</td>
					</tr>
				</table>
				
			</form>
			
		</div>
		<div class="pageBodyArea">
			<!-- body 부분 - 상품 목록 보기 -->
			<table class="ListTableStyle">
				<!-- 표 제목 부분 -->
				<thead>
					<tr>
						<th>No.</th>
						<th>상품분류</th>
						<th>상품번호</th>
						<th>상품명</th>
						<th>내용</th>
						<th>작성자</th>
						<th>주문일</th>
						<th>별점</th>
						<th>삭제</th>					
					</tr>
				</thead>
				<!-- c:foreach로 대체 -->
				<tbody id="TablebodyArea">
				<c:choose>
					<c:when test="${empty reviewList}">
						<tr>
							<td colspan="9">등록된 상품리뷰 리스트가 존재하지 않습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="reviewList" items="${reviewList}">
							<tr>
								<td>${reviewList.R_NUM}</td>
								<td class="c${reviewList.CATEGORY_CODE}"></td>
								<td>${reviewList.PRODUCT_ID}</td>
								<td>${reviewList.PRODUCT_NAME}</td>
								<td>${reviewList.REVIEW_CONTENT}</td>
								<td>${reviewList.USER_ID}</td>
								<td>
									<fmt:formatDate value="${reviewList.ORDER_DATE}" pattern="yyyy-MM-dd HH:MM"/>
								</td>
								<td class="s${reviewList.REVIEW_GRADE}"></td>
								<td>
								<button class="addBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/product/review/delete?review_id=${reviewList.REVIEW_ID}'">리뷰삭제</button>
								</td>
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