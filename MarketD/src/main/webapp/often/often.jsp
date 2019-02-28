<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>HTML, CSS and JavaScript demo</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#panel1").slideToggle(0);
		$("#panel2").slideToggle(0);
		$("#panel3").slideToggle(0);
		$("#panel4").slideToggle(0);
		$("#panel5").slideToggle(0);
		$("#panel6").slideToggle(0);
		$("#panel7").slideToggle(0);
		$("#panel8").slideToggle(0);
		$("#panel9").slideToggle(0);
		$("#panel10").slideToggle(0);

		$("#flip1").click(function() {
			$("#panel1").slideToggle("700");
		});
		$("#flip2").click(function() {
			$("#panel2").slideToggle("700");
		});
		$("#flip3").click(function() {
			$("#panel3").slideToggle("700");
		});
		$("#flip4").click(function() {
			$("#panel4").slideToggle("700");
		});
		$("#flip5").click(function() {
			$("#panel5").slideToggle("700");
		});
		$("#flip6").click(function() {
			$("#panel6").slideToggle("700");
		});
		$("#flip7").click(function() {
			$("#panel7").slideToggle("700");
		});
		$("#flip8").click(function() {
			$("#panel8").slideToggle("700");
		});
		$("#flip9").click(function() {
			$("#panel9").slideToggle("700");
		});
		$("#flip10").click(function() {
			$("#panel10").slideToggle("700");
		});
	});
</script>

</head>
<body>
	<!-- Start your code here -->
	<table style="margin-left: auto; margin-right: auto;">
		<tr>
			<td style="height: 50px;"></td>
		</tr>
		<tr>
			<td>

				<table
					style="width: 1000px; border-top: 1px solid #7393b6; border-bottom: 1px solid #7393b6;">
					<tr>
						<td
							style="font-size: 1.5em; text-align: left; border-bottom: 1px solid #7393b6; height: 50px">
							자주묻는 질문 &nbsp <a style="font-size: 0.5em;">1:1문의</a>
						</td>
					</tr>
					<tr>
						<td id="flip1" style="font-size: 1.3em; cursor: pointer;">
							Q1.판매하려는 물품은 어떻게 등록하나요?
							<div id="panel1" style="font-size: 0.8em;">판매하시려는 아이템은 홈 화면
								상단 오른쪽에 [판매하기] 버튼을 누른 후 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를
								입력하여 등록하실 수 있습니다.</div>
						</td>
					</tr>
					<tr>
						<td id="flip2"
							style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
							Q2.판매하면 안되는 항목이 있나요?
							<div id="panel2" style="font-size: 0.8em;">의사 처방이 필요한 의약품,
								담배, 전자담배, 모든 주류, 성인용품, 허가받지 않은 다이어트 식품 등이 금지아이템입니다.</div>
						</td>
					</tr>
					<td id="flip3"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q3.아이템 검색은 어떻게 하나요?
						<div id="panel3" style="font-size: 0.8em;">웹사이트 상단 검색창에 검색어를
							입력하여 찾으시려는 아이템을 검색할 수 있습니다.</div>
					</td>
					</tr>
					<td id="flip4"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q4.유의해야 하는 행동이 있나요?
						<div id="panel4" style="font-size: 0.8em;">
							<div>다음과 같은 글과 아이템을 등록시 삭제가 될 수 있으니 유의해주세요. </div>
							<div >1. 다른 서비스/사이트로 유도하는 이미지나 글</div>
							<div> 2. 외부 서비스를
							상업적으로 홍보하거나 대량판매/매입행위(휴대폰/자동차딜러 등)의 글</div>
							<div> 3. 동일한 내용의 글이나 아이템</div>
							</div>
					</td>
					</tr>
					<td id="flip5"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q5.회원정보 수정은 어떻게 하나요?
						<div id="panel5" style="font-size: 0.8em;">상단에 내정보 > 비밀번호 입력
							> 수정버튼 으로 수정페이지로 들어가 처리가 가능합니다.</div>
					</td>
					</tr>
					<td id="flip6"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q6.판매자 등급이 무엇인가요?
						<div id="panel6" style="font-size: 0.8em;">거래횟수로 등급을 매겨 판매자의
							신용을 증명할 수 있는 등급입니다.</div>
					</td>
					</tr>
					<td id="flip7"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q7.탈퇴는 어떻게 하나요?
						<div id="panel7" style="font-size: 0.8em;">상단에 내정보 페이지로 들어가
							탈퇴하기를 클릭하여 가능합니다.</div>
					</td>
					</tr>
					<td id="flip8"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q8.판매글 삭제는 어떻게 하나요?
						<div id="panel8" style="font-size: 0.8em;">상단의 판매내역에서 입금되지않은
							상품글을 삭제 가능합니다.</div>
					</td>
					</tr>
					<td id="flip9"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q9.홈 화면에 보이는 물품들은 무엇인가요?
						<div id="panel9" style="font-size: 0.8em;">가장 최근에 게시된 글들을
							보여드리고 있습니다.</div>
					</td>
					</tr>
					<td id="flip10"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q10.판매한 물품이 분실 또는 파손되었을 경우 어떻게하나요?
						<div id="panel10" style="font-size: 0.8em;">배송 중 발생한 문제일 경우
							배송사로 배상이 가능한지 상담을 받아보시기 바랍니다. 배송사 문의처: 
							<div>1. 편의점택배(포스트박스) : 1577-1287 </div>
							<div>2. 대한통운 : 1588-1255 </div>
							<div>3. 롯데택배 : 1588-2121 </div>
							<div>4. 한진택배 : 1588-0011 </div>
							<div>5. 고고밴(퀵/용달/화물) : 1588-0233</div>
							</div>
					</td>
					</tr>




				</table>

			</td>
		</tr>
	</table>

	<!-- End your code here -->
</body>
</html>