<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/member/member.css">
</head>
<body>
	<c:if test="${result==1}"><div id="succ">로그인 성공</div></c:if>
	<c:if test="${result==0}"><div class="fail">비번이 틀림</div></c:if>
	<c:if test="${result==-1}"><div class="fail">없는 아이디</div></c:if>
	<c:if test="${sessionScope.id!=null}">
		<jsp:include page="../member/memberInfo.jsp"></jsp:include>
	</c:if>
	 <c:if test="${sessionScope.id == null || sessionScope.id == ''}">
		<jsp:include page="../member/login.jsp"></jsp:include>
	</c:if>
</body>
</html>


















