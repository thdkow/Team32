<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
    <div class="id">
	  이름<input class="box">
	</div>
	<div class="birth">
	  생년월일<input class="box">
    </div>
    <div class="questio">
	  인증질문<input class="box">
    </div>
  </div>
  
  <div class="under">
  <input class="btn" type="button" value="확인">
  <input class="btn" type="button" value="취소">
  </div>
  </form>
</div>

</body>
</html>