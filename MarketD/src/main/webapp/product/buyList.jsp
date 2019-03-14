<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<%@ page import="java.util.ArrayList"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:set var="alist" value="${requestScope.alist}"/>
<c:set var="pm" value="${requestScope.pm}"/>

<div class="container">

	<div class="row">

		<%@include file="../include/menuNavigation2.jsp"%>

		<div class="col-lg-9 my-5">
			<h1>구매내역</h1>
			<form class="form-inline my-3 justify-content-center">
			 	<input class="form-control mr-sm-2" type="search" placeholder="시작일" 
			 			aria-label="Search" size="20">&nbsp;~&nbsp;&nbsp;
				<input class="form-control mr-sm-2 " type="search" placeholder="마지막일"
						 aria-label="Search" size="20">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<div class="row clearfix">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" class="text-center">상품</th>
							<th scope="col" class="text-center" width="500">주문정보</th>
							<th scope="col" class="text-center" width="150">판매자</th>
							<th scope="col" class="text-center" width="150">금액</th>
							<th scope="col" class="text-center" width="200">주문날짜/상태</th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${alist}" var="alist2" varStatus="status" >
						<tr>
							<th scope="row"><a href="#?${alist2.pidx}"> <img
									src="http://placehold.it/700x400" height="140" width="140"
									alt=""></a></th>
							<td><a href="#">${alist2.psubject}</a> <br /> 수량 : ${alist2.pvol} 개 <br /> <a
								href="#">주문변호:&nbsp;${alist2.oid}1&nbsp;&nbsp;(상세정보) </a>
								<br /><br /><a href="#">구매취소<!-- 운송장번호 : 12121212121212 &nbsp;<a href="#">반송신청--></td>
							<td class="text-center"><a href="#">판매자이름</a>
								<button type="button" class="btn btn-outline-danger my-2">추천</button>
								<button type="button" class="btn btn-outline-secondary my-2">비추천</button></td>
							<td class="text-center">상품:<br/>${alist2.pmoney}<br/><br/>배송비:<br/>${alist2.pfee}</td>
							<td class="text-center">${alist2.obuydate} <br />
								<button type="button" class="btn btn-outline-primary my-2">결제준비중</button>
<!-- 							<button type="button" class="btn btn-secondary">Secondary</button>
								<button type="button" class="btn btn-success">Success</button>
								<button type="button" class="btn btn-danger">Danger</button>
								<button type="button" class="btn btn-warning">Warning</button>
								<button type="button" class="btn btn-info">Info</button>
								<button type="button" class="btn btn-light">Light</button>
								<button type="button" class="btn btn-dark">Dark</button> -->
								<button type="button" class="btn btn-outline-warning my-2">구매확정</button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<div class="row my-2 justify-content-center ">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->

</div>


<!-- 페이징 처리에 사용되는 인터페이스이다 < 1 2 3 4 5 6 7 8 9 10 > -->
	 <div style="text-align: center;">
	 <div class="jb-center">
		 <ul class="pagination">
		 	<li>
		 	<c:if test="${pm.prev eq true }">
	 			<a href="${myContextPath}/Product/productPaymentHistory.dobby?${pm.makePrev()}"> 			
		 			<span class="glyphicon glyphicon-chevron-left"></span>
	 			</a> 		
 			</c:if>			
			</li>
			
 	 	<c:forEach var="pmbt" begin="${pm.startPage}" end="${pm.endPage}">
           <li
           <c:if test="${pm.scri.page eq pmbt}">class="active"</c:if>>
           
           		<a href="${myContextPath}/Product/productPaymentHistory.dobby?${pm.makeSearch(pmbt)}">${pmbt}</a>
           		<!-- 메소드를 이용해서 깔끔하게 처리하였다. -->
           </li>
        </c:forEach>
  
		 	<li>
		  	<c:if test="${pm.next eq true && pm.endPage gt 0}">
 			 <a href="${myContextPath}/Product/productPaymentHistory.dobby?${pm.makeNext()}">
	 			<span class="glyphicon glyphicon-chevron-right"></span>
 			</a> 
 		 	</c:if> 
			</li>
		 </ul>
	 </div>
 </div>
<%@include file="../include/footer.jsp"%>