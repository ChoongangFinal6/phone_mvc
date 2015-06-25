<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#topBar {
		height:30px;
		background-color: black;
		color:white;
		padding : 0px 20px 0px 10px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

	function timer_start() { 
		tcounter = 0;
		t1 = setInterval(timer, 1000);
	}
	
	// 1자리 수는 앞에 0을 붙여 2자리 수로
	function doubleDigit(i) {
	    if (i < 10) {
	        i= "0" + i;
	    }
	    return i;
	}

	function timer() {
		tcounter = tcounter + 1;
		var today = new Date();
		var h = today.getHours();
		var m = today.getMinutes();
		m = doubleDigit(m);
		
		document.getElementById("clock").innerHTML = h+ ":" + m;	

	 	if(tcounter%8==0){
			getState();
			tcounter=1;
		}
	}
	
	function getState(){
		var recvId = ${id};
		var params = 'recvId=' + recvId;

		$.ajaxSetup( {
			type : 'post',
			url : 'smsRecv.do',
			dataType : 'html', 
			success : function(data){
				$('#result').html($(data).find('#status_sms'));
			}
		});
		
		$.ajax({ data:params}); 
	}
	
</script>
</head>

<body onLoad="timer_start()">
	<div id="topBar">
		<span id="clock"></span>
		<a href="listSMS.do?recvId=${recvId}"><span id="result">${newMsg}</span></a>
	</div>
</body>
</html>