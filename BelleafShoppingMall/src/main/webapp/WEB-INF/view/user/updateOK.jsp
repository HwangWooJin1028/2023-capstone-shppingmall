<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트 완료</title>

</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	<div class="cotainer">
	<div class="card boder-success" style="max-width: 600px; margin-left: 350px;">
		<div class="card-header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><div class="text-center h4"><div class="center"><strong>개인정보변경</strong>이 완료되었습니다.</div>
		</div><hr>
		<div class="text-center">
		<a class="btn" href="${pageContext.request.contextPath}/myinfo">마이페이지</a>
		<a class="btn" href="${pageContext.request.contextPath}/myin">메인페이지</a>
		</div>
		</font></font>
		</div>
	</div>
	</div>
		
</body>
</html>