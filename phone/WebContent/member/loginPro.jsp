<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../template/aa.jsp"%>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result==1}">
<script type="text/javascript">
alert("${name}님 로그인 되었습니다. ");
Location.href= "home.do";
</script>
</c:if>
<c:if test="${result==-1}">
<script type="text/javascript">
alert("없는 아이디 입니다.");
history.go(-1);

</script>
</c:if>
<c:if test="${result==0}">
<script type="text/javascript">
alert("비밀 번호가 맞지 않습니다");
history.go(-1);

</script>


</c:if>

</body>
</html>