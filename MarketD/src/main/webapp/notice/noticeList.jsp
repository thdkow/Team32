<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<c:set var="nv" value="${nv}" />
<c:set var="myContextPath" value="${pageContext.request.contextPath}" />


<div class="container">

	<div class="row">

		<%@include file="../include/menuNavigation3.jsp"%>

		<div class="col-lg-9 my-5">
			<h1>공지사항</h1>

			<div class="row my-5 justify-content-center">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="nvlist" items="${nv}" varStatus="status">
							<tr>
								<th scope="row">${status.count}</th>
								<td><a href="/Notice/NoticeContent.dobby?nidx=${nvlist.nidx}">${nvlist.nsubject}</td>
								<td>운영자</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test='${midx le 10}'><!-- midx <= 10 -->
					<div class="col align-self-end">
						<a class="float-right btn btn-outline-primary" href="/Notice/NoticeWrite.dobby">
							공지하기
						</a>
					</div>
				</c:if>
			</div>
			<div class="row my-2 justify-content-center ">
				<nav aria-label="Page navigation">
					<ul class="pagination">
					
					<c:if test="${pm.prev eq true }">
						<li class="page-item">
							<a class="page-link" aria-label="Previous"
							 href="${myContextPath}/Notice/NoticeList.dobby${pm.makePrev()}">
							  <span aria-hidden="true">&laquo;</span></a></li>
							</c:if>
							
						
		<c:forEach var="pmbt" begin="${pm.startPage}" end="${pm.endPage}">
         		 <li class="page-item">
           <a class="page-link" href="${myContextPath}/Notice/NoticeList.dobby${pm.makeSearch(pmbt)}">${pmbt}</a>
           		<!-- 메소드를 이용해서 깔끔하게 처리하였다. -->
           </li>
        </c:forEach>
						
							<c:if test="${pm.next eq true && pm.endPage gt 0}">
							<li class="page-item"> <a class="page-link" aria-label="Next"
							 href="${myContextPath}/Notice/NoticeList.dobby${pm.makeNext()}">
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

<%@include file="/include/footer.jsp"%>