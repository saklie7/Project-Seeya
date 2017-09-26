<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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
			<form class="form-horizontal" action="write" method="post">
				<div class="form-group">
					<label for="title" class="control-label col-xs-2">Title</label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="title" name="title"
							value="${board.title }" required readonly="readonly">
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
							name="content" placeholder="Content" required readonly="readonly">${board.content }</textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="regDate" class="control-label col-xs-2">Date</label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="regDate"
							name="regDate" placeholder="Date" required
							value="<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate }" />"
							readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-offset-2 col-xs-10">
						<a href="<c:url value='/boards'/>" class="btn btn-primary">List</a>
						<c:if test="${not empty member && member.membername == board.writer }">
							<a href="/update/${board.bno }" class="btn btn-primary">Update</a>
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>