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
		if ($("#subject").val() == ""){
			$("#sid").html("아이디을 입력하세요");
			$("#sid").css("color","red");
			return;
		}else if ($("#content").val() == ""){
			$("#cid").html("이름을 입력하세요");
			$("#sid").html("");
			$("#cid").css("color","red");
			return;
		}else if ($("#writer").val() == ""){
			$("#wid").html("인증질문를 입력하세요");
			$("#cid").html("");
			$("#wid").css("color","red");
			return;
		}							
		
		var frm = document.form1;
		frm.action ="${contextPath}/Board/boardWriteAction.do";
		frm.method ="post";
		frm.submit();		
		
		return;
		
	});				
});
</script>

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
/* 링크에서 밑줄 없애기 */
a.box { text-decoration:none;
		color:black;}

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
	  아이디<input class="box">
	</div>
	<div class="birth">
	  이름<input class="box">
    </div>
    <div class="questio">
	  인증질문<input class="box">
    </div>
  </div>
  
  <div class="under">
  <input class="btn" type="button" id="save"onclick="save();" value="확인">
  <input class="btn" type="button" value="취소">
  </div>
  </form>
</div>
</body>
</html>