<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<div class="container">

	<div class="row">

		<%@include file="../include/menuNavigation2.jsp"%>

		<div class="col-lg-9 my-5">
				<table class="table my-5">
					<tbody>
						<tr>
							<th><img
									src="/resources/img/dobby2.png" height="150" width="150"
									alt=""></th>
							<td class="align-middle" style="font-size: 30px;">구매해주셔서 감사합니다.</td>
						</tr>
												<tr>
						<td colspan="2" class="text-center"><button type="button" class="btn btn-outline-primary" 
						onclick="location.href='/index.jsp'"  style="font-size: 20px;">확인</button></td>
						<tr>
					</tbody>
				</table>
		</div>
	</div>
</div>
<%@include file="/include/footer.jsp"%>