<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<c:import url="side_menu.jsp"></c:import>
	<div class="container">
		<!-- main -->
		<div class="main-agileits">
			<h1>Member Login</h1>
			<div class="mainw3-agileinfo">
				<!-- login form -->
				<div class="login-form">
					<div class="login-agileits-top">
						<form action="login" method="post">
							<p>Username</p>
							<input id="input1" type="text" class="name" name="memberid"
								placeholder="Member ID" required="" />
							<p>Password</p>
							<input id="input2" type="password" class="password"
								name="password" required="" /> <label class="anim"> <input
								type="checkbox" class="checkbox" /> <span> Remember me ?</span>
							</label> <input type="submit" value="Login">
						</form>
					</div>
					<!-- <div class="login-agileits-bottom">
						<h6>
							<a href="#">Forgot password?</a>
						</h6>
					</div> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>