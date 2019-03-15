<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@include file="../include/header.jsp"%>
<%@ page import="java.util.ArrayList"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:set var="alist" value="${requestScope.alist}"/>


<div class="container">

	<div class="row">

		<%@include file="../include/menuNavigation2.jsp"%>

		<div class="col-lg-9 my-5">
			<h1>장바구니</h1>
				<div class="row clearfix">

					<table class="table table-hover my-4">
						<thead>
							<tr>
								<th scope="col" class="text-center">상품</th>
								<th scope="col" class="text-center" width="500">상품정보</th>
								<th scope="col" class="text-center" width="150">판매자</th>
								<th scope="col" class="text-center" width="150">금액</th>
								<th scope="col" class="text-center" width="200">삭제</th>
							</tr>
						</thead>
						<tbody>
						
						

							<%-- 
									<c:forEach items="${alist}" var="alist2" varStatus="status" >
								
									
								</c:forEach> --%>
								
								<c:set var="totalpmoney" value="0"/>
								<c:set var="totalpfee" value="0"/>
						<c:forEach items="${alist}" var="alist2" varStatus="status" >
						<c:set var= "totalpfee" value="${totalpfee + alist2.pfee}"/>
						<c:set var= "totalpmoney" value="${totalpmoney + alist2.pmoney}"/>
							<tr>
								<td scope="row"><a href="#"> <img
										src="http://placehold.it/700x400" height="140" width="140"
										alt=""></a></td>
								<td><a href="/Product/ProductContent.dobby?pidx=${alist2.pidx}">
								${alist2.psubject}</a> <br /></td>
								<td class="text-center">${alist2.mname}</td>
								<td class="text-center">상품222:<br />${alist2.pmoney}원<br /> <br />배송비:<br />${alist2.pfee}원
								</td>
								<td class="text-center">담은 날 :<br />${fn:substring(alist2.sdate,0,10)} <br />
									<button type="button" 
									onclick="location.href='/Cart/shoppingCartDeleteProduct.dobby?sidx=${alist2.sidx}'" 
									class="btn btn-outline-danger my-2">빼기</button>
										
								</td>
							</tr>
							
							</c:forEach>	
						</tbody>
					</table>
				</div>
				<!-- /.row -->
				<h4>총 1개 상품</h4>
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="text-center">상품가격</th>
							<th scope="col"></th>
							<th scope="col" class="text-center">택배비</th>
							<th scope="col"></th>
							<th scope="col" class="text-center">할인</th>
							<th scope="col"></th>
							<th scope="col" class="text-center">합계</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center"><c:out value="${totalpmoney}"/>원</td>
							<td class="text-center"><img alt="+" height="25" width="25"
								src="/resources/img/plus.png"></td>
							<td class="text-center"><c:out value="${totalpfee}"/>원</td>
							<td class="text-center"><img alt="-" height="25" width="25"
								src="/resources/img/minus.png"></td>
							<td class="text-center">0원</td>
							<td class="text-center"><img alt="=" height="20" width="20"
								src="/resources/img/equal.png"></td>
							<td class="text-center"><c:out value="${totalpmoney+totalpfee}"/>원</td>
						</tr>
					</tbody>
				</table>
				<div class="row my-3 justify-content-center ">
					<button class="btn btn-outline-success" 
					onclick="location.href='/Cart/shoppingCartBatchPayment.dobby'">일괄결제</button>
				</div>
		</div>
		<!-- /.col-lg-9 -->
	</div>
	<!-- /.row -->

</div>

<%@include file="/include/footer.jsp"%>