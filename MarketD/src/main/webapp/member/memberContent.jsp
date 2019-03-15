<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ page import ="com.team.marketd.domain.MemberVo" %>

<c:set var="mv" value="${mv}" />

<div class="container">

	<div class="row">

			<%@include file="../include/menuNavigation2.jsp"%>


		<div class="col-lg-5 my-5">
			<h1>마이페이지</h1>
			<div class="row my-4">
			<form action="memberCheck.dobby" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th scope="row" class="text-center">아 이 디</th>
							<td>${mv.mid}</td>
						</tr>
						<tr>
							<th scope="row" width="100px" class="text-center">비밀번호</th>
							<td><input type="password" name="pwd" size="13"></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">이    름</th>
							<td>${mv.mpwd}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center">생년월일</th>
							<td>${mv.mbirth}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center">성    별</th>
							<td>${mv.msex}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center">이 메 일</th>
							<td>${mv.mmail}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center">휴대전화</th>
							<td>${mv.mtell}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center">거래 계좌</th>
							<td>${mv.maccount}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center">카톡 ID</th>
							<td>${mv.mkakao}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center">인증 질문</th>
							<td>${mv.mquestion}</td>
						</tr>
					</tbody>
				</table>	
				<div class="col align-self-end"> 
				<button type="submit" class="float-right btn btn-outline-primary">확인</button>
			</div>		
			</form>
							
			</div>
			<!-- End your code here -->
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>