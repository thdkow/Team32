<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.uploadDiv{
background: rgb(230,230,230);
}

.uploadResult{
	width:100%;
	background-color: gray;
	border: 5px solid red;
}
.uploadResult ul{
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}
.uploadresult ul li{
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}
.uploadresult ul li img{
	width: 100px;
}
.uploadresult ul li span{
	color: white;
}
.bigPictureWrapper{
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255,255,255,0.5);
}
.bigPicture{
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}
.bigPicture img{
	width: 600px;
}
</style>
</head>
<body>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		
			<div class="panel panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/board/register" method="post">
					<div class="form-group">
						<label>title</label> <input class="form-control" name="title">
					</div>
					
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control"  rows="3" name="content" ></textarea>
					</div>
					
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer">
					</div>
					<button type="submit" class="btn btn-default">submit Button</button>
					<button type="reset" class="btn btn-default">reset Button</button>
				</form>
			</div><!--end panel-body  -->
		</div><!--end panel-body  -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
		
			<div class="panel-heading">File Attach</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" class="" name='uploadFile' multiple>
				</div>
				
				<div class='uploadResult'>
					<ul>
					
					</ul>
				</div>
			</div><!-- end panel-body -->
		</div><!-- end panel-body  -->
	</div><!--end panel  -->
</div><!-- /.row -->

<script src="https://code.jquery.com/jquery-3.3.1.js"
		 integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		 crossorigin="anonymous">
</script>
		
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$( document ).ready( function(e) {
	alert("시작");
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		console.log("submit clicked");
		var str ="";
			
			$(".uploadResult ul li").each(function(i, obj){
				
				var jobj = $(obj);
				console.dir(jobj);
				
	str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			});
			$(".formObj").html(str).submit();
//			formObj.append(str).submit();
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");

	var maxSize = 5242880; //5MB

	function checkExtension(fileName, fileSize){	
		if(fileSize >= maxSize){
				alert("파일 사이즈 초과.");
			return false;
		}
		if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
}); //document ready끝


$("input[type='file']").change(function(e){
	console.log("변화감지");
	var formData = new FormData();
	
	var inputfile = $("input[name='uploadFile']");
	
	var files =	inputFile[0].files;
console.log("files : "+files);
	for(var i=0;i<files.length;i++){
		if(!checkExtension(files[i].name,files[i].size)){
			return false;
		}
		formData.append("uploadfile",files[i]);
	}
	
	$.ajax({
		url:'/uploadAjaxAction.dobby',
		processData:false,
		contentType:false,data:
		formData,type:'POST',
		datatype:'json',
		success:function(result){
			console.log(result);
			showUploadResult(result); // 업로드 결과 처리 함수
		}
	}); //ajax 
}); //input[type='file']
	
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr||uploadresultArr.length==0){return;}
		var uploadUL = $(".uploadResult ul");
		var str="";
		$(uploadResultArr).each(function(i, obj){
			
			//image type
			if(obj.image){
	var fileCallPath = encodeURIComponent ( obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str += "><div>";
				str	+= "<span> "+obj.fileName+"</span>";
				str	+= "<button type='button' data-file=\'"+fileCallPath+"\' "
				str	+= "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str	+= "<img src='/display.dobby?fileName="+fileCallPath+"'>";
				str	+= "</div>";
				str	+="</li>";
			}else{
			//이미지 파일만 받을꺼니까 이 부분은 미사용	
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				str += "<li><div>";
				str	+= "<span> "+obj.fileName+"</span>";
				str	+= "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str	+= "<img src='/resources/img/iconfile.png'></a>";
				str	+= "</div>";
				str	+="</li>";
			}
		});
		uploadUL.append(str);
	}
	
$(".uploadResult").on("click","button",function(e){
	console.log("delete file");
	
});
</script>
</body>
</html>