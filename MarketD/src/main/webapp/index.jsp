<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/include/header.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
			<!-- Bootstrap CSS 풀스크린 관련-->
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link href="/SRC2/fadeslide/assets/css/main.css" rel="stylesheet" media="screen"/>

<!-- 스크린  -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	
<title>Insert title here</title>
	<!-- jQuery 풀 스크린 슬라이드 쇼-->
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <!-- Client JavaScript -->
    <script src="/SRC2/fadeslide/assets/js/jquery.reslider.js"></script>
</head>
<body>
메인 화면
가상주소 : dobby
리소스 : resources (js,css)
뷰단 : include(head,foot)는 이 위치
회원 관련 : member

<div class="wrapper" id="myAnchor" >
</div><!-- TOP버튼  -->
<div class="wrap wrap-index">
            <!-- slider-->
            <div class="slider">
                <div class="jquery-reslider">
                    <div class="slider-block" data-url="\resources\img\logodobby.png"> Slide 1</div>
                    <div class="slider-block" data-url="\resources\img\logodobby.png"></div>
                    <div class="slider-block" data-url="\resources\img\logodobby.png"></div>
                    <div class="slider-block" data-url="http://www.blueb.co.kr/SRC2/_image/05.jpg"></div>

                    <div class="slider-direction slider-direction-next"></div>
                    <div class="slider-direction slider-direction-prev"></div>

                    <div class="slider-dots">
                      <ul>

                      </ul>
                    </div>
                </div>
            </div>
            <!-- end build-->
        </div>
        
        <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!--페이지-->

	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w01.jpg" style="width:100%" alt="First slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 1</h1>
					<p>텍스트 1</p>
				</div>
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg" style="width:100%" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 2</h1>
					<p>텍스트 2</p>
				</div>
			</div>
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 3</h1>
					<p>텍스트 3</p>
				</div>
			</div>
		</div>
		<!--슬라이드3-->
	</div>
	
	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>
</body>
</html>