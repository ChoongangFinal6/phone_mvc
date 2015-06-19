<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp" />
	</header>
	
	<section>
		<article>
			<jsp:include page="${viewPage}" />
			<%-- ${viewPage} --%>
		</article>
	</section>
	
	<footer>
		<jsp:include page="bottom.jsp" />
	</footer>
</body>
</html>