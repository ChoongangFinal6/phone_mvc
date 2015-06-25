<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

#dialogTitle{
	background-color: #333333;
	height: 60px;
  	color: white;
  	font-size: 1.5em;
}

.dialogContent {
	overflow: scroll;
}

.msgBalloon {
	border: 1px solid black;
}

#msgForm {
	width :100%;
	position : absolute;
	bottom : 0px;
	float : left;
	height : 50px;
	padding: 0 0 0 0;
	margin: 0 0 0 0;
}
#msgInput {
	resize: none;
	width: 270px;
	height : 100%;
}
#msgSendBtn {
	width : 50px;
	height : 50px;
	background-image : url("../images/send_msg.png");
	background-position: center;
	background-size : 50px;
	margin: 0 0 0 0;
}



</style>
</head>
<body>
	<div id="dialogTitle">${sendId}</div>
	<div id="dialogContent">
		<c:forEach var="sms" items="${ smsList }">
			<c:if test="${sms.recvId==id}">
				<div class="talkBubbleYou"> ${sms.content}</div>				
			<%-- 	<span class="talkBubbleDate"><fmt:formatDate type="both" pattern="M월d일 hh:mm" value="${sms.sendDate}"/></span> --%>
			</c:if>
			<c:if test="${sms.sendId==id}">
				<%-- <span class="talkBubbleDate"><fmt:formatDate type="both" pattern="M월d일 hh:mm" value="${sms.sendDate}"/></span> --%>
				<div class="talkBubbleMe"> ${sms.content}</div>
			</c:if>
		</c:forEach>
	</div>
	
	<span id="msgForm">
	<form action="sendMsg.do">
		<input type="text" name="targetId" value="${sendId}" hidden="true">
		<textarea name="content" id="msgInput" placeholder="메세지를 입력하세요" required="required"></textarea>
		<button id="msgSendBtn"></button>
	</form>
	</span>
</body>
</html>