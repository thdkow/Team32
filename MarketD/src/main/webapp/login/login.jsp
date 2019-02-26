<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(document).ready(function(){
	$("#save").click(function(){
//		alert("버튼클릭");
		if ($(".id").val() == ""){
			$("#sid").html("아이디을 입력하세요");
			$("#sid").css("color","red");
			return;
		}else if ($(".pwd").val() == ""){
			$("#cid").html("비밀번호을 입력하세요");
			$("#sid").html("");
			$("#cid").css("color","red");
			return;
		}						
		
		var frm = document.form1;
		frm.action ="${contextPath}/Board/boardWriteAction.dobby";
		frm.method ="post";
		frm.submit();		
		
		return;
		
	});				
});
</script>

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
a {
	text-decoration:none;
}
</style>
</head>
<body>
<div class="loginbox">
  
  <form action="">
  <div class="under">
    <div class="id box">
	  아이디 <input class="">
	</div>
	<div class="pwd box">
	  비밀번호<input class="">
    </div>
  </div>
  
  <div >
    <a href="lookingid.dobby">아이디</a>
    <a href="lookingpwd.dobby">/ 비밀번호 찾기</a>
    <input type="checkbox" id="autologin">자동로그인
  </div>
  
  <div class="under">
  <input class="btn" type="button"  id = "save" onclick="save();" value="로그인">
  <input class="btn" type="button" value="취소">
  </div>
  </form>
</div>
</body>
</html>