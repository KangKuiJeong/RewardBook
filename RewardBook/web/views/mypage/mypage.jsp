<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="follow.model.vo.Follow, member.model.vo.Member, java.util.ArrayList"%>
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<link rel="stylesheet" href="/RewardBook/resources/css/common.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style type="text/css">
	a{text-decoration: none; color:#000;}		 
  	#box{margin: 0 auto; width:1140px; height:1100px;}
  	
	ul{list-style: none;}
	#top {  height:400px; margin-bottom: 45px;}
	
	#myname { font-size: 45px; font-weight:bold;}
	#point { background-color: #ffb202; border-radius: 100px; text-align: center; font-size: 13px; 
			color: #fff; font-weight: bold; height: 10px; line-height: 10px; margin-bottom:5px;}
	#point span{margin:5px;}
	#leftul {float:left; }
	.litype a{ font-size: 20px; font-weight:bold; color: black; text-decoration: none;}
	#leftul li{ padding: 5px 5px;}
	#logdiv { float:right; margin-right:14px; }
	#top #left { float:left; margin : 60px 0px 0px 0px;}
	#top #right { float:right; margin : 100px 0px 0px 0px;}
	#rightul li{ padding: 5px 0px;}
	#logout{ background-color: #ffb202; border-radius: 100px; text-align: center; font-size: 13px; 
			 font-weight: bold; height: 10px; line-height: 10px; text-decoration: none; width:80px;
			 margin: 0px 47px 0px 0px ;}
	#logout a{ text-decoration:none; color: #fff;}  
	#myimage img{ width:200px; height:200px; border-radius: 50%; margin-bottom:5px; }
	#bottom{height:373px; margin: 0px 0px 100px 0px;}
	
	.litype span{font-size:20px; font-weight:bold; color: black;}
	.tabsearch { margin-bottom:20px;}
	.tabsearch input[type="text"] {margin-right:5px; height:30px;}
	.tabsearch button {height:34px; padding: 0 10px}
.tabs {
	width:100%; height:150px;
  display: flex; 
  flex-wrap: wrap;     
} 
.tabs label { 
width:16.66%; 
  order: 1; 
  display: block; 
  padding:10px 0px; 
  text-align:center; 
  cursor: pointer; 
  background: #ffb202; 
  font-weight: bold; 
  transition: background ease 0.7s; 
} 
/*박스배경*/ 
.tabs .tab {
	height: 500px; 
  order: 99; 
  flex-grow: 1; 
  width: 100%; 
  display: none; 
  padding: 1rem;
  background: #fffafa; 
} 
.tabs input[type="radio"] { 
  display: none; 
} 
/*탭 눌렀을때 컬러*/ 
.tabs input[type="radio"]:checked + label { 
  background: rgba(178, 178, 178, 0.3); 
} 
.tabs input[type="radio"]:checked + label + .tab { 
  display: block; 
}


.tab .tabbox { margin:10px; width:100%; height:100%;}
.tab .tabbox .boxtop { height: 40px; width:100%;  }
.tab .tabbox .boxbottom { height: 420px; width:100%; overflow:auto;}
.tab .tabbox .boxbottom .boxarea { margin: 5px; float:left; width:30%; height: 200px; border: 1px solid gray; }
.tab .tabbox .boxbottom .boxarea .itemimage { width: 100%; height:140px; border-bottom: 1px solid gray; }
.tab .tabbox .boxbottom .boxarea .itemname { width: 100%; height:60px;  }
.tab .tabbox .boxbottom .boxarea .itemname .itemname_text {width: 100%; height:40px;margin-left:2px; font-size:15px; font-weight:bold;}
.tab .tabbox .boxbottom .boxarea .itemname .itemname_per {width: 100%; height:20px;margin-left:2px; color:blue; font-size:11px;}


.boxbottom .bottomcenter{ margin: 0 auto; height:100%; width:500px;}

.followarea {height:60px; width:100%; align:left;  display: flex; margin:10px 0px; padding:10px 0px; border-bottom:1px solid gray;}
#followarea {height:60px; width:100%; align:left;  display: flex; margin:10px 0px; padding:10px 0px; border-bottom:1px solid gray;}
.followerarea {height:60px; width:100%; align:left;  display: flex; margin:10px 0px; padding:10px 0px; border-bottom:1px solid gray;}


.flwimg {height:60px; width:60px; }
.followimg {border-radius:50%;height:60px; width:60px; }
.followerimg {border-radius:50%;height:60px; width:60px; }
#followingimg {border-radius:50%;height:60px; width:60px; }

.flwname {height:60px; width:100%; margin-left: 5px;}
.followname { font-weight:bold;font-size:25px; line-height:60px;}
.followername { font-weight:bold;font-size:25px; line-height:60px;}
#followingname { font-weight:bold;font-size:25px; line-height:60px;}

.flwtype { height:60px; width:120px; margin-left: 5px; }
.followtype { font-size:20px; color:gray; line-height:60px; float:right;}
.followertype { font-size:20px; color:gray; line-height:60px; float:right;}
#followingtype { font-size:20px; color:gray; line-height:60px; float:right;}



.tabsearch button{ float:right;}
.tabsearch { float: right; margin: 0px 30px;}

.tabitem { float:left; width:130px; height:130px; border:1px solid gray; margin: 55px;}





</style>



<script src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript"></script>

<link rel="stylesheet" href="/RewardBook/resources/css/mainMyPage.css">


</head>

<body>
<!-- 헤더부분 -->
<%@ include file="../common/header.jsp" %>
<!-- 헤더부분  -->
<hr>

<div id="box">

<div id="top">
	<div id="left">
		<ul id="leftul">
			<li id="myname"><%= loginMember.getName() %></li>
			
			<li id="my">
				<%if(loginMember.getuNo().substring(0,1).equals("A")){ 	//A로 시작하면 개인회원이라고 노출 %>
							개인회원
						<% }else{ %>
							기업회원
						<% } %>	
			</li>
			
			<li id="point"><span>mypoint : <%= loginMember.getMileage() %>p</span></li>
			
			<li class="litype"><a href="update.jsp">회원정보 수정</a></li>
			
			<li class="litype"><a href="inquiry_maker.jsp">1:1문의</a></li>
			
			<li class="litype"><a href="inquiry_admin.jsp">관리자 문의</a></li>
			
			<li class="litype">
				<span class="flwc">팔로워 : </span><span id="flwcount"></span>
					<script type="text/javascript">
						$(function(){
							$.ajax({
								url:"/RewardBook/flw_listcount",
								data:{uNo : "<%= loginMember.getuNo() %>"},
								type:"get",
								dataType: "json",
								success: function(data){
									$("#flwcount").html($("#flwcount").text() + data.uNo);
								}
							});
						});
					</script>
			</li>
			
			
			
		</ul>
	</div>
	<div id="right">
		<div id="myimage">
			<!-- 이미지가 있을 때 -->
			<%if(loginMember.getProfileImg() != null){ %>
				<img src="/RewardBook/resources/images/profileImg/<%= loginMember.getProfileImg() %>">
			<% }else{	//이미지가 없을때 기본이미지 보여지게함 %>
				
				<img src="/RewardBook/resources/images/index/profile.jpg">
				
			<% } %>
			
		</div>
		<div id="logdiv">
			<ul id="rightul">
				<li id="logout"><a href="#" onclick="logoutCheck();">로그아웃</a></li>
			</ul>
		</div>
		<script>	
			//로그아웃 confirm 창
			function logoutCheck(){	
								
				var check = confirm("정말 로그아웃 하시겠습니까?");
				if(!check){ history.go(-1);} 
				else { location.href = '/RewardBook/logout';}
			
			}	
		</script>
	</div>
</div>


<div id="bottom">
	<div class="tabs"> 
		<input type="radio" name="tabs" id="tabone" checked="checked">     
	    <label for="tabone">내 프로젝트</label> 
	      <div class="tab">
	        <div class="tabbox">
			    <div class="boxtop">   	
			       	<div class="tabsearch">
						<input type="text" placeholder="검색어를 입력하세요.">
						<button>검색</button>
					</div>
				</div> 
	        	<div class="boxbottom">
	        		<a class="boxitem" href="#">
		        		<div class="boxarea">
		        				<div class="itemimage">
		        					<img src="/RewardBook/resources/images/mypage/item1.jpg" width="100%" height="100%">
		        				</div>
		        				<div class="itemname">
		        					<div class="itemname_text"><span>[세준] 파워뱅크 블루투스 이어폰 에어팟 짱</span></div>
		        					<div class="itemname_per"><span>97% 달성</span></div>
		        				</div>
		        		</div>
	        		</a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
	        	</div>
	        </div>
	       
	       </div>       
	    
	    <input type="radio" name="tabs" id="tabtwo">     
	    <label for="tabtwo">후원한 프로젝트</label> 
	      <div class="tab"> 
	      		<div class="tabbox">
			    <div class="boxtop">   	
			       	<div class="tabsearch">
						<input type="text" placeholder="검색어를 입력하세요.">
						<button>검색</button>
					</div>
				</div> 
	        	<div class="boxbottom">
	        		<a class="boxitem" href="#">
		        		<div class="boxarea">
		        				<div class="itemimage">
		        					<img src="/RewardBook/resources/images/mypage/item2.jpg" width="100%" height="100%">
		        				</div>
		        				<div class="itemname">
		        					<div class="itemname_text"><span>[승진] 고급진 색감 뿌잉</span></div>
		        					<div class="itemname_per"><span>97% 달성</span></div>
		        				</div>
		        		</div>
	        		</a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		
	        	</div>
	        </div>
	      </div>
	    
	    <input type="radio" name="tabs" id="tabthree">     
	    <label for="tabthree">팔로잉</label> 
	      <div class="tab"> 
	            <div class="tabbox">
			    <div class="boxtop">   	
			       	<div class="tabsearch">
						<input type="text" placeholder="검색어를 입력하세요.">
						<button>검색</button>
					</div>
				</div> 
	        	<div class="boxbottom">
	        		<div class="bottomcenter">
	        			<div class="followinglink"></div>
	        				
		        			<script type="text/javascript">
							$(function(){
								$.ajax({
									url:"/RewardBook/flwing_list",
									data:{uNo : "<%= loginMember.getuNo() %>"},
									type:"get",
									dataType: "json",
									success: function(data){
										var jsonStr = JSON.stringify(data);
										//string => json 객체로 바꿈
										var json = JSON.parse(jsonStr);
										var count = 0;
										for(var i in json.result){
											var type = (json.result[i].u_no.charAt(0) == 'A')? "개인" : "기업";
													$(".followinglink").html($(".followinglink").html()
															+"<a href='/RewardBook/user_profile?u_no=" + json.result[i].u_no + "'>"
															+"<div class='followarea'>"
															+"<div class='flwimg'>"
															+ 	"<img class='followimg' src='/RewardBook/resources/images/mypage/i.jpg'>"
							        						+ "</div>"
								        					+ "<div class='flwname'>"
								        					+ 	"<span class='followname'>"
								        					+ 		decodeURIComponent(json.result[i].name)
								        					+	"</span>"
								        					+ "</div>"
								        					+ "<div class='flwtype'>"
								        					+ 	"<span class='followtype'>"
								        					+ type
								        					+	"</span>"
								        					+ "</div>"
								        					+"</div>"
								        					+"</a>");
													count++;
										}
										if(count == 0){
											$(".followinglink").html($(".followinglink").html()
													+ "<br>" + "<br>"
						        					+ "<div class='flwname'>"
						        					+ 	"<span class='followname'>"
						        					+ 	 "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "아직 팔로잉하는 친구가 없습니다."
						        					+	"</span>"
						        					+ "</div>"
						        					);
										}
									}
								});
							});
							</script>
	        			
	        		</div>	
	        	</div>
	        </div>
	      </div>  
	    
	    <input type="radio" name="tabs" id="tabfour">     
	    <label for="tabfour">팔로워</label> 
		  <div class="tab">
				<div class="tabbox">
			    <div class="boxtop">   	
			       	<div class="tabsearch">
						<input type="text" placeholder="검색어를 입력하세요.">
						<button>검색</button>
					</div>
				</div> 
	        	<div class="boxbottom">
	        		<div class="bottomcenter">
	        			<div class="followerlink"></div>
	        				<script type="text/javascript">
							$(function(){
								$.ajax({
									url:"/RewardBook/flwer_list",
									data:{uNo : "<%= loginMember.getuNo() %>"},
									type:"get",
									dataType: "json",
									success: function(data){
										var jsonStr = JSON.stringify(data);
										//string => json 객체로 바꿈
										var json = JSON.parse(jsonStr);
										var count = 0;
										
										for(var i in json.result){
											var type = (json.result[i].u_no.charAt(0) == 'A')? "개인" : "기업";
											
											$(".followerlink").html($(".followerlink").html()
													+"<a href='/RewardBook/user_profile?u_no=" + json.result[i].u_no + "'>"
													+"<div class='followerarea'>"
													+"<div class='flwimg'>"
													+ 	"<img class='followerimg' src='/RewardBook/resources/images/mypage/i.jpg'>"
					        						+ "</div>"
						        					+ "<div class='flwname'>"
						        					+ 	"<span class='followername'>"
						        					+ 		decodeURIComponent(json.result[i].name)
						        					+	"</span>"
						        					+ "</div>"
						        					+ "<div class='flwtype'>"
						        					+ 	"<span class='followertype'>"
						        					+ type
						        					+	"</span>"
						        					+ "</div>"
						        					+"</div>"
						        					+"</a>");
											count++;
										}
										if(count == 0){
											$(".followerlink").html($(".followerlink").html()
													+ "<br>" + "<br>"
						        					+ "<div class='flwname'>"
						        					+ 	"<span class='followername'>"
						        					+ 	 "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "아직 팔로워하는 친구가 없습니다."
						        					+	"</span>"
						        					+ "</div>"
						        					);
										}
									}
								});
							});
							</script>
										
	        		</div>	
	        	</div>
	       	 </div>	
	       	 
	      	</div>  
	    
	    <input type="radio" name="tabs" id="tabfive">     
	    <label for="tabfive">좋아요</label> 
	      <div class="tab"> 
	      <div class="tabbox">
			    <div class="boxtop">   	
			       	<div class="tabsearch">
						<input type="text" placeholder="검색어를 입력하세요.">
						<button>검색</button>
					</div>
				</div> 
	        	<div class="boxbottom">
	        		<a class="boxitem" href="#">
		        		<div class="boxarea">
		        				<div class="itemimage">
		        					<img src="/RewardBook/resources/images/mypage/item1.jpg" width="100%" height="100%">
		        				</div>
		        				<div class="itemname">
		        					<div class="itemname_text"><span>[세준] 파워뱅크 블루투스 이어폰 에어팟 짱</span></div>
		        					<div class="itemname_per"><span>97% 달성</span></div>
		        				</div>
		        		</div>
	        		</a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
	        	</div>
	        </div>
	      </div>  
	    
	    <input type="radio" name="tabs" id="tabsix">     
	    <label for="tabsix">리뷰</label> 
	      <div class="tab"> 
	      <div class="tabbox">
			    <div class="boxtop">   	
			       	<div class="tabsearch">
						<input type="text" placeholder="검색어를 입력하세요.">
						<button>검색</button>
					</div>
				</div> 
	        	<div class="boxbottom">
	        		<a class="boxitem" href="#">
		        		<div class="boxarea">
		        				<div class="itemimage">
		        					<img src="/RewardBook/resources/images/mypage/item1.jpg" width="100%" height="100%">
		        				</div>
		        				<div class="itemname">
		        					<div class="itemname_text"><span>[세준] 파워뱅크 블루투스 이어폰 에어팟 짱</span></div>
		        					<div class="itemname_per"><span>97% 달성</span></div>
		        				</div>
		        		</div>
	        		</a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
		        		<a class="boxitem"  href="#"><div class="boxarea"></div></a>
	        	</div>
	        </div>
	      </div>          
	</div>
</div>

</div>




	<!-- 푸타부분 include -->
	<%@ include file="../common/footer.jsp" %>
	




</body>

</html>