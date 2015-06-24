<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../template/aa.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/member/member.css">
<script type="text/javascript" src="${root}/js/jquery.js"></script>
<script type="text/javascript" src="${root}/member/member.js">
	
</script>
</head>
<body>
<c:if test="${result <0}">
<div>실명확인 인증에 실패 했습니다.</div>
</c:if>  
	<h2>개인인증</h2>
	    <div id="back" >
	<form action="join.do" method="post">
	    
	    <div id="back0"><br>회원을 가입하시려면 반드시 본인 인증을 필요로 합니다. 아래 정보를 기입하여 본인 인증을 확인 하시기 바랍니다.</div>
	    <div id="back1">
		<div>
			<div class="title_name">이름</div>
			<span class="abc"></span>  
			<input type="text" name="name">
		</div>
		<div>
			<div class="title_name">생년월일</div>
			<span class="abc"></span>  
			<input type="date" name="birthdate">
		</div>
		<div>
			<div class="title_name">성별</div>
			<span class="abc"></span> 
			<select name="gender">
			<option value="1">남자</option>
			<option value="2">여자</option>
			</select>
		</div>
	    </div>
	    <P> <P> <P> <P> <P>
		<div><input type="submit" value="개인인증확인" ></div>
	</form>
	    </div>
</body>
</html>