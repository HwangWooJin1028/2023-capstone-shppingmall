<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터(고객 문의 목록)</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myinfoPrdQnaList.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script>
	//문의하기 버튼을 누르면 활성화 go_qna()함수
	function go_qna(userId){
		if(userId ==''){
			var con=confirm("로그인후 이용가능합니다. 로그인 페이지로 이동하시겠습니까");
			location.href="${pageContext.request.contextPath}/login";
		}else{
			location.href="${pageContext.request.contextPath}/center/info/insert";
		}
	}
//문의글의 제목을 누르면 글의 내용과 답변이 한눈에 보이는 상세페이지로 이동하는함수	
	function go_getCenter(cetner_qna_id)
	{
		location.href="${pageContext.request.contextPath}/center/info?center_qna_id="+cetner_qna_id; 		
	}  
</script>

</head>

<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	
	<!-- body -->
	<div class="body">
		<div class="myinfo-body" style="padding-top: 100px;">
			<!-- 제목 부분 -->
			<div class="page-nav">홈><a href="/center">고객센터</a></div>
			<div class="page-title">고객 센터</div>
			
			<div class="content-prdqnabody">
				
				<!-- 여기서부터 본론 -->
				<div class="content-body">
					<!-- 검색을 위한 폼 -->
					<div class="pageSearchArea">
						<form action="${pageContext.request.contextPath}/center/list" method="get">
							<table class="searchTableStyle">
								<tr>
									<td>
										<select name="searchCondition" class="searchSelect">
											<c:forEach items="${contitionMap}" var="option">
												<option value="${option.value}">${option.key}</option> 
											</c:forEach>
										</select>
											<!-- 실제 검색어 -->
										<input id="textSearch"  type="text" name="searchKeyword">
											<input id="btnSearch" type="submit" value="검색">
											${option.value}
									</td>
								</tr>
							</table>
							<br>	
						</form>
					</div>
					
					<table class="content-prdqnaInfo">
						<!-- 표 제목 부분 -->
						<thead>
							<tr>
								<th>NO.</th>
								<th>문의제목</th>
								<th>닉네임</th>
								<th>문의날짜</th>
								<th>답변상태</th>
							</tr>
						</thead>
						<!-- c:foreach로 대체 -->
						<tbody>			
			 				<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="5">등록된 고객문의가 존재하지 않습니다</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="center" varStatus="status">
										<tr onclick="go_getCenter(${center.CENTER_QNA_ID});">
											<td>${center.CENTER_QNA_ID}</td> 
											<td>${center.CENTER_QNA_TITLE}</td>
											<td>${center.USER_NICKNAME}</td>
											<td><fmt:formatDate value="${center.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/></td>
											<c:choose>
												<c:when test="${empty center.CENTER_REPLY_ID}">
													<td>답변대기</td>
												</c:when>
												<c:otherwise>
													<td><strong>답변완료</strong>
												</c:otherwise>
											</c:choose>
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
									<a href="${pageContext.request.contextPath}/center/list?nowPage=${paging.nowPageNum-1}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">
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
										<li><a href="${pageContext.request.contextPath}/center/list?nowPage=${p}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${p}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.nowPageNum < paging.lastPageNum}">
								<li>
									<a class="pagingItem" href="${pageContext.request.contextPath}/center/list?nowPage=${paging.nowPageNum+1}&cntPageItemNum=${cntPageItemNum}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">
									<i class="fa-solid fa-caret-right"></i>
									</a>
								</li>
							</c:if>
						</ul>
					</div>
					
					<div style="float: right;">
						<button type="button" class="center-btn" onclick="go_qna('${user.user_id}');">문의하기</button>
					</div>
							
			</div>
			
		</div>
	</div>

	<footer>
      <jsp:include page="../common/footer.jsp"></jsp:include>
   </footer>
</body>
</html>