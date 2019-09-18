<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원가입</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/member/emailJoin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<!-- 헤더부분 include -->
	<%@ include file="../common/header.jsp" %>
	
		<div id="joinEmailContainer">
			<p class="title">기업회원가입</p>
			<form action="/RewardBook/m_cenroll" method="post" id="joinCompanyForm">
			
				<button onclick="auth();" id="authBtn" >인증번호전송</button>
				<input type="text" id="userId" name="userId" placeholder="이메일 계정입력">
				<p id="emailCheck"></p>
				
				<button onclick="check();" id="checkBtn" >인증하기</button> 
				<input type="text" id="authNum" name="authNum" placeholder="인증번호 입력">
				
				<input type="text" id="bnumber" name="bnumber" placeholder="사업자번호 10자리 -없이 입력">
				<button id="bnumCheck" onclick="bnumAuth();">중복확인</button>
				<p id="bnumCheckbox"></p>
				<input type="text" id="bName" name="bName" placeholder="사업자명 입력">
				<p id="userNameCheck"></p>
				<input type="password" id="userPWd" name="userPWd" placeholder="비밀번호(특수문자,영문,숫자를 포함하여 8자리 이상)">
				<input type="password" id="userPWd2" placeholder="비밀번호 확인">
				<p id="passwordCheck"></p>
				<div class="termsWrap">
					<p>
						<label id="allChoice">
							<input type="checkbox" name="all" id="all"> 전체선택
						</label>
					</p>
					<p>
						<a href="#" class="termsName" id="t1">리워드북 이용약관<span id="checkSpan1"> 보기 ∨</span></a>
							<div class="termsBox" id="t1Box">
								<p class="termsContents">
								제1장 총칙<br>
								제1조 (목적)<br>
								본 약관은 리워드북플랫폼 주식회사(이하 회사)가 인터넷 사이트를 통하여 제공하는 크라우드펀딩 서비스 등 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
								제2조 (정의)<br>
								본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
								서비스 : 회원이 온라인 홈페이지를 통하여 본 약관에 따라 이용할 수 있는 회사가 제공하는 모든 서비스를 의미합니다.<br>
								회원 : 본 약관에 따라 회사와 서비스이용계약을 체결하고 홈페이지를 통하여 서비스를 이용할 수 있는 자격을 부여받은 자를 말합니다.<br>
								아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 회사가 승인하는 문자와 숫자의 조합을 의미합니다.<br>
								비밀번호 : 회원이 부여 받은 아이디와 일치되는 회원임을 확인하고 비밀보호를 위해 회원 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<br>
								게시물 : 회원이 서비스를 이용함에 있어 홈페이지의 게시판에 게재한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.<br>
								제2장 서비스의 이용<br>
								제3조 (서비스의 제공)<br>
								회사가 본 약관에 따라 회원이 된 자는 다음 각 호의 서비스를 이용할 수 있습니다.<br>
								a호 외 크라우드 펀딩 서비스 : 프로젝트 게시, 사이버거래장소 제공 등<br>
								회원은 제1항 각 호 서비스와 관련된 개별 서비스를 이용하기 위하여 개별약관에 따른 새로운 약정을 회사와 체결하여야 할 수 있습니다. 이 경우 각 개별 서비스의 구체적인 내용은 서비스별 개별약관에서 정한 바에 따릅니다.<br>
								서비스는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.<br>
								회사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다.<br>
								회사는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.<br>
								제4조 (서비스의 변경)<br>
								회사는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있습니다.<br>
								서비스의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당 서비스 초기화면에 게시됩니다.<br>
								회사는 무료로 제공되는 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관계법령에 특별한 규정이 없는 한 회원에게 별도의 보상을 하지 않습니다.<br>
								</p>
							</div>
						<label>
							<input type="checkbox" name="c1" id="c1"> 
							동의(필수)
						</label>
					</p>
					<p>
						<a href="#" class="termsName" id="t2">개인정보 수집 및 이용에 대한 안내<span id="checkSpan2"> 보기 ∨</span></a>
							<div class="termsBox" id="t2Box">
								<p class="termsContents">
								1. 개인정보 처리방침의 기본방향<br>
								2. 목차<br>
								3. 개인정보의 수집목적 및 이용목적<br>
								4. 개인정보의 수집범위 및 수집방법<br>
								5. 개인정보의 이용 및 제공<br>
								6. 개인정보에 대한 회원의 권리 및 행사방법<br>
								7. 개인정보의 보유 및 이용기간<br>
								8. 장기 미이용 회원 개인정보 분리 보관<br>
								9. 개인정보 보호에 대한 기술적 관리적 대책<br>
								10. 수집한 개인정보 취급 위탁<br>
								11. 쿠키(Cookie)의 운영에 관한 사항<br>
								12. 광고성 정보전송<br>
								13. 개인정보 보호 의무 및 책임자 공시<br>
								</p>
							</div>
						<label>
							<input type="checkbox" name="c2" id="c2"> 
							동의(필수)
						</label>
					</p>
					<p>
						<a href="#" class="termsName" id="t3">위치정보 이용약관<span id="checkSpan3"> 보기 ∨</span></a>
							<div class="termsBox" id="t3Box">
								<p class="termsContents">
									제 1 조 (목적)<br>
									이 약관은 리워드북 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
									제 2 조 (약관 외 준칙)<br>
									이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.<br>
									제 3 조 (서비스 내용 및 요금)<br>
									①회사는 직접 위치정보를 수집하거나 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.<br>
									1.Geo Tagging 서비스: 게시물에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다.<br>
									2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다.<br>
									3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.<br>
									4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.<br>
									5.이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
								</p>
							</div>
						<label>
							<input type="checkbox" name="c3" id="c3"> 
							동의(선택)
						</label>
					</p>
				</div>	
				<input type = "hidden" id="authNumOri" name="authNumOri"/>
				<input type = "hidden" id="authCheck" name="authCheck"/>
				<input type="submit" value="가입하기">
		</form>	
	</div>
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
	
	<!-- 이용약관 및 회원가입 부분 연결 자바스크립트 -->
	<script type="text/javascript" src="/RewardBook/resources/js/member/emailJoinCompany.js"></script>
	<script type="text/javascript" src="/RewardBook/resources/js/member/emailAuth.js"></script>
	
</body>
</html>