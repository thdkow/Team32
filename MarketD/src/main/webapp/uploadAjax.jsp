<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTO HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload With Ajax</title>
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
<h1>파일 업로드 현재 JSP파일 위치는<br>webapp/uploadAjax.jsp</h1>
	<div class="uploadDiv">
		<input type="file" name='uploadFile' multiple><!--  -->
	</div>
	<div class='uploadResult'>여러 파일을 선택하려면 CTRL이나 SHIFT 키를 누른 상태에서 선택하십시오.
		
	</div>
	<button id="uploadBtn"> upload</button>
	<div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>
		
		<script
		 src="https://code.jquery.com/jquery-3.3.1.js"
		 integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		 crossorigin="anonymous">
		</script>
		
		<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
	<script>
		$(document).ready(function(){
			alert("Ajax를 이용한 파일 업로드 시작");
			////////////파일 상세 처리////////
			
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
			/////////////////////////////
			var cloneObj = $(".uploadDiv").clone();

			$("#uploadBtn").on("click",function(e){
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				alert("업로드 버튼 클릭시 초기화");
				var files = inputFile[0].files;
				
				console.log(files);
				
				//add filedate to formdata //checkExtension로 확장자 사이즈 구분
				for(var i =0; i <files.length; i++){
					if(!checkExtension(files[i].name,files[i].size)){
						return false;
					}
					formData.append("uploadFile",files[i]);
				}
				 $.ajax({
					url: '/uploadAjaxAction.dobby',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					dataType:'json',
					success: function(result){ 
						console.log(result);
						console.log("끝났니?");
					}
				}); // $.ajax 
				 alert("uploadBtn 끝");
			});// 끝
			
			var uploadResult = $(".uploadResult ul");
			 alert("uploadResult렛츠 기릿");
				function showUploadedFile(uploadResultArr){
					
			var str="";
					console.log("이미지 ㄱㄱㄱ");
						$(uploadResultArr).each(function(i, obj) {
							
							if(!obj.image){
								
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
			alert(obj.uploadPath);
			var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					
							str +="<li><div><a href='/download.dobby?fileName="+fileCallPath+"'>"
								+"<img src='/resources/img/iconfile.png'>" 
								+ obj.fileName + "</a>"
								+"<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"
								+"</div></li>";
							}else{
								
			var fileCallPath = encodeURIComponent ( obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
					
			var originPath = obj.uploadPath+"\\"+obj.uuid +"_"+obj.fileName;
			
			originPath = originPath.replace(new RegExp(/\\/g),"/");
			alert(fileCallPath+"파일콜패스경로");			
			str += "<li><a href=\"javascript:showImage(\'"
				+originPath+"\')\"><img src='/display.dobby?fileName="
				+fileCallPath+"'></a><span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"
				+"<li>";
							
							}
						});
				$(".uploadResult").html(str);//아래 append 작동안 해서 변경
//					uploadResult.append(str);
				}//showUploadedFile 끝
			
		});//도큐먼트레디
		
		function showImage(fileCallPath) {
			///alert("showImage작동");alert(fileCallPath);
			
			console.log("showImage작동");
			console.log(fileCallPath);
			
			
				$(".bigPictureWrapper").css("display","flex").show();
				$(".bigPicture")
				.html("<img src='/display.dobby?fileName="+encodeURI(fileCallPath)+"'>")//encodeURI 책과 다름
				.animate({width:'100%',height:'100%'},1000);
			
			console.log("showImage....end");
			
		}//bigPictureWrapper 이미지 끝
		$(".bigPictureWrapper").on("click",function(e){
			
			console.log(".bigPictureWrapper open");
			
			e.stopPropagation();
			
			$(".bigPicture").animate({width:'0%',height:'0%'},1000);
			setTimeout(function(){
				console.log(".bigPictureWrapper timeout");
				$('.bigPictureWrapper').hide();
			},1000);
			
		});//bigPictureWrapper click 끝
		
		$(".uploadresult").on("click","span",function(e){
			
			var targerFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
			
			$.ajax({
				url:'/deleteFile.dobby',
				data:{fileName: targetFile, type:type},
				dataType:'text',
				type:'POST',
				success:function(result){
					alert(result);
				}
			}); //ajax
		});
		
	</script>
</body>
</html>