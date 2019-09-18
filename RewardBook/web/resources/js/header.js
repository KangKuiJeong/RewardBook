/**
 * 프로필사진등록용 자바스크립트
 */

function changeImg(){
	
	var url = "/RewardBook/views/member/changeProfileImage.jsp";
    var name = "프로필이미지 변경";
    var option = "width = 400, height = 400, top = 200, left = 800, location = no";
    		
	window.open(url, name, option);
	
}