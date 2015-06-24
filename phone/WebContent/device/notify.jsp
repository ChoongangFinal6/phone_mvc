<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dao.*, dto.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div id="status_sms">
		<a href="listSMS.do?recvId=${recvId}"> ${newMsg}</a>
		<%-- <c:if test="${smsList.size() >= 1}">
			0
		</c:if>
		<c:if test="${smsList.size() == 0}">
			0
		</c:if> --%>
	</div>
</body>
</html>