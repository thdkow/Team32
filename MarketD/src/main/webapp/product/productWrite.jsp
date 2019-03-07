<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
	function fnCngList(sVal) {

		

		var f = document.getElementById("SDIV");

		var opt = $("#SDIV option").length;

		if (sVal == "") {

			num = new Array("소분류");

			vnum = new Array("");

		} else if (sVal == "패션의류") {
			
			num = new Array("남성의류", "여성의류", "아우터", "모자");

			vnum = new Array("301", "302", "303" , "304");

		} else if (sVal == "가구") {

			num = new Array("DIY", "조명", "침구/커튼", "수납용품");

			vnum = new Array("321", "322", "323", "324");

		} else if (sVal == "도서") {

			num = new Array("도서", "교육", "음반");

			vnum = new Array("341", "342", "343");

		} else if (sVal == "스포츠") {

			num = new Array("휘트니스/수영", "등산/아웃도어", "캠핑/낚시", "구기/라켓", "자전거/보드");

			vnum = new Array("361", "364", "365", "366", "367");

		} else if (sVal == "컴퓨터") {

			num = new Array("모니터", "데스크탑", "노트북", "프린터", "저장장치", "PC주변기기");

			vnum = new Array("381", "382", "383", "384", "385", "386");

		} else if (sVal == "뷰티잡화") {

			num = new Array("신발", "가방", "주얼리", "수입명품", "시계", "선글라스", "기타");

			vnum = new Array("401", "402", "403", "404", "405", "406", "407");

		} else if (sVal == "디지털") {

			num = new Array("카메라", "음향기기", "게임", "휴대폰", "태블릿");

			vnum = new Array("421", "422", "423","424", "425");

		} else if (sVal == "취미") {

			num = new Array("건강/의료", "반려동물", "악기", "키덜트", "사무용품", "기타");

			vnum = new Array("441", "442", "443", "444", "445", "446");

		} else if (sVal == "생활가전") {

			num = new Array("대형가전", "계절가전", "주방가전", "생활가전", "미용가전");

			vnum = new Array("461", "462", "463", "464", "465");

		}

		

		for (var i = 0; i < opt; i++) {
			
			f.options[0] = null;

		}

		for (k = 0; k < num.length; k++) {
			
			f.options[k] = new Option(num[k], vnum[k]);

		}

	}
	
	

	$(document).ready(function() {
		
		$("#psubject").val("")
		
		$("#save1").click(function(){//#으로 id를 호출하여 jquery를 사용하였다.
			
		 	if($("#psubject").val() == ""){//이처럼 텍스트에 들어온 값을 비교하려면 .val을 사용하여야 한다. #subject만 했을시 x
			
			$("#sid1").html("<b>제목을 입력해주세요</b>");
			$("#sid1").show();
			$("#sid1").hide(5000);//하이드를사용하여서 출력한 문구를 지웠는데 다시눌렀을때 출력이되지않아 show를 이용하였다.
			} 
		 	else if($("#SDIV").val() == ""){
				$("#sid2").html("<b>종류를 정해주세요</b>");
				$("#sid2").show();
				$("#sid2").hide(5000);
				}
		 	else if($("#pmoney").val() == ""){
			
			$("#sid3").html("<b>금액을 입력해주세요</b>");
			$("#sid3").show();
			$("#sid3").hide(5000);
			}
			else if($("#pfee").val() == ""){
				$("#sid3").html("<b>배송비를 입력해주세요</b>");
				$("#sid3").show();
				$("#sid3").hide(5000);
				}
			else if($("#pvol").val() == ""){
				$("#sid3").html("<b>수량을 입력해주세요</b>");
				$("#sid3").show();
				$("#sid3").hide(5000);
				}
			else if($("#pcontent").val() == ""){
			$("#sid4").html("<b>내용을 입력해주세요</b>");
			$("#sid4").show();
			$("#sid4").hide(5000);
			}else if($("#pcontent").val() != ""){// else if를 한 이유는 textarea를 이용했을때 비교가 안되고 값이 null로 들어가
				//db에 입력이 되어버려서 조건을 추가해서 막아놓았다.
				
					document.getElementById('frm55').submit();;
					
					return;
			}
				});	
		
	}); // document redy
	
	
	
	
	
	
</script>


<div class="container">

	<div class="row">

		<div class="col-lg-3 ">
			<a href="/Product/ProductWrite.dobby">
			<img class="rounded d-block mt-5" alt="판매하기" height="80" width="255"
				src="/resources/img/btn_sub.jpg"></a>
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
			<h1>판매글 작성</h1>

			<div class="row my-5">
				<form class="" id="frm55" name="frm55" action="/Product/ProductSaleWriteAction.dobby" method="post">
					<fieldset>

						<div class="form-group">
							<span class="col-md-1 offset-md-2 text-xs-center"><i
								class="fa fa-user bigicon"></i></span>
							<div class="col-md-8">
								<label for="filter">상품명</label> 
								<input id="psubject" name="psubject"
									type="text" placeholder="상품명을 입력해주세요." class="form-control"
									size="120" value="">	<span id="sid1"></span>
									
									<input type="hidden" value="2" id="midx" name="midx">
									
							</div>
						</div>
						
						<div class="input-group col-md-8 my-4">
							<div class="input-group-prepend">	
								<span class="input-group-text" id="">카테고리</span>
							</div>

								<select name="BDIV" id="BDIV" class="custom-select"
									onchange="fnCngList(this.value);">
									<option selected>대분류</option>
									<option value="패션의류">패션의류</option>
									<option value="가구">가구</option>
									<option value="도서">도서</option>
									<option value="스포츠">스포츠</option>
									<option value="컴퓨터">컴퓨터</option>
									<option value="뷰티잡화">뷰티잡화</option>
									<option value="취미">취미</option>
									<option value="생활가전">생활가전</option>
									<option value="디지털">디지털</option>
								</select>
								
								 <select name="caidx" id="SDIV" class="custom-select">
									<option value="">소분류</option>
								</select>
						</div>
						<span id="sid2"></span>
						

				<div class="input-group  col-md-8 my-4">
					<div class="input-group-prepend">
						<span class="input-group-text" >상품정보</span>
					</div>
					<input type="text" class="form-control" name="pmoney" id="pmoney" value="" placeholder="상품금액">
					<div class="input-group-prepend">
						<span class="input-group-text" id="">원</span>
					</div>
					<input type="text" class="form-control" name="pfee" id="pfee" value="" placeholder="배송비">
					<div class="input-group-prepend">
						<span class="input-group-text" >원</span>
					</div>
					<input type="text" class="form-control" name="pvol" id="pvol" value="" placeholder="수량">
					<div class="input-group-prepend">
						<span class="input-group-text" >개</span>
						
					</div>
				</div>	
				<span id="sid3"></span>

				<div class="form-group my-3">
					<span class="col-md-1 offset-md-2 text-xs-center"><i
						class="fa fa-pencil-square-o bigicon"></i></span>
					<div class="col-md-8">
						<label for="filter">판매내용</label>
						<span id="sid4"></span>
						<textarea class="form-control" name="pcontent" id="pcontent"
						placeholder="판매내용을 상세하게 입력해주세요" rows="15"></textarea>
					</div>
				</div>

				<div class="form-group">
					<span class="col-md-1 offset-md-2 text-xs-center"><i
						class="fa fa-pencil-square-o bigicon"></i></span>
					<div class="col-md-8">
						<label for="filter">첨부파일 : </label> <input type="file" id="pimage"
							name="pimage" multiple="multiple" />
						<p style="text-align: right; margin-top: 20px;"></p>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-8">
						<div class="col align-self-end">
							<a class="float-right btn btn-outline-danger">취소</a> 
							<a id="save1" class="float-right btn btn-outline-primary mr-3">등록</a>
						</div>
					</div>
				</div>
				</fieldset>
				</form>
			</div>
		</div>
	</div>

</div>
<link rel="stylesheet" type="text/css"
	href="/resources/css/all.min.css" />
<script type="text/javascript"
	src="/resources/js/shieldui-all.min.js"></script>

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