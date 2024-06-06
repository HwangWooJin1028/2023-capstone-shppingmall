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
<title>나의 문의 목록 보기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myinfoPrdQnaList.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
/*반응형 웹*/
@media all and (max-width:931px) {
	.myinfo-body { 
		width: 100%; 
		margin: auto; 
	}
	.pageSearchArea {
	    width: 100%;
	    margin-left: auto;
	    margin-right: auto;
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
			<div class="page-nav">홈><a href="/myinfo">마이페이지</a>><a href="/myinfo/center/list">문의목록</a></div>
			<div class="page-title">나의 문의목록</div>
			
			<div class="content-prdqnabody">
				
				<!-- 여기서부터 본론 -->
				<div class="content-body">
					<!-- 검색을 위한 폼 -->
					<div class="pageSearchArea">
						
						<table class="content-prdqnaInfo">
							<!-- 표 제목 부분 -->
							<thead>
								<tr>
									<th>No.</th>
									<th>문의제목</th>
									<th>문의날짜</th>
									<th>답변상태</th>
								</tr>
							</thead>
							<!-- c:foreach로 대체 -->
							<tbody id="">			
				 				<c:choose>
									<c:when test="${empty myCenterQna}">
										<tr style="text-decoration: none;cursor: default;">
											<td colspan="4">등록된 문의 리스트가 존재하지 않습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="center" items="${myCenterQna}" varStatus="status">
											<tr onclick="location.href='${pageContext.request.contextPath}/myinfo/center/info?center_qna_id=${center.CENTER_QNA_ID}'">
												<td>${status.count}</td>
												<td>${center.CENTER_QNA_TITLE}</td>
												<td>
													<fmt:formatDate value="${center.CENTER_QNA_DATE}"/>
												</td>
												<c:if test="${empty center.CENTER_REPLY_ID}">
													<td>답변대기</td>
												</c:if>
												<c:if test="${not empty center.CENTER_REPLY_ID}">
													<td>답변완료</td>
												</c:if>
											</tr>						
										</c:forEach>
									</c:otherwise>
								</c:choose> 
								
							</tbody>
						</table>
					
						
						
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