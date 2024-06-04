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
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/ProductInfo.css?after">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>상품자세히 보기</title>
<script type="text/javascript">
$(document).ready(function() {
	$(".c1").html("쌀 및 잡곡");
	$(".c2").html("과일");
	$(".c3").html("채소");
	$(".c4").html("수산물");
	$(".c5").html("축산물");
	
	$('.s1').html("&#10029");
	$('.s2').html("&#10029&#10029");
	$('.s3').html("&#10029&#10029&#10029");
	$('.s4').html("&#10029&#10029&#10029&#10029");
	$('.s5').html("&#10029&#10029&#10029&#10029&#10029");
	$(function ($) {
		  $(".tab-content").eq(0).show(0);
		  $(".tab-ul li").click(function () {
		    var idx = $(this).index();
		    $(".tab-content").hide();
		    $(".tab-content").eq(idx).show();
		    $(".tab-ul li").removeClass("active");
		    $(this).addClass("active");
		  });
	});
})
function goCart(user_id, product_id) {
	if(!user_id) {
		alert("로그인 이후에 장바구니에 담는 것이 가능합니다");
		location.href="/login";
	} else {
		location.href="/cart/insert?product_id="+product_id+"&cart_product_qty="+$("#cart_product_qty").val();
	}
}
function goBuy(user_id, product_id) {
	if(!user_id) {
		alert("로그인 이후에 바로구매 하는 것이 가능합니다");
		location.href="/login";
	} else {
		var produt = product_id.toString();
		location.href="/cart/order?product_id="+product_id+"&cart_product_qty="+$("#cart_product_qty").val();
	}
}
function qnaInsert(user_id, product_id) {
	if(!user_id) {
		alert("로그인 이후에 바로구매 하는 것이 가능합니다");
		location.href="/login";
	}
	else {
		if($.trim($(".prdQnaInsert").children("textarea").val()) == "") {
			alert($.trim($("#qna_content").val()));
			alert("상품문의 내용을 등록하여주십시오.");
		} else {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/product/qna/insert",
				data: $("#prdQnaForm").serialize()+"&product_id="+product_id,
				success: function(data) {
					window.close();
					window.opener.location.href="${pageContext.request.contextPath}/product/info?product_id="+product_id;
				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert("실패하였습니다.다시한번 상품문의를 등록하여주십시오.");
				}
			});
		}
	}
}
</script>
<style>
.noto-sans-kr-category {
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-weight: 300;
  font-style: normal;
}
.prdAddTable {
	width: 60%;
  text-align: left;
  line-height: 1.8em;
  margin: auto;
  border-collapse: separate; 
  border-spacing: 0;
}
.ProimageArea {
	margin-left:30px;
  width: 50%;
  float: left;
  padding-right: 30px;
  height: 400px;
  border-right: 1px solid #e9e9e9;
  
}
.ProimageArea img{
	width: 76%;
	height: 100%;
	border: 1px solid #ccc;
	object-fit:cover;
  
}
@media all and (max-width:1449px) {
	.bodyArea {
	    width: 100%;
	    margin: auto;
	    padding-top: 60px;
	    padding-bottom: 90px;
	}
	.proProductInfo {
	    width: 100%;
	    text-align: center;
	    margin-top: 20px;
	    display: flex;
	    justify-content: center;
	    align-items: stretch;
	}
	.prdAddTable {
		width: 100%;
	    text-align: left;
	    line-height: 1.8em;
	    margin: auto;
	    border-collapse: separate;
	    border-spacing: 0;
	}

}
@media all and (max-width:931px) {
	.bodyArea {
	    width: 100%;
	    margin: auto;
	    padding-top: 60px;
	    padding-bottom: 90px;
	}
	.proProductInfo {
	    width: 100%;
	    text-align: center;
	    margin-top: 20px;
	    display: flex;
	    justify-content: center;
	    align-items: stretch;
	    flex-direction: column;
	}

	.ProimageArea {
		margin-left: 0px;
	    width: 100%;
	    float: left;
	    padding-right: 0px;
	    margin-right: 0px; 
	    height: 400px;
	    border-right: 1px solid #e9e9e9;
	    text-align: center;
	}
	.ProItemDetailArea {
	    padding-left: 15px;
	    width: 100%;
	    float: left;
	}
	.prdAddTable {
		width: 100%;
	    text-align: left;
	    line-height: 1.8em;
	    margin: auto;
	    border-collapse: separate;
	    border-spacing: 0;
	}
	.ProimageArea img{
		width: 400px;
		height: 400px;
		border: 1px solid #ccc;
		object-fit:cover;
	  
	}
}
</style>
</head>
<body>
	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
	<div class="bodyArea" style="padding-top: 100px;">

		<div class="proProductInfo" style="text-align: center;">	
			<div class="ProimageArea">
				<img alt="..." src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${product.product_pic}">
			</div>
			
			<div class="ProItemDetailArea">
				<table class="prdAddTable">
					<tr style="line-height: 2em;">
						<th class="ItemTitleArea noto-sans-kr-category" colspan="2" style="padding-bottom: 10px; font-size: 24px;">${product.product_name}</th>
					</tr>
					<tr>
						<th class="ItemTitleArea">상품구분</th>
						<td class="c${product.category_code}"></td>
					</tr>
					<c:if test="${product.product_discount ne 0.0}">
						<tr>
							<th>할인율</th>
							<td>
								<c:if test="${product.product_discount ne 0.0}">
									<strong style="font-size:large; color:red;"><fmt:formatNumber value="${product.product_discount}" type="percent"/></strong><br>
								</c:if>
							</td>
						</tr>
						<tr style="line-height: 0.1em;">
							<th class="ItemTitleArea">가격</th>
							<td>
								<p>
									<del style="font-size: large;"><fmt:formatNumber value="${product.product_price}" pattern="###,###,###"/>원</del>
									<b style="font-size: x-large;"><fmt:formatNumber value="${product.product_price*(1-product.product_discount)}" pattern="###,###,###"/>원</b>
								</p>
							</td>
						</tr>
					</c:if>	
					<c:if test="${product.product_discount eq 0.0}">
						<tr style="line-height: 0.1em;">
							<th class="ItemTitleArea">가격</th>
							<td>
								<p><br><fmt:formatNumber value="${product.product_price}" pattern="###,###,###"/>원</p>
							</td>
						</tr>
					</c:if>						
					<tr >
						<th style="padding-bottom: 30px;">수량</th>
						<td style="padding-bottom: 30px;"><input id="cart_product_qty" type="number" value="1" min="1" max="${product.product_stock}"/></td>
					</tr>
					<tr>
						<td colspan="2" style="padding-bottom: 10px;"><input class="ProInfoItemBtn" type="button" value="장바구니 담기"
						onclick="goCart('${user_id}', ${product.product_id})"></td>
					</tr>
					<tr>
						<td colspan="2"><input class="ProInfoItemBtn" type="button" value="바로구매" onclick="goBuy('${user_id}', ${product.product_id})"></td>
					</tr>
				</table>
			</div>
			
		</div>
	
		
		<!-- 전의 영역에 영향이 미치지 않도록 하는 div -->
		<div class="floatClearClass"></div>
		
		<!-- body 부분 - 상품 목록 보기 -->
		<div class="menuArea">
			<ul class="tab-ul">
				<li class="active" style="border-left-width: 1px;">상품상세정보</li>
				<li>후기</li>
				<li>문의</li>
			</ul>
		</div>
		
		<!-- 전의 영역에 영향이 미치지 않도록 하는 div -->
		<div class="floatClearClass"></div>
		
		<div class="ProductInfoArea tab-content">
			<img alt="" src="${pageContext.request.contextPath}/resources/img/deliverNotice.png" style="width: 100%;height: 100%;">
		</div>
		
		<!-- 전의 영역에 영향이 미치지 않도록 하는 div -->
		<div class="floatClearClass"></div>
		
		<!-- body 부분 - 상품 목록 보기 -->
		<div class="reviewArea tab-content">
			<table class="ListTableStyle">
				<!-- 표 제목 부분 -->
				<thead>
					<tr>
						<th>No.</th>
						<th>내용</th>
						<th>작성자</th>
						<th>주문일</th>
						<th>별점</th>					
					</tr>
				</thead>
				<!-- c:foreach로 대체 -->
				<tbody id="TablebodyArea">
				<c:choose>
					<c:when test="${empty reviewList}">
						<tr>
							<td colspan="5">리뷰 리스트가 존재하지 않습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="reviewList" items="${reviewList}">
							<tr>
								<td>${reviewList.R_NUM}</td>
								<td>${reviewList.REVIEW_CONTENT}</td>
								<td>${reviewList.USER_NICKNAME}</td>
								<td>
									<fmt:formatDate value="${reviewList.ORDER_DATE}" pattern="yyyy-MM-dd HH:MM"/>
								</td>
								<td class="s${reviewList.REVIEW_GRADE}"></td>
							</tr>						
						</c:forEach>
					</c:otherwise>
				</c:choose>
					
				</tbody>
			</table>
			<div class="pagingArea">
				<ul>
					<c:if test="${reviewPaging.nowPageNum>1}">
						<li>
							<a href="/product/info?nowPage=${reviewPaging.nowPageNum-1}&cntPageItemNum=${reviewPaging.cntPageItemNum}">
								<i class="fa-solid fa-caret-left"></i>
							</a>
						</li>
					</c:if>
					<c:forEach begin="${reviewPaging.startPageNum}" end="${reviewPaging.endPageNum}" var="p">
						<c:choose>
							<c:when test="${p==reviewPaging.nowPageNum }">
								<li class="disabled">
	    							<span>${p}</span> <!-- 클릭 불가능한 비활성화된 페이지 -->
								</li>
							</c:when>
							<c:when test="${p!=reviewPaging.nowPageNum}">
								<li><a href="/product/info?nowPage=${p}&cntPageItemNum=${reviewPaging.cntPageItemNum}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${reviewPaging.nowPageNum < reviewPaging.lastPageNum}">
						<li>
							<a class="pagingItem" href="/product/info?nowPage=${reviewPaging.nowPageNum+1}&cntPageItemNum=${reviewPaging.cntPageItemNum}">
							<i class="fa-solid fa-caret-right"></i>
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
		
		<!-- 전의 영역에 영향이 미치지 않도록 하는 div -->
		<div class="floatClearClass"></div>
		
		<!-- body 부분 - 상품 목록 보기 -->
		<div class="prdQnaArea tab-content">
				<form id="prdQnaForm" action="/product/qna/insert" method="post">
				<div class="prdQnaInsert">
						<textarea id="" name="qna_content" cols="60" placeholder="소중한 고객님의 개인정보 보호를 위해 주민번호, 전화번호 등의 개인정보는 절대 입력하지 않도록 주의해주세요.
	또한, 다음과 같은 내용의 글은 관리자에 의해 임의로 삭제될 수 있습니다.
	- 저작권 침해/음란/욕설/비방 글
	- 개인정보 유출(전화번호, 주민번호, 이름, 아이디 등)
	- 판매/광고/홍보성 글을 등록한 경우"></textarea>
						<input class="qna-button" type="button" onclick="qnaInsert('${user_id}', ${product.product_id})" value="Submit" >
					</div>
				</form>
			
			<table class="ListTableStyle">
				<!-- 표 제목 부분 -->
				<thead>
					<tr>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>작성대기</th>
					</tr>
				</thead>
				<!-- c:foreach로 대체 -->
				<tbody id="TablebodyArea">			
	 				<c:choose>
						<c:when test="${empty qnaList}">
							<tr>
								<td colspan="4">등록된 상품문의 리스트가 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="askList" items="${qnaList}">
								<c:if test="${askList.q_or_a eq 0}">
									<tr>
										<td>${askList.qna_content}</td>
										<td>${askList.user_nickname}</td>
										<td>
											<fmt:formatDate value="${askList.product_qna_date}"/>
										</td>
										
										<c:if test="${askList.product_qna_state eq 0 }">
											<td>[답변대기]</td>
										</c:if>
										<c:if test="${askList.product_qna_state eq 1 }">
											<td>[답변완료]</td>
										</c:if>
									</tr>
								</c:if>
								<c:if test="${askList.q_or_a eq 1}">
									<tr>
										<td>ㄴ${askList.qna_content}</td>
										<td>관리자</td>
										<td>
											<fmt:formatDate value="${askList.product_qna_date}"/>
										</td>
										<td></td>
									</tr>
								</c:if>						
							</c:forEach>
						</c:otherwise>
					</c:choose> 
					
				</tbody>
			</table>
			<div class="pagingArea">
				<ul>
					<c:if test="${qnaPaging.nowPageNum>1}">
						<li>
							<a href="/product/info?nowPage=${qnaPaging.nowPageNum-1}&cntPageItemNum=${qnaPaging.cntPageItemNum}">
								<i class="fa-solid fa-caret-left"></i>
							</a>
						</li>
					</c:if>
					<c:forEach begin="${qnaPaging.startPageNum}" end="${qnaPaging.endPageNum}" var="p">
						<c:choose>
							<c:when test="${p==qnaPaging.nowPageNum }">
								<li class="disabled">
	    							<span>${p}</span> <!-- 클릭 불가능한 비활성화된 페이지 -->
								</li>
							</c:when>
							<c:when test="${p!=qnaPaging.nowPageNum}">
								<li><a href="/product/info?nowPage=${p}&cntPageItemNum=${qnaPaging.cntPageItemNum}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${qnaPaging.nowPageNum < qnaPaging.lastPageNum}">
						<li>
							<a class="pagingItem" href="/product/info?nowPage=${qnaPaging.nowPageNum+1}&cntPageItemNum=${qnaPaging.cntPageItemNum}">
							<i class="fa-solid fa-caret-right"></i>
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		
		</div>
	</div>
	<!-- 전의 영역에 영향이 미치지 않도록 하는 div -->
	<div class="floatClearClass"></div>
	
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>

</body>
</html>