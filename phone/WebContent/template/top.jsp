<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/member/member.css">
</head>
<body>
	<div>
		<div id="topbar">
			<img alt="wmpt" src="${root}/image/wmptel.jpg" width="300px"
				height="80px" style="text-align: center;"> 
				<span id="topbar_right"> 
				<c:if test="${sessionScope.id!=null}">
					<jsp:include page="../member/memberInfo.jsp"></jsp:include>
				</c:if> 
				 <c:if test="${sessionScope.id == null || sessionScope.id == ''}">
					<jsp:include page="../member/log.jsp"></jsp:include>
				</c:if>
			   </span>
			<hr id="topbar_hr" style="">
		</div>
	</div>

</body>
</html>


















