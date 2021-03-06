<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update</title>
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
		<div class="bs-example">
			<form class="form-horizontal" action="/update" method="post">
				<div class="form-group" hidden="hidden">
					<label for="bno" class="control-label col-xs-2">bno</label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="bno" name="bno"
							placeholder="bno" required value="${board.bno }">
					</div>
				</div>
				<div class="form-group">
					<label for="title" class="control-label col-xs-2">Title</label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="title" name="title"
							placeholder="Title" required value="${board.title }">
					</div>
				</div>
				<div class="form-group">
					<label for="writer" class="control-label col-xs-2">Writer</label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="writer" name="writer"
							placeholder="Writer" required value="${board.writer }"
							readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="content" class="control-label col-xs-2">Content</label>
					<div class="col-xs-10">
						<textarea class="form-control" rows="20" id="content"
							name="content" placeholder="Content" required>${board.content }</textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-offset-2 col-xs-10">
						<a href="<c:url value='/boards'/>" class="btn btn-primary">List</a>
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>