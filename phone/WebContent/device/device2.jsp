<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	function timer_start() { 
		tcounter = 0;
		t1 = setInterval(timer, 1000);
	}

	function timer() {
		tcounter = tcounter + 1;
		document.getElementById("timer_s").innerHTML = tcounter;
		
		if(tcounter%3==0){
			getState();
		}
	}
	
	function getState(){
		var recvId = '01011112222';
		var pass = '1234';
		var params = 'recvId=' + recvId + '&pass=' + pass;

		$.ajaxSetup( {
			type : 'post',
			url : 'smsRecv.do',
			dataType : 'html', 
			success : function(data){
				$('#result').html($(data));	
			}
		});
		
		$.ajax({ data:params}); 
	}
	

</script>
</head>

<body onLoad="timer_start()">

	<table border="1">
		<tr>
			<td style="width: 300px; height: 50px"><span id="timer_s"></span></td>
		</tr>
		<tr>
			<td style="height: 300px"><span id="result"></span></td>
		</tr>
	</table>

</body>
</html>