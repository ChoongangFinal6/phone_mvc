<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#device_footer {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #575859), color-stop(1, #000000));
	background:-moz-linear-gradient(top, #575859 5%, #000000 100%);
	background:-webkit-linear-gradient(top, #575859 5%, #000000 100%);
	background:-o-linear-gradient(top, #575859 5%, #000000 100%);
	background:-ms-linear-gradient(top, #575859 5%, #000000 100%);
	background:linear-gradient(to bottom, #575859 5%, #000000 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#575859', endColorstr='#000000',GradientType=0);
	background-color:#8a878a;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	padding:0 0 0 0;
	margin:0 0 0 0;
	width:100%;
	height:40px;
	bottom:0;
	position:fixed;
	z-index: 100;
	text-align: center;
}

#homeBtn {
	width:35px;
	height:35px;
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
	<div id="device_footer">
		<img src="${root}/image/homeBtn.png" id="homeBtn" onClick="location.href='/phone/device/device.do'">
	</div>
</body>
</html>