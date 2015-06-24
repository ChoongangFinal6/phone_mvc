<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="dao.*, dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
					<a href='readSMS.do?sendId=${sms.sendId}'>
					${sms.sendId} / [${sms.numOfNew}] <br>
					${sms.content} <fmt:formatDate type="both" pattern="M월d일 hh:mm" value="${sms.sendDate}"/><br>				
				</td>
			</tr>
		</c:forEach>
	</table>
	
<%-- 	<table>
		<c:forEach var="sender" items="${ sendIdMap }">
			<c:set var="msg" value="${sender.key}"></c:set>
			<tr>
				<td><a href='readSMS.do?sendId=${sender.key}'>
					${sender.key} / ${sender.value}<br>
					${newestMsgMap[msg]}
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
 --%>
</body>
</html>