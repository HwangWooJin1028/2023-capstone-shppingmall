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
<title>상품문의답변 작성</title>
<script type="text/javascript">
function insertAnswer() {
	var content = $("#prdAskInsert").find("textarea").val().trim();
	if(content.length==0) {
		alert("답변 내용이 없습니다.")
		$("#prdAskInsert").find("textarea").focus();
	} else {
		$("#prdAskInsert").submit();
	
	}
}

function backList() {
	history.back();
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
	<div id="prdInfoBodyContainer">
		<div class="pageTitleArea">
			<h1>상품문의 답변</h1>
		</div>
		<hr>
		<div class="prdAddFormArea">
			<form id="prdAskInsert" action="/admin/product/ask/answer" method="post" class="prdAddForm">
			<input type="hidden" name="qna_id" value="${prdAsk.qna_id}">
				<table class="prdAddTable">
					<tr>
						<th>상품번호</th>
						<td><input name="product_id" type="text" value="${prdAsk.product_id}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><input name="product_name" type="text" value="${prdAsk.product_name}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" value="${prdAsk.user_id}" disabled="disabled"></td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td><input type="text" value="${prdAsk.product_qna_date}" disabled="disabled"></td>
					</tr>
					<tr>
						<th>질문내용</th>
						<td><input type="text" value="${prdAsk.qna_content}" disabled="disabled"></td>
					</tr>
					<tr>
						<th>답변</th>
						<td><textarea rows="10" cols="50" name="qna_content" style="width:100%;"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input class="btnProductAdd" type="button" value="목록으로" onclick="backList()" style="width:100%;margin:0;"></td>
					</tr>					
				</table>
				<div class="floatClearClass"></div>
				<div class="buttonArea" style="width:40%; margin:0 auto;">
					<input class="btnProductAdd" type="reset" value="초기화">
					<input class="btnProductAdd" type="button" value="답변작성" onclick="insertAnswer()">
				</div>
				
				
			</form>
		</div>
		
	</div>

</body>
</html>