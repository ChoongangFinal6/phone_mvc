<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function runDevice(){
		// window.open(url, windowName, windowFeatures, optionalArg4)
		var deviceWindow = window.open("device/device.do", "deviceWindow", 
				"menubar=no, titlebar=yes, status=no, scrollbars=no, resizable=no, toolbar=no, " +
				"width=300, height=600, top=0, left=600");	
	}
</script>
</head>
<body>

HOME
	<button onclick="runDevice()">phone</button>

</body>
</html>