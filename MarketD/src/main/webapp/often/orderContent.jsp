<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<div class="container">

	<div class="row">

		<div class="col-lg-3 ">
			<img class="rounded d-block mt-5" alt="판매하기" height="80" width="255"
				src="image/btn_sub.jpg">
			<div class="list-group">
				<div href="#" class="list-group-item menu-item mt-5">
					<a href="#">마이페이지</a>
				</div>
				<div href="#" class="list-group-item menu-item">
					<a href="#">장바구니</a>
				</div>
				<div href="#" class="list-group-item menu-item">
					<a href="#">구매내역</a>
				</div>
				<div href="#" class="list-group-item menu-item">
					<a href="#">판매내역</a>
				</div>

			</div>

		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9 my-5">
			<h1>주문/결제</h1>
			<div class="row clearfix">
				<table class="table table-hover my-4">
					<thead>
						<tr>
							<th scope="col" class="text-center">상품</th>
							<th scope="col" class="text-center" width="500">주문정보</th>
							<th scope="col" class="text-center" width="150">판매자</th>
							<th scope="col" class="text-center" width="150">상품가격</th>
							<th scope="col" class="text-center" width="150">배송비</th>
							<th scope="col" class="text-center" width="150">할인</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#"> <img
									src="http://placehold.it/700x400" height="100" width="100"
									alt=""></a></th>
							<td><a href="#">아름다운 집을 짓는 벽돌</a> <br /> 수량 : 10 개</td>
							<td class="text-center"><a href="#">eerfd9377</a></td>
							<td class="text-center">25000원</td>
							<td class="text-center">2500원</td>
							<td class="text-center">0원</td>
						</tr>
					</tbody>
				</table>
				<h4>총 1개 상품</h4>
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="text-center">상품가격</th>
							<th scope="col"></th>
							<th scope="col" class="text-center">택배비</th>
							<th scope="col"></th>
							<th scope="col" class="text-center">할인</th>
							<th scope="col"></th>
							<th scope="col" class="text-center">합계</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center">25000원</td>
							<td class="text-center"><img alt="+" height="25" width="25"
								src="image/plus.png"></td>
							<td class="text-center">2500원</td>
							<td class="text-center"><img alt="-" height="25" width="25"
								src="image/minus.png"></td>
							<td class="text-center">0원</td>
							<td class="text-center"><img alt="=" height="20" width="20"
								src="image/equal.png"></td>
							<td class="text-center">27500원</td>
						</tr>
						<tr>
							<td colspan="7">
								<p style="font-size: 30px; text-align: center;">배송정보</p>
								<div class="input-group  col-md-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">수&nbsp;&nbsp;령&nbsp;&nbsp;인&nbsp;</span>
									</div>
									<input type="text" class="form-control" placeholder="수령인">
								</div>
								<div class="input-group  col-md-4 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">카&nbsp;&nbsp;톡&nbsp;&nbsp;ID&nbsp;</span>
									</div>
									<input type="text" class="form-control" placeholder="카톡ID">
								</div>
								<div class="input-group  col-md-5 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">연&nbsp;&nbsp;락&nbsp;&nbsp;처&nbsp;</span>
									</div>
									<input type="text" class="form-control" placeholder="연락처">
								</div>
								<div class="input-group  col-md-8 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;</span>
									</div>
									<input type="text" class="form-control" placeholder="주소-지역정보">
								</div>
								<div class="input-group  col-md-8 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">상세&nbsp;주소&nbsp;</span>
									</div>
									<input type="text" class="form-control" placeholder="주소-건물정보">
								</div>
								<div class="input-group  col-md-10 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">배송&nbsp;메모&nbsp;</span>
									</div>
									<input type="text" class="form-control" placeholder="배송메모">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="7">
								<p style="font-size: 30px; text-align: center;">결제방법</p>
								<div class="col-md-4 my-3">무통장 입금</div>
								<div class="input-group col-md-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">&nbsp;입금자명&nbsp;</span>
									</div>
									<input type="text" class="form-control" placeholder="입금자명">
								</div>
								<div class="col-md-10 my-3">입금계좌:&nbsp;&nbsp;&nbsp;&nbsp;농협&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;301123456789&nbsp;&nbsp;&nbsp;&nbsp;Dobby</div>
							</td>
						</tr>
						<tr>
							<td colspan="7" id="flip1"><p style="font-size: 15px; text-align: center;">이용약관▼</p></td>
						</tr>
						<tr id="panel1">
							<td colspan="7">제 1 장 총 칙<br /> 제 1 조 (목적)본 약관은 서비스 이용자가
								주식회사 (이하 “회사”라 합니다)가 제공하는 온라인상의 인터넷 서비스(이하 “서비스”라고 하며, 접속 가능한
								유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는 모든 “서비스”를 의미합니다. 이하 같습니다)에
								회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에 동의하고 회원등록을 완료한 서비스 이용자를 말합니다.
								이하 “회원”이라고 합니다)의 권리•의무
							</td>
						</tr>
						<tr><td colspan="7"><input type="checkbox">&nbsp;약관동의</td>
						</tr>
						<tr>
						<td colspan="2" class="text-center align-middle" style="font-size: 15px;">총 1개 상품</td>
						<td colspan="5" class="text-right" style="font-size: 35px;">27500원</td>
						</tr>
						<tr>
						<td colspan="7" class="text-center"><button type="button" class="btn btn-outline-danger" style="font-size: 20px;">결제하기</button></td>
						<tr>
					</tbody>
				</table>
			</div>
			<!-- /.row -->
			
		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->

</div>

<%@include file="/include/footer.jsp"%>