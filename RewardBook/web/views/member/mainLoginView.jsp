<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 웹폰트 연결 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/common.css">
<link rel="stylesheet" href="/RewardBook/resources/css/member/memberView.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 사용할 외부 자바스크립트 연결 -->
<script type="text/javascript" src="/RewardBook/resources/js/member/Logincheck.js"></script>
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

	<!-- 헤더부분 include -->
	<%@ include file="../common/header.jsp" %>
	
	<!-- 로그인영역 -->
	<div id="loginContainer">
		<p class="title">로그인</p>
		<form id="loginForm" action="/RewardBook/login" method="post" onsubmit="checkLoginForm();">
			<input type="text" placeholder="이메일 계정" id="loginId" name="userid">
			<p id="emailCheck"></p>
			<input type="password" placeholder="비밀번호(특수문자,영문,숫자 포함 8자 이상)" id="loginPw" name="userpwd">
			<div id="idSaveDiv">
				<input type="checkbox" value="아이디저장" id="saveId">
				<label for="saveid" id="saveIdtext">아이디 저장 </label>
			</div>
			<div id="find">
				<a href="/RewardBook/views/member/findIdView.jsp">아이디ㆍ비밀번호찾기 ></a>
			</div>
			<p id="checkLogin"></p>
			<input type="submit" value="로그인" id="subLogin">
		</form>
			<!-- API 영역시작 -->
		<div id="snsWrap">
			<ul>
			<!-- 카카오톡 로그인 API 시작 -->
			<li><a id="custom-login-btn" href="javascript:loginWithKakao()">카카오톡</a></li>
			</ul>
			<div id="naver_id_login"></div>
		</div>
		<script type='text/javascript'>
		 
		 Kakao.init('38eb46ae389d2f0f361c4a77827435b4');
		    function loginWithKakao() {
		      // 로그인 창을 띄웁니다.
		      Kakao.Auth.login({
		        success: function(authObj) {
		          alert(JSON.stringify(authObj));
		        },
		        fail: function(err) {
		          alert(JSON.stringify(err));
		        }
		      });
		    };
		    
	</script>
		<p id="joinIntro">아직 리워드북 계정이 없으신가요? &nbsp;<a href="/RewardBook/views/member/joinMainView.jsp">회원가입하기</a></p>		
	</div>
	
	
	<!-- 푸터부분 include -->
	<%@ include file="../common/footer.jsp" %>
	
	
</body>
</html>