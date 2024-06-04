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
function deleteAsk(user_id, center_qna_id) {
	if(!user_id) {
		alert("로그인 이후에 문의를 삭제하는 것이 가능합니다");
		location.href="${pageContext.request.contextPath }/login";
	} else {
		let del = confirm("문의를 삭제하시겠습니까?");
		if(del){
			let f = document.createElement('form');
			
			let obj2 = document.createElement('input');
			obj2.setAttribute('type', 'hidden');
			obj2.setAttribute('name', 'center_qna_id');
			obj2.setAttribute('value', center_qna_id);
			
			f.appendChild(obj2);
			f.setAttribute('method', 'post');
			f.setAttribute('action', '/myinfo/center/delete');
			document.body.appendChild(f);
			f.submit();
		}
	}
}
function editAnswer(user_id, center_qna_id) {
	if(!user_id) {
		alert("로그인 이후에 문의를 수정하는 것이 가능합니다");
		location.href="${pageContext.request.contextPath }/login";
	} else {
		let del = confirm("문의를 수정하시겠습니까?");
		if(del) {
			$("#qnaform").submit();
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

<div id="prdInfoBodyContainer">
		<div class="myinfo-body" style="padding-top: 100px;">
			<!-- 제목 부분 -->
			<div class="page-nav">홈><a href="/myinfo/center/list">나의 문의목록</a>><a href="/myinfo/center/info">나의 문의상세보기</a></div>
			<div class="page-title">나의 문의 상세보기</div>
			
			<div class="content-prdqnainfobody">
				<!-- 여기서부터 본론 -->
				<div class="content-body">
					<!-- 검색을 위한 폼 -->
					<div class="pageSearchArea">
					<h3>나의 문의</h3>
					<form id="qnaform" action="/myinfo/center/info" method="post">
						<div class="flex-row">
							
							<div>
								<table class="content-prdqna">
									<input type="hidden" name="center_qna_id" value="${myCenter.CENTER_QNA_ID}">
									<tr>
										<th>No.</th>
										<td><input name="center_qna_id" type="text" value="${myCenter.CENTER_QNA_ID}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>문의제목</th>
										<td><input id="center_qna_title" name="center_qna_title" type="text" value="${myCenter.CENTER_QNA_TITLE}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>ID</th>
										<td><input name="user_id" type="text" value="${myCenter.USER_ID}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>닉네임</th>
										<td><input name="user_nickname" type="text" value="${myCenter.USER_NICKNAME}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>문의날짜</th>
										<td><input type="text" value="<fmt:formatDate value="${myCenter.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/>" disabled="disabled"></td>
									</tr>
									<tr><th>문의내용</th></tr>
									<tr>
										<c:choose>
											<c:when test="${empty myCenter.REPLY_CONTENT}">
												<td colspan="2">
													<textarea rows="10" cols="50" name="center_qna_content" id="center_qua_content" style="width:100%; resize: none;">${myCenter.CENTER_QNA_CONTENT}</textarea>
												</td>
											</c:when>
											<c:otherwise>
												<td colspan="2">
													<textarea rows="10" cols="50" name="center_qna_content" id="center_qua_content" style="width:100%; resize: none;" disabled="disabled">${myCenter.CENTER_QNA_CONTENT}</textarea>
												</td>
											</c:otherwise>
										</c:choose>	
										
									</tr>
									
									<c:choose>
										<c:when test="${not empty myCenter.REPLY_CONTENT}">
										<tr>
											<th><span  style="margin-top: 10px;">답변 날짜</span></th>
											<td><fmt:formatDate value="${myCenter.CENTER_REPLY_DATE}" pattern="yyyy-MM-dd"/></td>
										</tr>
										<tr><th>답변 내용</th></tr>
										<tr>
											<td colspan="2"><textarea rows="10" cols="50" style="width:100%;" disabled="disabled">${myCenter.REPLY_CONTENT}</textarea></td>
										</tr>
										</c:when>
									</c:choose>
									
									<c:choose>
								<c:when test="${not empty myCenter.REPLY_CONTENT}">
									<tr>
										<td colspan="2"><input type="button" class="moni" value="목록으로" onclick="backList()" style="width:100%;margin:0;"></td>
									</tr>
									<tr>
										<td colspan="2"><input type="button" class="reset" value="문의삭제" onclick="deleteAsk('${centerUser.user_id}')" style="width:100%;margin-top:10px;"></td>
									</tr>	
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2"><input  type="button" value="목록으로" onclick="backList()"class="moni" style="width:100%;margin-top:10px;"></td>
									</tr>
									<tr>
										<td colspan="2"><input type="button" value="문의삭제" class="reset" onclick="deleteAsk('${centerUser.user_id}',${myCenter.CENTER_QNA_ID})" style="width:100%;margin:0;"></td>
									</tr>	
									<tr>
										<td colspan="2"><input type="button" value="문의수정" class="moni" onclick="editAnswer('${centerUser.user_id}',${myCenter.CENTER_QNA_ID})" style="width:100%;margin:0;"></td>
									</tr>
								</c:otherwise>
							</c:choose>	
								</table>
		
								<div class="floatClearClass"></div>
							</div>
							
							
						</div>
						
						
					</form>
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