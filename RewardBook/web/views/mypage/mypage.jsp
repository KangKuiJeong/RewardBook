
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="follow.model.vo.Follow, member.model.vo.Member, java.util.ArrayList"%>
    
    

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
	/* #point { background-color: #ffb202; border-radius: 100px; text-align: center; font-size: 13px; 
			color: #fff; font-weight: bold; height: 10px; line-height: 10px; margin-bottom:5px;} */
	#point span{background-color: #ffb202; border-radius: 100px; text-align: center; font-size: 13px; 
			color: #fff; font-weight: bold; height: 10px; line-height: 10px; padding: 0px 15px 2px 15px;}
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
.tab .tabbox .boxbottom { height: 420px; width:100%; overflow:auto; overflow-sytyle:none; margin-left:30px;}
.boxbottom::-webkit-scrollbar { display: none; }
.tab .tabbox .boxbottom .boxarea { margin: 5px; float:left; width:30%; height: 300px; border: 1px solid lightgray; }
.tab .tabbox .boxbottom .boxarea .itemimage { width: 100%; height:200px; border-bottom: 1px solid gray; }
.tab .tabbox .boxbottom .boxarea .itemname { width: 100%; height:50px;  display:block;}
.tab .tabbox .boxbottom .boxarea .itemname .itemname_text {width: 100%; height:50px;margin-left:2px; font-size:15px; font-weight:bold; overflow:hidden auto;}
.tab .tabbox .boxbottom .boxarea .itemname .itemname_text span{padding:2px;}
.tab .tabbox .boxbottom .boxarea .iteminfo {width: 100%; height:20px;margin-left:2px; color:blue; font-size:11px; overflow:hidden;}
.tab .tabbox .boxbottom .boxarea .iteminfo .iteminfo_name {float:left; font-size: 13px; color: #90949c;}
.tab .tabbox .boxbottom .boxarea .iteminfo .iteminfo_category{float:right; font-size: 13px; color: #90949c;margin-right:5px;}
.tab .tabbox .boxbottom .boxarea .itemper {width: 100%; height:30px;margin-left:2px; color:blue; font-size:11px; overflow:hidden;}
.profile_image { width:100%; height:100%; border-radius:50%;}
.project_image{width:100%; height:100%;}

.boxbottom .bottomcenter{ margin: 0 auto; height:100%; width:600px;}

.followarea {height:60px; width:100%; align:left;  display: flex; margin:10px 0px; padding:10px 0px; border-bottom:1px solid lightgray;}
#followarea {height:60px; width:100%; align:left;  display: flex; margin:10px 0px; padding:10px 0px; border-bottom:1px solid lightgray;}
.followerarea {height:60px; width:100%; align:left;  display: flex; margin:10px 0px; padding:10px 0px; border-bottom:1px solid lightgray;}


.flwimg {height:60px; width:80px; }
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
			
			<li class="litype"><a href="/RewardBook/olist?u_no=<%= loginMember.getuNo() %>">1:1문의</a></li>
			
			<li class="litype"><a href="/RewardBook/iq_clist?u_no=<%= loginMember.getuNo() %>">관리자 문의</a></li>
			
			<li class="litype"><a href="/RewardBook/mlist?u_no=<%= loginMember.getuNo() %>">MY메모</a></li>
			
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
									$("#flwcount").html($("#flwcount").text() + data.listCount);
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
						<!-- <input type="text" placeholder="검색어를 입력하세요.">
						<button>검색</button> -->
					</div>
				</div> 
	        	<div class="boxbottom">
	        	
		        	<div class="myproject"></div>
	        		<script type="text/javascript">
	        		$(function(){
						$.ajax({
							url:"/RewardBook/mp_list",
							data:{uNo : "<%= loginMember.getuNo() %>"},
							type:"get",
							dataType: "json",
							success: function(data){
								var jsonStr = JSON.stringify(data);
								//string => json 객체로 바꿈
								var json = JSON.parse(jsonStr);
								var thumbnail = null;
								if(json.list){
									for(var i in json.list){
										if(json.list[i].img == null){thumbnail = "noimage.png"}else{thumbnail = json.list[i].img}
										$(".myproject").html($(".myproject").html()
												+"<a class='boxitem' href='/RewardBook/p_sel?p_no=" + json.list[i].p_no + "'>"
						        				+ "<div class='boxarea'>"
				        						+ "<div class='itemimage'>"
				        						+ "<img src='/RewardBook/resources/upfiles/project/"
				        						+ thumbnail
				        						+ "' class='project_image'>"
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
	    
	    <input type="radio" name="tabs" id="tabtwo">     
	    <label for="tabtwo">후원한 프로젝트</label> 
	      <div class="tab"> 
	      		<div class="tabbox">
			    <div class="boxtop">   	
			       	<div class="tabsearch">
						
					</div>
				</div> 
	        	<div class="boxbottom">
	        		<div class="payproject"></div>
	        		<script type="text/javascript">
	        		$(function(){
						$.ajax({
							url:"/RewardBook/pay_list",
							data:{uNo : "<%= loginMember.getuNo() %>"},
							type:"get",
							dataType: "json",
							success: function(data){
								var jsonStr = JSON.stringify(data);
								//string => json 객체로 바꿈
								var json = JSON.parse(jsonStr);
								var thumbnail = null;
								if(json.list){
									for(var i in json.list){
										if(json.list[i].img == null){thumbnail = "noimage.png"}else{thumbnail = json.list[i].img}
										$(".payproject").html($(".payproject").html()
												+"<a class='boxitem' href='/RewardBook/p_sel?p_no=" + json.list[i].p_no + "'>"
						        				+ "<div class='boxarea'>"
				        						+ "<div class='itemimage'>"
				        						+ "<img src='/RewardBook/resources/upfiles/project/"
				        						+ thumbnail
				        						+ "' class='project_image' >"
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
									$(".payproject").html($(".payproject").html()
											+ "<div class='bottomcenter'>"
											+ "<br><br>"
				        					+ "<div class='flwname'>"
				        					+ 	"<span class='followername'>"
				        					+ 	 "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "아직 후원중인 프로젝트가 없습니다."
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
	    
	    <input type="radio" name="tabs" id="tabthree">     
	    <label for="tabthree">팔로잉</label> 
	      <div class="tab"> 
	            <div class="tabbox">
			    <div class="boxtop">   	
			       	<div class="tabsearch">
						
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
										var profile = null;
										for(var i in json.result){
											var type = (json.result[i].u_no.charAt(0) == 'A')? "개인" : "기업";
											if(json.result[i].u_profile == null){profile = "i.png"}else{profile = json.result[i].u_profile}
													$(".followinglink").html($(".followinglink").html()
															+"<a href='/RewardBook/user_profile?u_no=" + json.result[i].u_no + "'>"
															+"<div class='followarea'>"
															+"<div class='flwimg'>"
															+ "<img src='/RewardBook/resources/images/profileImg/" + profile + "' class='profile_image' >"
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
													+ "<br><br>"
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
										var profile = null;
										for(var i in json.result){
											var type = (json.result[i].u_no.charAt(0) == 'A')? "개인" : "기업";
											if(json.result[i].u_profile == null){profile = "i.png"}else{profile = json.result[i].u_profile}
												$(".followerlink").html($(".followerlink").html()
														+"<a href='/RewardBook/user_profile?u_no=" + json.result[i].u_no + "'>"
														+"<div class='followerarea'>"
														+"<div class='flwimg'>"
														+ "<img src='/RewardBook/resources/images/profileImg/" + profile + "' class='profile_image' >"
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
														+ "<br><br>"
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
						
					</div>
				</div> 
	        	<div class="boxbottom">
	        		
	        		<div class="likeproject"></div>
	        		<script type="text/javascript">
	        		$(function(){
						$.ajax({
							url:"/RewardBook/like_plist",
							data:{uNo : "<%= loginMember.getuNo() %>"},
							type:"get",
							dataType: "json",
							success: function(data){
								var jsonStr = JSON.stringify(data);
								//string => json 객체로 바꿈
								var json = JSON.parse(jsonStr);
								var thumbnail = null;
								if(json.list){
									for(var i in json.list){
										if(json.list[i].img == null){thumbnail = "noimage.png"}else{thumbnail = json.list[i].img}
										$(".likeproject").html($(".likeproject").html()
												+"<a class='boxitem' href='/RewardBook/p_sel?p_no=" + json.list[i].p_no + "'>"
						        				+ "<div class='boxarea'>"
				        						+ "<div class='itemimage'>"
				        						+ "<img src='/RewardBook/resources/upfiles/project/"
				        						+ thumbnail
				        						+ "' class='project_image'>"
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
									$(".likeproject").html($(".likeproject").html()
											+ "<div class='bottomcenter'>"
											+ "<br><br>"
				        					+ "<div class='flwname'>"
				        					+ 	"<span class='followername'>"
				        					+ 	 "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "아직 좋아요한 프로젝트가 없습니다."
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
	    
	    <input type="radio" name="tabs" id="tabsix">     
	    <label for="tabsix">리뷰</label> 
	      <div class="tab"> 
	      <div class="tabbox">
			    <div class="boxtop">   	
			       	<div class="tabsearch">
						
					</div>
				</div> 
	        	<div class="boxbottom">
		        	<div class="reviewproject"></div>
	        		<script type="text/javascript">
	        		$(function(){
						$.ajax({
							url:"/RewardBook/mr_list",
							data:{uNo : "<%= loginMember.getuNo() %>"},
							type:"get",
							dataType: "json",
							success: function(data){
								var jsonStr = JSON.stringify(data);
								//string => json 객체로 바꿈
								var json = JSON.parse(jsonStr);
								var thumbnail = null;
								if(json.list){
									for(var i in json.list){
										if(json.list[i].img == null){thumbnail = "noimage.png"}else{thumbnail = json.list[i].img}
										$(".reviewproject").html($(".reviewproject").html()
												+"<a class='boxitem' href='/RewardBook/p_sel?p_no=" + json.list[i].p_no + "'>"
						        				+ "<div class='boxarea'>"
				        						+ "<div class='itemimage'>"
				        						+ "<img src='/RewardBook/resources/upfiles/project/"
				        						+ thumbnail
				        						+ "' class='project_image'>"
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
				        						+ "<span class='invest_info enddate'> "+ json.list[i].rdate +"일 남음 </span>"
				        						+ "</div>"
					        					+ "</div>"
				        						+ "</a>");
									}
								}
								else if(json.result){
									$(".reviewproject").html($(".reviewproject").html()
											+ "<div class='bottomcenter'>"
											+ "<br><br>"
				        					+ "<div class='flwname'>"
				        					+ 	"<span class='followername'>"
				        					+ 	 "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "아직 남겨진 리뷰가 없습니다."
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
	      </div>          
	</div>
</div>

</div>




	<!-- 푸타부분 include -->
	<%@ include file="../common/footer.jsp" %>
	




</body>

</html>