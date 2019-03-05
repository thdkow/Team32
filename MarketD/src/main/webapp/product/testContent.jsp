<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:set var="pm" value="${requestScope.pm}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${myContextPath}/include/member.css" />
	
<script type="text/javascript">

$( document ).ready( function() {
//	alert("제이쿼리 시작 확인");
	
	 $.boardCommentList(); //페이지 댓글 리스트 
	
	$('#save').click(function(){	
		 alert("세이브 작동");	
		  	var pidx =		$("#pidx").val();
			var cwriter =	$("#cwriter").val();
			var ccontent =	$("#ccontent").val();
			var midx =		$("#midx").val();
		 $.ajax({
				type : "POST",
				url  : "${contextPath}/product/commentWriteAction.dobby",
			 	headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				datatype : "text",
				data : JSON.stringify({						
					"pidx" : pidx,
					"cwriter" : cwriter,
					"ccontent" : ccontent,
					"midx" : midx
				}),
				cache : false,
				error : function(){ },
				success : function(data){
						if (data == null){
							alert("데이타없음");
						}
						 alert(data.result+" : result값");
						alert(data);
						/* $.boardCommentList();*/
						$('#cwriter').val("");
						$('#ccontent').val("");
						$('#nextPage').val("2");
						}			
			});	
		});//save펑션	
  } );// 도큐먼트 끝
  
  $.boardCommentList = function(){
//	  alert("boardCommentList 쪽");
	var page = $("#nextPage").val();
		$.ajax({
			type : "GET", //숫자 2 = {midx}고정 값 로그인 기능 구현시 교체, 1은 페이지 첫페이지 불러오기 위한 값
			url  : "${contextPath}/product/2/1/commentlist.dobby",
			datatype : "json",
			cache : false,
			error : function(){	
//				alert("boardCommentList에러발생");
			},
			success : function(data){
				
				commentList(data);
				}			
		});	 	
}//boardCommentList끝

$.del = function(cidx){//삭제 기능
	
	var cidx = cidx;
//	 alert("값cidx:"+cidx);
 	
	 $.ajax({
			type : "DELETE",
			url  : "/Comment/"+cidx+"/deleteComment.dobby",
			 headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			datatype : "text",
			cache : false,
			error : function(){				
			},
			success : function(data){			
				
				if (data == null){
					alert("data값은 없음");
				}
				$.boardCommentList();
			}			
		});	
}	
function commentList(data){
	
		var str = '';						
		var midx = 2;//로그인 기능 구현시 변수처리
				
		$(data).each(function(index){
			
			if (midx == this.midx) {//본인만 삭제 가능
				delinput ="<button class='btn btn-danger' onclick='$.del("+this.cidx+")'>삭제</button>";
				}
			if (midx != 0) {//로그인 한 모든 사람에게 권한
				replyput ="<button class='btn btn-danger' onclick='$.replyinput("+this.cidx+")'>답글</button>";
				}
			str += "<ul><li class='sub1'>"+(index+1) + "</li>" 
				+  "<li class='sub2'>"+this.cwriter + "</li>"
				+  "<li class='sub3'>"+this.ccontent + "</li>"
				+  "<li class='sub4'>"+delinput+"</li>"
				+  "<li class='sub5'>"+replyput+"</li>"
				+  "</ul>";
				});
		$('#tbl').html("<ul><li class='title1'>번호</li>"
						+"<li class='title2'>작성자</li>"
						+"<li class='title3'>내용</li>"
						+"<li class='title4'>삭제여부</li>"
						+"</ul>"
						+str+"");				
	}/*commentList끝*/
	
	$.replyinput = function(cidx){//답글 작성칸 기능
		
		var cidx = cidx;
		alert(cidx+"cidx값");
					replygo ="<button class='' onclick='$.selectCommentOne("+cidx+")'>대댓글입력</button>";
		
		$('#tblreply').html("<ul><li class='title1'>작성자</li>"
				+"<li class='title2'><input type='text' name='cwriterre' id='cwriterre' placeholder='작성자'class='' /></li>"
				+"<li class='title1'>댓글내용</li>"
				+"<li class='title3'><input type='text' name='ccontentre' id='ccontentre' placeholder='대댓글내용'class='' /></li>"
				+"<li class='title4'>"+replygo+"</li>"
				+"</ul>" );
		
		
    }
	 $.selectCommentOne = function(cidx){
		  alert("selectcommentone 쪽");
		var cidx = cidx
		alert("selectcommentone 쪽 번호 : "+cidx);
			$.ajax({
				type : "GET", 
				url  : "/comment/"+cidx+"/commentOne.dobby",
				datatype : "json",
				cache : false, 
				error : function(){	
					alert("selectCommentOne에러발생리");
				},
				success : function(data){

//					alert("selectCommentOne의 오리진값:"+data["corigincidx"]);
					$.reply(data);

					}			
			});	 	
	}//selectcommentone끝
	
	$.reply = function(data){//답글 저장 기능
		alert("reply시작");
		var pidx =	$("#pidx").val();//pidx,midx는 하단에 상수값있음 나중에 변경하기
//		 alert("pidx"+pidx+": reply쪽");
		var midx =	$("#midx").val();
//		 alert("midx"+midx+": reply쪽");	
		var cwriter =	$("#cwriterre").val();
//		 alert("작성자"+cwriter+": reply쪽");
		var ccontent =	$("#ccontentre").val();
//		 alert("내용"+ccontent+": reply쪽");
		var corigincidx=data["corigincidx"];
		 alert("오리진"+corigincidx+": reply쪽");
		var cleftright =data["cleftright"];
//		 alert("레프트"+cleftright+": reply쪽");
		var cupdown =	data["cupdown"];
		 alert("업다운"+cupdown+": reply쪽");
		 
		 $.ajax({
				type : "POST",
				url  : "/comment/commentReplyWrite.dobby",
				 headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				datatype : "json",
				  data : JSON.stringify({						
					"pidx"		: pidx,
					"midx"		: midx,
					"cwriter"	: cwriter,
					"ccontent"	: ccontent,
					"corigincidx"	: corigincidx,
					"cleftright"	: cleftright,
					"cupdown"		: cupdown
				}),  
				cache : false,
				error : function(){				
				},
				success : function(data){			
					
					if (data == null){
						alert("data값은 없음");
					}
					$.boardCommentList();
					$('#cwriterre').val("");
					$('#ccontentre').val("");	
				}			
		});	
	}//reply끝	
</script>
		<h1>&lt;댓글 테스트 페이지&gt;</h1>
	
				제목		:이 페이지는 답글을 확인하기 위한 용도 입니다<br>
				작성자	:도비<br>
				조회수	:조회수<br>
				작성일	:2019.02.28<br>
				<!-- substring(0,10) 을 지우면 시간까지 0,10으 숫자 파악하기 -->
			<br>
			<br>
				내용		:내용은 없다 댓글만 작동하면 그만
			<br>

		<div id="commenttbl" class="box-body">
		<div class="form-group">
		<label for="examInputEmail1">작성자</label>
		<input type="text" class="form-control" name="cwriter" id ="cwriter" placeholder="이름입력하세요" />
		<input type="hidden" name="pidx" id="pidx"  value="2" /><!-- 게시판 글의 bidx 번호 -->
		<input type="hidden" name="midx" id="midx"  value="2" />
		<br>	
		<label for="examInputEmail1">내용</label>
		<textarea class="form-control" name="ccontent" id="ccontent" rows="3" placeholder="내용입력하세요"></textarea>
		</div>

		<div class="form-group">
		<input type="button" name="save" id="save" value="저장" class="comment_input" />	
		</div>
		</div>
		<div id="tbl"></div><!-- 코멘트리스트 -->
		<div id="tblreply"></div><!-- 코멘트답글 -->
		&nbsp;
		<div class="form-group">
				<input type="hidden" name="corigincidx" id="corigincidx"  value="${cv.corigincidx}" />
				<input type="hidden" name="cleftright" id="cleftright"  value="${cv.cleftright}" />
				<input type="hidden" name="cupdown" id="cupdown"  value="${cv.cupdown}" />
		<input id='nextPage' type="hidden" value='2' /><!--page에 해당값을
		2로 준 이유는 첫 리스트화 했을 시 더보기 누르면 두번째가 작동 단 문제가 2로 주면 리스트가 2에 해당값을 뽑아서
		첫 리스트는 page값을 고정값 1로 줬다<-해결법 page를 변수 처리해서 이 부분처럼 input에 hidden으로 담아서
		이 페이지 내에서 기억 할 수 있게끔 하면 된다
		  -->
		<input id='totalCount' type='text' value='0' /><!--totalCount에 해당값을  -->
		</div> 
		
		<!-- 페이징 처리에 사용되는 인터페이스이다 < 1 2 3 4 5 6 7 8 9 10 > -->
	 <div style="text-align: center;">
	 <div class="jb-center">
		 <ul class="pagination">
		 	<li>
		 	<c:if test="${pm.prev eq true }">
	 			<a href="${myContextPath}/Board/boardList.do${pm.makePrev()}"> 			
		 			<span class="glyphicon glyphicon-chevron-left"></span>
	 			</a> 		
 			</c:if>			
			</li>
			
 	 	<c:forEach var="pmbt" begin="${pm.startPage}" end="${pm.endPage}">
           <li
           <c:if test="${pm.scri.page eq pmbt}">class="active"</c:if>>
           
           		<a href="${myContextPath}/Board/boardList.do${pm.makeSearch(pmbt)}">${pmbt}</a>
           		<!-- 메소드를 이용해서 깔끔하게 처리하였다. -->
           </li>
        </c:forEach>
  
		 	<li>
		  	<c:if test="${pm.next eq true && pm.endPage gt 0}">
 			 <a href="${myContextPath}/Board/boardList.do${pm.makeNext()}">
	 			<span class="glyphicon glyphicon-chevron-right"></span>
 			</a> 
 		 	</c:if> 
			</li>
		 </ul>
	 </div>
 </div>
	<div>
		<button onclick="location.href='${contextPath}/index.jsp'">메인가기</button>
	</div>
	
