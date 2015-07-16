<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../template/aa.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="${root}/member/loginPro.do" method="post">

		<div class="login" id="loginblock1">
			<input type="tel" name="id" placeholder="아이디(xxx-xxxx-xxxx)"
				required="required" pattern="\d{3}[\-]\d{4}[\-]\d{4}" id="logid"
				style="width: 400px; height: 60px">
		</div>
		<div></div>
		<div class="login" id="loginblock2">
			<input type="password" name="password" placeholder="비밀번호 "
				required="required" id="pwd" style="width: 400px; height: 60px">
		</div>
		<div>
			<c:if test="${result==1}">
				<div id="succ">로그인 성공</div>
			</c:if>
			<c:if test="${result==0}">
				<div class="fail">비밀번호를 다시 확인하세요.<br>
				WMPtelecom에 등록되지 않은 아이디이거나,<br> 
				아이디 또는 비밀번호를 잘못 입력하셨습니다.</div>
			</c:if><br>
			
			<c:if test="${result==-1}">
				<div class="fail">아이디를 다시 확인하세요.<br>
				WMPtelecom에 등록되지 않은 아이디이거나,<br> 
				 아이디 또는 비밀번호를 잘못 입력하셨습니다.
			    </div>
			</c:if><br> 
		</div>
		
       
		<div>
			<button name="login" class="logbutton"
				style="width: 400px; height: 60px">로그인</button>
		</div>
	</form>
</body>
</html>