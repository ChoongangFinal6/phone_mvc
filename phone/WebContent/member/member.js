/**
 * 
 */

$(function(){ 
	$('#join').click(function(){
		var url = "check.do";
		$(location).attr('href',url);	 
	});
});
$(function() {

	$('#pw').keyup(function() {
		if ( $('#pw').val().length < 6 || $('#pw').val().length > 12) {
			
			$('#pwchk').css('display', 'block');
			
		}else{
			$('#pwchk').css('display', 'none');
		}
	});
});
$(function() {
	$('#id').keyup(function() {
		var idVal = $('#id').val();
		var sendData = 'id=' + idVal;
		$.ajaxSetup({
			type : 'POST',
			url : 'idCheck.do',
			dataType : 'text',
			success : function(idCheck) {
				var text = idCheck;
				var start = text.indexOf("<!-- start of contents -->") + 28;
				var end = text.indexOf("<!-- end of contents -->");
				var text2 = text.substring(start, end);
				if(text2 ==1){
					$('#msg').css('display', 'block');
				}else{
					$('#msg').css('display', 'none');
					
				}
				
			}
		});
		$.ajax({
			data : sendData
		});
		return false;
	});
});


