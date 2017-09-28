<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="col-md-7 ">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>User Profile</h4>
				</div>
				<div class="panel-body">

					<div class="box box-info">

						<div class="box-body">
							<div class="col-sm-6">
								<div align="center">
									<img alt="User Pic"
										src="${member.profilePic }"
										id="profile-image1" class="img-circle img-responsive"> <input
										id="profile-image-upload" class="hidden" type="file">
									<div style="color: #999;">click here to change profile
										image</div>
									<!--Upload Image Js And Css-->
								</div>

								<br>

								<!-- /input-group -->
							</div>
							<div class="col-sm-6">
								<h4 style="color: #00b1b1;">Comment</h4>
								<span>${member.comment }</span>
							</div>
							<div class="clearfix"></div>
							<hr style="margin: 5px 0 5px 0;">


							<div class="col-sm-5 col-xs-6 tital ">Member ID :</div>
							<div class="col-sm-7 col-xs-6 ">${member.memberid }</div>
							<div class="clearfix"></div>
							<div class="bot-border"></div>

							<div class="col-sm-5 col-xs-6 tital ">Member Name :</div>
							<div class="col-sm-7">${member.membername }</div>
							<div class="clearfix"></div>
							<div class="bot-border"></div>

							<!-- /.box-body -->
						</div>
						<br>
						<br>
						<br>
						<div class="box-button" align="right">
							<a href="edit" class="btn btn-info">Edit</a> 
							<a href="delete" class="btn btn-danger">Delete</a>
						</div>
						<!-- /.box -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>