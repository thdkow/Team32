<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<c:set var="qv" value="${qv}" />

<div class="container">

	<div class="row">

		<%@include file="/include/menuNavigation3.jsp"%>

		<div class="col-lg-9 my-5">
			<h1>답변하기</h1>
			<div class="card my-3" style="height: 50rem;">
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
					
					
					<div class="card card-inner">
						<div class="card-body">
							<div class="row my-5">
								<form class="" method="post" action="/Question/QuestionReplyAction.dobby?qidx=${qv.qidx}">
									<fieldset>

										<div class="form-group">
											<span class="col-md-1 offset-md-2 text-xs-center"><i
												class="fa fa-user bigicon"></i></span>
											<div class="col-md-8">
												<label for="filter">답변제목</label> <input id="qresubject"
													name="qresubject" type="text" placeholder="답변 제목을 입력해주세요."
													class="form-control" size="120">
											</div>
										</div>

										<div class="form-group">
											<span class="col-md-1 offset-md-2 text-xs-center"><i
												class="fa fa-pencil-square-o bigicon"></i></span>
											<div class="col-md-8">
												<label for="filter">답변내용</label>
												<textarea class="form-control" id="qrecontent" name="qrecontent"
													placeholder="답변 내용을 정확히 입력해주세요." rows="7" size="120"></textarea>
											</div>
										</div>

										<div class="form-group">
											<div class="col-md-12 text-xs-center">
												<button type="submit" class="btn btn-primary btn-lg"
													name="submit">등록</button>
												<a class="btn btn-outline-danger btn-lg" href="/Question/QuestionList.dobby">취소</a>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<style>
.header {
	color: #36A0FF;
	font-size: 27px;
	padding: 10px;
}

.bigicon {
	font-size: 35px;
	color: #36A0FF;
}
</style>

<%@include file="/include/footer.jsp"%>