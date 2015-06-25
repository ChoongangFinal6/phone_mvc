<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

#device_body {
	width: 100%;
	margin: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}

#device_Header {
	width: 100%;
	height: 30px;
	position: absolute;
	z-index: 20;
	background-color: #fcc;
}

#device_Section {
	width: 100%;
	min-height: 100%;
	position: absolute;
	top : 30px;
	margin: 0 0 0 0;
	background-color: #ffeeee;
}

#device_Article {
	height : auto;
	background-color: #aaaaaa;
}
</style>
</head>

<body id="device_body">

  	<div id="device_Header">
		<jsp:include page="device_top.jsp" />
	</div>
	<div id="device_Section">
		<div id="device_Article">
			<jsp:include page="${viewPage}" />
		</div>
	</div>
 
 <%-- 
	<header id="device_Header">
		<jsp:include page="device_top.jsp" />
	</header>
	
	<div id="device_Section">
		<article id="device_Article">
			<jsp:include page="${viewPage}" />
		</article>
	</div>

 --%>
</body>
</html>
