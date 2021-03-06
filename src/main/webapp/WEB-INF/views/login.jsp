<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<c:import url="side_menu.jsp"></c:import>
	<div class="container">
		<form class="form-signin" action="login" method="post">
			<h2 class="form-signin-heading">Member login</h2>
			<label for="inputMemberid" class="sr-only">Member Id</label> 
			<input type="text" id="memberid" class="form-control" name="memberid"
				placeholder="Member Id" required autofocus> 
			<label for="inputPassword" class="sr-only">Password</label> 
			<input type="password" id="inputPassword" class="form-control"
				name="password" placeholder="Password" required>
			<c:if test="${not empty error }">
				<br>
				<div align="center">
				<span class="label label-danger" id="result">${login.error }</span>
				</div>
				<br>
			</c:if>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
				<a href="join" class="btn btn-info btn-block btn-lg">Join</a>
		</form>
	</div>

</body>
</html>