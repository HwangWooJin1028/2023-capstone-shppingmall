<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminListStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>상품문의목록</title>
<script type="text/javascript">
var condition = '<c:out value="${searchCondition}"/>';
var category = '<c:out value="${prd_category}"/>';
var qstate = '<c:out value="${qna_state}"/>';

$(document).ready(function() {
	$(".c1").html("쌀")
	$(".c2").html("과일")
	$(".c3").html("채소")
	$(".c4").html("수산물")
	$(".c5").html("축산물")
	
	if(condition!='') {
		$('option[value='+condition+']').prop('selected', true);
	}
	if(category!='') {
		$('.qna_category').val(category).prop('selected', true);
	}
	if(qstate!='') {
		$('.qna_state[value='+qstate+']').prop('checked', true);
	}
	
	$(".qs0").html("답변대기")
	$(".qs1").html("답변완료")
})
function resetOption() {
	$('#textSearch').val('');
	$("#searchCondition").val("");
	$("#product_category").val("");
	$('input[name="product_ana_state"]').prop('checked', false);
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
			<strong>전체 상품 문의 목록</strong>
		</div>
		<hr>
		<div class="pageSearchArea">
			<form action="/admin/product/ask" method="get">
				<table class="searchTableStyle">
					<tr>
						<td colspan="4">
							<select id="searchCondition" name="searchCondition" class="searchSelect">
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
								<option value="1">쌀</option>
								<option value="2">과일</option>
								<option value="3">채소</option>
								<option value="4">수산물</option>
								<option value="5">축산물</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>답변상태</th>
						<td style="vertical-align: middle;">
							<input id="product_ana_state" type="radio" name="product_ana_state" value="1">답변대기
							<input id="product_ana_state" type="radio" name="product_ana_state" value="2">답변완료
							<button id="btnReset" type="button" onclick="resetOption()" >초기화</button>
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
						<th>작성일</th>
						<th>작성대기</th>
						<th></th>
					</tr>
				</thead>
				<!-- c:foreach로 대체 -->
				<tbody id="TablebodyArea">			
	 				<c:choose>
						<c:when test="${empty prdAskList}">
							<tr>
								<td colspan="9">등록된 상품문의 리스트가 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="askList" items="${prdAskList}">
								<tr onclick="location.href='${pageContext.request.contextPath}/admin/ask/info?qna_group=${askList.QNA_GROUP}'">
									<td>${askList.R_NUM}</td>
									<td class="c${askList.CATEGORY_CODE}"></td>
									<td>${askList.PRODUCT_ID}</td>
									<td>${askList.PRODUCT_NAME}</td>
									<td>${askList.QNA_CONTENT}</td>
									<td>${askList.USER_NICKNAME}</td>
									<td>
										<fmt:formatDate value="${askList.PRODUCT_QNA_DATE}"/>
									</td>
									<td class="qs${askList.PRODUCT_QNA_STATE}"></td>
									<c:if test="${askList.PRODUCT_QNA_STATE eq 0 }">
										<td onclick="event.cancelBubble = true;">
											<button class="addBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/product/ask/answer?qna_id=${askList.QNA_ID}'">답변작성</button>
										</td>
									</c:if>
									<c:if test="${askList.PRODUCT_QNA_STATE eq 1 }">
										<td>답변작성완료</td>
									</c:if>
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