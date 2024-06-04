<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/footer.css?after">
<script src="https://kit.fontawesome.com/a2a3cabe39.js" crossorigin="anonymous"></script>
<title></title>
</head>
<body style="position: static;bottom: 0px;">
	<div class="footer">
		<div class="col-1">
			<h3>USEFUL LINKS</h3>
			<a href="#">About</a>
			<a href="#">Services</a>
			<a href="#">Contact</a>
			<a href="#">Shop</a>
			<a href="#">Blog</a>
		</div>
		<div class="col-2">
			<h3>NEWSLETTER</h3>
			<form>
				<input name="email" type="email" placeholder="Your Email Address" required>
				<br>
				<button type="submit">SUBSCRIBE NOW</button>
			</form>
		</div>
		<div class="col-3">
			<h3>CONTACT</h3>
			<p>123, XYZ ROAD, BSK 3 <br>Bangalore, Karnataka, IN</p>
			<div class="social-icons">
				<i class="fab fa-facebook"></i>
				<i class="fab fa-twitter"></i>
				<i class="fab fa-instagram"></i>
			</div>
		</div>
		
	</div>
</body>
</html>