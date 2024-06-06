<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/homepage.css?after">
<title>BELLEAF</title>
<script>
$(document).ready(function() {
    // 카테고리 이름 설정
    $(".c1").html("쌀");
    $(".c2").html("과일");
    $(".c3").html("채소");
    $(".c4").html("수산물");
    $(".c5").html("축산물");
    
    $('.benncontainer').slick({
        dots: false,
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        speed: 300,
        arrows : false,
        adaptiveHeight: true,
        autoplay : true,			
		autoplaySpeed : 5000
      });
    
 	// Slick 슬라이더 초기화
    $('.categoryArea').each(function() {
        $(this).slick({
        	infinite : false, 
            slidesToShow: 5,
            slidesToScroll: 5,
            arrows : false,
            autoplay : true,			// 자동 스크롤 사용 여부
			autoplaySpeed : 5000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
			pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
			vertical : false,
            nextArrow: '<button type="button" class="slick-next">></button>',
            prevArrow: '<button type="button" class="slick-prev"><</button>',
            responsive: [
            	{
                    breakpoint: 1400,
                    settings: {
                        slidesToShow: 4,
                        slidesToScroll: 4
                    }
                },
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 5,
                        slidesToScroll: 5
                    }
                },
                
                {
                    breakpoint: 968,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 700,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                    }
                },
                {
                    breakpoint: 470,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                }
            ]
            
        });
        
    });
    
    

});

</script>
<style type="text/css">
@media all and (max-width:1339px) {
	#home-container {
		width: 95%;
	}
}
</style>
</head>
<body style="margin: 0px;">	

	<!-- header 참조 -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
		
	
	<!-- 상단 광고  -->
	<div style="padding-top: 53px;width: 100%;" class="benncontainer">
		<c:if test="${empty user}">
			<c:forEach items="${bannerList}" var="banner">
				<div style="width:100%;"><img src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${banner.banner_content}" style="width: 100%;height: auto;"></div>
				<%-- <div style="width:100%;"><a href="/login"><img src="${pageContext.request.contextPath}/resources/img/${banner.banner_content}" style="width: 100%;height: auto;"></a></div> --%>
			</c:forEach>
		
		</c:if>
		<c:if test="${not empty user}">
			<c:forEach items="${bannerList}" var="banner">
				<div style="width:100%;"><img src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${banner.banner_content}" style="width: 100%;height: auto;"></div>
				<%-- <div style="width:100%;"><a href="/cart/list"><img src="${pageContext.request.contextPath}/resources/img/${banner.banner_content}" style="width: 100%;height: auto;"></a></div> --%>
			</c:forEach>
		</c:if>
	</div>
	
	<div id="home-container" >  	
		<!-- body -->
		<div class="body" style="padding-top: 50px;">
			<!-- 카테고리 제목 -->
            <div class="categoryTitleArea" style="margin-bottom: 30px;">
                <a href="" class="noto-sans-kr-category" style="font-size: x-large; cursor: default;">최근 나온 상품들 &#127808;</a>
            </div>
			<div class="categoryArea" style="margin-top: 60px;">
                <div class="floatClearClass"></div>
                <!-- 카테고리 내용 -->
                <c:forEach var="prdItem" items="${prdlist}">
                    <div class="categoryItemArea" style="cursor: default;">
                        <a href="${pageContext.request.contextPath}/product/info?product_id=${prdItem.PRODUCT_ID}">
                            <img src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${prdItem.PRODUCT_PIC}" alt="${prdItem.PRODUCT_NAME}" width="800" height="500">
                        </a>

                        <div class="desc">
							<strong>${prdItem.PRODUCT_NAME}</strong>
							<c:if test="${prdItem.PRODUCT_DISCOUNT ne 0.0}">
								<p>
									<strong style="font-size:large; color:red;"><fmt:formatNumber value="${prdItem.PRODUCT_DISCOUNT}" type="percent"/></strong><br>
									<del><fmt:formatNumber value="${prdItem.PRODUCT_PRICE}" pattern="###,###,###"/>원</del>
									<fmt:formatNumber value="${prdItem.PRODUCT_PRICE*(1-prdItem.PRODUCT_DISCOUNT)}" pattern="###,###,###"/>원
								</p>
							</c:if>
							<c:if test="${prdItem.PRODUCT_DISCOUNT eq 0.0}">
								<p><br><fmt:formatNumber value="${prdItem.PRODUCT_PRICE}" pattern="###,###,###"/>원</p>
							</c:if>
						</div>
                    </div>
                </c:forEach>
			</div>
			
			
			<!-- 카테고리 제목 -->
            <div class="categoryTitleArea" style="margin-bottom: 30px;margin-top: 60px;">
                <a href="" class="noto-sans-kr-category" style="font-size: x-large; cursor: default;">오늘의 특가 상품 &#127800;</a>
            </div>
			<div class="categoryArea" style="margin-top: 100px;">
				
                <div class="floatClearClass"></div>
                <!-- 카테고리 내용 -->
                
                <c:forEach var="prdItem" items="${prdlistByDiscount}">
                    <div class="categoryItemArea" style="cursor: default;">
                        <a href="${pageContext.request.contextPath}/product/info?product_id=${prdItem.PRODUCT_ID}">
                            <img src="https://aws-bucket-capstone-belleaf.s3.ap-northeast-2.amazonaws.com/${prdItem.PRODUCT_PIC}" alt="${prdItem.PRODUCT_NAME}" width="800" height="500">
                        </a>
                        <div class="desc">
							<strong>${prdItem.PRODUCT_NAME}</strong>
							<c:if test="${prdItem.PRODUCT_DISCOUNT ne 0.0}">
								<p>
									<strong style="font-size:large; color:red;"><fmt:formatNumber value="${prdItem.PRODUCT_DISCOUNT}" type="percent"/></strong><br>
									<del><fmt:formatNumber value="${prdItem.PRODUCT_PRICE}" pattern="###,###,###"/>원</del>
									<fmt:formatNumber value="${prdItem.PRODUCT_PRICE*(1-prdItem.PRODUCT_DISCOUNT)}" pattern="###,###,###"/>원
								</p>
							</c:if>
							<c:if test="${prdItem.PRODUCT_DISCOUNT eq 0.0}">
								<p><br><fmt:formatNumber value="${prdItem.PRODUCT_PRICE}" pattern="###,###,###"/>원</p>
							</c:if>
						</div>
                    </div>
                </c:forEach>
                
			</div>

		</div>
	</div>
	
	<!-- footer 참조 -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>