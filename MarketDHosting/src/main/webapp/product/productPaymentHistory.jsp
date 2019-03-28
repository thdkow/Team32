<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<c:import url="/include/indexHeader.jsp" />
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
<c:set var="alist" value="${requestScope.alist}"/>
<c:set var="pm" value="${requestScope.pm}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		
		<script type="text/javascript" src="${myContextPath}/resources/js/calendar.js"></script><!-- 달력 -->
		<link rel="stylesheet" href="${myContextPath}/resources/css/style.css" />
		
		
		
<title>구매내역</title>
</head>
<body>


<div class="container">

	<div class="row">


<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Payment History</h2>
          <h3 class="section-subheading text-muted">구매한 상품들 입니다.</h3>
        </div>
      </div>

		<div class="col-lg-9 my-5">
			<form class="form-inline my-3 justify-content-center" action="${myContextPath}/Needlogin/Product/ProductPaymentHistory.dobby" method="post">
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
					
					<c:set var="fileCallPath" value="/${alist2.uploadPath}/${alist2.uuid}_${alist2.fileName}"/>
					
						<tr>
					<th scope="row"><a href="${myContextPath}/Product/ProductContent.dobby?pidx=${alist2.pidx}"> 
					<img src="${myContextPath}/display.dobby?fileName=${fileCallPath}" height="140" width="140" alt="">
					</a></th>
					<td><a href="${myContextPath}/Product/ProductContent.dobby?pidx=${alist2.pidx}">${alist2.psubject}</a> <br /> <a
								href="#">주문번호:&nbsp;${alist2.oid}</a>
								<br /><br />
								
								<c:if test="${alist2.ofinal eq 'N'}">
			<a href="${myContextPath}/Product/ProductPaymentCancle.dobby?pidx=${alist2.pidx}&oidx=${alist2.oidx}&oid=${alist2.oid}">
									구매취소</a>
								</c:if>
								
								</td>
					<td class="text-center"><a href="#">${alist2.mname}</a></td>
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
						onclick="location='${myContextPath}/Product/ProductPaymentConfirmation.dobby?oidx=${alist2.oidx}'" 
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
							 href="${myContextPath}/Needlogin/Product/ProductPaymentHistory.dobby?${pm.makePrev()}">
							  <span aria-hidden="true">&laquo;</span></a></li>
							</c:if>
							
						
		<c:forEach var="pmbt" begin="${pm.startPage}" end="${pm.endPage}">
         		 <li class="page-item">
           <a class="page-link" href="${myContextPath}/Needlogin/Product/ProductPaymentHistory.dobby${pm.makeSearch(pmbt)}">${pmbt}</a>
           		<!-- 메소드를 이용해서 깔끔하게 처리하였다. -->
           </li>
        </c:forEach>
						
							<c:if test="${pm.next eq true && pm.endPage gt 0}">
							<li class="page-item"> <a class="page-link" aria-label="Next"
							 href="${myContextPath}/Needlogin/Product/ProductPaymentHistory.dobby${pm.makeNext()}">
							 <span aria-hidden="true">&raquo;</span>
						</a></li>
						</c:if> 
						
					</ul>
				</nav>
				</div>
				
				</div>
			</div><!-- contaner -->
			</section>
		</div>
		<!-- /.row -->
		

	</div>
	<!-- /.col-lg-9 -->






</body>
</html>

	<c:import url="/include/indexFooter.jsp" />