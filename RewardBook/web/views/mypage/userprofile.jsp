<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="follow.model.vo.Follow, member.model.vo.Member, java.util.ArrayList"%>
    
<% Member member = (Member)request.getAttribute("member"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<link rel="stylesheet" href="/RewardBook/resources/css/common.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/RewardBook/resources/css/project/projectMain.css">
<style type="text/css">
	a{text-decoration: none; color:#000;}		 
  	#box{margin: 0 auto; width:1140px; height:1100px;}
  	
	ul{list-style: none;}
	#top {  height:400px; margin-bottom: 45px;}
	
	#myname { font-size: 45px; font-weight:bold;}
	#point { background-color: #ffb202; border-radius: 100px; text-align: center; font-size: 13px; 
			color: #fff; font-weight: bold; height: 10px; line-height: 10px; margin-bottom:5px;}
	#point span{margin:5px;}
	#mycategory{}
	
	
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
	
	.litype {font-size:20px; font-weight:bold; color: black;}
	.tabsearch { margin-bottom:20px;}
	.tabsearch input[type="text"] {margin-right:5px; height:30px;}
	.tabsearch button {height:34px; padding: 0 10px}
	
	.category_style { font-size:16px;font-style:italic; }
	
	.fbtn { width:70%; cursor:pointer;}
	
	
	
	
	
.tabs {
	width:100%; height:150px;
  display: flex; 
  flex-wrap: wrap;     
} 
.tabs label { 
width:33.333%; 
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
.tab .tabbox .boxbottom { height: 420px; width:100%; overflow:auto; overflow-sytyle:none; margin-left:30px;}
.boxbottom::-webkit-scrollbar { display: none; }
.tab .tabbox .boxbottom .boxarea { margin: 5px; float:left; width:30%; height: 300px; border: 1px solid lightgray; }
.tab .tabbox .boxbottom .boxarea .itemimage { width: 100%; height:200px; border-bottom: 1px solid gray; }
.tab .tabbox .boxbottom .boxarea .itemname { width: 100%; height:50px;  display:block;}
.tab .tabbox .boxbottom .boxarea .itemname .itemname_text {width: 100%; height:50px;margin-left:2px;  font-size:15px; font-weight:bold; overflow:hidden auto;}
.tab .tabbox .boxbottom .boxarea .itemname .itemname_text span{padding:2px;}
.tab .tabbox .boxbottom .boxarea .iteminfo {width: 100%; height:20px;margin-left:2px; color:blue; font-size:11px; overflow:hidden;}
.tab .tabbox .boxbottom .boxarea .iteminfo .iteminfo_name {float:left; font-size: 13px; color: #90949c;}
.tab .tabbox .boxbottom .boxarea .iteminfo .iteminfo_category{float:right; font-size: 13px; color: #90949c; margin-right:5px;}
.tab .tabbox .boxbottom .boxarea .itemper {width: 100%; height:30px;margin-left:2px; color:blue; font-size:11px; overflow:hidden;}


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
			<li id="myname"><%= member.getName() %></li>
			
			<li id="my">
				<%if(member.getuNo().substring(0,1).equals("A")){ 	//A로 시작하면 개인회원이라고 노출 %>
							개인회원
						<% }else{ %>
							기업회원
						<% } %>	
			</li>
			
			
			<li class="litype">
				<% if(member.getIntro() == null){ %>
					<span>안녕하세요. <%= member.getName() %> 입니다.</span>
				<% } else {  %>
					<%= member.getIntro() %>
				<% } %>
			</li>
			
			
			<li class="litype">
				<% if(member.getCategory() == null){ %>
					<span class="category_style">등록된 카테고리가 없습니다.</span>
				<% } else {  %>
					<span class="category_style"><%= member.getCategory() %></span>
				<% } %>
			</li>
			
			
			<li class="litype">
				<% if(member.getHomepage() == null){ %>
					<span class="category_style">등록된 홈페이지가 없습니다.</span>
				<% } else {  %>
					<a href="<%= member.getHomepage() %>">홈페이지</a>
				<% } %>
			</li>
			
			<li class="litype">
				<span class="flwc">팔로워 : </span><span id="flwcount"></span>
					<script type="text/javascript">
						//총 팔로워 수 출력
						$(function(){
							$.ajax({
								url:"/RewardBook/flw_listcount",
								data:{uNo : "<%= member.getuNo() %>"},
								type:"get",
								dataType: "json",
								success: function(data){
									$("#flwcount").html($("#flwcount").val() + data.listCount);
									
								},
								error: function(jqXHR, textStatus, errorThrown){
									console.log("error : " + textStatus);
								}
							});
						});
					</script>
			</li>
			
			
			<li class="litype">
				<div id="follow_button"></div>
				
				<script type="text/javascript">
				//팔로우 상태 조회 에 따른 이미지 출력
					$(function(){
						$.ajax({
							url: "/RewardBook/flw_find",
							data: {
								u_no: "<%= member.getuNo() %>",
								login_no: "<%= loginMember.getuNo() %>"
								},
							type: "get",
							dataType: "json",
							success: function(data){
								if(data.follow_find == 0){
									$("#follow_button").html($("#follow_button").html()
											+ "<img class='fbtn' src='/RewardBook/resources/images/mypage/fbtn1.png' onclick='followbtn()'>");
								}else{
									$("#follow_button").html($("#follow_button").html()
											+ "<img class='fbtn' src='/RewardBook/resources/images/mypage/unfbtn1.png' onclick='unfollowbtn()'>");
								}
									
							},
							error: function(jqXHR, textStatus, errorThrown){
								console.log("error : " + textStatus);
							}
						});
					});
				</script>
			
				
				<script type="text/javascript">
				
					//팔로우 + 버튼 눌렀을 때
					function followbtn(){
						$(function(){
							$.ajax({
								url: "/RewardBook/flw_insert",
								data: {
									u_no_f: "<%= member.getuNo() %>",
									u_no_fr: "<%= loginMember.getuNo() %>"
									},
								type: "get",
								dataType: "json",
								success: function(data){
									if(data.following == 1){
										alert("<%= member.getName() %>님을 팔로우 하셨습니다.");
										if(data.following == 1){
											$("#follow_button").html(
													"<img class='fbtn' src='/RewardBook/resources/images/mypage/unfbtn1.png' onclick='unfollowbtn()'>");
										}else{
											$("#follow_button").html(
													"<img class='fbtn' src='/RewardBook/resources/images/mypage/fbtn1.png' onclick='followbtn()'>");
										}
										//결과에 따른 총 팔로워 수 재출력
										$(function listCount(){
											$.ajax({
												url:"/RewardBook/flw_listcount",
												data:{uNo : "<%= member.getuNo() %>"},
												type:"get",
												dataType: "json",
												success: function(data){
													$("#flwcount").html($("#flwcount").val() + data.listCount);
													
												},
												error: function(jqXHR, textStatus, errorThrown){
													console.log("error : " + textStatus);
												}
											});
										});
										//
									} else{
										alert("다시 시도하여주세요.");
									}
								},
								error: function(jqXHR, textStatus, errorThrown){
									console.log("error : " + textStatus);
								}
							});
						});
					};
					
					</script>
					
					
					
					<script type="text/javascript">
					//언팔로우 - 버튼 눌렀을 때
					function unfollowbtn(){
						$.ajax({
							url: "/RewardBook/flw_delete",
							data: {
								u_no_f: "<%= member.getuNo() %>",
								u_no_fr: "<%= loginMember.getuNo() %>"
								},
							type: "get",
							dataType: "json",
							success: function(data){
								if(data.unfollow == 1){
									alert("<%= member.getName() %>님을 팔로우 취소 하셨습니다.");
									if(data.unfollow == 1){
										$("#follow_button").html(
												"<img class='fbtn' src='/RewardBook/resources/images/mypage/fbtn1.png' onclick='followbtn()'>");
									}else{
										$("#follow_button").html(
												"<img class='fbtn' src='/RewardBook/resources/images/mypage/unfbtn1.png' onclick='unfollowbtn()'>");
									}
									//결과에 따른 총 팔로워 수 재출력
									$(function listCount(){
										$.ajax({
											url:"/RewardBook/flw_listcount",
											data:{uNo : "<%= member.getuNo() %>"},
											type:"get",
											dataType: "json",
											success: function(data){
												$("#flwcount").html($("#flwcount").val() + data.listCount);
												
											},
											error: function(jqXHR, textStatus, errorThrown){
												console.log("error : " + textStatus);
											}
										});
									});
									//
								} else{
									alert("다시 시도하여주세요.");
								}
							},
							error: function(jqXHR, textStatus, errorThrown){
								console.log("error : " + textStatus);
							}
							
						});
					};
					
				</script>
				
				
				
				
			</li>
			
					
			
		</ul>
	</div>
	<div id="right">
		<div id="myimage">
			<!-- 이미지가 있을 때 -->
			<% if(member.getProfileImg() != null){ %>
				<img src="/RewardBook/resources/images/profileImg/<%= member.getProfileImg() %>">
			<% }else{	//이미지가 없을때 기본이미지 보여지게함 %>
				
				<img src="/RewardBook/resources/images/index/profile.jpg">
				
			<% } %>
			
		</div>
		
	</div>
</div>


<div id="bottom">
	<div class="tabs"> 
		<input type="radio" name="tabs" id="tabone" checked="checked">     
	    <label for="tabone">프로젝트</label> 
	      <div class="tab">
	        <div class="tabbox">
			    <div class="boxtop">   	
			       	<div class="tabsearch">
						<input type="text" placeholder="검색어를 입력하세요.">
						<button>검색</button>
					</div>
				</div> 
	        	<div class="boxbottom">
	        		<div class="myproject"></div>
	        		<script type="text/javascript">
	        		$(function(){
						$.ajax({
							url:"/RewardBook/up_list",
							data:{uNo : "<%= member.getuNo() %>"},
							type:"get",
							dataType: "json",
							success: function(data){
								var jsonStr = JSON.stringify(data);
								//string => json 객체로 바꿈
								var json = JSON.parse(jsonStr);
								if(json.list){
									for(var i in json.list){
										$(".myproject").html($(".myproject").html()
												+"<a class='boxitem' href='#'>"
						        				+ "<div class='boxarea'>"
				        						+ "<div class='itemimage'>"
				        						+ "<img src='/RewardBook/resources/images/mypage/item1.jpg' width='100%' height='100%'>"
				        						+ "</div>"
				        						+ "<div class='itemname'>"
				        						+ "<div class='itemname_text'>"
				        						+ "<span>" + decodeURIComponent(json.list[i].title).replace(/\+/gi, " ") +"</span>"
				        						+ "</div>"
				        						+ "</div>"
				        						+ "<div class='iteminfo'>"
				        						+ "<span class='iteminfo_name'>"+ decodeURIComponent(json.list[i].name).replace(/\+/gi, " ") +"</span>"
				        						+ "<span class='iteminfo_category'>"+ decodeURIComponent(json.list[i].category).replace(/\+/gi, " ") +"</span>"
				        						+ "</div>"
				        						+ "<div class='itemper'>"
				        						+ "<div class='target_gauge'>"
				        						+ "<span class='gauge' style='width:" + (json.list[i].nprice / json.list[i].tprice) * 100 + "%;'></span>"
				        						+ "</div>"
				        						+ "<span class='percentage'>" + parseInt((json.list[i].nprice / json.list[i].tprice) * 100) + "%</span>"
				        						+ "<span class='invest_info enddate'>"+ json.list[i].rdate +"일 남음</span>"
				        						+ "</div>"
					        					+ "</div>"
				        						+ "</a>");
									}
								}
								else if(json.result){
									$(".myproject").html($(".myproject").html()
											+ "<div class='bottomcenter'>"
											+ "<br><br>"
				        					+ "<div class='flwname'>"
				        					+ 	"<span class='followername'>"
				        					+ 	 "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "아직 진행중인 프로젝트가 없습니다."
				        					+	"</span>"
				        					+ "</div></div>"
				        					);
								}
									
								
							},
							error: function(jqXHR, textStatus, errorThrown){
								console.log("error : " + textStatus + " / " + jqXHR + " / " + errorThrown);
							}
						});
					});
	        		</script>
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
									data:{uNo : "<%= member.getuNo() %>"},
									type:"get",
									dataType: "json",
									success: function(data){
										var jsonStr = JSON.stringify(data);
										//string => json 객체로 바꿈
										var json = JSON.parse(jsonStr);
										var count = 0;
										
										for(var i in json.result){
											count++;
											var uno = "<%= loginMember.getuNo() %>";
											var str = "<a href='/RewardBook/"
												if (json.result[i].u_no != uno){
													str += "user_profile?u_no=" + json.result[i].u_no;
												}else{
													str += "views/mypage/mypage.jsp";
												}
											str += "'>"
												+ "<div class='followerarea'>"
												+ "<div class='flwimg'>"
												+ "<img class='followerimg' src='/RewardBook/resources/images/mypage/i.jpg'>"
							        			+ "</div>"
								        		+ "<div class='flwname'>"
								        		+ "<span class='followername'>"
								        		+ decodeURIComponent(json.result[i].name)
								        		+ "</span>"
								        		+ "</div>"
								        		+ "<div class='flwtype'>"
								        		+ "<span class='followertype'>"
								        		+ (json.result[i].u_no.charAt(0) == 'A' ? "개인" : "기업")
								        		+ "</span>"
								        		+ "</div>"
								        		+ "</div>"
								        		+ "</a>";

											$(".followerlink").html($(".followerlink").html() + str);
										}
										if(count == 0){
											$(".followerlink").html($(".followerlink").html()
												+ "<br>" + "<br>"
					        					+ "<div class='flwname'>"
					        					+ "<span class='followername'>"
					        					+ "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "아직 팔로워하는 친구가 없습니다."
					        					+ "</span>"
					        					+ "</div>"
					        					);
										}
									},
									error: function(jqXHR, textStatus, errorThrown){
										console.log("error : " + textStatus);
									}
								});
							});
							</script>
										
	        		</div>	
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