<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 확인</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/small_logo.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/userDeleteForm.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function secession() {
	if($('#user_pw').val() == '') {
		alert("패스워드를 입력해주세요");
		$('#user_pw').focus();
		return;
	} 
	if($('#user_pw').val() !=$('#passwdCheck').val()) {
		alert("패스워드가 다릅니다.다시한번 입력해주세요");
		$('#user_pw').focus();
		return;
	} else {
		$.ajax({
			url: "${pageContext.request.contextPath}/myinfo/user/delete",
			type: "POST",
			data: $("#userDeleteForm").serialize(),
			success: function(data) {
				if(data == 1) {
					alert("회원탈퇴에 성공하셨습니다.");
					window.close();
					window.opener.location.href="${pageContext.request.contextPath}/";
				} else {
					alert("회원탈퇴에 실패하였습니다.");
					window.close();
					window.opener.location.href="${pageContext.request.contextPath}/myinfo/confirm";					
				}
				
			},
			error: function() {
				alert("회원탈퇴에 실패하였습니다.");
				window.close();
				window.opener.location.href="${pageContext.request.contextPath}/myinfo/confirm";
			}
		});
	}
}
</script>
</head>
<body>
	<div class="delete-content">
	<span style="color:rgb(231, 76, 60);"><b>회원 탈퇴를 하시겠습니까?</b></span><br>
	<span>회원탈퇴를 하시기 위해 다시한번 비밀번호를 입력하여 주십시오.</span>
	<form id="userDeleteForm">
		<table class="content-userInfo">
			<tr>
			 	<th>아이디</th>
			 	<td colspan="2"><input type="text" name="user_id" value="${myid}" readonly></td>
			</tr>
			<tr>
			 	<th>비밀번호</th>
			 	<td colspan="2"><input type="text" id="user_pw" name="user_pw"></td>
			</tr>
			<tr>
			 	<th>비밀번호 확인</th>
			 	<td colspan="2"><input type="password" name="passwdCheck" id="passwdCheck"></td>
			</tr>
			<tr>
				<td colspan="3"><input class="userinfo-deletebutton" type="button" value="회원 탈퇴하기" onclick="secession()"></td>
			</tr>
		</table>
	</form>
	</div>

</body>
</html>