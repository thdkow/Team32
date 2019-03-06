<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>

<%@include file="/include/header.jsp" %>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3 ">
				<img class="rounded d-block mt-5" alt="판매하기" height="80" width="255"
					src="image\btn_sub.jpg">
				<div class="list-group">
					<div href="#" class="list-group-item menu-item mt-5">
						<a href="#">컴퓨터</a>
						<ul>
							<li><a href="#">Web</a></li>
							<li><a href="#">Print</a></li>
							<li><a href="#">Other</a></li>
						</ul>
					</div>
					<div href="#" class="list-group-item menu-item">
						<a href="#">취미</a>
						<ul>
							<li><a href="#">Web</a></li>
							<li><a href="#">Print</a></li>
							<li><a href="#">Other</a></li>
						</ul>
					</div>
					<div href="#" class="list-group-item menu-item">
						<a href="#">생활가전</a>
						<ul>
							<li><a href="#">Web</a></li>
							<li><a href="#">Print</a></li>
							<li><a href="#">Other</a></li>
						</ul>
					</div>
					<div href="#" class="list-group-item menu-item">
						<a href="#">스포츠</a>
						<ul>
							<li><a href="#">Web</a></li>
							<li><a href="#">Print</a></li>
							<li><a href="#">Other</a></li>
						</ul>
					</div>
					<div href="#" class="list-group-item menu-item">
						<a href="#">기타</a>
						<ul>
							<li><a href="#">Web</a></li>
							<li><a href="#">Print</a></li>
							<li><a href="#">Other</a></li>
						</ul>
					</div>
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<div class="row">


					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img src="http://placehold.it/700x400"
								height="145" width="253" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item Three</a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img src="http://placehold.it/700x400"
								height="145" width="253" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item Three</a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img src="http://placehold.it/700x400"
								height="145" width="253" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item Three</a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img src="http://placehold.it/700x400"
								height="145" width="253" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item Three</a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img src="http://placehold.it/700x400"
								height="145" width="253" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item Three</a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img src="http://placehold.it/700x400"
								height="145" width="253" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item Three</a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img src="http://placehold.it/700x400"
								height="145" width="253" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item Three</a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img src="http://placehold.it/700x400"
								height="145" width="253" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item Three</a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img src="http://placehold.it/700x400"
								height="145" width="253" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item Three</a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img src="http://placehold.it/700x400"
								height="145" width="253" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Item Three</a>
								</h4>
								<h5>$24.99</h5>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Amet numquam aspernatur!</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
<%@include file="/include/footer.jsp" %>