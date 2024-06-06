<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminProductAdd.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>상품문의 상세보기</title>
<script type="text/javascript">
function backList() {
	history.back();
}
function deleteAsk(qna_group) {
	let del = confirm("문의 및 답변을 삭제하시겠습니까?");
	if(del){
		let f = document.createElement('form');
		
		let obj2 = document.createElement('input');
		obj2.setAttribute('type', 'hidden');
		obj2.setAttribute('name', 'qna_group');
		obj2.setAttribute('value', qna_group);
		
		f.appendChild(obj2);
		f.setAttribute('method', 'post');
		f.setAttribute('action', '/admin/ask/delete');
		document.body.appendChild(f);
		f.submit();
	}
}
function deleteAnswer(qna_group, qna_id) {
	let del = confirm("답변을 삭제하시겠습니까?");
	if(del){
		let f = document.createElement('form');
		
		let obj1 = document.createElement('input');
		obj1.setAttribute('type', 'hidden');
		obj1.setAttribute('name', 'qna_id');
		obj1.setAttribute('value', qna_id);
		
		let obj2 = document.createElement('input');
		obj2.setAttribute('type', 'hidden');
		obj2.setAttribute('name', 'qna_group');
		obj2.setAttribute('value', qna_group);
		
		let obj3 = document.createElement('input');
		obj3.setAttribute('type', 'hidden');
		obj3.setAttribute('name', 'qna_ask_id');
		obj3.setAttribute('value', $('#qna_ask_id').val());
		
		f.appendChild(obj1);
		f.appendChild(obj2);
		f.appendChild(obj3);
		f.setAttribute('method', 'post');
		f.setAttribute('action', '/admin/ask/answer/delete');
		document.body.appendChild(f);
		f.submit();
	}
}
function editAnswer(qna_id) {
	let f = document.createElement('form');
	alert($('#qna_ans_content').val());
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
	f.setAttribute('action', '/admin/ask/answer/edit');
	document.body.appendChild(f);
	f.submit();
}
</script>
<style type="text/css">
body {
	background-color: white !important;
}
@media all and (max-width:1339px) {
	#prdInfoBodyContainer {
		width: 70%; 
		margin: auto; 
	}
	.prdAddTable {
	    width: 100%;
	    margin: 0 auto;
	}
}
@media all and (max-width:600px) {
	#prdInfoBodyContainer {
		width: 100%; 
		margin: auto; 
	}
	.prdAddTable {
	    width: 100%;
	    margin: 0 auto;
	}
	.buttonArea {
	    width: 100%;
	    padding-top: 3px;
	    padding-left: 3px;
	    margin: 0 auto;
	    display: flex;
	    justify-content: space-between;
	}
}
@media all and (max-width:1339px) {
	#prdInfoBodyContainer {
		width: 80%; 
		margin: auto; 
	}
	.prdAddTable {
	    width: 100%;
	    margin: 0 auto;
	}
	.buttonArea {
	    width: 80%;
	    padding-top: 3px;
	    padding-left: 3px;
	    margin: 0 auto;
	    display: flex;
	    justify-content: space-between;
	}
}
</style>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div id="prdInfoBodyContainer">
		<div class="pageTitleArea">
			<h1>상품문의 상세보기</h1>
		</div>
		<hr>
		<div class="prdAddFormArea">
			
			<table class="prdAddTable">
			<c:forEach items="${prdAsk}" var="ask">
				<c:choose>
					<c:when test="${ask.q_or_a eq 0}">
						<input type="hidden" name="qna_id" id="qna_ask_id" value="${ask.qna_id}">
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
							<td><input type="text" id="qna_ask_content" value="${ask.qna_content}" disabled="disabled"></td>
						</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<th>답변</th>
						<td>
						<textarea rows="10" cols="50" name="qna_content" id="qna_ans_content" style="width:100%;">${ask.qna_content}</textarea>
						</td>
					</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				<tr>
					<td colspan="2"><input class="btnProductAdd" type="button" value="목록으로" onclick="backList()" style="width:100%;margin:0;"></td>
				</tr>	
				<tr>
					<td colspan="2"><input class="btnProductAdd" type="button" value="문의삭제" onclick="deleteAsk(${prdAsk[0].qna_group})" style="width:100%;margin:0;"></td>
				</tr>				
			</table>
			<div class="floatClearClass"></div>
			<c:if test="${fn:length(prdAsk) gt 1}">
			<div class="buttonArea" style="width:40%; margin:0 auto;">
				<input class="btnProductAdd" type="button" value="답변삭제"  onclick="deleteAnswer(${prdAsk[1].qna_group},${prdAsk[1].qna_id})">
				<input class="btnProductAdd" type="button" value="답변수정" onclick="editAnswer(${prdAsk[1].qna_id})">
			</div>
			</c:if>
			
		</div>
		
	</div>


</body>
</html>