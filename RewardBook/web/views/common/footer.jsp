<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하단부 footer 영역</title>
<link rel="stylesheet" href="resources/css/common.css">
</head>
<body>
	<div id="footer">
		<p id="f_contents">
			<span>리워드북(RewardBook)</span><br>
			<b>(주)구삼구사</b> | 대표이사 구삼구사 | 사업자등록번호 123-456-78900<br>
			<b>주소</b> 서울특별시 강남구 역삼동 남도빌딩 2F<br>
			<b>리워드북 고객센터</b> <span>1661-9056 | info@rewardbook.co.kr</span><br>
			<b>광고문의</b> info@rewardbook.co.kr<br>
			<b>파트너 제휴문의</b> info@rewardbook.co.kr<br>
			<b>마케팅 제휴/PR 문의</b> info@rewardbook.co.kr<br><br>
			<span id="yellowId">Yellow ID</span> <span>@리워드북</span><br>
			<a href="/RewardBook/views/admin/adminLogin.jsp" class="f_list">관리자로그인</a>	
			<span id="copyright">Copyright 2019 구삼구사 All rights reserved.</span>
		</p>
		<div id="f_bottom_wraps">
			<div class="f_bottom">
			<a href="/RewardBook/views/member/membershipAgreement.jsp" class="f_list">회원가입약관</a>
				<span class="line"> | </span> 
				<a href="/RewardBook/views/member/serviceAgreement.jsp" class="f_list">리워드서비스이용약관</a>
				<span class="line"> | </span> 
				<a href="/RewardBook/views/member/privacyPolicy.jsp" class="f_list">리워드서비스개인정보처리방침</a>
				<span class="line"> | </span> 
				<a href="#" class="f_list">리워드서비스운영정책</a>
				<span class="line"> | </span>  
				<a href="#" class="f_list">공지사항</a>
				<span class="line"> | </span> 
				<a href="/RewardBook/flist" class="f_list">자주묻는질문</a>

				<span id="footerSns">
						<a href="https://facebook.com" target="_blank">
							<img src="/RewardBook/resources/images/index/facebook48.png" width="32"></a>
						<a href="https://youtube.com" target="_blank">
							<img src="/RewardBook/resources/images/index/youtube48.png" width="32"></a>
						<a href="https://naver.com" target="_blank">
							<img src="/RewardBook/resources/images/index/blog48.png" width="32"></a>
				</span>
				
			</div>
		</div>
	</div>
</body>
</html>