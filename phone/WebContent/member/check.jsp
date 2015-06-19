<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="aa.jsp"%>
<!DOCTYPE html PUBLIC>
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
	<h2>개인인증</h2>
	<form action="" >
	    <div id="back" >
		<div>
			<div id="name1">이름</div>
			<span class="abc"></span> 
			<input type="text" id="name">
		</div>
		<div>
			<div id="date1">생년월일</div>
			<span class="abc"></span> 
			<input type="date" id="date">
		</div>
		<div>
			<div id="gender1">성별</div>
			<span class="abc"></span> 
			<select name="gender">
			<option value="man">남자</option>
			<option value="woman">여자</option>
			</select>
		</div>
	    </div>
		<div><input type="submit" value="확인"></div>
	</form>
</body>
</html>