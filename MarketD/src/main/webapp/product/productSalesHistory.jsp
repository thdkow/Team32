<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:set var="alist" value="${requestScope.alist}"/>
<c:set var="pm" value="${requestScope.pm}"/>


<%@include file="/include/header.jsp"%>

<div class="container">

	<div class="row">

				<%@include file="/include/menuNavigation.jsp"%>
				
		<div class="col-lg-9 my-5">
			<h1>판매내역</h1>
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
							<th scope="col" class="text-center" width="150">구매자</th>
							<th scope="col" class="text-center" width="150">판매금액</th>
							<th scope="col" class="text-center" width="200">주문날짜/상태</th>
						</tr>
						
						
					</thead>
					<tbody>
					
			<c:forEach items="${alist}" var="alist2" varStatus="status" >
			
			<tr>
			<th scope="row">
			<a href="/Product/ProductContent.dobby?pidx=${alist2.pidx}"> 
			<img src="http://placehold.it/700x400" height="140" width="140"alt=""></a></th>
			<td><a href="/Product/ProductContent.dobby?pidx=${alist2.pidx}">${alist2.psubject}</a> 
			<br /> 수량 : ${alist2.pvol} <br /> 주문번호:&nbsp;${alist2.oid}&nbsp;&nbsp;
			<br /><br /><a href="/Product/productDeleteSalesHistory.dobby?pidx=${alist2.pidx}">판매글 삭제
			<!-- 운송장번호 : 12121212121212 &nbsp; 구매확정 배송중--></td>
			<td class="text-center">${alist2.mname}</td>
			<td class="text-center">상품:<br/>${alist2.pmoney}원<br/><br/>배송비:<br/>${alist2.pfee}원</td>
			<td class="text-center">${alist2.pwridate} <br />	
			<button type="button" class="btn btn-outline-primary my-2">결제완료</button>
			<button type="button" class="btn btn-outline-warning my-2">배송시작</button>
				</td>
			</tr>
			

			</c:forEach>
					
						
						
					</tbody>
				</table>
				
				
				<div class="col align-self-end">
					<a class="float-right btn btn-outline-success" href="/Product/ProductWrite.dobby">판매글 작성</a>
				</div>
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
	 			<a href="${myContextPath}/Board/boardList.do${pm.makePrev()}"> 			
		 			<span class="glyphicon glyphicon-chevron-left"></span>
	 			</a> 		
 			</c:if>			
			</li>
			
 	 	<c:forEach var="pmbt" begin="${pm.startPage}" end="${pm.endPage}">
           <li
           <c:if test="${pm.scri.page eq pmbt}">class="active"</c:if>>
           
           		<a href="${myContextPath}/Board/boardList.do${pm.makeSearch(pmbt)}">${pmbt}</a>
           		<!-- 메소드를 이용해서 깔끔하게 처리하였다. -->
           </li>
        </c:forEach>
  
		 	<li>
		  	<c:if test="${pm.next eq true && pm.endPage gt 0}">
 			 <a href="${myContextPath}/Board/boardList.do${pm.makeNext()}">
	 			<span class="glyphicon glyphicon-chevron-right"></span>
 			</a> 
 		 	</c:if> 
			</li>
		 </ul>
	 </div>
 </div>

<%@include file="/include/footer.jsp"%>