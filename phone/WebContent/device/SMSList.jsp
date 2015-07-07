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
		<c:if test="${sms.recvId==sessionScope.id}"><!-- 마지막 대화가 내가 받은 문자인경우 -->
		<a href='detailSMS.do?sendId=${sms.sendId}'>
			<div class="chatListEntry">
				<span style="font-weight:bold;">${sms.sendId}</span>
				<c:if test="${sms.numOfNew >= 1}">
					<span style="margin-left: 10px; font-weight:bold; color:red;">
					<img src="${root}/image/${sms.numOfNew}.png" style="width:15px"></span>
				</c:if>
				<div class="lastMsgTitle">${sms.content}</div>
				<div style="text-align:right; font-size: 8pt">
				<fmt:formatDate type="both" pattern="M월d일 hh:mm"
					value="${sms.sendDate}" />
				</div>
			</div>
		</a>
		</c:if>
		<c:if test="${sms.sendId==sessionScope.id}"><!-- 마지막 대화가 내가 보낸 문자인경우 -->
		<a href='detailSMS.do?sendId=${sms.recvId}'>
			<div class="chatListEntry">
				<span style="font-weight:bold;">${sms.recvId}</span>
				<c:if test="${sms.numOfNew >= 1}">
					<span style="margin-left: 10px; font-weight:bold; color:red;">
					<img src="${root}/image/${sms.numOfNew}.png" style="width:15px"></span>
				</c:if>
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