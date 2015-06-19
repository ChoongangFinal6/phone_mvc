<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
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
		//location.href='comm.do';
		var params = "id=010";
		//new ajax.xhr.Request('comm.do', params, showNotify, 'POST');
		$.ajax({
			url : 'comm.do', 
			dataType : 'html', 
			success : function(data){
				$('#result').html($(data));		
			}
		});
	}
	

</script>
</head>

<body onLoad="timer_start()">

	<table border="1" width='300'>
		<tr>
			<td><span id="timer_s"></span></td>
		</tr>
		<tr>
			<td><span id="result"></span></td>
		</tr>
	</table>

</body>
</html>