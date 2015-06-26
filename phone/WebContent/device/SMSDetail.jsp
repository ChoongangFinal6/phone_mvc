<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$( document ).ready( function() {
	  var position =  $('#lastMsg').offset();
	    $('html, body').animate({scrollTop : position.top}, 100);
	});
</script>
</head>
<body>
	<div id="dialogTitle">${sendId}</div>
	<div id="dialogContent">
		<c:forEach var="sms" items="${ smsList }">
			<c:if test="${sms.recvId==id}">
				<div class="talkBubble_L">
					<span class="tb_Content_L"><pre>${sms.content}</pre></span>
					<br>		
					<span class="tb_Date_L">
						<fmt:formatDate type="both" pattern="M월d일 hh:mm" value="${sms.sendDate}"/></span>
				</div>
			</c:if>
			
			<c:if test="${sms.sendId==id}">
				<div class="talkBubble_R">
					<span class="tb_Content_R"><pre>${sms.content}</pre></span>
					<br>
					<span class="tb_Date_R">
						<fmt:formatDate type="both" pattern="M월d일 hh:mm" value="${sms.sendDate}"/></span>
				</div>
			</c:if>
		</c:forEach>
		<div id="lastMsg" style="height: 60px"></div>
	</div>
	
	<div id="msgForm">
	<form action="sendMsg.do">
		<input type="text" name="targetId" value="${sendId}" hidden="true">
		<textarea name="content" id="msgInput" cols="22" placeholder="메세지를 입력하세요" required="required"></textarea>
		<button id="msgSendBtn"></button>
	</form>
	</div>
</body>
</html>