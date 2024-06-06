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
<title>회원 목록 관리</title>
<script type="text/javascript">
$(document).ready(function() {
	$(".us0").html("휴면회원")
	$(".us1").html("일반회원")
	$(".us2").html("관리자")
})
function resetOption() {
	$('#textSearch').val('');
	$(".searchSelect").val("");
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
</style>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div id="bodyContainer">
		<div style="margin-top: 50px; font-size: x-large; cursor: default;">
			<strong>전체 회원 목록</strong>
		</div>
		<hr>
		<div class="pageSearchArea">
			
			<form action="list" method="get">
				<table class="searchTableStyle">
					<tr>
						<td colspan="4">
							<select name="searchCondition" class="searchSelect">
								<option value="USER_ID">회원아이디</option>
								<option value="USER_NAME">회원이름</option>
							</select>
							<!-- 실제 검색어 -->
							<input id="textSearch" type="text" name="searchKeyword">
							<input id="btnSearch" type="submit" value="검색">
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
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>회원등급</th>
					</tr>
				</thead>
				<!-- c:foreach로 대체 -->
				<tbody id="TablebodyArea">
				<c:choose>
					<c:when test="${empty userList}">
						<tr>
							<td colspan="4">등록된 사용자 리스트가 존재하지 않습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="users" items="${userList}">
							<tr onClick="location.href='${pageContext.request.contextPath}/admin/user/info?user_id=${users.USER_ID}'">
								<td>${users.USER_ID}</td>
								<td>${users.USER_NAME}</td>
								<td>${users.USER_NICKNAME}</td>
								<td class="us${users.USER_STATE}"></td>
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
							<a href="${pageContext.request.contextPath}/admin/user/list?nowPage=${paging.nowPageNum-1}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}">
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
								<li><a href="${pageContext.request.contextPath}/admin/user/list?nowPage=${p}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.nowPageNum < paging.lastPageNum}">
						<li>
							<a class="pagingItem" href="${pageContext.request.contextPath}/admin/user/list?nowPage=${paging.nowPageNum+1}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}">
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