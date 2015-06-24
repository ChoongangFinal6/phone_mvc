<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.msgBalloon {
		border: 1px solid black;
	}
</style>
</head>
<body>
	<h3>${smsList.get(0).sendId}와의 대화목록</h3>
	
	<table>
		<c:forEach var="sms" items="${ smsList }">
			<tr>
				<c:if test="${sms.recvId==id}">
					<td>
						<div class="msgBalloon">	
						${sms.content}<br>
						<fmt:formatDate type="both" pattern="M월d일 hh:mm" value="${sms.sendDate}"/><br>
						</div>				
					</td>
					<td></td>
				</c:if>
				<c:if test="${sms.sendId==id}">
					<td></td>
					<td>
						<div class="msgBalloon">	
						${sms.content}<br>
						<fmt:formatDate type="both" pattern="M월d일 hh:mm" value="${sms.sendDate}"/><br>				
						</div>
					</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<div style="position: absolute; bottom: 50px;">
	<form action="sendMsg.do?">
		<input type="text" name="newMsg" required="required" style="width: 100%; padding:5px;"><button style="padding:5px;">전송</button>
	</form>
	</div>
</body>
</html>