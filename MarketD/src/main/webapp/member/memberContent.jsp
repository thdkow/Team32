<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ page import ="com.team.marketd.domain.MemberVo" %>

<%MemberVo mv = (MemberVo)request.getAttribute("mv"); %>
<div class="container">

	<div class="row">

		<div class="col-lg-3 ">
			<img class="rounded d-block mt-5" alt="판매하기" height="80" width="255"
				src="image/btn_sub.jpg">
			<div class="list-group">
				<div href="#" class="list-group-item menu-item mt-5">
					<a href="#">마이페이지</a>
				</div>
				<div href="#" class="list-group-item menu-item">
					<a href="#">장바구니</a>
				</div>
				<div href="#" class="list-group-item menu-item">
					<a href="#">구매내역</a>
				</div>
				<div href="#" class="list-group-item menu-item">
					<a href="#">판매내역</a>
				</div>

			</div>

		</div>
		<!-- /.col-lg-3 -->



		<div class="col-lg-5 my-5">
			<h1>마이페이지</h1>
			<div class="row my-4">
			<form action="memberCheck.dobby" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th scope="row" class="text-center">아 이 디</th>
							<td><%=mv.getMid() %></td>
						</tr>
						<tr>
							<th scope="row" width="100px" class="text-center">비밀번호</th>
							<td><input type="password" name="pwd" size="13"></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">이    름</th>
							<td><%=mv.getMpwd() %></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">생년월일</th>
							<td><%=mv.getMbirth() %></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">성    별</th>
							<td><%=mv.getMsex() %></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">이 메 일</th>
							<td><%=mv.getMmail() %></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">휴대전화</th>
							<td><%=mv.getMtell() %></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">거래 계좌</th>
							<td><%=mv.getMaccount() %></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">카톡 ID</th>
							<td><%=mv.getMkakao() %></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">인증 질문</th>
							<td><%=mv.getMquestion() %></td>
						</tr>
					</tbody>
				</table>	
				<div class="col align-self-end"> 
				<button type="submit" class="float-right btn btn-outline-primary">수정</button>
			</div>		
			</form>
							
			</div>
			<!-- End your code here -->
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>