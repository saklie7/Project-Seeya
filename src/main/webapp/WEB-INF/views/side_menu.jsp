<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
@import
	url('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css')
	;

@media ( min-width :768px) {
	body {
		margin-top: 50px;
	}
	/*html, body, #wrapper, #page-wrapper {height: 100%; overflow: hidden;}*/
}

#wrapper {
	padding-left: 0;
}

#page-wrapper {
	width: 100%;
	padding: 0;
	background-color: #fff;
}

@media ( min-width :768px) {
	#wrapper {
		padding-left: 225px;
	}
	#page-wrapper {
		padding: 22px 10px;
	}
}

/* Top Navigation */
.top-nav {
	padding: 0 15px;
}

.top-nav>li {
	display: inline-block;
	float: left;
}

.top-nav>li>a {
	padding-top: 20px;
	padding-bottom: 20px;
	line-height: 20px;
	color: #fff;
}

.top-nav>li>a:hover, .top-nav>li>a:focus, .top-nav>.open>a, .top-nav>.open>a:hover,
	.top-nav>.open>a:focus {
	color: #fff;
	background-color: #1a242f;
}

.top-nav>.open>.dropdown-menu {
	float: left;
	position: absolute;
	margin-top: 0;
	/*border: 1px solid rgba(0,0,0,.15);*/
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	background-color: #fff;
	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
}

.top-nav>.open>.dropdown-menu>li>a {
	white-space: normal;
}

/* Side Navigation */
@media ( min-width :768px) {
	.side-nav {
		position: fixed;
		top: 60px;
		left: 225px;
		width: 225px;
		margin-left: -225px;
		border: none;
		border-radius: 0;
		border-top: 1px rgba(0, 0, 0, .5) solid;
		overflow-y: auto;
		background-color: #222;
		/*background-color: #5A6B7D;*/
		bottom: 0;
		overflow-x: hidden;
		padding-bottom: 40px;
	}
	.side-nav>li>a {
		width: 225px;
		border-bottom: 1px rgba(0, 0, 0, .3) solid;
	}
	.side-nav li a:hover, .side-nav li a:focus {
		outline: none;
		background-color: #1a242f !important;
	}
}

.side-nav>li>ul {
	padding: 0;
	border-bottom: 1px rgba(0, 0, 0, .3) solid;
}

.side-nav>li>ul>li>a {
	display: block;
	padding: 10px 15px 10px 38px;
	text-decoration: none;
	/*color: #999;*/
	color: #fff;
}

.side-nav>li>ul>li>a:hover {
	color: #fff;
}

.navbar .nav>li>a>.label {
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	position: absolute;
	top: 14px;
	right: 6px;
	font-size: 10px;
	font-weight: normal;
	min-width: 15px;
	min-height: 15px;
	line-height: 1.0em;
	text-align: center;
	padding: 2px;
}

.navbar .nav>li>a:hover>.label {
	top: 10px;
}

.navbar-brand {
	padding: 5px 15px;
}
</style>
<div id="throbber" style="display: none; min-height: 120px;"></div>
<div id="noty-holder"></div>
<div id="wrapper">
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/"> <img src="./images/seeya.jpg" />
			</a>
		</div>
		<!-- Top Menu Items -->
		<ul class="nav navbar-right top-nav">
			<li><a href="#" data-placement="bottom" data-toggle="tooltip"
				href="#" data-original-title="Stats"><i
					class="fa fa-bar-chart-o"></i> </a></li>
			<c:if test="${not empty member }">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">${member.memberid }<b
						class="fa fa-angle-down"></b></a>
					<ul class="dropdown-menu">
						<li><a href="member"><i class="fa fa-fw fa-user"></i>
								Profile</a></li>
						<li><a href="#"><i class="fa fa-fw fa-cog"></i> Change
								Password</a></li>
						<li class="divider"></li>
						<li><a href="logout"><i class="fa fa-fw fa-power-off"></i>
								Logout</a></li>
					</ul></li>
			</c:if>
		</ul>
		<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li><a href="#" data-toggle="collapse" data-target="#submenu-1"><i
						class="fa fa-fw fa-search"></i> MEMBER MENU <i
						class="fa fa-fw fa-angle-down pull-right"></i></a>
					<ul id="submenu-1" class="collapse">
						<c:if test="${empty member }">
							<li><a href="/login"><i class="fa fa-angle-double-right"></i>
									Login</a></li>
							<li><a href="member/join"><i class="fa fa-angle-double-right"></i>
									Join </a></li>
						</c:if>
						<c:if test="${not empty member }">
							<li><a href="/logout"><i
									class="fa fa-angle-double-right"></i> Logout</a></li>
						</c:if>
					</ul></li>
				<li><a href="/boards"><i class="fa-fw fa fa-reorder"></i>
						Boards</a></li>
				<li><a href="sugerencias"><i
						class="fa fa-fw fa-paper-plane-o"></i> MENU 4</a></li>
				<li><a href="faq"><i class="fa fa-fw fa fa-question-circle"></i>
						MENU 5</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>

	<div id="page-wrapper">
		<div class="container-fluid">
			<!-- Page Heading -->
			<div class="row" id="main">
				<div class="col-sm-12 col-md-12 well" id="content">
					<h1>Welcome ${member.memberid }</h1>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">
	$(function() {
		$('[data-toggle="tooltip"]').tooltip();
		$(".side-nav .collapse").on(
				"hide.bs.collapse",
				function() {
					$(this).prev().find(".fa").eq(1).removeClass(
							"fa-angle-right").addClass("fa-angle-down");
				});
		$('.side-nav .collapse').on(
				"show.bs.collapse",
				function() {
					$(this).prev().find(".fa").eq(1).removeClass(
							"fa-angle-down").addClass("fa-angle-right");
				});
	})
</script>