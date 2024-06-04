<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/testadminHeader.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<title></title>
<style>
.sidebar {
  height: 100vh;
  width: 200px;
  position: fixed;
  top: 0;
  left: 0;
  background-color: #111;
  color: white;
  overflow-x: hidden;
  padding-top: 30px;
  list-style: none;
}
.small_menu {
	padding-top: 5px;
}
.big_menu > li {
  padding: 13px 16px;
  cursor: pointer;
  border-bottom: 1px solid #444; 
}

.big_menu, .small_menu {
  list-style-type: none;
  padding-left: 0;
  margin: 0;
}

.small_menu li a {
  color: white;
  padding: 13px 16px;
  text-decoration: none;
  display: block;
}

.big_menu > li.open > .small_menu {
  display: block;
}

.big_menu li a:hover,
.big_menu > li:hover {
  color: rgb(229,170,163); 
}
.none a:hover {
  background-color: rgb(151,151,151,0.1);
}
</style>
<!-- Sidebar toggle script -->
<script>
$(document).ready(function(){
	  $('.small_menu').hide();

	  $('.big_menu > li').on('click', function() {
	    $(this).children('.small_menu').slideToggle(300);
	    $(this).siblings().children('.small_menu').slideUp(300);
	    $(this).toggleClass('open');
	    $(this).siblings().removeClass('open');
	  });
	});
</script>
</head>
<body oncontextmenu="return false" onselect="return false" ondragstart="return false">
<div class="sidebar">
  <!-- Sidebar content -->
  <ul class="big_menu">
  <li style="text-align: right; font-size: small;"><a href="${pageContext.request.contextPath}/logout" style="color: white; text-decoration: none;"><b>LOGOUT</b></a></li>
  <li class="none" >
  <a href="${pageContext.request.contextPath}/admin" style="color: white; text-decoration: none; font-size: x-large;"><b>BELLEAF</b></a>
  
  </li>
  <li><i class="fa-solid fa-house-chimney"></i>&nbsp;&nbsp;&nbsp;홈페이지 관리 <i class="arrow fas fa-angle-right"></i>
      <ul class="small_menu">
        <li><a href="${pageContext.request.contextPath}/admin/banner">베너목록</a></li>
      </ul>
    </li>
  
    <li><i class="fas fa-box menu-item-icon"></i>&nbsp;&nbsp;&nbsp;상품관리 <i class="arrow fas fa-angle-right"></i>
      <ul class="small_menu">
        <li><a href="${pageContext.request.contextPath}/admin/product/list">상품목록</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/product/add">상품등록</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/product/review">상품후기 조회</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/product/ask">상품문의 조회</a></li>
      </ul>
    </li>
    <li><i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp;회원관리 <i class="arrow fas fa-angle-right"></i>
      <ul class="small_menu">
        <li><a href="${pageContext.request.contextPath}/admin/user/list">회원목록</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/centerList">고객문의목록</a></li>
      </ul>
    </li>
    <li><i class="fa-regular fa-credit-card"></i>&nbsp;&nbsp;&nbsp;주문관리 <i class="arrow fas fa-angle-right"></i>
      <ul class="small_menu">
        <li><a href="${pageContext.request.contextPath}/admin/order/list">판매내역목록</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/order/delivery">배송상태변경</a></li>
      	<li><a href="${pageContext.request.contextPath}/admin/order/refundlist">환불요청목록</a></li>
      </ul>
    </li>
    <!-- Repeat for other menu items -->
  </ul>
</div>
</body>
</html>
