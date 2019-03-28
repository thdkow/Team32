<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.team.marketd.domain.MemberVo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
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
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/shop-homepage.css" rel="stylesheet">

<script type="text/javascript">
	
	window.onload = function() {
	    document.getElementById('btn').onclick = function() {
	  		
			var keyword = frm.keyword.value;
			if(keyword==""){
				
				 document.getElementById("keyword").value = 'empty';
				
			}
	    	
	        document.getElementById('frm').submit();
	        return false;
	    };
	};
	    
</script>


</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color:#c7bfe8;">
		<div class="container">
			<a class="navbar-brand" href="http://localhost/index.jsp"><img alt="도비마켓" height="41"
				width="215" src="/resources/img/logodobby.jpg"></a>
			<form name="frm" id="frm" class="form-inline" action="/Product/ProductList.dobby">
				<input class="form-control mr-sm-2 " type="search" id="keyword" name="keyword" value=""
					placeholder="어떤 물건을 찾으시나요?" aria-label="Search" size="40">
					
					<input type="hidden" name="caidx" value="1000">
					<input type="hidden" name="minPrice" value="0">
					<input type="hidden" name="maxPrice" value="0">
					
					
			</form>
					<button class="btn btn-outline-success my-2 my-sm-0"  id="btn">검색</button>

							
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="row">

				<div class="collapse navbar-collapse span9" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="/Notice/NoticeList.dobby">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="/Question/OftenList.dobby">고객센터</a></li>
					</ul>
				</div>
			<%
				if (session.getAttribute("midx") == null) {
					/* int	midx = (int)session.getAttribute("midx"); */
			%>
			<div class="btn-group span3">
					<button class="btn btn-secondary"
					onclick="location.href='/login.dobby'">로그인</button>
<!--<button class="btn btn-secondary" onclick="location.href='login2.dobby'">로그인</button> -->
				<button class="btn btn-secondary"
					onclick="location.href='/MemberJoin.dobby'">회원가입</button>
				<!--  &nbsp;&nbsp;<input type="checkbox" onclick="location.href='login.dobby'">자동 로그인</input>  -->
			</div>
			<%
				}
			%>
			<%
				if (session.getAttribute("midx") != null) {
			%>
			<div class="btn-group span3">
				<button class="btn btn-secondary"
					onclick="location.href='/memberProfile.dobby'">내정보</button>
				<button class="btn btn-secondary"
					onclick="location.href='/logoutAction.dobby'">로그아웃</button>
			</div>
			<%
				}
			%>
			</div>
		</div>
	</nav>