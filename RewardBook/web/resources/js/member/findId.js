/**
 * 아이디 찾기 자바스크립트
 */

function findId(){
		
	$.ajax({
		url: "/RewardBook/m_findbno",
		data: {bnumber: $("#bnumber").val()},
		type: "get",
		success: function(data){
			$("#bnumCheckbox").html($("#bnumCheckbox").text() + "<br>"+ data);
		}
	});
	
	
}
	