<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<c:set var="nv" value="${nv}" />
<c:set var="myContextPath" value="${pageContext.request.contextPath}" />

<div class="container">

	<div class="row">

		<%@include file="../include/menuNavigation3.jsp"%>
		
		<div class="col-lg-9 my-5">
			<h1>공지보기</h1>
	
	<div class="card my-3 " style="height: 15rem;">
	    <div class="card-body">
	        <div class="row">
        	    <div class="col-md-2">
        	        <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid"/>
        	        <p class="text-secondary text-center">15 Minutes Ago</p>
        	    </div>
        	    <div class="col-md-10">
        	        <p>
        	            <strong>${nv.nsubject}</strong>
        	       </p>
        	        <p>
        	        	${nv.ncontent}
        	        </p>
        	    </div>
	        </div>
	    </div>
	</div>
	<c:if test='${midx le 10}'><!-- midx <= 10 -->
					<div class="col align-self-end">
						<a class="float-right btn btn-outline-primary" href="/Notice/NoticeDeleteAction.dobby?nidx=${nv.nidx}">
							삭제하기
						</a>
					</div>
				</c:if>
</div>
</div>
</div>
<%@include file="/include/footer.jsp"%>