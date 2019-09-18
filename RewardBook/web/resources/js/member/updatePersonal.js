/**
 * 개인회원정보수정 자바스크립트
 */

	pUdateForm.onsubmit = function(e) {
		e.preventDefault();
		
		var uPwd1 = $("#updateUserPWd").val();
        var uPwd2 = $("#updateUserPWd2").val();
        
        if(uPwd1 == ""){
        	
        	$('#passwordCheckUpdate').text('비밀번호란이 비었습니다.');
        	$('#updateUserPWd').css("border","1px solid rgb(242, 85, 85)"); 
        	pUdateForm.updateUserPWd.select();
        	return false;
        	
        }else if(uPwd2 == ""){
        	
        	$('#passwordCheckUpdate2').text('비밀번호 확인이 비었습니다.');
        	$('#updateUserPWd2').css("border","1px solid rgb(242, 85, 85)"); 
        	pUdateForm.updateUserPWd2.select();
        	return false;
        	
      
        }else if(!(uPwd1 == uPwd2)){	//비밀번호와 확인이 틀렸을 때
			
			$('#passwordCheckUpdate2').text('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
			$('#updateUserPWd2').css("border","1px solid rgb(242, 85, 85)"); 
			pUdateForm.updateUserPWd.select();
			return false;
			
			
		}else{
				
			var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; 
			   if(!regExp.test($("#updateUserPWd").val())) { 
				   
				   $('#passwordCheckUpdate').text('비밀번호는 영문,숫자를 포함하여 8자리 이상입니다.');
				   $('#updateUserPWd').css("border","1px solid rgb(242, 85, 85)"); 
				   
			      return false; 
			   }
		}
        
        this.submit(); 
		
	};
	
	
	
	
