<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<div class="container">

	<div class="row">

		<%@include file="../include/menuNavigation3.jsp"%>

		<div class="col-lg-9 my-5">
			<h1>공지하기</h1>

			<div class="row my-5">
				<form class="" action="/Notice/NoticeWriteAction.dobby" method="post">
					<fieldset>

						<div class="form-group">
							<span class="col-md-1 offset-md-2 text-xs-center"><i
								class="fa fa-user bigicon"></i></span>
							<div class="col-md-8">
								<label for="filter">공지제목</label> <input id="fname"
									name="nsubject" type="text" placeholder="공지 제목을 입력해주세요."
									class="form-control" size="120">
							</div>
						</div>
						<div class="form-group">
							<span class="col-md-1 offset-md-2 text-xs-center"><i
								class="fa fa-user bigicon"></i></span>
							<div class="col-md-8">
								<label for="filter">공지유형</label>
								<select class="form-control" name="caidx">
									<option value="0" selected="selected">유형</option>
									<option value="201">회원정보</option>
									<option value="202">구매</option>
									<option value="203">판매</option>
									<option value="204">신고</option>
									<option value="205">기타</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<span class="col-md-1 offset-md-2 text-xs-center"><i
								class="fa fa-pencil-square-o bigicon"></i></span>
							<div class="col-md-8">
								<label for="filter">공지내용</label>
								<textarea class="form-control" id="message" name="ncontent"
									placeholder="공지 내용을 정확히 입력해주세요." rows="7" size="120"></textarea>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-12 text-xs-center">
								<button type="submit" class="btn btn-primary btn-lg"
									name="submit">등록</button>
								<a class="btn btn-danger btn-lg" href="/Notice/NoticeList.dobby">취소</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

</div>
<link rel="stylesheet" type="text/css"
	href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>

<script type="text/javascript">
	jQuery(function($) {
		$("#files").shieldUpload();
	});
</script>
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