<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Side Menu</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/moblie-userheader.css?after"> 
  <style type="text/css">
	.moblie_small_menu li {
	  border-bottom: 0px !important;
	}
  </style>
</head>
<body oncontextmenu="return false" onselect="return false" ondragstart="return false">
	<div class="moblie-adminheader-body" style="background-color: black;">
		<div class="moblie-top-menu">
			<div class="logo-container">
				<strong style=" align-content:center;text-align:center;">
					<a href="${pageContext.request.contextPath}/admin" class="logoText rajdhani-light" style="text-decoration:none;font-size: x-large;"><img alt="" src="${pageContext.request.contextPath}/resources/img/darkmode_logo.png" height="40px;"></a>
				</strong>
			</div>
			<div class="menu-btn"><i class="fas fa-bars" style="color: #ffffff;"></i></div>
		</div>
		<div class="menu-overlay"></div>
		<nav class="side-menu">
		  <header>
		    <h2>Menu</h2>
		    <a href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-arrow-right-from-bracket" style="color: #ffffff;"></i></a>&nbsp;&nbsp;&nbsp;
		  </header>
		  <ul class="moblie_big_menu">
		  
		  <li>홈페이지 관리 <i class="fa-solid fa-caret-down" style="color: #000000;"></i>
		    <ul class="moblie_small_menu">
		      <li><a href="${pageContext.request.contextPath}/admin/banner">베너목록</a></li>
		    </ul>
		  </li>
	  
		  <li>상품관리 <i class="fa-solid fa-caret-down" style="color: #000000;"></i>
		    <ul class="moblie_small_menu">
		      <li><a href="${pageContext.request.contextPath}/admin/product/list">상품목록</a></li>
		      <li><a href="${pageContext.request.contextPath}/admin/product/add">상품등록</a></li>
		      <li><a href="${pageContext.request.contextPath}/admin/product/review">상품후기 조회</a></li>
		      <li><a href="${pageContext.request.contextPath}/admin/product/ask">상품문의 조회</a></li>
		    </ul>
		  </li>
		  <li>회원관리<i class="fa-solid fa-caret-down" style="color: #000000;"></i>
		    <ul class="moblie_small_menu">
		      <li><a href="${pageContext.request.contextPath}/admin/user/list">회원목록</a></li>
		      <li><a href="${pageContext.request.contextPath}/admin/centerList">고객문의목록</a></li>
		    </ul>
		  </li>
		  <li>주문관리 <i class="fa-solid fa-caret-down" style="color: #000000;"></i>
		    <ul class="moblie_small_menu">
		      <li><a href="${pageContext.request.contextPath}/admin/order/list">판매내역목록</a></li>
		      <li><a href="${pageContext.request.contextPath}/admin/order/delivery">배송상태변경</a></li>
			  <li><a href="${pageContext.request.contextPath}/admin/order/refundlist">환불요청목록</a></li>
		    </ul>
		  </li>
		  </ul>
		</nav>
	</div>
	
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
	    $('.moblie_small_menu').hide();

		  $('.moblie_big_menu > li').on('click', function() {
		    $(this).children('.moblie_small_menu').slideToggle(300);
		    $(this).siblings().children('.moblie_small_menu').slideUp(300);
		    $(this).toggleClass('open');
		    $(this).siblings().removeClass('open');
		  });
	  });
	</script>
</body>
</html>
