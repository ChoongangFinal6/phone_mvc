<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
html, body {
	width: 100%;
	height:100%
}

html {
	width: 100%;
	height: 100%
}

body {
	width: 100%;
	height: 100%
}

#header {
	width: 100%;
	height: 50px;
	position: relative;
	z-index: 20;
	overflow: hidden;
	background-color: #fcc
}

#container {
	width: 100%;
	min-height: 100%;
	position: relative;
	z-index: 10;
	margin: -50px 0 -50px 0;
	background-color: #FF6
}

.contents {
	padding-top: 50px
}

#footer {
	width: 100%;
	height: 50px;
	position: relative;
	z-index: 20;
	overflow: hidden;
	background-color: #CCF
}
</style>
</head>

<body>

	<div id="header">
		<jsp:include page="device_top.jsp" />
	</div>
	<div id="container">
		<div class="contents">
			<jsp:include page="${viewPage}" />
		</div>
	</div>
	<div id="footer">
		<jsp:include page="device_bottom.jsp" />
	</div>
	
	<%-- 
	<header class="device_Header">
		<jsp:include page="device_top.jsp" />
	</header>
	
	<section>
		<article id="deviceArcticle">
			<jsp:include page="${viewPage}" />
			뷰페이지 : ${viewPage}
		</article>
	</section>
	
	<footer id="devicefooter">
		<jsp:include page="device_bottom.jsp" />
	</footer> --%>
</body>
</html>
