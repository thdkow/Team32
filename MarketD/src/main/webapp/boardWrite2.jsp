<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.team.marketd.domain.*" %>
<% PageMaker pm = (PageMaker)request.getAttribute("pageMaker");%>

<%@ include file="../include/header.jsp" %>


<style>
.fileDrop {
width: 100%;
height:200px;
border:1px dotted blue;
}

small {
margin-left:3px;
font-weight:bold;
color:gray;
}
</style>
<script type="text/javascript">
function check() {	
  
  var formname = document.frm;
  
  if (formname.subject.value =="") {
	  alert("제목입력하세요");
	  formname.subject.focus();	  
	  return ;	  
  } else if (formname.content.value ==""){	
	  alert("내용 입력하세요");
	  formname.content.focus();	  
	  return ;
  } else if (formname.writer.value ==""){	
	  alert("작성자 입력하세요");
	  formname.writer.focus();	  
	  return ;
  }
    var res;
  	res = confirm("등록하시겠습니까?");
  
  	if (res == true) {
	   	formname.method ="post";
	   	formname.action ="<%=request.getContextPath() %>/BoardWriteActionController";
	   	formname.submit();  
  	}
  	return ;
}	

function addFilePath(msg){
	alert(msg);	
}

function checkImageType(fileName){
	
	var pattern = /jpg$|gif$|png$|jpeg$/i;
	alert(fileName.match(pattern));
	
	return fileName.match(pattern);
}

function getOriginalName(fileName){
//	alert(fileName);
	//이미지파일이면 원본이름 안쓴다
	if (checkImageType(fileName)) {
		return;
	}
	
	var idx = fileName.lastIndexOf("_")+1;
	
	alert(idx);
	return fileName.substr(idx);
}

//파일이 이미지일경우
function getImageLink(fileName){
	if (!checkImageType(fileName)) {
		return;
	}
	//위치 폴더뽑기
	var front = fileName.substr(0,12);
	//파일이름뽑기
	//_는 빼고
	var end = fileName.substr(14);
	
	return front+end;	
}

function fileman(){
	alert("파일업로드만 실행");
	$("#uploadfile").on("dragenter dragover",function(event){//드래그 사용
	
		event.preventDefault();		//이벤트 기본 기능 중지 검색하기
	});
	
	$("#uploadfile").on("drop",function(event){
		//파일을 drop 떨어트리면 이벤트 발생 에이작스 아래가 작동
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file",file);//덧붙이다
		
		$.ajax({
			url:'/uploadAjax', //@restcontroller로 이 경로가
			data: formData,
			dataType:'text',
			processData:false,
			contentType:false,
			type:'POST',
			success : function(data){
				
				//  /2018/05/30/s-sdsdsd-ssd22q.jpg
				alert(data);
			
				// input--> sdsdsd-ssd22q.jpg
				$("#uploadfile").val(data.replace("s-",""));		
				
				var str ="";
				
				if(checkImageType(data)){
					str ="<div>"
					+ "<a href='displayFile?fileName="+getImageLink(data)+"'>"
					+ "<img src='displayFile?fileName="+data+"' />"
					+ getImageLink(data) 
					+ "</a>"
					+ "</div>";
				}else{
					str = "<div>"
						+ "<a href='displayFile?fileName="+data+"'>"
						+ getOriginalName(data) 
						+ "</a>"
						+ "</div>";
				}
				
				$(".uploadedList").append(str);
			}		
			
		});	
		
	});	
	
});

</script>
</head>
<body>
<form name="frm">
<input type=hidden name="page" value="<%-- <%=pm.getScri().getPage() %> --%>" />
<input type=hidden name="searchType" value="<%-- <%=pm.getScri().getSearchType() %> --%>" />
<%-- <input type=hidden name="keyword" value="<%=pm.getScri().getKeyword() %>" /> --%>
<table border=1 width="100%" height="600px">
<tr>
<td>제목</td>
<td>
<input type="text" name="subject" id="subject" size="20" maxlength="20" />
</td>
</tr>
<tr>
<td>내용</td>
<td>
<textarea name="content" rows=20 cols=100 >
</textarea>
</td>
</tr>
<tr>
<td>작성자</td>
<td>
<input type="text" name="writer"  size="20"  />
</td>
</tr>
<tr>
<td>파일업로드</td>
<td>
<!-- <input type="hidden" id ="uploadfile" name="uploadfile"> -->
</td>
</tr>
<tr>
<td></td>
<td align="center">
<input type="button" name="button" value="확인" onclick="javascript:check();" />
<input type="button" value="리셋" onclick="reset();"/>
<input type="button" value="목록" onclick="javascript:document.location.href='<%=request.getContextPath()%>/BoardListController';"/>
</td>
</tr>
</table>
</form>

<form action="">
<div>파일만작동</div>
<div><input type="text" id ="uploadfile" name="uploadfile"></div>
<div><input type="button" name="button" value="확인" onclick="javascript:fileman();" /></div>
</form>
<div class="fileDrop"></div>
<div class="uploadedList"></div>

<%@ include file="../include/footer.jsp" %>

