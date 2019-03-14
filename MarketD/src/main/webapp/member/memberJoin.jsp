<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
<c:set var="mv" value="${mv}" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#panel1").slideToggle(0);

		$("#flip1").click(function() {
			$("#panel1").slideToggle("700");
		});
		
		
		$('#idCheck').click(function() {
			var id = $('#id').val();
			
			$.ajax({
				type : "GET",
				url : "/Member/"+id+"/idCheck.dobby",
				datatype : "json",
				cache : false,
				error : function() {
					alert("error");
				},
				success : function(data) {
					/* var cnt_data = JSON.stringify(data); json 객체를 string 타입으로 형변환 하는 메소드*/ 
				cnt_data = data.cnt; //.cnt를 통해서 HashMap에 담아준 cnt 객체의 리턴값을 뽑아온다
					if(data.cnt == 1){
						alert("이미 존재하는 아이디입니다.");
						
/* 	document.getElementById("idCheck").btn btn-outline-success = "btn btn-outline-danger"; */						
						 return;
					}else if(data.cnt == 0){
						alert("사용 가능한 아이디 입니다.");
						return;
					} //조건문 끝
				} //success 끝
			});//ajax 끝
		});
		
	});
	
	//jquery id는 : '#id', class는 :'.id'

</script>
<%--  <script>
	function idcheck(){
		alert("중복체크실행?");
		var frm = document.form1;
		var id = frm.id.value;
		
		frm.action = "<%=request.getContextPath() %>idCheck.dobby";
		frm.method = "post"; // post 방식으로 데이터 전달 post:  파라미터에 노출이안됨 get: 파라미터에 노출됨
		frm.submit();
		return;
}
</script>  --%>
<script type="text/javascript">
	function check() {
		//var id2 = document.getElementsByName("id")[0].value;
		var frm = document.form1;
		var id = frm.id.value;
		var pwd = frm.pwd.value;
		var pwd2 = frm.pwd2.value;
		var name = frm.name.value;
		var birth = frm.birth.value;
		var sex = frm.sex.value;
		var mmail1 = frm.mmail1.value;
		var mmail2 = frm.mmail2.value;
		var phone1 = frm.phone1.value;
		var phone2 = frm.phone2.value;
		var phone3 = frm.phone3.value;
		var caidx = frm.caidx.value;
		var maccount = frm.maccount.value;
		var mkakao = frm.mkakao.value;
		var question = frm.question.value;
		var mquestion = frm.mquestion.value; 
		
	 	if (id == "") {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return;
		}else if(cnt_data == 1){
			alert("다른 아이디를 입력해주세요.")
			frm.id.focus();
			return;
		}else if (pwd == "") {
			alert("비밀번호를 입력하세요");
			frm.pwd.focus();
			return;
		}else if (pwd2 == "") {
			alert("비밀번호 확인을 입력하세요");
			frm.pwd2.focus();
			return;
		}else if (pwd != pwd2) {
			alert("비밀번호가 일치하지않습니다.");
			frm.pwd.value = "";
			frm.pwd2.value = "";
			frm.pwd.focus();
			return;
		}else if (name == "") {
			alert("이름을 입력하세요");
			frm.name.focus();
			return;
		}else if (birth == "") {
			alert("생년월일를 입력하세요.");
			frm.birth.focus();
			return;
		}else if (isNaN(birth) == true) {
			alert("생년월일은 숫자만 입력하세요.");
			frm.birth.value = "";
			frm.birth.focus();
			return;
		}else if ( sex == ""){
			alert("본인의 성별을 선택해주세요.");
			frm.sex.focus();
			return;
		}else if ( mmail1 ==""){
			alert("본인의 이메일을 입력해주세요.");
			frm.mmail1.focus();
			return;
		}else if (mmail2 == ""){
			alert("본인의 이메일을 선택해주세요.");
			frm.mmail2.focus();
			return;
		}else if (phone1 ==""){
			alert("휴대폰 번호 앞자리를 선택해주세요.");
			frm.phone1.focus();
			return;
		}else if(phone2 == ""){
			alert("휴대폰 번호 가운데 4자리를 입력해주세요.");
			frm.phone2.focus();
			return;
		}else if(isNaN(phone2) == true){
			alert("휴대폰 번호는 숫자만 입력해주세요.");
			frm.phone2 = "";
			frm.phone2.focus();
			return;
		}else if(phone3 == ""){
			alert("휴대폰 번호 마지막 4자리를 입력해주세요.");
			frm.phone3.focus();
			return;
		}else if(isNaN(phone3) == true){
			alert("휴대폰 번호는 숫자만 입력해주세요.");
			frm.phone3 = "";
			frm.phone3.focus();
			return;
		}else if(caidx == ""){
			alert("거래계좌를 선택해주세요.");
			frm.cadix.focus();
			return;
		}else if(maccount == ""){
			alert("계좌번호를 입력해주세요.");
			frm.maccount.focus();
			return;
		}else if(isNaN(maccount) == true){
			alert("계좌번호는 숫자만 입력해주세요.");
			frm.maccount = "";
			frm.maccount.focus();
			return;
		}else if(mkakao == ""){
			alert("카카오톡 아이디를 입력해주세요.")
			frm.mkakao.focus();
			return;
		}else if(mquestion ==""){
			alert("인증 질문답변을 입력해주세요.");
			frm.mquestion.focus();
			return;
		} 
	 	
		frm.action = "/MemberJoinAction.dobby";
		frm.method = "post"; // post 방식으로 데이터 전달 post:  파라미터에 노출이안됨 get: 파라미터에 노출됨
		frm.submit();
		return;
	}
</script>
<div class="container">

	<div class="row">

		<%@include file="../include/menuNavigation2.jsp"%>



		<div class="col-lg-7 my-5">
			<h1>내정보 수정</h1>
			<div class="row clearfix my-4">
				<form name="form1">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">아 이 디</th>
								<td><input type="text" id="id" name="id" size="7"
									class="mr-2">
									<button type="button" id="idCheck" name="idCheck"
										class="btn btn-outline-success" style="font-size: 12px;"
										onclick="idCheck();">중복체크</button></td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td><input type="password" id="pwd" name="pwd" size="7"></td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인</th>
								<td><input type="password" id="pwd2" name="pwd2" size="7"></td>
							</tr>
							<tr>
								<th scope="row">이 름</th>
								<td><input type="text" name="name" size="7"></td>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td><input type="text" name="birth" size="6" maxlength="6"></td>
							</tr>
							<tr>
								<th scope="row">성 별</th>
								<td><input type="radio" name="sex" value="M" />남&nbsp;&nbsp;&nbsp;<input
									type="radio" name="sex" value="F" />여</td>
							</tr>

							<tr>
								<th scope="row">이 메 일</th>
								<td><input type="text" name="mmail1" size="9"> @<select
									style="margin-right: 10px" id="selectEmail" name="mmail2"
									size="1" width="100px">
										<option value="" selected="">이메일을 선택해주세요</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="outlook.com">outlook.com</option>
										<option value="yahoo.com">yahoo.com</option>
										<option value="daum.com">daum.com</option>
										<option value="aol.com">aol.com</option>
										<option value="nate.com">nate.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="epost.kr">epost.kr</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="1">직접 입력</option>
								</select> <input type="text" id="str_email02" name="mmail3" size="9"
									disabled=""></td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
								<td><select name="phone1">
										<option value="">선택</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select>- <input type="text" name="phone2" size="4" maxlength="4">-
									<input type="text" name="phone3" size="4" maxlength="4"></td>
							</tr>
							<tr>
								<th scope="row">거래 계좌</th>
								<td><select name="caidx">
										<option value="">은행 선택</option>
										<option value="1">하나은행</option>
										<option value="2">신한은행</option>
										<option value="3">농협</option>
										<option value="4">IBK기업은행</option>
										<option value="5">외환은행</option>
										<option value="6">KB국민은행</option>
										<option value="7">우리은행</option>
										<option value="8">새마을금고</option>
								</select> <input type="text" name="maccount" size="20"></td>
							</tr>
							<tr>
								<th scope="row">카톡 아이디</th>
								<td><input type="text" name="mkakao" size="10"></td>
							</tr>
							<tr>
								<th scope="row">인증 질문</th>
								<td><select name="question">
										<option value="">질문을 선택해주세요</option>
										<option value="1">아버지의 성함은?</option>
										<option value="2">내가 태어난 곳은?</option>
										<option value="3">내 어렸을 때 별명은?</option>
										<option value="4">내 보물 1호는?</option>
										<option value="5">나의 첫사랑은?</option>
										<option value="6">나의 좌우명은?</option>
										<option value="7">내가 제일 좋아하는 음식은?</option>
										<option value="8">내가 가장 흥미로워하는 장소는?</option>
								</select> <input type="text" name="mquestion" size="10"></td>
							</tr>
							<tr>
								<td colspan="2" id="flip1"><p
										style="font-size: 15px; text-align: center;">이용약관▼</p></td>
							</tr>
							<tr id="panel1">
								<td colspan="2">제 1 장 총 칙<br /> 제 1 조 (목적)본 약관은 서비스 이용자가
									주식회사 (이하 “회사”라 합니다)가 제공하는 온라인상의 인터넷 서비스(이하 “서비스”라고 하며, 접속 가능한
									유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는 모든 “서비스”를 의미합니다. 이하
									같습니다)에 회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에 동의하고 회원등록을 완료한 서비스
									이용자를 말합니다. 이하 “회원”이라고 합니다)의 권리•의무
								</td>
							</tr>
							<tr>
								<td colspan="2"><input type="checkbox">&nbsp;약관동의</td>
							</tr>
						</tbody>
					</table>
					<div class="col align-self-end">
						<button type="button" class="float-right btn btn-outline-danger"
							onclick="location.href='index.jsp'">취소</button>
						<input type="button"
							class="float-right btn btn-outline-primary mr-3" value="가입"
							onclick="check();" />
					</div>
				</form>
			</div>
			<!-- End your code here -->
		</div>
	</div>
</div>

<script>
	$('#selectEmail').change(function() {
		$("#selectEmail option:selected").each(function() {
			if ($(this).val() == '1') { //직접입력일 경우 
				$("#str_email02").val(''); //값 초기화 
				$("#str_email02").attr("disabled", false); //활성화
			} else { //직접입력이 아닐경우 
				$("#str_email02").val($(this).text()); //선택값 입력
				$("#str_email02").attr("disabled", true); //비활성화 
			}
		});
	});
</script>
<%@include file="../include/footer.jsp"%>