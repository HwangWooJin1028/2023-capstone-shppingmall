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
<title>나의 상품 문의 보기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myinfoPrdQnaInfo.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function backList() {
	history.back();
}
function deleteAsk(qna_group) {
	let del = confirm("문의를 삭제하시겠습니까?");
	if(del){
		let f = document.createElement('form');
		
		let obj2 = document.createElement('input');
		obj2.setAttribute('type', 'hidden');
		obj2.setAttribute('name', 'qna_group');
		obj2.setAttribute('value', qna_group);
		
		f.appendChild(obj2);
		f.setAttribute('method', 'post');
		f.setAttribute('action', '/myinfo/prdqna/info/delete');
		document.body.appendChild(f);
		f.submit();
	}
}
function editAnswer(qna_id) {
	let f = document.createElement('form');
	let obj1 = document.createElement('input');
	obj1.setAttribute('type', 'hidden');
	obj1.setAttribute('name', 'qna_content');
	obj1.setAttribute('value', $('#qna_ans_content').val());
	
	let obj3 = document.createElement('input');
	obj3.setAttribute('type', 'hidden');
	obj3.setAttribute('name', 'qna_id');
	obj3.setAttribute('value', qna_id);
	
	f.appendChild(obj1);
	f.appendChild(obj3);
	f.setAttribute('method', 'post');
	f.setAttribute('action', '/myinfo/prdqna/info/edit');
	document.body.appendChild(f);
	f.submit();
}
</script>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div id="prdInfoBodyContainer">
		<div class="myinfo-body" style="padding-top: 100px;">
			<!-- 제목 부분 -->
			<div class="page-nav">홈><a href="/myinfo">마이페이지</a>><a href="/myinfo/prdqna/list">상품문의목록</a></div>
			<div class="page-title">상품문의목록</div>
			
			<div class="content-prdqnainfobody">
				<!-- 여기서부터 본론 -->
				<div class="content-body">
			
					<table class="content-prdqna">
					<c:forEach items="${prdAsk}" var="ask">
						<c:choose>
							<c:when test="${ask.q_or_a eq 0}">
								<input type="hidden" name="qna_id" value="${ask.qna_id}">
								<tr>
									<th>상품번호</th>
									<td><input name="product_id" type="text" value="${ask.product_id}" readonly="readonly"></td>
								</tr>
								<tr>
									<th>상품명</th>
									<td><input name="product_name" type="text" value="${ask.product_name}" readonly="readonly"></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td><input type="text" value="${ask.user_id}" disabled="disabled"></td>
								</tr>
								<tr>
									<th>작성날짜</th>
									<td><input type="text" value="${ask.product_qna_date}" disabled="disabled"></td>
								</tr>
								<tr>
									<th>질문내용</th>
									<td>
									<textarea rows="10" cols="50" name="qna_content" id="qna_ans_content" style="width:100%;">${ask.qna_content}</textarea>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<th>답변</th>
								<td>
								<textarea rows="10" cols="50" style="width:100%;" disabled="disabled">${ask.qna_content}</textarea>
								</td>
							</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<tr>
						<td colspan="2"><input class="btnProductAdd" type="button" value="목록으로" onclick="backList()" style="width:100%;margin:0;"></td>
					</tr>
					<c:choose>
						<c:when test="${fn:length(prdAsk) gt 1}">
							<tr>
								<td colspan="2"><input class="btnProductAdd" type="button" value="문의삭제" onclick="deleteAsk(${prdAsk[0].qna_group})" style="width:100%;margin:0;"></td>
							</tr>	
						</c:when>
						<c:otherwise>
						<tr>
							<td colspan="2"><input class="btnProductAdd" type="button" value="문의삭제" onclick="deleteAsk(${prdAsk[0].qna_group})" style="width:100%;margin:0;"></td>
						</tr>	
						<tr>
							<td colspan="2"><input class="btnProductAdd" type="button" value="문의수정" onclick="editAnswer(${prdAsk[0].qna_id})"></td>
						</tr>
						</c:otherwise>
					</c:choose>	
					
					</table>
					<div class="floatClearClass"></div>
				
				</div>
		
			</div>
		</div>
	</div>

</body>
</html>