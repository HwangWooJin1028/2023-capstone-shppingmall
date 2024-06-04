<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myinfoPrdQnaInfo.css?after">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script>

function go_delete(centerUserId,centerUserPw,getCenterUserId,getCenterQnaId,getCenterReplyId) {
	if(centerUserId == null) {
		var con = confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?");
		if(con) {
			location.href = "${pageContext.request.contextPath}/login";
		}
	} else {
		if(centerUserId != getCenterUserId) {
			alert("작성자가 아니므로 삭제할 수 없습니다.");
		} else {
			var pwdCheck = prompt("비밀번호 확인이 필요합니다. 비밀번호를 입력해 주세요.");
			if (pwdCheck != centerUserPw) {
				alert("비밀번호가 틀렸습니다.");
			} else {
				if (getCenterReplyId != undefined) {
					var con = confirm("해당 문의에 대한 답글이 존재합니다. 문의글을 삭제하면 답글도 함께 삭제됩니다. 그래도 삭제하시겠습니까?");
					if (con) {
						location.href = "${pageContext.request.contextPath}/center/info/delete?center_qna_id=" + getCenterQnaId;
					}
				} else {
					var real = confirm("정말로 삭제하시겠습니까?");
					if (real) {
						location.href = "${pageContext.request.contextPath}/center/info/delete?center_qna_id=" + getCenterQnaId;
					}
				}
			} 
		}
	}
}  

//문의수정 버튼을 누르면 활성화되는 함
function go_update(centerUserId,centerUserPw,getCenterUserId,getCenterQnaId,getCenterReplyId) {
	if(centerUserId == null) {
		var con = confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?");
		if(con) {
			location.href = "${pageContext.request.contextPath}/login";
		}
	} else {
		if(centerUserId != getCenterUserId) {
			alert("작성자가 아니므로 수정할 수 없습니다.");
			console.log("getCenterReplyId:", getCenterReplyId);

		
		} else {
			if (getCenterReplyId != undefined ||getCenterReplyId !=null) {
				alert("답변완료 상태인 문의글은 수정이 불가능합니다.");
			} else {
				var pwdCheck = prompt("비밀번호 확인이 필요합니다. 비밀번호를 입력해 주세요.");
				if (pwdCheck != centerUserPw) {
					alert("비밀번호가 틀렸습니다.");
				} else {
					location.href = "${pageContext.request.contextPath}/center/info/update?center_qna_id=" + getCenterQnaId;
				}
			}
		}
	}
}
</script>

<style type="text/css">


/*button style*/
.moni {
  width: 100%;
  float: left;
  padding: 10px 10px;
  border: solid rgb(207,207,207);
  border-width: 1px;
  background: transparent;
  cursor: pointer;
  margin: auto !important;
}
.moni:hover, .moni:focus{
  border: solid rgb(229, 170, 163);
  background: rgb(229, 170, 163);
  color: white;
  transition: 0.7s;
}

.reset {
  width: 100%;
  float: left;
  padding: 10px 10px;
  border: 1px solid rgb(231, 76, 60) !important;
  border-width: 1px;
  background: transparent;
  cursor: pointer;
  margin: auto !important;
}
.reset:hover, .reset:focus{
  background: rgb(231, 76, 60) !important;
  color: white;
  transition: 0.7s;
}
@media all and (max-width:931px) {
	.myinfo-body { 
		width: 100%; 
		margin: auto; 
	}
}
</style>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	<div id="prdInfoBodyContainer">
		<div class="myinfo-body" style="padding-top: 100px;">
			<!-- 제목 부분 -->
			<div class="page-nav">홈><a href="/center/list">고객센터</a>><a href="/center/info">문의상세보기</a></div>
			<div class="page-title">문의 상세보기</div>
			
			<div class="content-prdqnainfobody">
				<!-- 여기서부터 본론 -->
				<div class="content-body">
				<form id="insertCenterQna" action="/center/info/insert" method="post">
					<input type="hidden" id="user_id" name="user_id" value="${user_id}">
					<table class="content-prdqna" style="line-height: 2em;">
						<tr>
							<th class="center">NO.</th>
							<td><span style="padding-left: 10px;">${getCenter.CENTER_QNA_ID}</span></td>
						</tr>
						<tr>
							<th class="center">문의제목</th>
							<td><span style="padding-left: 10px;">${getCenter.CENTER_QNA_TITLE}</span></td>
						</tr>
						<tr>
							<th>ID</th>
							<td><span style="padding-left: 10px;">${getCenter.USER_ID}</span></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><span style="padding-left: 10px;">${getCenter.USER_NICKNAME}</span></td>
						</tr>
						<tr>
							<th class="center">문의날짜</th>
							<td><span style="padding-left: 10px;"><fmt:formatDate value="${getCenter.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/></span></td>
						</tr>
						<tr><th colspan="2">문의내용</th></tr>
						<tr>
							
							<td colspan="2">
								<textarea name="content" rows="10" cols="40" disabled="disabled">${getCenter.CENTER_QNA_CONTENT}</textarea>			
							</td>
						</tr>
						<c:choose>
							<c:when test="${empty getCenter.REPLY_CONTENT}">
								<tr>
									<th colspan="2" class="2" style="text-align: center;">등록된 답변이 없습니다.</th>				
								</tr>
							</c:when>
							<c:otherwise>
								<tr><th>답변내용</th></tr>
								<tr>
									<td colspan="2">
										<textarea name="content" rows="10" cols="40" disabled="disabled">${getCenter.REPLY_CONTENT}</textarea>
									</td>
								</tr>
								<tr>
									<th>답변날짜</th>
									<td><fmt:formatDate value="${getCenter.CENTER_REPLY_DATE}" pattern="yyy-MM-dd"/></td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<td colspan="2"><button type="button" class="moni" onclick="location.href='/center/list'" style="width:100%;margin:0;">목록으로</button></td>
						</tr>
						<tr>
							<td colspan="2"><button type="button" class="moni" style="width:100%;margin:0;" onclick="go_update('${centerUser.user_id}','${centerUser.user_pw}','${getCenter.USER_ID}','${getCenter.CENTER_QNA_ID }',${getCenter.CENTER_REPLY_ID});">문의 수정</button></td>
						</tr>	
						<tr>
							<td colspan="2"><button type="reset" class="reset" onclick="go_delete('${centerUser.user_id}','${centerUser.user_pw}','${getCenter.USER_ID}','${getCenter.CENTER_QNA_ID }','${getCenter.CENTER_REPLY_ID}');">문의 삭제</button></td>
						</tr>
					</table>
					</form>
					<div class="floatClearClass"></div>
				
				</div>
		
			</div>
		</div>
	</div>
	
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>