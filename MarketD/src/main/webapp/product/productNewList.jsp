<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:set var="alist" value="${requestScope.alist}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
 
<script type="text/javascript">

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
		 
			 str += "<div class='table-row'>"+ "<div class='table-cell'>"
				+ (index+1) +"</div>" +  "<div class='table-cell ' align='left'>"
				+ "<A href='/Product/ProductContent.dobby?pidx="+ this.pidx + "'>"
				+ this.psubject + "</A></div>"
	 	 		+  "<div class='table-cell'>"+this.mname+"</div>"
				+  "<div class='table-cell'>"+this.pmoney+"</div>"
				+  "<div class='table-cell'>"+this.pwridate+"</div>"  
				+  "</div>"; 
				
	 });
				
	 $('#tbl').html(	
						 "<div class='table default'>"
						+"<div class='table-header'>"
						+"<div class='table-row'>"
						+"<div class='table-head'>순서</div>"
						+"<div class='table-head'>제목</div>"
						+"<div class='table-head'>이름</div>"
						+"<div class='table-head'>가격</div>"
						+"<div class='table-head'>작성일</div>"
						+"</div></div>"
						+ str +"</div>" 	 	);

			 
			 };		//newList 

		

</script>



<title>NewList</title>
</head>
<body>

<link rel="stylesheet" type="text/css"
	href="${myContextPath}/include/member.css" />

	<form action="/Product/ProductList.dobby" method="post">
	<select name="caidx">
			 <option value="1">남성의류</option>
			 <option value="302">여성의류</option>
			 <option value="303">아우터</option>
	</select>
	<input name='minPrice' type='text' value='0' />
	<input name='maxPrice' type='text' value='0' />
	
	<input name='keyword' type='text' value='empty' />
	<input name='serch' type='submit' value='검색' />
	</form>


			<div id="tbl"></div>
	

&nbsp;
<div class="form-group">
<center>
<button id='more'>더보기</button>
</center>	
<input id='nextPage' type='text' value='2' />
<input id='moreTotalCount' type='text' value='' />
<input id='page' type='text' value='1' />
</div>
<input type="button" onclick="location='/Product/productPaymentHistory.dobby'" value="구매내역이동">

</body>
</html>

<%@include file="/include/footer.jsp"%>