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
<title>나의 상품 문의 목록 보기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myinfoPrdQnaList.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".c1").html("쌀")
	$(".c2").html("과일")
	$(".c3").html("채소")
	$(".c4").html("수산물")
	$(".c5").html("축산물")
	
	$(".qs0").html("답변대기")
	$(".qs1").html("답변완료")
})
</script>
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
			<div class="page-nav">홈><a href="/myinfo">마이페이지</a>><a href="/myinfo/prdqna/list">상품문의목록</a></div>
			<div class="page-title">상품문의목록</div>
			
			<div class="content-prdqnabody">
				
				<!-- 여기서부터 본론 -->
				<div class="content-body">

					<table class="content-prdqnaInfo">
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
						<tbody id="">			
			 				<c:choose>
								<c:when test="${empty myPrdQnaList}">
									<tr>
										<td colspan="9">등록된 상품문의 리스트가 존재하지 않습니다</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="myPrdQna" items="${myPrdQnaList}">
										<tr onclick="location.href='${pageContext.request.contextPath}/myinfo/prdqna/info?qna_group=${myPrdQna.QNA_GROUP}'">
											<td>${myPrdQna.R_NUM}</td>
											<td class="c${myPrdQna.CATEGORY_CODE}"></td>
											<td>${myPrdQna.PRODUCT_ID}</td>
											<td>${myPrdQna.PRODUCT_NAME}</td>
											<td>${myPrdQna.QNA_CONTENT}</td>
											<td>${myPrdQna.USER_NICKNAME}</td>
											<td>
												<fmt:formatDate value="${myPrdQna.PRODUCT_QNA_DATE}"/>
											</td>
											<td class="qs${myPrdQna.PRODUCT_QNA_STATE}"></td>
											<c:if test="${myPrdQna.PRODUCT_QNA_STATE eq 0 }">
												<td>답변대기</td>
											</c:if>
											<c:if test="${myPrdQna.PRODUCT_QNA_STATE eq 1 }">
												<td>답변완료</td>
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
				
				</div>	
				
							
			</div>
			
		</div>
	</div>
	
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>