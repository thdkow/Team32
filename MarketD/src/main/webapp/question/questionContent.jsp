<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" 
rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<c:set var="qv" value="${qv}" />

<div class="container">

	<div class="row">

		<%@include file="/include/menuNavigation3.jsp"%>

		<div class="col-lg-9 my-5">
			<h1>답변보기</h1>
	
	<div class="card my-3 " style="height: 30rem;">
	    <div class="card-body">
	        <div class="row">
        	    <div class="col-md-2">
        	    <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid"/>
                   <p class="text-secondary text-center">${qv.qwridate}</p>
        	    </div>
        	    <div class="col-md-10">
        	    
        	        <p>
        	            <strong> 제목 : ${qv.qsubject}</strong>   &nbsp;&nbsp;&nbsp;  작성자 :  ${qv.mname}
        	             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 문의 유형 : ${qv.cate}
        	            
        	       </p>
        	       
        	        <p>${qv.qcontent}</p>
        	    </div>
	        </div>
	        
	        <c:if test="${qv.qstate=='Y'}">
	        
	        	<div class="card card-inner " style="margin-left: 4rem; height: 15rem;">
            	    <div class="card-body ">
            	        <div class="row ">
                    	    <div class="col-md-2">
                    	        <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid"/>
                    	        <p class="text-secondary text-center">${qv.qrewridate}</p>
                    	    </div>
                    	    <div class="col-md-10">
        	    
        	        <p>
        	            <strong> 제목 : ${qv.qresubject}</strong>   &nbsp;&nbsp;&nbsp;  작성자 : 관리자
        	       </p>
        	       
        	        <p>${qv.qrecontent}</p>
        	    </div>
            	        </div>
            	    </div>
	            </div> 
	            </c:if>   

	    </div>

	   
	</div>
		   			
</div>
 					
					 <c:if test="${midx<11}">
 						<a class="btn btn-outline-danger btn-lg" href="/Question/QuestionReply.dobby?qidx=${qv.qidx}">답변하기</a>
					</c:if>
					<c:if test="${midx<11 or midx==qv.midx}">
 						<a class="btn btn-outline-danger btn-lg" href="/Question/QuestionDeleteAction.dobby?qidx=${qv.qidx}">삭제</a>
					</c:if>
						<a class="btn btn-outline-danger btn-lg" href="/Question/QuestionList.dobby">목록</a>
					
					
</div>

</div>

						
<%@include file="/include/footer.jsp"%>