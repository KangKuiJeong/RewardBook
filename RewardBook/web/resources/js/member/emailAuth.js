/**
 * 이메일인증(개인) 자바스크립트
 */

function auth(){

	if($("#userId").val()==""){
		
		alert("인증받을 이메일을 입력해주세요");
		
	}else if($("#userId").val()){
		
		$.ajax({
			url: "/RewardBook/m_auth",
			data: {userId: $("#userId").val()},
			type: "get",
			success: function(data){
				
				alert('메일을 전송하였습니다.');
				$("#authNumOri").val(data.authNum);
			},
	        error: function(e) {
	            alert("이메일을 확인해주세요");
	        }	
		});
	}
	
}

function check() {
	
	if(!$('#authNum').val()){
		alert("인증번호를 입력하세요");
	}
	else if($('#authNum').val()!=$("#authNumOri").val())
	{
		alert("인증번호가 다릅니다. 인증번호를 다시 입력해주세요");
		$("#authNum").val("");
	}	
	else if($('#authNum').val()==$("#authNumOri").val())
	{
		alert("이메일 인증이 완료되었습니다")
		$('#authCheck').val("checked");
	}
}

function check() {
	
	if(!$('#authNum').val()){
		alert("인증번호를 입력하세요");
	}
	else if($('#authNum').val()!=$("#authNumOri").val())
	{
		alert("인증번호가 다릅니다. 인증번호를 다시 입력해주세요");
		$("#authNum").val("");
	}	
	else if($('#authNum').val()==$("#authNumOri").val())
	{
		alert("이메일 인증이 완료되었습니다")
		$('#authCheck').val("checked");
	}
}

function bnumAuth() {
	
	if(joinCompanyForm.bnumber.value == "") {
		
		alert('사업자번호가 입력되지 않았습니다.');
		joinCompanyForm.bnumber.focus();
		return false;
		
	}else if(joinCompanyForm.bnumber.value.length()>10){
			
		var regExp = /^[0-9]{10}$/; 
		   if(!regExp.test($("#bnumber").val())) { 
			  
			   $('#bnumCheckbox').text('사업자번호는 10자리 숫자입니다.');
			   $('#bnumber').css("border","1px solid rgb(242, 85, 85)"); 
		      return false; 
		   }   
	}else{
		
		$.ajax({
			url: "/RewardBook/m_findBnum",
			data: {findEmail: $("#findEmail").val()},
			type: "get",
			success: function(data){
				$("#submitReturn").html($("#submitReturn").text() + "<br>"+ data);
			}
		});
		
	}
	
}




	