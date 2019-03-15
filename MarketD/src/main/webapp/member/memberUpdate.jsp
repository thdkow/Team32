<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ page import ="com.team.marketd.domain.MemberVo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="mv" value="${mv}" />


<div class="container">

	<div class="row">

		<%@include file="../include/menuNavigation2.jsp"%>



		<div class="col-lg-7 my-5">
			<h1>내정보 수정</h1>
			<div class="row clearfix my-4">
			<form action="memberUpdate.dobby" method="post">
				<table class="table">
					<input type="hidden" value="${mv.midx}" name="midx">
					<tbody>
						<tr>
							<th scope="row">아 이 디</th>
							<td>${mv.mid}</td>
						</tr>
								<tr>
							<th scope="row">이름</th>
							<td>${mv.mname}</td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td><input type="password" name="pwd" size="7"></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인</th>
							<td><input type="password" name="pwd2" size="7"></td>
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
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select>- <input type="text" size="4" maxlength="4" name="phone2">- <input
								type="text" size="4" maxlength="4" name="phone3"></td>
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
							<td><select>
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
					</tbody>
				</table>
				<div class="col align-self-end">
				<button class="float-right btn btn-outline-danger" onclick="location.href='index.jsp'">취소</button>
				<button type="submit" class="float-right btn btn-outline-primary mr-3">수정</button>
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