<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<title></title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/ico/logo_icon.ico">
<script>
$.noConflict();
jQuery(document).ready(function($) {
	    function checkWidth() {
	        if ($(window).width() >= 1340) {
	            $('.pc-Body').show();
	            $('.mobile-Body').hide();
	        } else {
	            $('.pc-Body').hide();
	            $('.mobile-Body').show();
	        }
	    }

	    // 페이지 로드 시 한 번 체크
	    checkWidth();

	    // 디바운스 함수 
	    function debounce(func, wait) {
	        let timeout;
	        return function() {
	            clearTimeout(timeout);
	            timeout = setTimeout(func, wait);
	        };
	    }

	    // 리사이즈 이벤트 핸들러에 디바운스 적용
	    $(window).resize(debounce(checkWidth, 250));

	
    $('.btnSearch').click(function() {
        var searchInput = $('.inputSearch').val().trim(); // 검색 입력값 가져오기
        if (searchInput) { // 입력값이 있으면
            $('#searchForm').submit(); // 폼 제출
        }
    });

    $('.inputSearch').keypress(function(event) {
        if (event.which == 13) { // 엔터 키를 눌렀을 때
            $(this).blur(); // 입력 필드에서 포커스 해제
            $('.btnSearch').click(); // 검색 버튼 클릭 이벤트 실행
        }
    });
    function focusSearch() {
    	document.querySelector('.inputSearch').focus();
    }

});

</script>
<style type="text/css">
body {
	background-color: #f6f4ee;
}
.rajdhani-light {
  font-family: "Rajdhani", sans-serif;
  font-weight: 300;
  font-style: normal;
}

.header {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    width: 100%;
    margin: 0 auto;
    display: flex;
    align-items: center;
    padding: 5px 30px;
    background-color: white !important;
    z-index: 1000;
}

.allMenuArea {
    display: flex;
    align-items: center;
}

.buttonMenuArea {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    flex-grow: 1;
}

.menu-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
}


.rajdhani-light {
  font-family: "Rajdhani", sans-serif;
  font-weight: 300;
  font-style: normal;
}


.allMenuArea ul {
    display: flex;
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.allMenuArea li a {
    position: relative;
    display: block;
    color: black;
    text-align: center;
    padding: 4px 16px;
    text-decoration: none;
}
.allMenuArea li a:after {
    content: '';
    display: block;
    width: 100%; /* 가상 요소의 너비 */
    height: 1px;
    background: #888;
    transition: transform 0.5s ease;
    position: absolute;
    bottom: -2px;
    left: 50%; 
    transform: translateX(-50%) scaleX(0);
    transform-origin: center; 
}

/* 호버 시 메뉴 항목 아래 줄 애니메이션 */
.allMenuArea li a:hover:after,
.allMenuArea li a:focus:after {
    transform: translateX(-50%) scaleX(1);
    background: rgb(92, 110, 86); 
}


.buttonMenuArea {
    display: flex;
    align-items: center;
}



/* 버튼 메뉴 영역 스타일 */
.buttonMenuArea [class*='fa'] {
    margin-left: 10px; 
    padding: 4px 10px;
    cursor: pointer;
}

.buttonMenuArea [class*='fa']:hover,
.buttonMenuArea [class*='fa']:focus {
   color: rgb(231, 76, 60);
	transition: 0.7s;
}


.searchArea {
    position: relative;
    margin-right: 10px;
}

.inputSearch {
    height: 50px;
    width: 50px; 
    border-style: none;
    padding: 10px;
    font-size: 18px;
    letter-spacing: 2px;
    outline: none;
    border-radius: 25px; 
    transition: all .5s ease-in-out;
    background-color: transparent; 
    padding-right: 40px;
    color: #000; 
    border-bottom: 1px solid transparent; 
}

.inputSearch::placeholder {
    color: rgba(0, 0, 0, 0.5);
}

.inputSearch:focus {
    width: 300px; 
    border-radius: 0; 
    background-color: transparent;
    border-bottom: 1px solid #000; 
    color: #000; 
}

.btnSearch {
	font-size: 30px;
    width: 50px;
    height: 50px;
    border-style: none;
    font-size: 20px;
    font-weight: bold;
    outline: none;
    cursor: pointer;
    border-radius: 50%;
    position: absolute;
    right: 0px;
    background-color: transparent; 
    color: #000;
    pointer-events: painted;  
}

/* inputSearch에 포커스가 있지 않을 때 btnSearch 클릭 시 포인터 이벤트를 비활성화 */
.searchArea:not(:focus-within) .inputSearch {
    pointer-events: none;
}

.buttonMenuArea a,
.buttonMenuArea a:visited,
.buttonMenuArea a:hover,
.buttonMenuArea a:focus,
.buttonMenuArea a:active {
	font-size: 10px;
    color: inherit;
    text-decoration: none;
}
.buttonPosition {
	position: fixed;
	bottom: 0;
	right: 0;
	margin-right: 70px;
	margin-bottom: 100px;
	width:75px;
	height:75px;
	cursor: pointer;
 	text-align: center;
 	align-content: center;
}
/* .pc-Body {
		display: none;
	}
	.moblie-Body {
		display: none;
	}
/*반응형 웹*/
@media all and (min-width:1340px) {
	.pc-Body {
		display: block;
	}
	.mobile-Body {
		display: none;
	}
} 
@media all and (max-width:1339px) {
	.pc-Body {
		display: none;
	}
	.mobile-Body {
		display: block;
	}
}
</style>
</head>
<body>
	<div class="pc-Body">
		<!-- 로그인을 안했을 경우, 이 header를 실행 -->
		<c:if test="${empty user}">
			<!-- header -->
			<div class="header">
			<!-- Logo를 넣는 곳. src는 경로  -->
					<div clas="logo-container">
					<strong style=" align-content:center;text-align:center;">
						<a href="${pageContext.request.contextPath}/" class="logoText rajdhani-light" style="text-decoration:none;font-size: x-large;"><img alt="" src="${pageContext.request.contextPath}/resources/img/iogo.png" height="40px;"></a>
					</strong>
					</div>
					
				<!-- 전체 menu 영역 -->
				<div class="menu-wrapper">
					<div class="allMenuArea" style="padding-left: 22px;">
						<!-- 네비바 menu 영역. -->
						<ul>
						    <li><a href="${pageContext.request.contextPath}/product/category?category_code=1">&#127806;쌀 및 잡곡</a></li>
						     <li><a href="${pageContext.request.contextPath}/product/category?category_code=2">&#127822;과일</a></li>
						     <li><a href="${pageContext.request.contextPath}/product/category?category_code=3">&#127807;채소</a></li>
						     <li><a href="${pageContext.request.contextPath}/product/category?category_code=4">&#128031;수산물</a></li>
						     <li><a href="${pageContext.request.contextPath}/product/category?category_code=5">&#127830;축산물</a></li>
							<li><a href="${pageContext.request.contextPath}/center/list">고객센터</a></li>
						</ul>
					</div>
					
					<!-- 장바구니, 로그인 등의 영역. -->
					<div class="buttonMenuArea">				
					 	
					 	<form action="/product" method="get">
					 	<div class="searchArea">
		    				<button type="button" class="btnSearch"  onclick="document.querySelector('.inputSearch').focus();">
		    					<i class="fa fa-search fa-2x"  aria-hidden="true" style="font-size:20px;"></i>
		    				</button>
		    				<input type="text" class="inputSearch" placeholder="press the enter" name="searchKeyword">
		  				</div>
					 	</form>
		  				
						<a href="${pageContext.request.contextPath}/login"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i></a>
						<a href="${pageContext.request.contextPath}/login"><i class="fa fa-user fa-2x" aria-hidden="true"></i></a>
						<a href="${pageContext.request.contextPath}/login" style="font-size: small; padding-right:10px; padding-left: 10px;">로그인</a>
					</div>
				</div>
			</div>
			
			<div class="buttonPosition">
				<a href="javascript:chattingOpen()" style="text-decoration:none;"><img alt="" src="${pageContext.request.contextPath}/resources/img/btn.png"></a>
			</div>
		
		</c:if>
		
		<c:if test="${not empty user}">
			<!-- user가 관리자일 경우, 이 header를 실행 -->
			<c:if test="${user.user_state eq 2}">
				<!-- header 참조 -->
				<header>
					<jsp:include page="../common/testadminHeader.jsp"></jsp:include>
				</header>	
			</c:if>
			<!-- user가 관리자가 아닐 경우, 이 header를 실행 -->
			<c:if test="${user.user_state ne 2 }">
				<!-- header -->
				<div class="header">
					<!-- Logo를 넣는 곳. src는 경로  -->
					<div clas="logo-container">
					<strong style=" align-content:center;text-align:center;">
						<a href="${pageContext.request.contextPath}/" class="logoText rajdhani-light" style="text-decoration:none;font-size: x-large;"><img alt="" src="${pageContext.request.contextPath}/resources/img/iogo.png" height="40px;"></a>
					</strong>
					</div>
						
					<!-- 전체 menu 영역 -->
					<div class="menu-wrapper">
						<div class="allMenuArea" style="padding-left: 22px;">
							<!-- 네비바 menu 영역. -->
							<ul>
							    <li><a href="${pageContext.request.contextPath}/product/category?category_code=1">&#127806;쌀 및 잡곡</a></li>
							     <li><a href="${pageContext.request.contextPath}/product/category?category_code=2">&#127822;과일</a></li>
							     <li><a href="${pageContext.request.contextPath}/product/category?category_code=3">&#127807;채소</a></li>
							     <li><a href="${pageContext.request.contextPath}/product/category?category_code=4">&#128031;수산물</a></li>
							     <li><a href="${pageContext.request.contextPath}/product/category?category_code=5">&#127830;축산물</a></li>
								<li><a href="${pageContext.request.contextPath}/center/list">고객센터</a></li>
							</ul>
						</div>
						
						<!-- 장바구니, 로그인 등의 영역. -->
						<div class="buttonMenuArea">				
						 	
						 	<form action="/product" method="get">
						 	<div class="searchArea">
			    				<button type="button" class="btnSearch"  onclick="document.querySelector('.inputSearch').focus();">
			    					<i class="fa fa-search fa-2x"  aria-hidden="true" style="font-size:20px;"></i>
			    				</button>
			    				<input type="text" class="inputSearch" placeholder="press the enter" name="searchKeyword">
			  				</div>
						 	</form>
			  				
							<a href="${pageContext.request.contextPath}/cart/list"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i></a>
							<a href="${pageContext.request.contextPath}/myinfo"><i class="fa fa-user fa-2x" aria-hidden="true"></i></a>
							<a href="${pageContext.request.contextPath}/logout" style="font-size: small; padding-right:10px; padding-left: 10px;">로그아웃</a>
						</div>
					</div>
				</div>
				
				<div class="buttonPosition">
					<a href="javascript:chattingOpen()" style="text-decoration:none;"><img alt="" src="${pageContext.request.contextPath}/resources/img/btn.png"></a>
				</div>	
				
			
			</c:if>
		</c:if>
	
	</div>

	<div class="mobile-Body">
		<!-- 로그인을 안했을 경우, 이 header를 실행 -->
		<c:if test="${empty user}">
			<!-- header 참조 -->
			<header>
				<jsp:include page="../common/mobile-userheader.jsp"></jsp:include>
			</header>
		</c:if>
		
		<c:if test="${not empty user}">
			<!-- user가 관리자일 경우, 이 header를 실행 -->
			<c:if test="${user.user_state eq 2}">
				<!-- header 참조 -->
				<header>
					<jsp:include page="../common/mobile-adminHeader.jsp"></jsp:include>
				</header>	
			</c:if>
			<!-- user가 관리자가 아닐 경우, 이 header를 실행 -->
			<c:if test="${user.user_state ne 2 }">
				<!-- header 참조 -->
				<header>
					<jsp:include page="../common/mobile-userheader.jsp"></jsp:include>
				</header>
			</c:if>
		</c:if>
		
	</div>

</body>

<script>
function chattingOpen(){
	window.open("${pageContext.request.contextPath}/chatting","팝업 테스트","width=500, height=700, top=10, left=10");
}
</script>

</html>