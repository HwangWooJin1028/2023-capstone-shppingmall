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
<title>회원정보 보기</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/small_logo.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myInfoUserInfo.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
})
function findAddr() {
	/* daum api를 써서 주소를 검색하고 그 주소를 document의 input text에... */
	new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         document.getElementById('member-post').value = data.zonecode;
         document.getElementById("member-addr").value = addr;
            
        }
    }).open();
}
function deleteUser(user_id) {
	let cf = confirm("회원 탈퇴를 하시겠습니까?");
	if(cf) {
		window.open("/myinfo/user/delete?user_id="+user_id,"pop1",
		"width=600, height=700 top=100, left=150");
	}
}
function editUser() {
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
			url: "${pageContext.request.contextPath}/myinfo/user",
			type: "POST",
			data: $("#userUpdateForm").serialize(),
			success: function(data) {
				alert("회원수정에 성공하셨습니다.");
				location.href="${pageContext.request.contextPath}/myinfo/confirm";
			},
			error: function() {
				alert("회원수정에 실패하였습니다.");
				location.href="${pageContext.request.contextPath}/myinfo/confirm";
			}
		});
	}
}
</script>
<style type="text/css">
.header {
    background-color: #fff !important;
    border-bottom: 0px !important; 
}
</style>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	<!-- body -->
	<!-- body -->
	<div class="body">
		<div class="myinfo-body" style="padding-top: 100px;">
			<!-- 제목 부분 -->
			<div class="page-nav">홈><a href="/myinfo">마이페이지</a>><a href="/myinfo/confirm">회원정보수정</a></div>
			<div class="page-title">회원정보수정</div>
			
			<div class="content-userbody">
				
				<!-- 여기서부터 본론 -->
				<div class="content-body">
					<form id="userUpdateForm" action="/myinfo/user" method="post">
						<div class="content-userarea">
							<div class="userinfo-area">
								<h3>회원</h3>
								<table class="content-userInfo">
									<tr>
									 	<th>아이디</th>
									 	<td colspan="2"><input type="text" name="user_id" value="${user.user_id}" readonly></td>
									</tr>
									<tr>
									 	<th>비밀번호</th>
									 	<td colspan="2"><input type="text" id="user_pw" name="user_pw" value="${user.user_pw}"></td>
									</tr>
									<tr>
									 	<th>비밀번호 확인</th>
									 	<td colspan="2"><input type="password" name="passwdCheck" id="passwdCheck"></td>
									</tr>
									<tr>
									 	<th>이름</th>
									 	<td colspan="2"><input type="text" name="user_name" value="${user.user_name}" readonly></td>
									</tr>
									<tr>
									 	<th>닉네임</th>
									 	<td colspan="2"><input type="text" name="user_nickname" value="${user.user_nickname}"></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td colspan="2"><input type="email" name="user_email" value="${user.user_email}" required="required"></td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td colspan="2" class="element">
											<select name="user_phone1" class="item-phone phone-select" style="width:30%;">
													<option>010</option>
													<option>02</option>
													<option>031</option>
													<option>070</option>
											</select><span><b> - </b></span>
											<input type="text" class="item-phone" id="user_phone2" name="user_phone2" size="5" required style="width:30%;" value="${fn:substring(user.user_phone,3,7)}">
											<span><b> - </b></span>
											<input type="text" class="item-phone" id="user_phone3" name="user_phone3" size="5" required style="width:30%;" value="${fn:substring(user.user_phone,7,11)}">
										</td>
									</tr>
								</table>
						
							</div>
							<div class="deli-area">
								<h3>배송지 주소</h3>
								<table class="content-userInfo">
								
									<tr>
										<th>우편번호</th>	
										<td><input type="text" id="member-post" placeholder="우편번호을 입력하세요.." name="user_zipcode" required="required" value="${user.user_zipcode}"></td>
										<td><input class="deli-button" type="button" value="주소찾기" onclick="findAddr()" style="width:100%;"></td>
									</tr>
									<tr>
										<th>도로명주소</th>	
										<td colspan="2"><input type="text" id="member-addr" placeholder="도로명 주소를 입력하세요.." name="user_addr" required="required" value="${user.user_addr}"></td>
									</tr>
									<tr>
										<th>상세 주소</th>	
										<td colspan="2"><input type="text" id="member-addr-d" placeholder="상세주소를 입력하세요.." name="user_addr_d" required="required" value="${user.user_addr_d}"></td>
									</tr>
									<tr>
										<td colspan="3"><input class="userinfo-deletebutton" type="button" value="회원 탈퇴하기" onclick="deleteUser('${user.user_id}')"></td>
									</tr>
									<tr>
										<td colspan="3"><input class="userinfo-button" type="button" value="회원 정보 수정하기" onclick="editUser()"></td>
									</tr>
								</table>
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