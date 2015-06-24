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
	<h2>SMS List</h2>

	<table>
		<c:forEach var="sms" items="${ smsList }">
			<tr>
				<td>
					<a href='readSMS.do?sendId=${sms.sendId}&recvId=${sms.recvId}'>
					${sms.sendId} / [${sms.numOfNew}] <br>
					${sms.content} <fmt:formatDate type="both" pattern="M월d일 hh:mm" value="${sms.sendDate}"/><br>				
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	

</body>
</html>