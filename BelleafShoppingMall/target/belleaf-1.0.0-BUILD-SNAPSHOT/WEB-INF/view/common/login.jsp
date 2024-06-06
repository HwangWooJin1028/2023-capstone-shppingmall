<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var msg = "${msg}"; // 서버 사이드에서 전달한 msg 값을 JavaScript 변수에 할당
if(msg.trim() != "") {
	alert(msg); // 또는 다른 방식으로 메시지를 표시
}
function userLogin() {
	var loginForm = $('#userLoginForm');
	var length = $('input').length;
	if($.trim($('#user_id').val())=="") {
		alert($('#user_id').attr('title') + "을 입력하세요" );
		$('#user_id').focus();
		return;
	}
	if($.trim($('#user_pw').val())=="") {
		alert($('#user_pw').attr('title') + "을 입력하세요" );
		$('#user_pw').focus();
		return;
	}
	loginForm.submit();
}
</script>
</head>
<body>
	<header>
      <jsp:include page="../common/header.jsp"></jsp:include>
   </header>
	<div id="userAddBodyContainer" class="userAddBodyContainer">
		<br/>
		<!-- 회원가입제목 -->
		<div class="pageTitleArea">
			<p style="font-size: 48px;"><b>LOGIN</b></p>
		</div>
		<form class="userAddForm" id="userLoginForm" name="userLoginForm" action="/login" method="post">
			<table class="userAddTable">
				<!-- 정보입력부분 -->
				<tr>
					<td colspan="2" >
						<input type="text" class="userid" id="user_id" name="user_id" placeholder="아이디를 입력하세요" required title="아이디" style="margin-bottom: 10px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" ><input id="user_pw"
						name="user_pw" type="password" placeholder="비밀번호를 입력하세요" maxlength="20" required title="비밀번호"></td>
				</tr>
			</table>
			<br>
			<div class="btnArea">
				<input class="userFormbtn" type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/'" style="margin-bottom: 10px;">
				<input class="userFormbtn" type="button" id="login" value="로그인" onclick="userLogin()">
			</div>
			<div style="text-align: center;padding-top: 40px;">
				<!-- a onclick="hi -->
				<a class="idpw text-dark" href="findIdview">아이디 찾기</a><span class="text-black-50">&nbsp;<small>|</small></span>
				<a class="idpw text-dark" href="findpwview">비밀번호찾기</a>
				<br>
				<div class="">
					<p style="cursor:default;">아직 회원이 아니라면? <a class="idpw text-dark" href="join" style="color: rgb(229, 170, 163);">회원가입</a></p>
					
				</div>
				
			</div>
		</form>
	</div>
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>