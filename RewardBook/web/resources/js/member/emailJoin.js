/**
* email 회원가입처리 자바스크립트 
**/

	$(function(){
		var doc = document; 
		var joinForm = doc.getElementById('joinForm'); 
		var inputs = joinForm.getElementsByTagName('INPUT'); 
		var joinForm_data = {
			"c1": false, 
			"c2": false, 
			"c3": false
			}; 
		var c1 = doc.getElementById('c1'); 
		var c2 = doc.getElementById('c2'); 
		var c3 = doc.getElementById('c3'); 
	 
		function checkboxListener() {
			joinForm_data[this.name] = this.checked; 
			if(this.checked) {
				this.parentNode.style.color = "#000"; 
			}
		}
			c1.onclick = c2.onclick = c3.onclick = checkboxListener; 
			var all = doc.getElementById('all'); 
			all.onclick = function() {
				if (this.checked) {
						setCheckbox(joinForm_data, true); 
					} else {
						setCheckbox(joinForm_data, false); 
					}
				}; 
				function setCheckbox(obj, state) {
					for (var x in obj) {
						obj[x] = state; 
						for(var i = 0; i < inputs.length; i++) {
							if(inputs[i].type == "checkbox") {
								inputs[i].checked = state; 
							}
						}
					}
				}
				
			//onsubmit 시작
			joinForm.onsubmit = function(e) {
				
				e.preventDefault(); // 서브밋 될때 화면이 깜빡이지 않게 방지
				
				if(joinForm.userId.value == "") {
					
					alert('이메일이 입력되지 않았습니다.');
					joinForm.userId.focus();
					return false;
					
				}else{
						
					var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; 
					   if(!regExp.test($("#userId").val())) { 
						  
						   $('#emailCheck').text('이메일형식이 올바르지 않습니다.');
						   $('#userId').css("border","1px solid rgb(242, 85, 85)"); 
					      return false; 
					   }
				}
				
//				if($('#authCheck').val() == ""){
//					alert('이메일 인증이 완료되지 않았습니다');
//					$('#authNum').focus();
//					return false;
//					
//				}
				
				if(joinForm.userName.value == "") {
					alert('이름이 입력되지 않았습니다.');
					joinForm.userName.focus();
					return false;
				}else{
						
					var regExp = /^[가-힣]{2,6}$/; 
					   if(!regExp.test($("#userName").val())) { 
						  
						   $('#userNameCheck').text('이름형식이 올바르지 않습니다.(2-6자 이내)');
						   $('#userName').css("border","1px solid rgb(242, 85, 85)"); 
					      return false; 
					   }
				}
				
		        var pwd1 = $("#userPWd").val();
		        var pwd2 = $("#userPWd2").val();
				if(!(pwd1 == pwd2)){	//비밀번호와 확인이 틀렸을 때
					
					$('#passwordCheck').text('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
					joinForm.userPWd.select();
					return false;
				}else{
						
					var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; 
					   if(!regExp.test($("#userPWd").val())) { 
						   
						   $('#passwordCheck').text('비밀번호는 특수문자,영문,숫자를 포함하여 8자리 이상입니다.');
						   $('#userPWd').css("border","1px solid rgb(242, 85, 85)"); 
						   
					      return false; 
					   }
				}
			
				if ( !joinForm_data['c1'] ) {
					alert('이용약관 동의를 하지 않았습니다'); 
					c1.parentNode.style.color = 'red'; 
					return false; 
				}
				
				if ( !joinForm_data['c2'] ) {
					alert('개인정보 수집 및 이용에 대한 안내를 선택하지 않았습니다.'); 
					c2.parentNode.style.color = 'red'; 
					return false; 
				}
				

				
				
				this.submit(); 
			};
	});
	
		 $(document).ready(function(){
		       
		        $("#t1").click(function(){
		            var submenu = $("#t1Box");
		            if( submenu.is(":visible") ){
		                submenu.slideUp();
		                $("#checkSpan1").text(' 보기 ∨');
		            }else{
		                submenu.slideDown();
		                $("#checkSpan1").text(' 접기 ∧').css("font-weight","bold");
		            }
		        });
		    });
		
		 $(document).ready(function(){
		       
		        $("#t2").click(function(){
		            var submenu = $("#t2Box");
		            if( submenu.is(":visible") ){
		                submenu.slideUp();
		                $("#checkSpan2").text(' 보기 ∨');
		            }else{
		                submenu.slideDown();
		                $("#checkSpan2").text(' 접기 ∧').css("font-weight","bold");
		            }
		        });
		    });
		 
		 $(document).ready(function(){
		        
		        $("#t3").click(function(){
		            var submenu = $("#t3Box");
		            if( submenu.is(":visible") ){
		                submenu.slideUp();
		                $("#checkSpan3").text(' 보기 ∨');
		            }else{
		                submenu.slideDown();
		                $("#checkSpan3").text(' 접기 ∧').css("font-weight","bold");
		            }
		        });
		  });
		 
	