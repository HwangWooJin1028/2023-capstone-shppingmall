<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Your Website Title</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/testadminHeader.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="assets/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<style>
/* Reset margins and padding */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Apply the main font family */
body {
    font-family: 'Noto Sans KR', sans-serif;
}

/* Fixed header at the top */
.header {
    background-color: #4C6654; /* Adjusted to match the dark green color in the image */
    color: #ffffff;
    width: 100%;
    padding: 16px 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: fixed;
    top: 0;
    z-index: 10;
}

/* Logo Text Styling */
.logoText {
    font-size: 24px;
    cursor: pointer;
    margin-left: 2%; /* Or adjust as per your layout */
    color: #ffffff;
}

/* Navigation menu */
.allMenuArea ul {
    list-style: none;
    display: flex;
    align-items: center;
    gap: 20px; /* Adjust the space between the menu items */
}

.allMenuArea ul li a {
    text-decoration: none;
    color: #ffffff;
    font-size: 18px;
    position: relative;
    padding: 8px 0;
}

/* Underline effect for menu items */
.allMenuArea ul li a::after {
    content: '';
    position: absolute;
    width: 0;
    height: 2px;
    display: block;
    margin-top: 5px;
    background: #FFC107; /* Mustard color for underline */
    transition: width 0.3s;
}

.allMenuArea ul li a:hover::after,
.allMenuArea ul li a:focus::after {
    width: 100%;
}

/* Dropdown content */
.dropdownContent {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown:hover .dropdownContent {
    display: block;
}

/* Search and other icons */
.buttonMenuArea {
    display: flex;
    align-items: center;
    margin-right: 2%; /* Or adjust as per your layout */
}

.buttonMenuArea a {
    color: #ffffff;
    text-decoration: none;
    font-size: 20px;
    margin-left: 30px;
}

/* Responsive behavior for search */
.inputSearch {
    padding: 10px;
    border-radius: 25px;
    border: none;
    transition: width 0.4s ease;
}

.inputSearch:focus {
    width: 200px; /* Or as much as you need */
}

/* Search button */
.btnSearch {
    background: none;
    border: none;
    cursor: pointer;
    color: #ffffff;
}

/* Adjustments when scrolling */
header.sticky {
    padding: 10px 0;
    background-color: #333; /* Or any color you prefer when sticky */
}

</style>
</head>
<body>
		<!-- header -->
		<div class="header">
			
			<!-- Logo를 넣는 곳. src는 경로  -->
			<div style="margin-top: 50px; font-size: x-large; cursor: default;">
				<strong><a href="${pageContext.request.contextPath}/" class="logoText" style="text-decoration:none;">BELLEAF</a></strong>
			</div>
			
				
				
			<!-- 전체 menu 영역 -->
			<div class="menu-wrapper">
				<div class="allMenuArea">
					<!-- 네비바 menu 영역. -->
					<ul>
						<li><a href="${pageContext.request.contextPath}/">홈</a></li>
						<li class="dropdown">
					      <a href="javascript:void(0)" class="dropbtn">카테고리</a>
					      <div class="dropdownContent">
					        <a href="${pageContext.request.contextPath}/category1">쌀 및 잡곡</a>
					        <a href="${pageContext.request.contextPath}/category2">과일</a>
					        <a href="${pageContext.request.contextPath}/category3">채소</a>
					        <a href="${pageContext.request.contextPath}/category4">수산물</a>
					        <a href="${pageContext.request.contextPath}/category5">축산물</a>
					      </div>
					    </li>
						<li><a href="${pageContext.request.contextPath}/">고객센터</a></li>
						<li><a href="${pageContext.request.contextPath}/">마이페이지</a></li>
					</ul>
				</div>
				
				<div>
				</div>
				
				<!-- 장바구니, 로그인 등의 영역. -->
				<div class="buttonMenuArea">				
				 	
				 	<div class="searchArea">
	    				<button class="btnSearch"  onclick="document.querySelector('.inputSearch').focus();">
	    					<i class="fa fa-search fa-2x"  aria-hidden="true" style="font-size:20px;"></i>
	    				</button>
	    				<input type="text" class="inputSearch" placeholder="상품을 입력해주세요">
	  				</div>
	  				
					<a href="${pageContext.request.contextPath}/cart"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i></a>
					<a href="${pageContext.request.contextPath}/login"><i class="fa fa-user fa-2x" aria-hidden="true"></i></a>
				</div>
			</div>
		</div>
</body>
</html>
