<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 문의 하나 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminProductAdd.css">
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
<script>
//답변등록
function go_insertReply(QnaId) {
		var reply = $("#center_reply_content").val().trim();
		if (reply == "") {
			alert("답글내용을 입력하세요.");
			document.insertCenterReply.center_reply_content.focus();
		} else {
			$("#insertCenterReply").submit();
		}
	}

//답변수정
function go_updateReply(QnaId) {
		location.href = "${pageContext.request.contextPath}/admin/adminReplyUpdateGo?center_qna_id=" + QnaId;
	}

//답변삭제
function go_deleteReply(QnaId, replyId) {
	var real = confirm("답글을 정말로 삭제하시겠습니까?");
	if(real){
		location.href="${pageContext.request.contextPath}/admin/adminReplyDelete?center_qna_id="+ QnaId + "&center_reply_id=" + replyId;
	}
}

//문의 삭제
function go_deleteCenter(QnaId, ReplyId) {
	if (ReplyId != undefined) {
		var con = confirm("해당 문의에 대한 답글이 존재합니다. 문의글을 삭제하면 답글도 함께 삭제됩니다. 그래도 삭제하시겠습니까?");
		if (con) {
			location.href = "${pageContext.request.contextPath }/admin/adminCenterdelete?center_qna_id=" + QnaId;
		}
	} else {
		var real = confirm("문의글을 정말로 삭제하시겠습니까?");
		if (real) {
			location.href = "${pageContext.request.contextPath }/admin/adminCenterdelete?center_qna_id=" + QnaId;
		}
	}
}
</script>
<script src="https://kit.fontawesome.com/09fb84a732.js" crossorigin="anonymous"></script>
</head>
<body>
	<header>
      <jsp:include page="../common/header.jsp"></jsp:include>
   </header>
   
   <div id="prdInfoBodyContainer">
		<div style="margin-top: 50px; font-size: x-large; cursor: default;">
			<strong>고객문의 조회</strong>
		</div>
		<hr>
   <div id="prdAddFormArea">
   <form id="insertCenterReply" action="/admin/adminReplyInsert"  method="post" name="insertCenterReply">
   	<input type="hidden" id="center_qna_id" name="center_qna_id" value="${getCenter.CENTER_QNA_ID}">
		<table class="prdAddTable">
			<tr>
				<th style="text-align: left; vertical-align: middle;">No.</th>
				<td>${getCenter.CENTER_QNA_ID}</td>		
			</tr>
			<tr>
				<th style="text-align: left; vertical-align: middle;">문의제목</th>
				<td>${getCenter.CENTER_QNA_TITLE}</td>	
			</tr>
			<tr>
				<th style="text-align: left; vertical-align: middle;">ID</th>
				<td>${getCenter.USER_ID}</td>	
			</tr>
			<tr>
				<th style="text-align: left; vertical-align: middle;">닉네임</th>
				<td>${getCenter.USER_NICKNAME}</td>	
			</tr>
			<tr>
				<th style="text-align: left; vertical-align: middle;">문의날짜</th>
				<td><fmt:formatDate value="${getCenter.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr><th style="text-align: left; vertical-align: middle;" colspan="2">문의 내용</th></tr>
			<tr>
				
				<td colspan="2">
					<textarea name="content" rows="10" cols="40" disabled="disabled">${getCenter.CENTER_QNA_CONTENT }</textarea>
				</td>
			</tr>	
			<c:choose>			
			<c:when test="${empty getCenter.REPLY_CONTENT}">
				<tr><th style="text-align: left; vertical-align: middle;" colspan="2">답변내용</th></tr>
				<tr>
					<td colspan="2"><textarea name="reply_content" rows="10" cols="40" id="center_reply_content"></textarea></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr><th style="text-align: left; vertical-align: middle;"colspan="2">답변내용</th></tr>
				<tr>
					<td colspan="2"><textarea name="content" rows="10" cols="40" disabled="disabled">${getCenter.REPLY_CONTENT}</textarea></td>
				</tr>					
				<tr>
					<th style="text-align: left; vertical-align: middle;">답변날짜</th>
					<td><fmt:formatDate value="${getCenter.CENTER_REPLY_DATE }" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:otherwise>				
			</c:choose>
		</table>  
		<div style="float: right;">
		<c:choose>
			<c:when test="${empty getCenter.REPLY_CONTENT}">
				<button type="button" class="btn-center" style="margin-right: 10px;" onclick="go_insertReply(${getCenter.CENTER_QNA_ID });">답변 등록</button>
				<button type="button" class="btn-delete" onclick="go_deleteCenter(${getCenter.CENTER_QNA_ID },${getCenter.CENTER_REPLY_ID });">문의 삭제</button>
			</c:when>
					<c:otherwise>
					<button type="button" class="btn-center" style="margin-right: 10px;" onclick="go_updateReply(${getCenter.CENTER_QNA_ID });">답변 수정</button>
					<button type="button" class="btn-delete" style="margin-right: 10px;" onclick="go_deleteReply(${getCenter.CENTER_QNA_ID },${getCenter.CENTER_REPLY_ID});">답변 삭제</button>
					<button type="button" class="btn-delete" onclick="go_deleteCenter(${getCenter.CENTER_QNA_ID },${getCenter.CENTER_REPLY_ID});">문의 삭제</button>
				</c:otherwise>
		</c:choose>
		</div>

   </form>
   
   		<div style="float:left;">
			<button type="button" class="btn-center" onclick="location.href='centerList'">목록으로</button>
		</div>
		</div>
	<br><br><br><br><br><br><br><br>
</body>
</html>