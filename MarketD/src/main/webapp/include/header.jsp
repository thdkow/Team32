<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />	
	<title>DobbyMarket</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript" src=".\resources\js\header.js"></script>
	<link rel="stylesheet"  type="text/css" href=".\resources\css\header.css"/>
	<link rel="stylesheet"  type="text/css" href=".\resources\css\header_top.css"/>
		<!-- type="text/css" 추가 후 CSS링크 인식함 -->

</head>
<body>
<a href="/"><img src="\resources\img\logodobby.png" alt="도비마켓"/></a> 
<div id="search">
	<span class="green_window">
	<input id="query" name="query" type="text" title="검색어 입력" class="input_text" tabindex="1" accesskey="s" onclick="document.getElementById('fbm').value=1;" />
	</span>
	<input type="image" alt="검색" src="http://wstatic.naver.com/w9/btn_sch.gif" class="btn"/>
</div>
  <!--로그인/회원가입 -->
  <a href="#" class="button-3d">로그인</a>
  <a href="#" class="button-3d">회원가입</a>
  
<form action="">
	<nav>
		<div class="container">
	    	<ul>
		      <li><a href="#">내정보</a></li>
		      <li><a href="#">장바구니</a></li>
		     <li><a href="#">구매내역<i class='fa fa-angle-down'></i></a>
	       		 <ul>
			          <li><a href="https://www.hellomarket.com/">판매내역</a></li>
			          <li><a href="https://www.hellomarket.com/">구매요청</a></li>
			          <!-- <li><a href="#">Category Three</a></li> -->
	        	</ul>
	      	</li>
	      <li class='sub-menu'> <a href="#">판매내역<i class='fa fa-angle-down'></i></a>
	        <ul>
	          <li><a href="https://www.hellomarket.com/">판매내역</a></li>
	          <li><a href="https://www.hellomarket.com/">구매요청</a></li>
	<!--           <li><a href="#">Service Three</a></li>
	          <li><a href="#">Service Four</a></li>
	          <li><a href="#">Service Five</a></li>
	          <li><a href="#">Service Six</a></li> -->
	        </ul>
	      </li>
	      <li><a href="https://www.hellomarket.com/">공지사항</a></li>
	      <li><a href="https://www.hellomarket.com/">고객센터</a></li>
	    </ul>
	  </div>
	</nav>
</form>
<a href="#myAnchor" class="go-top">▲</a>

</body>
</html>
