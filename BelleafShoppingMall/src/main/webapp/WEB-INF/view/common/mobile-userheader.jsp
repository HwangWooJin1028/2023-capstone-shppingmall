<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Side Menu</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/moblie-userheader.css?after"> 
</head>

<body>
	<c:if test="${empty user}">
	
	<div class="moblie-userheader-body">
		<div class="moblie-top-menu">
			<div class="logo-container">
				<strong style=" align-content:center;text-align:center;">
					<a href="${pageContext.request.contextPath}/" class="logoText rajdhani-light" style="text-decoration:none;font-size: x-large;"><img alt="" src="${pageContext.request.contextPath}/resources/img/iogo.png" height="40px;"></a>
				</strong>
			</div>
			<div class="menu-btn"><i class="fas fa-bars"></i></div>
		</div>
		<div class="menu-overlay"></div>
		<nav class="side-menu">
		  <header>
		    <h2>Menu</h2>
		    <a href="${pageContext.request.contextPath}/login"><i class="fa fa-shopping-cart" aria-hidden="true" style="color: #ffffff;"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/login"><i class="fa fa-user" aria-hidden="true" style="color: #ffffff;"></i></a>&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/login"><i class="fa-solid fa-arrow-right-to-bracket" style="color: #ffffff;"></i></a>&nbsp;&nbsp;&nbsp;
		  </header>
		  <form id="searchForm" action="/product" method="get">
		  		<input type="search" name="searchKeyword" placeholder="press the enter" class="moblie-search">
		  </form>
		  <ul class="big_menu">
		     <li>카테고리 <i class="fa-solid fa-caret-down" style="color: #000000;"></i>
		      <ul class="small_menu">
		         <li><a href="${pageContext.request.contextPath}/product/category?category_code=1">&#127806;쌀 및 잡곡</a></li>
			     <li><a href="${pageContext.request.contextPath}/product/category?category_code=2">&#127822;과일</a></li>
			     <li><a href="${pageContext.request.contextPath}/product/category?category_code=3">&#127807;채소</a></li>
			     <li><a href="${pageContext.request.contextPath}/product/category?category_code=4">&#128031;수산물</a></li>
			     <li><a href="${pageContext.request.contextPath}/product/category?category_code=5">&#127830;축산물</a></li>
		      </ul>
		    </li>
			 <li><a href="${pageContext.request.contextPath}/center/list">고객센터</a></li>
			 <li><a href="javascript:chattingOpen()">채팅</a></li>
			 
		  </ul>
		</nav>
	</div>
	</c:if>
	<c:if test="${not empty user}">
		<div class="moblie-userheader-body">
		<div class="moblie-top-menu">
			<div class="logo-container">
				<strong style=" align-content:center;text-align:center;">
					<a href="${pageContext.request.contextPath}/" class="logoText rajdhani-light" style="text-decoration:none;font-size: x-large;"><img alt="" src="${pageContext.request.contextPath}/resources/img/iogo.png" height="40px;"></a>
				</strong>
			</div>
			<div class="menu-btn"><i class="fas fa-bars"></i></div>
		</div>
		<div class="menu-overlay"></div>
		<nav class="side-menu">
		  <header>
		    <h2>Menu</h2>
		    <a href="${pageContext.request.contextPath}/cart/list"><i class="fa fa-shopping-cart" aria-hidden="true" style="color: #ffffff;"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/myinfo"><i class="fa fa-user" aria-hidden="true" style="color: #ffffff;"></i></a>&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-arrow-right-from-bracket" style="color: #ffffff;"></i></a>&nbsp;&nbsp;&nbsp;
		  </header>
		  <form id="searchForm" action="/product" method="get">
		  		<input type="search" name="searchKeyword" placeholder="press the enter" class="moblie-search">
		  </form>
		  <ul class="big_menu">
		     <li>카테고리 <i class="fa-solid fa-caret-down" style="color: #000000;"></i>
		      <ul class="small_menu">
		         <li><a href="${pageContext.request.contextPath}/product/category?category_code=1">&#127806;쌀 및 잡곡</a></li>
			     <li><a href="${pageContext.request.contextPath}/product/category?category_code=2">&#127822;과일</a></li>
			     <li><a href="${pageContext.request.contextPath}/product/category?category_code=3">&#127807;채소</a></li>
			     <li><a href="${pageContext.request.contextPath}/product/category?category_code=4">&#128031;수산물</a></li>
			     <li><a href="${pageContext.request.contextPath}/product/category?category_code=5">&#127830;축산물</a></li>
		      </ul>
		    </li>
			 <li><a href="${pageContext.request.contextPath}/center/list">고객센터</a></li>
			 <li><a href="javascript:chattingOpen()">채팅</a></li>
			 
		  </ul>
		</nav>
	</div>
	</c:if>
	<script>
	  $(document).ready(function(){
	    $('.menu-btn').click(function() {
	      $('.side-menu').toggleClass('active');
	      $('.menu-overlay').fadeToggle();
	    });
	    
	    $('.menu-overlay').click(function() {
	      $('.side-menu').removeClass('active');
	      $(this).fadeOut();
	    });
	    $('.inputSearch').keypress(function(event) {
	        if (event.which == 13) { // 엔터 키를 눌렀을 때
	            $(this).blur(); // 입력 필드에서 포커스 해제
	            $('#searchForm').submit(); // 폼 제출
	        }
	    });
	    
	    $('.small_menu').hide();

		  $('.big_menu > li').on('click', function() {
		    $(this).children('.small_menu').slideToggle(300);
		    $(this).siblings().children('.small_menu').slideUp(300);
		    $(this).toggleClass('open');
		    $(this).siblings().removeClass('open');
		  });
	    
	  });
	</script>

</body>
</html>
