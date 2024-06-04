<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminListStyle.css">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>관리자페이지 상품목록</title>
<script type="text/javascript">
$(document).ready(function() {
	$(".c1").html("잡곡")
	$(".c2").html("과일")
	$(".c3").html("채소")
	$(".c4").html("수산물")
	$(".c5").html("축산물")
	
	$(".s1").html("판매중")
	$(".s2").html("판매중지")
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
@media all and (max-width:1339px) {
	.pageSearchArea, .pageBodyArea table {
	    width: 100%;
	    margin-left: auto;
	    margin-right: auto;
	}
	.pageSearchArea #textSearch {
	    text-align: left;
	    padding: 5px 10px;
	    font-size: 12px;
	    border: solid grey;
	    border-width: 1px;
	    background: white;
	    border-radius: 4px;
	}
	.pageSearchArea #btnSearch {
	    padding-left: 20px;
	    padding-right: 20px;
	    text-align: center;
	    background-color: white;
	    border: 1px solid;
	    border-color: rgb(229, 170, 163);
	    color: rgb(229, 170, 163);
	    border-radius: 2px;
	    cursor: pointer;
	}
	#bodyContainer {
		width: 100%; 
		margin: auto; 
	}
}
@media all and (max-width:600px) {
	.pageBodyArea button, #btnReset {
	    text-align: center;
	    width: 50px;
	    margin-left: 20px;
	    padding: 4px 5px;
	    background: white;
	    border: 1px solid;
	    border-color: rgb(229, 170, 163);
	    color: rgb(229, 170, 163);
	    border-radius: 2px;
	    cursor: pointer;
	    font-size: 9px;
	}
	.pageSearchArea, .pageBodyArea table {
        width: 100%;
        margin-left: auto;
        margin-right: auto;
        font-size: 9px;
    }
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
			<strong>전체 상품 목록</strong>
		</div>
		<hr>
		<div class="pageSearchArea">
			
			<form action="list" method="get">
				<table class="searchTableStyle">
					<tr>
						<td colspan="4">
							<select name="searchCondition" class="searchSelect">
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
					</tr>
					<tr>
						<th>상품상태</th>
						<td style="vertical-align: middle;">
							<input id="product_state" type="radio" name="product_state" value="1">판매중
							<input id="product_state" type="radio" name="product_state" value="2">판매중지
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
						<th>가격</th>
						<th>할인율</th>
						<th>상품상태</th>
						
					</tr>
				</thead>
				<!-- c:foreach로 대체 -->
				<tbody id="TablebodyArea">
				<c:choose>
					<c:when test="${empty prdList}">
						<tr>
							<td colspan="7">등록된 상품 리스트가 존재하지 않습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="prolist" items="${prdList}">
							<tr onClick="location.href='${pageContext.request.contextPath}/admin/product/info?product_id=${prolist.PRODUCT_ID}'">
								<td>${prolist.R_NUM}</td>
								<td class="c${prolist.CATEGORY_CODE}"></td>
								<td>${prolist.PRODUCT_ID}</td>
								<td>${prolist.PRODUCT_NAME}</td>
								<td>
									<fmt:formatNumber value="${prolist.PRODUCT_PRICE}" pattern="#,###"/>
								</td>
								<td>
									<fmt:formatNumber value="${prolist.PRODUCT_DISCOUNT}" type="percent"/>
								</td>
								<td class="s${prolist.PRODUCT_STATE}"></td>
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
			
			<div class="floatRight">
				<button class="addBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/product/add'">상품추가</button>
			</div>
			<div class="floatClearClass"></div>
		</div>
	</div>
	


</body>
</html>