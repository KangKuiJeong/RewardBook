<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member,admin.model.vo.Admin"%>   
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
	
%>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네비게이션 헤더 영역</title>
<link rel="stylesheet" href="/RewardBook/resources/css/common.css">
<link rel="stylesheet" href="/RewardBook/resources/css/mainMyPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/RewardBook/resources/js/header.js"></script>
</head>
<body>

	<!-- 네비게이션 헤더 영역 -->
	<header>
		<div id="headLine">
			<div id="logo"><a href="/RewardBook/index.jsp"><img src="/RewardBook/resources/images/index/sampleLogo.png" width="150" alt="logo"></a></div>
			<ul id="project">
				<li><a href="/RewardBook/p_list">프로젝트 둘러보기</a></li>
				<li><a href="#">프로젝트 오픈</a></li>
			</ul>
			<!-- 로그인전 보여지는 헤더영역(관리자,회원 둘다 로그인하지 않았을때 보임) -->
			<% if(loginMember == null && loginAdmin == null){ %>
			<ul id="member">
				<li id="search">
					<form action="/RewardBook/indexSearch" method="post">
						<input type="text" name="searchText" placeholder="검색어 입력">
					</form>
				</li>
				<li><a href="/RewardBook/views/member/mainLoginView.jsp">로그인</a></li>
				<li><a href="/RewardBook/views/member/joinMainView.jsp">회원가입</a></li>
			</ul>
			<!-- 관리자일때 보여지는 헤더영역 -->
			<% }else if(loginAdmin != null){ %>
			
			<ul id="member">
				<li id="memberMessage"><%= loginAdmin.getaName() %><span> 관리자님</span></li>
				<li><a href="/RewardBook/views/admin/adminMain.jsp">관리자페이지</a></li>
				<li><a href="#" onclick="logoutCheck();">로그아웃</a>
						<script>	
							//로그아웃 confirm 창
							function logoutCheck(){	
								
								var check = confirm("정말 로그아웃 하시겠습니까?");
								if(!check){ history.go(-1);} 
								else { location.href = '/RewardBook/logout';}
							}	
						</script>
				<li>		
			</ul>
			
			<%  } else{  %>
				
				<ul id="member">
				<li id="search">
					<form action="/RewardBook/indexSearch" method="post">
						<input type="text" placeholder="검색어 입력" name="searchText">
					</form>
				</li>
				<li id="memberMessage"><%= loginMember.getName() %><span>님</span></li>
				<li onclick="openFunc();">
					<a href="#">					
						<% if(loginMember.getProfileImg()!=null){	//프로필사진이 있을 때 %>
							<img id="headerProfile" src="/RewardBook/resources/images/profileImg/<%= loginMember.getProfileImg()%>" width="45" height="45">
						<% } else {	//프로필사진이 없을 때 기본이미지 노출%>
							<img id="headerProfile" src="/RewardBook/resources/images/index/profile.jpg" width="45" height="45">
						<% } %>
						
					</a>
				</li>
			</ul>
			<!-- 마이페이지 창 -->
			<div id="myBox">
				<ul>
					<li id="profileUpdateLi"><button id="profileUpdate" onclick="changeImg();">프로필사진변경</button></li>
					<li id="proName"><a href="/RewardBook/views/mypage/mypage.jsp"><%= loginMember.getName() %><span>></span></a></li>
					<li id="proifileImg">
						
						<% if(loginMember.getProfileImg()!=null){ %>
							<!-- 프로필사진이 있을경우 -->
							<img src="/RewardBook/resources/images/profileImg/<%= loginMember.getProfileImg() %>" width="50" height="50">
							
						<% }else{ %>
							<!-- 프로필사진이 없을경우 -->
							<img src="/RewardBook/resources/images/index/profile.jpg" width="50" height="50">
							
						<% } %>
					</li>
					<li id="userDivision">
						<%if(loginMember.getuNo().substring(0,1).equals("A")){ 	//A로 시작하면 개인회원이라고 노출 %>
							개인회원
						<% }else{ %>
							기업회원
						<% } %>	
					</li>
					
					<%if(loginMember.getuNo().substring(0,1).equals("A")){	//개인회원일때만 마일리지 노출함. %>
					<li id="myMileage">
						<%= loginMember.getMileage() %> Point
					<% } %>
					</li>	
				</ul>
				
				<ul id="menuUl">
					<li class="menuli" id="liTop">
					<%if(loginMember.getuNo().substring(0,1).equals("A")){	//개인회원일때는 개인회원 정보수정창이동 %>
						
						<a href="/RewardBook/views/member/personalUpdateMemberView.jsp">회원정보수정</a>
						
					<% }else{ //기업회원일때는 기업회원 정보수정창이동%>
						
						<a href="/RewardBook/views/member/companyUpdateMemberView.jsp">회원정보수정</a>
					
					<%} %>
					</li>
					<li class="menuli"><a href="">1:1문의</a></li>
					<li class="menuli"><a href="">관리자문의</a></li>
					<li class="menuli" id="liBottom">
						<a href="#" onclick="logoutCheck();">로그아웃</a>
						<script>	
							//로그아웃 confirm 창
							function logoutCheck(){	
								
								var check = confirm("정말 로그아웃 하시겠습니까?");
								if(!check){ history.go(-1);} 
								else { location.href = '/RewardBook/logout';}
							}	
						</script>
					</li>
				</ul>
				<button id="close" onclick="closeFunc();">X 닫기</button>
			</div>
				
			<%} %>
			<script> 	//마이페이지 창 닫기
			function closeFunc(){
				
				$("#myBox").css("display","none");
			}
			function openFunc(){
				
				$("#myBox").css("display","block");
			}
			</script>
		</div>
	</header><!-- 헤더영역끝 -->
	
</body>
</html>