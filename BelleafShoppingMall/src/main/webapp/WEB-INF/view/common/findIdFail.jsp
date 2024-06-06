<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 완료</title>
<style>
#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
    margin-top: 100px;
    padding-bottom: 170px; /* footer의 높이 */
    padding-left: 200px;
    padding-right: 200px;
}

.container{
	text-align: center;
	 margin:0 auto;
}

.jumbotron{
	text-align: center;
}

.center {
	text-align: center;
}
.btnok {
	width: 120px;
}
</style>
</head>
<body>
</head>
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<body>
	<div class="container" style="margin-top: 100px;">
			<div class="center"><strong>아이디 찾기</strong>가 완료되었습니다</div><br>
		<div class="card border-success mb-3" style="max-width: 30rem; max-width: 600px; margin-left: 650px;">
		  <div class="card-header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><div class="text-center h4"><strong>${getUser.user_id}</strong></div>
		  <hr>
		  <div class="text-center">
		  	<a class="btn btn-sm btn-outline-success btnok" href="${pageContext.request.contextPath }/login">로그인</a>
		  	<a class="btn btn-sm btn-outline-secondary btnok" href="${pageContext.request.contextPath }/findPwdView">비밀번호 찾기</a>
		  	<p style="color: red;">${msg}</p>
		  </div>
		  </font></font></div>
		</div>
		</div>
			<!-- footer -->
			<footer>
				<jsp:include page="../common/footer.jsp"></jsp:include>
			</footer>
		</div>

</body>
</html>