<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객문의 답글 수정 페이지</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminProductAdd.css">
<script>
//답변 수정
function go_updateReply(QnaId) {
	var reply = $("#reply_content").val().trim();
	if (reply == "") {
		alert("답글내용을 입력하세요.");
		document.updateCenterReply.reply_content.focus();
	} else {
		$("#updateCenterReply").submit();
	}
}

//답변 삭제
function go_deleteReply(QnaId) {
	var real = confirm("답글을 정말로 삭제하시겠습니까?");
	if (real) {
		location.href = "${pageContext.request.contextPath}/admin/adminReplyDelete?center_qna_id=" + QnaId;
	}
}
</script>
<style type="text/css">
body {
	background-color: white !important;
}
.btn-center {
	float: left;
	text-align: center;
	padding: 8px 15px;
	background: white;
	border: 1px solid;
	border-color: rgb(229, 170, 163);
	color: rgb(229, 170, 163);
	border-radius: 2px;
	cursor: pointer;
}

.btn-delete {
  	float: left;
	text-align: center;
	padding: 8px 15px;
	background: white;
	border: 1px solid;
	border-color: rgb(231, 76, 60);
	color: rgb(231, 76, 60);
	border-radius: 2px;
	cursor: pointer;
}

.btn-center:hover, .btn-center:focus{
  border: rgb(229, 170, 163);
  background: rgb(229, 170, 163);
  color: white !important;
  transition: 0.7s;
}
.btn-delete:hover, .btn-delete:focus{
  border: rgb(231, 76, 60);
  background: rgb(231, 76, 60);
  color: white;
  transition: 0.7s;
}
</style>	
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
  	<div id="prdInfoBodyContainer">
		<div style="margin-top: 50px; font-size: x-large; cursor: default;">
			<strong>고객문의 수정</strong>
		</div>
		<hr>

		<div id="prdAddFormArea">
			<br><br>
			<form id="updateCenterReply" action="adminReplyUpdate" method="post">
				<input type="hidden" id="center_qna_id" name="center_qna_id" value="${getCenter.CENTER_QNA_ID}">
				<table>
					<tr>
						<th style="text-align: left; vertical-align: middle">NO.</th>
						<td>${getCenter.CENTER_QNA_ID }</td>	
					</tr>
					<tr>
						<th style="text-align: left; vertical-align: middle">문의제목</th>
						<td>${getCenter.CENTER_QNA_TITLE }</td>
					</tr>
					<tr>
						<th style="text-align:left; vertical-align: middle">ID</th>
						<td>${getCenter.USER_ID }</td>
					</tr>
					<tr>
						<th style="text-align:left; vertical-align: middle">닉네임</th>
						<td>${getCenter.USER_NICKNAME }</td>
					</tr>
					<tr>
						<th style="text-align: left; vertical-align: middle;">문의날짜</th>
						<td><fmt:formatDate value="${getCenter.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr><th style="text-align: left; vertical-align: middle;" colspan="2">문의내용</th></tr>
					<tr>
						<td colspan="2">
							<textarea name="content" rows="10" cols="40" disabled="disabled" style="resize: none;">${getCenter.CENTER_QNA_CONTENT }</textarea>
						</td>
				  	</tr>
				  	<tr><th style="text-align: left; vertical-align: middle;" colspan="2">답변내용</th></tr>
					<tr>
						<td colspan="2">
							<textarea id="reply_content" name="reply_content" rows="10" cols="40" style="resize: none;">${getCenter.REPLY_CONTENT}</textarea>
						</td>
					</tr>
					<tr>
						<th style="text-align: left; vertical-align: middle;">답변날짜</th>
						<td><fmt:formatDate value="${getCenter.CENTER_REPLY_DATE}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</table>
				<div style="float:right;">
					<button type="button" class="btn-center" onclick="go_updateReply(${getCenter.CENTER_QNA_ID});" style="margin-right: 10px;">답변 수정</button>
					<button type="button" class="btn-delete" onclick="go_deleteReply(${getCenter.CENTER_QNA_ID });">답변 삭제</button>
				</div>
				<div style="float:left;">
					<button type="button" class="btn-center" onclick="location.href='centerList'" style="margin-right: 10px;">목록으로</button>
				</div>	
			</form>
		
			
		</div>	
	</div>
</body>
</html>