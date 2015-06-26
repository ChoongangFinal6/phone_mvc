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
	<div id="lastMsgTitle">대화 목록</div>
	<c:forEach var="sms" items="${ smsList }">
		<a href='detailSMS.do?sendId=${sms.sendId}'>
			<div class="chatEntry">
				<span>${sms.sendId}</span><span style="float: right;">[${sms.numOfNew}]</span>
				<div class="lastMsgTitle">${sms.content}</div>
				<div>
				<fmt:formatDate type="both" pattern="M월d일 hh:mm"
					value="${sms.sendDate}" />
				</div>
			</div>
		</a>
	</c:forEach>
</div>

</body>
</html>