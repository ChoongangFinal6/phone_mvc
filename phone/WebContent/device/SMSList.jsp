<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<div id="chatList">
	<div id="chatList_Title">대화 목록</div>
	<div style="height: 50px;"></div>
	<c:forEach var="sms" items="${ smsList }">
		<c:if test="${sms.recvId==sessionScope.id}">
		<a href='detailSMS.do?sendId=${sms.sendId}'>
			<div class="chatListEntry">
				<span style="font-weight:bold;">${sms.sendId}</span>
				<span style="margin-left: 10px; font-weight:bold; color:red;">[${sms.numOfNew}]</span>
				<div class="lastMsgTitle">${sms.content}</div>
				<div style="text-align:right; font-size: 8pt">
				<fmt:formatDate type="both" pattern="M월d일 hh:mm"
					value="${sms.sendDate}" />
				</div>
			</div>
		</a>
		</c:if>
		<c:if test="${sms.sendId==sessionScope.id}">
		<a href='detailSMS.do?sendId=${sms.recvId}'>
			<div class="chatListEntry">
				<span style="font-weight:bold;">${sms.recvId}</span>
				<span style="margin-left: 10px; font-weight:bold; color:red;">[${sms.numOfNew}]</span>
				<div class="lastMsgTitle">${sms.content}</div>
				<div style="text-align:right; font-size: 8pt">
				<fmt:formatDate type="both" pattern="M월d일 hh:mm"
					value="${sms.sendDate}" />
				</div>
			</div>
		</a>
		</c:if>
	</c:forEach>
</div>

</body>
</html>