<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원 정보수정</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 자바스크립트 연결 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 우편번호 api 스크립트 시작  -->
<script>
//우편번호 api 시작
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

function test(){

	  $("input[name='category']").each(function(){
		  var thisVal = $(this).val();
		  if( thisVal.length > 0 ){
			  $(this).attr("checked", true );
		  }
	  }); 
}
</script>

<!-- css연결 -->
<link rel="stylesheet" href="/RewardBook/resources/css/member/memberUpdate.css">
</head>
<body>
	
	<!-- 헤더부분 include -->
	<%@ include file="../common/header.jsp" %>
	
	<div id="companyUpdateContainer">
			<p class="title">기업회원 정보수정</p>
			<form action="/RewardBook/m_profileImg" method="post" id="pUdateImg" enctype="multipart/form-data">
				<!-- 이미지 시작 -->
				<img id="updateProfile" src="
				<% if(loginMember.getProfileImg()!=null){	//프로필사진이 있을 때 %>
					/RewardBook/resources/images/profileImg/<%= loginMember.getProfileImg()%>
				<% } else {	//프로필사진이 없을 때 기본이미지 노출%>
						/RewardBook/resources/images/index/profile.jpg
					<% } %>">
				<!-- 이미지 끝 -->
			</form>
			
			<form action="/RewardBook/m_cupdate" method="post" id="pUdateForm">
				<p id="emailId"><%= loginMember.getId() %></p>
				
				<input type="text" id="userName" name="userName" value="<%=loginMember.getName() %>">
				<input type="text" id="userBno"
					value="<%=loginMember.getuBno().substring(0, 3) %>-<%=loginMember.getuBno().substring(3, 5) %>-<%=loginMember.getuBno().substring(5, 10) %>" readonly>
				<p id="bNumContents">사업자등록번호는 수정이 불가능합니다.</p>
				<input type="password" id="updateUserPWd" name="userPWd" placeholder="비밀번호(특수문자,영문,숫자를 포함하여 8자리 이상)">
				<p id="passwordCheckUpdate"></p>
				<input type="password" id="updateUserPWd2" placeholder="비밀번호 확인">
				<p id="passwordCheckUpdate2"></p>
				<input type="tel" id="phone" name="phone" 
				<%if(loginMember.getPhone()==null){ //값이없을경우 %>
					placeholder="전화번호"
				<% }else{ 	//기존 값이 있을 경우 %>
					value="<%=loginMember.getPhone() %>"
				<% } %>>
				
				<input type="text" id="post" name="post" 
				<%if(loginMember.getPost()==null){ //값이없을경우 %>
					placeholder="우편번호"
				<% }else{ 	//기존 값이 있을 경우 %>
					value="<%=loginMember.getPost() %>"
				<% } %>>

				<input type="button" onclick="sample6_execDaumPostcode()" id="findPost" value="우편번호 찾기">
				
				<input type="text" id="address" name="address" 
				<%if(loginMember.getAddress()==null){ //값이없을경우 %>
					placeholder="주소"
				<% }else{ 	//기존 값이 있을 경우 %>
					value="<%=loginMember.getAddress() %>"
				<% } %>>
				
				<input type="text" id="detailAddress" name="detailAddress" 
				<%if(loginMember.getAddress_detail()==null){ //값이없을경우 %>
					placeholder="상세주소"
				<% }else{ 	//기존 값이 있을 경우 %>
					value="<%=loginMember.getAddress_detail() %>"
				<% } %>>
				
				<input type="text" id="homepage" name="homepage" 
				<%if(loginMember.getHomepage() ==null){ //값이없을경우 %>
					placeholder="홈페이지 URL"
				<% }else{ 	//기존 값이 있을 경우 %>
					value="<%=loginMember.getHomepage() %>"
				<% } %>>
				
				<div id="checkBoxDiv">
					
					<div class="checkArea">
						<input type="checkbox" value="주류" id="category" name="category">
						<label for="category" id="saveIdtext">주류</label>
					</div>
					
					<div class="checkArea">
						<input type="checkbox" value="생활" id="category" name="category">
						<label for="category" id="saveIdtext">생활</label>
					</div>
					
					<div class="checkArea">
						<input type="checkbox" value="건강" id="category" name="category">
						<label for="category" id="saveIdtext">건강</label>
					</div>
					
					<div class="checkArea">
						<input type="checkbox" value="의류" id="category" name="category">
						<label for="category" id="saveIdtext">의류</label>
					</div>
					
					<div class="checkArea">
						<input type="checkbox" value="IT" id="category" name="category">
						<label for="category" id="saveIdtext"> IT</label>
					</div>
					
					<div class="checkArea">
						<input type="checkbox" value="여행" id="category" name="category">
						<label for="category" id="saveIdtext">여행</label>
					</div>
					
					<div class="checkArea">
						<input type="checkbox" value="악세서리" id="category" name="category">
						<label for="category" id="saveIdtext">악세서리</label>
					</div>
					
					<div class="checkArea">
						<input type="checkbox" value="가방" id="category" name="category">
						<label for="category" id="saveIdtext">가방</label>
					</div>
					
					<div class="checkArea">
						<input type="checkbox" value="신발" id="category">
						<label for="category" id="saveIdtext">신발</label>
					</div>
					
				</div>
				
				<textarea name="intro" id="intro"><%if(loginMember.getIntro()==null){ //값이없을경우 %><% }else{ 	//기존 값이 있을 경우 %><%=loginMember.getIntro() %><% } %></textarea>
				<input type="hidden" name="userNo" value="<%= loginMember.getuNo() %>">
				<div class="btnArea">
					<input type="reset" value="취소">
					<input type="submit" value="완료">
				</div>
		</form>	
		
		<form id="companyDelForm" action="/RewardBook/m_cdel" method="post">
			<input type="hidden" value="<%= loginMember.getuNo() %>" name="userNo">
			<input type="submit" value="회원탈퇴하기">
		</form>
		
		<script>
		
			//회원탈퇴용 자바스크립트
			companyDelForm.onsubmit = function(e) {
				
				e.preventDefault();
				
				var answer = confirm('정말로 탈퇴하시겠습니까?');
				
				if(answer == false){
					
					return true;
					
				}
				
		        this.submit(); 
				
			};
		</script>
	</div>
	<script type="text/javascript" src="/RewardBook/resources/js/member/updatePersonal.js"></script>
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>