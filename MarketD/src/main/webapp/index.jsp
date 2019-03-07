<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:set var="alist" value="${requestScope.alist}"/>

 <script src="/resources/js/jquery.min.js"></script>
 <script src="/resources/js/jquery-3.2.1.min.js"></script>
 
<script type="text/javascript">
$(function(){
	(function($){


$( document ).ready( function() {

 	$.productNewList();
	
	   $('#more').click(function(){

			var npage = $("#nextPage").val(); //Criteria를 사용하지않고 Hidden속성의 inputbox를 이용(리스트를 전부 로드했을때 인설트시 1페이지로 돌아가는 문제때문)
			 
			$.ajax({
				type : "GET",
				url  : "/Product/"+npage+"/ProductNewList.dobby",
				
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
					$.newList(data);
					}			
			});	 
			
		}); //more
	 
});//    $(function(){  
	
 $.moerCount = function(){ //전체리스트와 로드된 리스트를 비교하는 함수

 
	$.ajax({
		type : "GET",
		url  : "/Product/1/1000/0/0/empty/ProductListTotal.dobby",
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

	 $.productNewList = function(){	

		var page = $('#page').val();
	
		$.ajax({
			type : "GET",
			url  : "/Product/"+page+"/ProductNewList.dobby",
			datatype : "json",
			cache : false,   
			error : function(){
				alert("리스트1 error");
			},
			success : function(data){	
			
				$.newList(data);
				var oblength = Object.keys(data).length;
				$('#moreTotalCount').val(oblength);	
				$.moerCount();
				}			
		});	 	
	}; 
	 
	 $.newList = function(data){
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

			 
			 };		//newList 

}(jQuery))
})



</script>


	<!-- Page Content -->
	<div class="container">

		<div class="row"><!--이아래에 네이게이션 둘것  -->


			<%@include file="/include/menuNavigation.jsp"%>


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

				<div class="row" id="tbr">
				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->
		
		<div class="form-group">
<center>
<button id='more' class="btn btn-outline-primary" >더보기</button>
</center>	
<input id='nextPage' type='hidden' value='2' />
<input id='moreTotalCount' type='hidden' value='12' />
<input id='page' type='hidden' value='1' />
</div>

	</div>
	<!-- /.container -->
<%@include file="/include/footer.jsp" %>