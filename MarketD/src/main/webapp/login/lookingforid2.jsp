<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 알려줌</title>
</head>
<style type="text/css">
boby {
  padding: 10%;
}
.loginbox{
  
  display: table;
  border: 1px solid red;
  padding: 10%;
}
.under{
  text-align: center
}
.box{
  border: 3px solid #ACFA58;
  color: black;
}
.link{
  text-decoration:none;
		color:#191919;
  background: #ACFA58;
}
.link:hover{
  filter: brightness(50%)
}
.btn{
  background: #ACFA58;
}
.btn:hover{
  filter: brightness(50%)
}
</style>
<body>
<div class="loginbox">
   
  <div class="under">
    <a href="lookingid.dobby" class="link">아이디 찾기</a>
    <a href="lookingpwd.dobby" class="link">비밀번호 찾기</a>
  </div>
  
  <form action="">
  <div class="under">
    <div class="">
	   고객님의 아이디는 "변수"입니다
	</div>
	
  </div>
  
  <div class="under">
 <a href="로그인주소.dobby"><input class="btn" type="button" value="로그인 하기"></a>
 <a href="lookinforpwd.dobby"><input class="btn" type="button" value="비밀번호 찾기"></a>
   </div>
  </form>
</div>
  

</body>
</html>