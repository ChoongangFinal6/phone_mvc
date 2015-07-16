<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

</body>
</html>
