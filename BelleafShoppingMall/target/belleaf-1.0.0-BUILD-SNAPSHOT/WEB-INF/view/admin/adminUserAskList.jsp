<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminListStyle.css">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<script>
//문의글의 제목을 누르면 글의 내용과 답변이 한눈에 보이는 상세페이지로 이동하는 함수
function go_getCenter(center_qna_id) {
	location.href="${pageContext.request.contextPath}/admin/adminCenter?center_qna_id="+center_qna_id;
}

//답변 등록-답변하기 버튼을 눌르면 활성화 되는 함수
function go_insertReply(center_qna_id){
	location.href="${pageContext.request.contextPath}/admin/adminCenter?center_qna_id="+center_qna_id;
}
</script>
<style type="text/css">
body {
	background-color: white !important;
}
</style>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/testadminHeader.jsp"></jsp:include>
	</header>
	<div id="bodyContainer">
		<div style="margin-top: 50px; font-size: x-large; cursor: default;">
			<strong>전체 문의 목록</strong>
		</div>
		<hr>
	

		<div class="pageSearchArea">
			<!--검색위한 폼  -->
			<form action="/admin/centerList" method="get">
				<table class="searchTableStyle">
					<tr>
						<td colspan="4">
						<select name="searchCondition" class="searchSelect"><!-- 옵션선택하는곳 -->
						<c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key}</option>
						</c:forEach>
						</select>
						<input  id="textSearch" type="text" name="searchKeyword"><!--글입력하는곳  -->
						<button id="btnSearch" type="submit" class="btn">검색</button><!-- 검색버튼 -->
						</td>
					</tr>
				</table>
				<br>
			</form>
		</div>
		
		<div class="pageBodyArea">
			<!-- 데이터 표시 영역 -->
			<table class="ListTableStyle">
				<thead>
					<tr>
						<th style="text-align:center; vertical-align: meddle; width: 7%">NO.</th>
						<th style="text-align:center; vertical-align: meddle; width: 43%">문의제목</th>
						<th style="text-align:center; vertical-align:meddle; width: 5%">ID</th>
						<th style="text-align:center; vertical-align:meddle; width: 20%">닉네임</th>
						<th style="text-align:center; vertical-align:meddle; width: 10%">문의날짜</th>
						<th style="text-align:center; vertical-align:meddle; width: 10%">문의상태</th>
						<th style="text-align: center; vertical-align: middle;" width="10%"></th>
					</tr>	
				</thead>
				<tbody id="TablebodyArea">
					<c:if test="${empty replylist}">
						<tr>
							<th colspan="7" style="text-align: center; vertical-align: meddle;">등록된 고개문의가 없습니다.</th>
						</tr>
					</c:if>
					<c:forEach items="${replylist}" var="center" varStatus="status">
						<tr onclick="go_getCenter(${center.CENTER_QNA_ID});">
							<td style="text-align: center; vertical-align: middle">${center.R_NUM}</td>
							<td style="vertical-align: middle;"><span class="d-inline-block text-truncate" style="max-width:180px; cursor:pointer;">
								<strong>${center.CENTER_QNA_TITLE }</strong></span>
							</td>
							<td style="text-align: center; vertical-align: middle;">${center.USER_ID }</td>
							<td style="text-align: center; vertical-align: middle;">${center.USER_NICKNAME }</td>
							<td style="text-align: center; vertical-align: middle;">
								<fmt:formatDate value="${center.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/>
							</td>
							<!-- 아래c:choose구문은reply테이블에 해당하는 답변이 비어있으면 답변대기,데이터기 있으면 바로 답변완료 -->
							<c:choose>
								<c:when test="${empty center.CENTER_REPLY_ID}">
									<td style="text-align: center; vertical-align: middle;">답변대기</td>
									<td style="text-align: center; vertical-align: middle;" onclick="event.cancelBubble=true">
										<button type="button" class="btn btn-dark btn-sm" onclick="go_insertReply(${center.CENTER_QNA_ID})" style="margin-right: 10px;">답변하기</button>
									</td>
								</c:when>
								<c:otherwise>
									<td style="text-align: center; vertical-align: middle;"><strong>답변완료</strong></td>
									<td></td>
<!-- 									<td style="text-align: center; vertical-align: middle;" onclick="event.cancelBubble=true">
										<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_insertReply(${center.CENTER_QNA_ID})" disabled style="margin-right: 10px;">답변하기</button>
									</td> -->
								</c:otherwise>
							</c:choose>
							<c:if test="${empty center.CENER_REPLY_ID}">
						
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
			<div class="pagingArea">
				<ul>
					<c:if test="${paging.nowPageNum>1}">
						<li>
							<a href="/admin/centerList?nowPage=${paging.nowPageNum-1}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}">
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
								<li><a href="/admin/centerList?nowPage=${p}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}">${p}</a></li>
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

		</div>

	</div>
</body>
</html>