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
<c:if test="${result>0}">
<script type="text/javascript">
 alert("${id}님 가입완료 되었습니다.");
 location.href="../home.do"; //${root} 해도된다  command.properties에 설정 에서 보면 home.do로 하면
                             // member/home.do로 간다. 그래서 경로를 못찾음
</script>                    
</c:if>
<c:if test="${result<=0 }">
<script type="text/javascript">
alert("가입 실패 하였습니다.");
history.go(-1);
</script>
</c:if>




</body>
</html>