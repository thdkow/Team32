<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:set var="alist" value="${requestScope.alist}"/>

 <script src="/resources/js/jquery.min.js"></script>
 <script src="/resources/js/jquery-3.2.1.min.js"></script>
 
 
<script type="text/javascript">
$(function(){
	(function($){


$( document ).ready( function() {
	
 	$.productSerchList();
 	
 	 $('#btn2').click(function(){
 		 
			var keyword = $("#keyword").val();
			var keyword2 = $("#keyword2").val(); 
			var minPrice = $("#minPrice").val(); 
			var maxPrice = $("#maxPrice").val(); 
			
			if(keyword==""){$("#keyword").val('empty')}
			if(keyword2==""){$("#keyword2").val('empty')}
			if(minPrice==""){$("#minPrice").val('0')}
			if(maxPrice==""){$("#maxPrice").val('0')}
					 
			});
	 
	
 	   $('#more').click(function(){

			var npage = $("#nextPage").val(); //Criteria를 사용하지않고 Hidden속성의 inputbox를 이용(리스트를 전부 로드했을때 인설트시 1페이지로 돌아가는 문제때문)
			 
			$.ajax({
				type : "GET",
				url  : "/Product/"+npage+"/${caidx}/${minPrice}/${maxPrice}/${keyword}/ProductSerchList.dobby",
				datatype : "json",
				cache : false,
				error : function(){
					alert("리스트 error");
				},
				success : function(data){


					
					$("#page").val(npage);	
					nextPage = (npage*1)+1;
					$("#nextPage").val(nextPage);
					var oblength = Object.keys(data).length;	
					$('#moreTotalCount').val(oblength);	
					$.moerCount();
					$.SerchList(data);
					}				 
			});
		}); //more 
	 
});//    $(function(){  
 	
 $.moerCount = function(){ //전체리스트와 로드된 리스트를 비교하는 함수
 
	 var page = $('#page').val();
	 
	$.ajax({
		type : "GET",
		url  : "/Product/"+page+"/${caidx}/${minPrice}/${maxPrice}/${keyword}/ProductListTotal.dobby",
		//위의 url에 0을 사용함으로 전체를 로드한다.(쿼리문에서 if문을 사용하여 where조건을 걸렀다.)
		datatype : "json",
		cache : false,   
		error : function(){
			alert("more error");
		},
		success : function(data){	
			

			if(data==$('#moreTotalCount').val()){		//more에서 불러온 리스트와 갯수를 비교하여 같다면 more버튼을 사라지게 처리함
				 $('#more').hide(2000);
				}else{
					$('#more').show(2000);				//같지 않다면 more버튼 활성화(show를 해주지않는다면 같지않더라도 사라진후에 나타나지않음)
					}
			}
			})			
	};		//moercount  

	 $.productSerchList = function(){	//input에 저장해놓은 페이지로 select(criteria와 같은 기능,default값은 1이다.)

	 var page = $('#page').val();
	
	 	$.ajax({
			type : "GET",
			url  : "/Product/"+page+"/${caidx}/${minPrice}/${maxPrice}/${keyword}/ProductSerchList.dobby",
			datatype : "json",
			cache : false,   
			error : function(){
				alert("리스트 error");
			},
			success : function(data){	
				var cate = ${caidx};
				$.SerchList(data);
				$('#caidx').val(cate);	
				var oblength = Object.keys(data).length;
				$('#moreTotalCount').val(oblength);	
				$.moerCount();
				}			
		});	 	 
	}; 		//$.productSerchList
	 
	  $.SerchList = function(data){
		  var str = '';	
			
			 $(data).each(function(index){
				 
				 var writedate = this.pwridate.substr(0,10);
				 
					 str += "<div class='col-lg-4 col-md-6 mb-4'><div class='card h-100'>"
					 	+ "<a href='/Product/ProductContent.dobby?pidx="+ this.pidx + "'><img src='"+this.pimage+"'height='145' width='253' alt=''></a>"
						+ "<div class='card-body'><h4 class='card-title'>" 
						+"<a href='/Product/ProductContent.dobby?pidx="+ this.pidx + "'>"+this.psubject+"</a></h4>"
						+  "<h5>"+this.pmoney+"원</h5>"+  "<p class='card-text'>판매자 : "+this.mname+"</p><p class='card-text'>등록일 : "
						+writedate+"</p></div></div></div>"
						

						
				 });
						
				 $('#tbr').html(str);

			 
			 };		//SerchList  

		

	}(jQuery))
	})
	
	
	
</script>

<!-- Page Content -->
<div class="container">

	<div class="row">

				<%@include file="/include/menuNavigation.jsp"%>
		

		<div class="col-lg-9 ">
			<form class="form-inline my-5" action="/Product/ProductList.dobby">
				<input class="form-control mr-sm-2" type="search" id="keyword2" name="keyword"
					placeholder="결과 내 검색" aria-label="Search">
			 	<input class="form-control mr-sm-2" type="search" placeholder="최소값" id="minPrice" name="minPrice"
			 			aria-label="Search" size="10" value="">&nbsp;~&nbsp;&nbsp;
				<input class="form-control mr-sm-2 " type="search" placeholder="최대값" id="maxPrice" name="maxPrice"
						 aria-label="Search" size="10" value="">
				<input type="hidden" id="caidx" name="caidx" value="1000" >
				<button class="btn btn-outline-success my-2 my-sm-0"  id='btn2'>검색</button>

			</form>

			
			<div class="row"  id="tbr">
			
			</div>
			<!-- /.row -->
			
			

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->

</div>
<!-- /.container -->

&nbsp;
<div class="form-group">
<center>
<button id='more' class="btn btn-outline-primary">더보기</button>
</center>	
<input id='nextPage' type='hidden' value='2' />
<input id='moreTotalCount' type='hidden' value='' />
<input id='page' type='hidden' value='1' />
</div>

<%@include file="/include/footer.jsp"%>