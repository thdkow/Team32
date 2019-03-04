<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <c:set 	var="pv" value="${pv}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${pv.pidx}<br>
${pv.caidx}<br>
${pv.midx}<br>
${pv.psubject}<br>
${pv.phit}<br>
${pv.pwridate}<br>
${pv.pcontent}<br>
${pv.pimage}<br>
${pv.pvol}<br>
${pv.pmoney}<br>
${pv.pfee}<br>
${pv.pip}<br>
${pv.psaleYn}<br>
${pv.pdelYn}


</body>
</html>