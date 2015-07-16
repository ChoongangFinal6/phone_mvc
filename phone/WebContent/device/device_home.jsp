<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#homeScreen {
		width:100%;
		height:550px;
		background-image: url("/phone/image/home_screen.png");
		background-repeat:no-repeat;
		background-size: 100% 100%;
	}
</style>
</head>
<body>
	<div id="homeScreen">
		<img src="/phone/image/msg.png" onClick="location.href='listSMS.do'"
		style="width:50px;height:50px;position:absolute;top:450px;left:30px">
	</div>
</body>
</html>