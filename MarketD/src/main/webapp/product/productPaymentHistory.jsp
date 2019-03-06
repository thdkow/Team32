<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:set var="alist" value="${requestScope.alist}"/>
<c:set var="pm" value="${requestScope.pm}"/>
<c:out value="${alist}+옴마나"></c:out>

<title>SalesList</title>


<link rel="stylesheet" type="text/css"
	href="${myContextPath}/include/member.css" />


	<!-- 테이블 시작 -->
	<div class="table default">
		<!-- 헤더 시작 -->
		<div class="table-header">
			<div class="table-row">
				<div class="table-head">pidx</div>
				<div class="table-head">제목</div>
				<div class="table-head">가격</div>
				<div class="table-head">final</div>
				<div class="table-head">날자</div>
			</div>
		</div>
		<!-- 헤더 끝 -->
		<!-- 테이블  로우 시작 -->
		<div id="rows" class="tableBody">

			<c:forEach items="${alist}" var="alist2" varStatus="status" >
			
				<div class='table-row'>
				<div class='table-cell'>${alist2.pidx}</div>
				<div class='table-cell ' align='left'>${alist2.psubject}</A></div>
				<div class='table-cell'>${alist2.pmoney}</div>
				<div class='table-cell'>${alist2.ofinal}</div>
				<div class='table-cell'>${alist2.pwridate}</div>
				</div>

			</c:forEach>
		</div>
		<!-- 테이블 로우 끝 -->

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

