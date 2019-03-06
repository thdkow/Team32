<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>메인페이지</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="/resources/css/shop-homepage.css" rel="stylesheet" type="text/css">
<!-- ${myContextPath} -->
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color:#c7bfe8;">
		<div class="container">
			<a class="navbar-brand" href="/"><img alt="도비마켓" height="41"
				width="215" src="/resources/img/logodobby.jpg"></a>
			<form class="form-inline">
				<input class="form-control mr-sm-2 " type="search"
					placeholder="어떤 물건을 찾으시나요?" aria-label="Search" size="40">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="row">

				<div class="collapse navbar-collapse span9" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="/Product/productPaymentHistory.dobby">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="/Product/ProductContent.dobby">고객센터</a></li>
					</ul>
				</div>
				<div class="btn-group span3">
					<button class="btn btn-secondary">로그인</button>
					<button class="btn btn-secondary">회원가입</button>
				</div>
			</div>
		</div>
	</nav>
<a href="#myAnchor" class="go-top">▲</a>
<div class="wrapper" id="myAnchor" >
</div><!-- TOP버튼  -->