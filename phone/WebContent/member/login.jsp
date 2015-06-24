<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../template/aa.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="./member.js"></script>
</head>
<body>
<form action="${root}/member/loginPro.do" method="post">
<input type="tel" name="id" placeholder="아이디(xxx-xxxx-xxxx)"  required="required" 
pattern="\d{3}[\-]\d{4}[\-]\d{4}" id="logid">
<input type="password" name="password" placeholder="비밀번호"  required="required" id="pwd">
<input type="submit"  value="로그인"  required="required" name="login">
<input type="button" name="join" value="회원가입" class="join" id="join" onclick="location.href='${root}/member/check.do'">

</form>






</body>
</html>