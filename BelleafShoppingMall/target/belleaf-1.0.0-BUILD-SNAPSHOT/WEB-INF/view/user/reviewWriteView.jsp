<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>리뷰 등록하기</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/small_logo.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/reviewWriteView.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function mark(star, e) {
	// 만약 가지고 있는 class가 true이면 
	if($(e).hasClass("off") == true) {
		$('#review_grade').attr('value', star);
		// starzone의 a자식들을 가져온다. -n은 모든 요소들을, 그중 star번째까지의 요소들을 가져온다.
		idtext = '#starzone a:nth-child(-n+' + star +')';
		
		$(idtext).removeClass('off');
		$(idtext).addClass('on');
		
		var starTxt= star + "점";
		$('#review_grade_text').text(starTxt);
		
	}else if($(e).attr('class')=='on') {
		idtext = '#starzone a:nth-child(-n+' + star +')';
		
		if($(e).next().hasClass("on")) {
			
			// grade를 star로 세팅
			$('#review_grade_text').text( star + '점');
			$('#review_grade').attr('value', star);
			
			for(let i = star+1; i<=5; i++){
				var id = '#starzone a:nth-child(' + i +')';
				$(id).removeClass('on');
				$(id).addClass('off');
			}
			return;
			
		} else {
			// grade를 0으로 세팅
			$('#review_grade_text').text('0점');
			$('#review_grade').attr('value', 0);
		}
		
		
		$(idtext).removeClass('on');
		$(idtext).addClass('off');
		
	}
}
function closeReview() {
	let msg = confirm("리뷰작성을 취소하시겠습니까?");
	if(msg) {
		window.close();
	}
}
function submitReview() {
	let contentBlank = $("#reviewform").find('textarea[name="review_content"]').val().trim();
	let star = $("#review_grade").val();
	if(star == 0 || star.length == 0) {
		alert("별점을 입력해주세요");
	}
	else if(contentBlank.length==0) {
		alert("내용을 입력해주세요");
	}
	else {
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/myinfo/review/insert",
			data: $("#reviewform").serialize(),
			success: function(data) {
				window.close();
				window.opener.location.href="${pageContext.request.contextPath}/myinfo/order";
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR + ' ' + textStatus.msg);
			}
		});
	}
	
}
</script>

</head>
<body>
	<div class="review-container">
		<div class="review-title">
			<strong>리뷰 쓰기</strong>
		</div>
		<div class="review-content">
			<form id="reviewform" action="${pageContext.request.contextPath}/myinfo/review/insert" method="post">
				<input type="hidden" id="order_detail_id" name="order_detail_id" value="${myOrder.ORDER_DETAIL_ID}">
				<div class="review-formdata">
						
					<div class="review-productdata">
						<img src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${myOrder.PRODUCT_PIC}">
						
						<div class="review-producttext">
							<span>${myOrder.PRODUCT_NAME}</span>
							<span>${myOrder.PRODUCT_PRICE}</span>
						</div>
					</div>
					<br>
					<div class="review-gradedata">
						<span id="starzone">
							<a onclick="mark(1, this)" class="off"></a> <!-- 클릭 시, 자기자신을 넘겨준다 -->
							<a onclick="mark(2, this)" class="off"></a>
							<a onclick="mark(3, this)" class="off"></a>
							<a onclick="mark(4, this)" class="off"></a>
							<a onclick="mark(5, this)" class="off"></a>
							<span id="review_grade_text">0점</span>
						</span>
						<input type="hidden" id="review_grade" name="review_grade">
					</div>
					<div class="review-contentdata">
						<textarea rows="14" style="width:75%;" name="review_content"></textarea>
					</div>
					
					<div class="review-buttonarea">
						<button class="review-button" onclick="closeReview()">취소</button>
						<input  class="review-button" type="button" onclick="submitReview()" value="등록">
					</div>
				
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>