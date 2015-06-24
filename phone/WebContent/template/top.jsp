<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.id!=null}">
		<jsp:include page="../member/memberInfo.jsp"></jsp:include>
	</c:if>
	 <c:if test="${sessionScope.id == null || sessionScope.id == ''}">
		<jsp:include page="../member/login.jsp"></jsp:include>
	</c:if>
</body>
</html>


















