<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/orderView.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>주문하러가기</title>
<script type="text/javascript">

function getMyOrder() {
	$.ajax({
		url: "${pageContext.request.contextPath}/order/user",
        type: 'GET',
        dataType: 'json',
        success: function(data) {
        	$("#user_name").val(data.user_name)
        	$("#user_phone").val(data.user_phone)
            if(data.user_zipcode != null || data.user_addr != null || data.user_addr_d != null) {
            	document.getElementById("member-post").value = data.user_zipcode;
            	document.getElementById("member-addr").value = data.user_addr;
            	document.getElementById("member-addr-d").value = data.user_addr_d;
            } else {
            	alert("주소를 가져오는데에 실패하였습니다.");
            }
        },
        error: function() {
        	alert("정보를 가져오는데 실패하였습니다");
        }
	});
	
}
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
</script>
<style type="text/css">
.width-600 {
	width: 600px !important;
}
@media all and (max-width:1380px) {
	.orderBody {
	    width: 80%;
	    margin: auto;
	}
	.orderAddTable {
	    width: 100%;
	    margin: 0 auto;
	}
}
@media all and (max-width:983px) {
	.orderBody {
	    width: 100%;
	    margin: auto;
	}
		.orderAddTable {
	    width: 100%;
	    margin: 0 auto;
	}
	.table-title {
	    display: none;
	    padding: 10px 20px;
	    border: 1px solid #e0e0e0;
	    border-width: 0 1px 1px 0;
	    font-size: 14px;
	    font-weight: normal;
	    text-align: left;
	    vertical-align: middle;
	}
	.orderBtnArea {
	    width: 100%;
	    margin: 0 auto;
	    padding-top: 10px;
	    display: flex;
	    flex-direction: column;
	    flex-wrap: wrap;
	    align-content: center;
	    justify-content: space-between;
	    text-align: center;
	}
	.orderBtn {
    	width: 100%;
    	margin: 10px;
    }
	.orderAddTable input[type="text"] {
	    width: 271px;
	    height: 55px;
	    padding: 10px 10px;
	    border: 1px solid #dcdcdc;
	    font-size: 14px;
	    line-height: 35px;
	    vertical-align: middle;
	    text-align: left;
	    font-size: 17px;
	    background: white;
	    border-radius: 1px;
	    -moz-appearance: textfield;
	}
    .width-600 {
		width: 100% !important;
	}
	
}
</style>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	<div class="orderBody" style="margin-bottom: 90px; padding-top: 80px;">
		<div class="pageTitleArea">
			<strong style="font-weight: 340; font-size:xx-large; margin: 0 auto; text-align: center; color: black;" class="noto-sans-kr-category">주문 정보 입력</strong>
		</div>
		<hr>
		
		<div class="orderInfoArea">
			<form action="/order/shopping" method="post" class="orderform">
				<div class="orderAddArea">
					<table class="orderAddTable">
						<tr>
							<td class="table-title">수령인</td>	
							<td><input type="text" placeholder="수령인 이름을 입력하세요.." id="user_name" name="order_receiver" required="required"></td>
						</tr>
						<tr>
							<td class="table-title">수령인 연락처</td>	
							<td>
							<input type="text" placeholder="수령인 연락처를 입력하세요.." id="user_phone" name="order_phone" required="required" maxlength="13" style="width: 350px;">
							<input type="hidden" name="order_total" id="order_total" value="${cartMap.allSum }">
							</td>
						</tr>
						<tr>
							<td class="table-title">우편번호</td>	
							<td><input type="text" id="member-post" placeholder="우편번호을 입력하세요.." name="order_zipcode" required="required">
							<input class="delivery-button" type="button" value="주소찾기" onclick="findAddr()" ></td>
						</tr>
						<tr>	
							<td class="table-title">도로명 주소</td>
							<td><input class="width-600" type="text" id="member-addr" placeholder="도로명 주소를 입력하세요.." name="order_addr" required="required" ></td>
						</tr>
						<tr>
							<td class="table-title">상세 주소</td>	
							<td><input class="width-600" type="text" id="member-addr-d" placeholder="상세주소를 입력하세요.." name="order_addr_d" required="required" ></td>
						</tr>
					</table>
				</div>
				<div class="orderBtnArea">
					<input class="orderBtn" type="button" value="내정보가져오기" onclick="getMyOrder()" style="margin-bottom:2px;">
					<input class="orderBtn" type="submit" value="결제하기" style="margin-top:2px;">
				</div>
			</form>
			
		</div>
	</div>
	
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>