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
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
                document.getElementById('post1').value = data.postcode1;
                document.getElementById('post2').value = data.postcode2;
                document.getElementById('addr').value = data.address1;
                document.getElementById('addr3').value = data.address2;
                document.getElementById('jibeon').value = data.relatedAddress;
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script> 

</head>
<body>

<div style="text-align: center;">
	<h2>회원가입</h2>
	<form name="frm" id='joinFrm' action="joinPro.do" method="post" style="width: 800px; height: auto;">
        <div>*은 필수입력 사항입니다.</div>
       	
        <div  style="background-color:pink;">
        	<div style="margin-left: 100px">
           		<span style="{width:300px;}">아이디(*)</span>
		  		<span>
		  			<input type="tel" name="id" 
           				placeholder="아이디(xxx-xxxx-xxxx)"  required="required" autofocus="autofocus"
           				pattern="\d{3}[\-]\d{4}[\-]\d{4}" class="fix" id="id">
           		</span>
           	</div>
        
        
        <span id="msg1" style="color: red; display: none;">아이디가 중복 됩니다.</span>
        <span id="msg2" style="color: blue; display: none;">사용 할 수 있는 아이디 입니다.</span>
      
       
        <div>
           <span>암호(*)<span>
		   <span style="margin-right: 100px;">
		   <input type="password" name="password" id="pw" required="required" class="fix">         
		   </span>
        </div>
        <span id="pwchk" style="display: none; color: red">암호는 6자리 이상 12자리 이하로 설정해 주세요 </span>
        
        <div>
			<div class="title_name">이름(*)</div>
			<span class="ab"></span> 
			<input type="text" name="name" required="required" class="fix">
		</div>
		<div>
			<div class="title_name">생년월일</div>
			<span class="ab"></span> 
			<input type="date" name="birthDate" required="required" class="fix">
		</div>
		<div>
			<div class="title_name">성별(*)</div>
			<span class="ab"></span> 
			남자<input type="radio" value="1" name="gen">
			여자<input type="radio" value="2" name="gen">
			</select>
		</div> 
		<div>
		    <div class="title_name">주소(*)</div>
			<span class="ab"></span>
			<div> 
			    <div class="addr">
			    	<input type="text" name="post1" id="post1" value=""> - <input type="text" name="post2" id="post2" value="">
			    </div>
			 
           		<input type="button" onclick="openDaumPostcode()" value="우편번호 찾기" style="width:100px; height:20px; font-size:11px; background-color:#ECECEC">
		   
            	<div class="addr1">
	                <div>
		            	<input type="text"name="addr1" id="addr" value="" title="행정기본주소" style="width:400px"/>
		            </div>
		            <div>
		            	<input type="text" name="addr2" id="addr2" value="" title="상세주소" style="width:300px" placeholder="상세주소" />
		            </div>
	            </div>
	            <div>
	            	<input type="text" name="addr3" id="addr3" value="" title="참고항목" style="width:510px" />
	            </div>
	            <div>
	            	<input type="text" name="jibeon" id="jibeon" value="" title="지번주소" style="width:510px"/>
	           	</div>
	        </div>
            <span class="ab"></span> 
		 </div>
		  </div>
		 <div align="center"><input type="submit" value="확인"/></div>
	    

        
</form>
</div>






</body>
</html>