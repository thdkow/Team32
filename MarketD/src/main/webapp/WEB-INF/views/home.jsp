<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
<style type="text/css">
div {
	color: blue; 
}
</style>

</head>
<body>
<h1>
	Hyun Jun Kang
</h1>

<P>  The time on the server is ${serverTime}. </P>


<div id = "my" >
이덕현
</div>
<%
for(int i=0;i<10;i++){
	System.out.println(i+"단 입니다");
	for(int j=0;j<10;j++){
		System.out.println(i+"X"+j+"="+(i*j)+"입니다");
	}
}
%>
<div>
이완건
</div>
<div>
강현준
</div>

</body>
</html>
