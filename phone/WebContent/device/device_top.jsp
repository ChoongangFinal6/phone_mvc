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
		padding : 0px 0px 0px 0px;
	}
	
#clock{
	vertical-align: top;
	height:30px;
	font-size: 16pt;
}

#result {
	vertical-align: top;
	margin-left: 20px;
	height: 30px;
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

	 	if(tcounter%10==0){
			getState();
			tcounter=1;
		}
	}
	
	// 새 문자가 몇 개 와있는지 조회
	function getState(){
		var recvId = ${id};
		var params = 'recvId=' + recvId;

		$.ajaxSetup( {
			type : 'post',
			url : 'smsRecv.do',
			dataType : 'text', 
			success : function(data){
				var num = $(data).find('#newMsg').text();
				if(num>=1){
					var imgSrc = "<img src='../image/envelop1.png'" +
						"style='width:25px; height:25px;'>";
					$('#result').html(imgSrc);
				}else{
					
				}
				
			}
		});
		
		$.ajax({ data:params}); 
	}
	
	// 문자 대화 리스트를 조회
	function getDialogList(){
		var recvId = ${id};
		var params = 'recvId=' + recvId;
		
		$.ajaxSetup( {
			type : 'post',
			url : 'listSMS.do',
			dataType : 'html', 
			success : function(data){
				$('#device_Article').html($(data).find('#chatList'));
			}
		});
		
		$.ajax({ data:params}); 
	}
/* 
	$('#result').click( function(){
		alert("1");
		getDialogList();	
	});
 */
</script>
</head>

<body onLoad="timer_start()">
	<div id="topBar">
		<span id="clock"></span>
		<span id="result" onclick="getDialogList()"></span>
	</div>
</body>
</html>