<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@include file="../include/header.jsp"%>
<%@ page import="java.util.ArrayList"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:set var="alist" value="${requestScope.alist}"/>
<c:set var="pm" value="${requestScope.pm}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		
		<script type="text/javascript" src="/resources/js/calendar.js"></script><!-- 달력 -->
		<link rel="stylesheet" href="/resources/css/style.css" />
		
		
		
<title>구매내역</title>
</head>
<body>


<div class="container">

	<div class="row">

		<%@include file="../include/menuNavigation2.jsp"%>

		<div class="col-lg-9 my-5">
			<h1>구매내역</h1>
			<form class="form-inline my-3 justify-content-center" action="/Product/ProductPaymentHistory.dobby" method="post">
			 	<input class="form-control mr-sm-2" id="date-picker" name="startdate" type="text" placeholder="시작일" 
			 			aria-label="Search" size="20">&nbsp;~&nbsp;&nbsp;
				<input class="form-control mr-sm-2 " id="date-picker2" name="lastdate" type="text" placeholder="마지막일"
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
							<th scope="col" class="text-center" width="200" style="font-size:0.8em">주문날짜/상태</th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${alist}" var="alist2" varStatus="status" >
						<tr>
					<th scope="row"><a href="#?${alist2.pidx}"> <img
									src="http://placehold.it/700x400" height="140" width="140"
									alt=""></a></th>
					<td><a href="#">${alist2.psubject}</a> <br /> 수량 : ${alist2.pvol} 개 <br /> <a
								href="#">주문번호:&nbsp;${alist2.oid}</a>
								<br /><br />
								
								<c:if test="${alist2.ofinal eq 'N'}">
			<a href="/Product/ProductPaymentCancle.dobby?pidx=${alist2.pidx}&oidx=${alist2.oidx}&oid=${alist2.oid}">
									구매취소</a>
								</c:if>
								
								</td>
					<td class="text-center"><a href="#">${alist2.mname}</a>
							<button type="button" class="btn btn-outline-danger my-2">추천</button>
						<button type="button" class="btn btn-outline-secondary my-2" style="font-size:0.8em">비추천</button></td>
					<td class="text-center">상품:<br/>${alist2.pmoney}<br/><br/>배송비:<br/>${alist2.pfee}</td>
					<td class="text-center">${fn:substring(alist2.obuydate,0,10)} <br />
							
							
					<c:choose>
					
   				   	<c:when test="${ alist2.pacomplete eq 'Y'}">
   				    <button type="button" class="btn btn-primary my-2"style="font-size:0.7em">결제완료</button>
   				    </c:when>

  				    <c:when test="${alist2.pacomplete eq 'N'}">
  				    <button type="button" class="btn btn-primary my-2"style="font-size:0.7em">결제준비중</button>
   				    </c:when>
   				    
   				     </c:choose>	
   				     <c:choose>
   				    
   		 			<c:when test="${alist2.ofinal eq 'Y'}">
						<button type="button" class="btn btn-warning my-2"style="font-size:0.7em">확정완료</button>
					</c:when>	
					<c:when test="${alist2.ofinal eq 'N'}">
						<button type="button" class="btn btn-outline-warning my-2"
						onclick="location='/Product/ProductPaymentConfirmation.dobby?oidx=${alist2.oidx}'" 
						style="font-size:0.7em">구매확정</button>
					</c:when>
					
					
					 </c:choose>	
							</td>
						</tr>
						</c:forEach>	
					</tbody>
				</table>

			</div>
			<div class="row my-2 justify-content-center ">
				<nav aria-label="Page navigation">
					<ul class="pagination">
					
					<c:if test="${pm.prev eq true }">
						<li class="page-item">
							<a class="page-link" aria-label="Previous"
							 href="${myContextPath}/Product/ProductPaymentHistory.dobby?${pm.makePrev()}">
							  <span aria-hidden="true">&laquo;</span></a></li>
							</c:if>
							
						
		<c:forEach var="pmbt" begin="${pm.startPage}" end="${pm.endPage}">
         		 <li class="page-item">
           <a class="page-link" href="${myContextPath}/Product/ProductPaymentHistory.dobby${pm.makeSearch(pmbt)}">${pmbt}</a>
           		<!-- 메소드를 이용해서 깔끔하게 처리하였다. -->
           </li>
        </c:forEach>
						
							<c:if test="${pm.next eq true && pm.endPage gt 0}">
							<li class="page-item"> <a class="page-link" aria-label="Next"
							 href="${myContextPath}/Product/ProductPaymentHistory.dobby${pm.makeNext()}">
							 <span aria-hidden="true">&raquo;</span>
						</a></li>
						</c:if> 
						
					</ul>
				</nav>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->

</div>





</body>
</html>

<%@include file="../include/footer.jsp"%>