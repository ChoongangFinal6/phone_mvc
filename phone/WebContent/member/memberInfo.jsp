<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${root}/member/member.css"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function runDevice(){
		// window.open(url, windowName, windowFeatures, optionalArg4)
		var deviceWindow = window.open("${root}/device/device.do", "deviceWindow", 
				"menubar=no, titlebar=yes, status=no, scrollbars=no, resizable=no, toolbar=no, " +
				"width=300, height=580, top=0, left=600");	
	}
</script>
</head>
<body>

    <c:if test="${id !='010-0000-0000'}">
	${id}님  <a href="${root}/member/logout.do">[Logout]</a>
		<button onclick="runDevice()">
		<img alt="phone" src="${root}/image/phone.jpg" id="phone"></button>
	</c:if>
 
 <div class="rogintop2">
 <c:if test="${id=='010-0000-0000'}">
    ${id}님  <a href="${root}/member/logout.do">[Logout]</a>
        <a href="${root}/member/memlist.do">[Manage_M]</a>
		<button onclick="runDevice()">
		<img alt="phone" src="${root}/image/phone.jpg" id="phone"></button>
    </c:if> 
 </div>   
</body>
</html>