<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="com.team.marketd.domain.MemberVo" %>

<%MemberVo mv = (MemberVo)request.getAttribute("mv"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 페이지</title>
<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/login.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</head>
<body>
	<div class="container pb-modalreglog-container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h3 class="card-title text-center">아이디 찾기 결과</h3>
						<form class="form-signin">
							<div class="form-label-group">
								<p class="text-center">아이디 :&nbsp;<%=mv.getMid() %></p>

							</div>

							<div class="input-group pb-modalreglog-input-group">
								<button
									class="btn btn-secondary pb-modalreglog-submit btn-block text-uppercase"
									data-toggle="modal" data-target="#myModal">로그인 화면으로</button>
								<button
									class="btn btn-secondary pb-modalreglog-submit btn-block text-uppercase"
									data-toggle="modal" data-target="#myModal2">메인 화면으로</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>