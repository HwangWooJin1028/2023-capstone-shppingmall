<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/joinForm.css">

<!-- 여기까지 헤더링크 -->
</head>
<body>
	<header>
      <jsp:include page="../common/header.jsp"></jsp:include>
   </header>
	<div id="userAddBodyContainer" class="userAddBodyContainer" style="padding-top: 100px;">
		<br/>
		<!-- 회원가입제목 -->
		<div class="pageTitleArea" style="padding-bottom: 30px;">
			<strong style="font-weight: 340; font-size:xx-large; margin: 0 auto; text-align: center; color: black;" class="noto-sans-kr-category">회원가입</strong>
		</div>
		<hr>
		<form class="userAddForm" id="signFrm" name="signFrm" action="/joinAction" method="post">
			<table class="userAddTable">
				<!-- 정보입력부분 -->
				<tr>
					<th>아이디 <b style="color: rgb(229, 170, 163);">*</b></th>
					<td>
						<input type="text" class="userid" id="user_id" name="user_id" placeholder="아이디" required>
					</td>
					<td>
					<input class="idcheckBtn" type="button" id="check"	value="중복체크"></td>
				</tr>
				<tr>
					<td></td>
					<td id="idCheck" class="ajax"></td>
				</tr>
				<tr>
					<th>패스워드<b style="color: rgb(229, 170, 163);">*</b></th>
					<td colspan="2" ><input id="user_pw"
						name="user_pw" type="password" placeholder="비밀번호" maxlength="20" required></td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td colspan="2"><input id="passwdCheck"
						name="passwdCheck" type="password" placeholder="비밀번호 확인"
						maxlength="20" required></td>
				</tr>
				<tr>
					<th>이름<b style="color: rgb(229, 170, 163);">*</b></th>
					<td colspan="2">
						<input id="user_name" name="user_name"
							type="text" placeholder="이름" maxlength="20"required>
					</td>
				</tr>
				<tr>
					<th class="element text-start">닉네임<b style="color: rgb(229, 170, 163);">*</b></th>
					<td colspan="2">
					<input id="user_nickname" name="user_nickname" type="text" placeholder="닉네임" maxlength="20">
					</td>
				</tr>
				<tr>
					<th>이메일<b style="color: rgb(229, 170, 163);">*</b></th>
					<td colspan="2" class="element">
					<input id="uSER" name="user_email" type="text" placeholder="이메일" maxlength="20"></td>
				</tr>
				<tr>
					<th>전화번호<b style="color: rgb(229, 170, 163);">*</b></th>
					<td colspan="2">
					<select name="user_phone1"
						class="phoneSelect">
							<option>010</option>
							<option>02</option>
							<option>031</option>
							<option>070</option>
					</select> 
					<input type="text" class="op" id="user_phone2" name="user_phone2" style="width:30%;" size="5" required>
					<input type="text" class="op" id="user_phone3" name="user_phone3" style="width:30%;" size="5" required>
					</td>
				</tr>
			</table>
			<br>
			<div class="btnArea">
				<input class="userFormbtn" type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/'">
				<input class="userFormbtn" type="button" id="signUp" value="회원가입">
			</div>
		</form>
	</div>
		<!-- footer 참조 -->
		<footer>
			<jsp:include page="../common/footer.jsp"></jsp:include>
		</footer>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script type="text/javascript">
		   $(document).ready(function(e){
		      
		      var idx = false;
		      
		      $('#signUp').click(function(){
		         if($.trim($('#user_id').val()) == ''){//공백잡기
		            alert("아이디를 입력해 주세요.");
		            $('#user_id').focus();
		            return;
		         }else if($.trim($('#user_pw').val()) == ''){//공백잡기
		            alert("패스워드를 입력해 주세요.");
		            $('#user_pw').focus();
		            return;
		         }
		         //패스워드 확인
		         else if($('#user_pw').val() != $('#passwdCheck').val()){//패스워드 다른거 자
		            alert('패스워드가 다릅니다.');
		            $('#user_pw').focus();
		            return;
		         }
		         
		         if(idx==false){
		            alert("아이디 중복체크를 해주세요.");
		            return;
		         }else if($.trim($('#user_name').val()) == ''){
		        	 alert('이름을 입력해 주세요.');
		        	 $('#user_name').focus();
		             return false;
		    	}else if($.trim($('#user_phone2').val().length) != 4){
		        	 alert('전화번호 형식이 올바르지 않습니다.\n 다시 입력해 주세요.');
		        	 $('#user_phone2').focus();
		             return false;
		         }else if($.trim($('#user_phone3').val().length) != 4){
		        	 alert('전화번호 형식이 올바르지 않습니다.\n 다시 입력해 주세요.');
		        	 $('#user_phone3').focus();
		             return false;
		         }else{
		            $('#signFrm').submit();
		         }
		      });
		      
		      $('#check').click(function(){
		         $.ajax({
		            url: "${pageContext.request.contextPath}/idCheck",
		            type: "GET",
		            data:{
		               "user_id":$('#user_id').val()
		            },
		            success: function(data){
		               if(data == 0 && $.trim($('#user_id').val()) != '' ){
		                  idx=true;
		                  $('#user_id').attr("readonly",true);
		                  var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
		                  $('#idCheck').empty();
		                  $('#idCheck').append(html);
		               }else{
		
		                  var html="<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
		                  $('#idCheck').empty();
		                  $('#idCheck').append(html);
		               }
		            },
		            error: function(){
		               alert("서버에러");
		            }
		         });
		      });
		   });
   
		</script>
	</body>
</html>