<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의 등록</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myPageTemplate.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/myinfoPrdQnaInfo.css?after">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
//내용이 비어있으면 alert를 띄우는 함수
function go_nullCheck() {
	var titleN = $("#center_qna_title").val().trim();
	var contentN = $("#center_qna_content").val().trim();
	if (titleN == "") {
		alert("제목을 입력하세요.");
		document.insertCenterQna.center_qna_title.focus();
	} else {
		if (contentN == "") {
			alert("내용을 입력하세요.");
			document.insertCenterQna.center_qna_content.focus();
		} else {
			$("#insertCenterQna").submit();
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
  border: solid rgb(231, 76, 60);
  border-width: 1px;
  background: transparent;
  cursor: pointer;
  margin: auto !important;
}
.reset:hover, .reset:focus{
  background: rgb(231, 76, 60);
  color: white;
  transition: 0.7s;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div id="prdInfoBodyContainer">
		<div class="myinfo-body" style="padding-top: 100px;">
			<!-- 제목 부분 -->
			<div class="page-nav">홈><a href="/center/list">고객센터</a>><a href="/center/insert">문의등록</a></div>
			<div class="page-title">고객센터 문의 등록</div>
			
			<div class="content-prdqnainfobody">
				<!-- 여기서부터 본론 -->
				<div class="content-body">
				<form id="insertCenterQna" action="/center/info/insert" method="post">
					<input type="hidden" id="user_id" name="user_id" value="${user_id}">
					<table class="content-prdqna">
						<tr>
							<th class="center"><span>문의제목</span></th>	
						</tr>
						<tr>
						<td><input style="margin-bottom:20px;" type="text" name="center_qna_title" id="center_qna_title"></td>
						</tr>
						<tr><th class="center" colspan="2">문의내용</th></tr>
						<tr>
							<td  colspan="2">
								<textarea name="center_qna_content" rows="10" cols="40" id="center_qna_content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2"><button type="button" class="moni" onclick="go_nullCheck()" style="width:100%;margin:0;">문의하기</button></td>
						</tr>	
						<tr>
							<td colspan="2"><button type="reset" class="reset">초기화</button></td>
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