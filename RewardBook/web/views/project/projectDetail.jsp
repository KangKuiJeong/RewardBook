<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.model.vo.Project, payment.model.vo.Reward, java.util.ArrayList" %>
<%@ page import="project.model.vo.ProjectNews" %>
<%@ page import="memo.model.vo.Memo, review.model.vo.Review" %>

<%
	Project project = (Project)request.getAttribute("project"); 
	Memo memo = (Memo)request.getAttribute("memo");
	ArrayList<Reward> rewardList = (ArrayList<Reward>)request.getAttribute("rewardList");
	int percent = (int)((double)(project.getP_nprice()) / (double)(project.getP_tprice()) * 100);
	String message = (String)request.getAttribute("message");
	ArrayList<ProjectNews> newsList = (ArrayList<ProjectNews>)request.getAttribute("list");
	Review review = (Review)request.getAttribute("review");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= project.getP_title() %></title>
<link rel="stylesheet" href="/RewardBook/resources/css/project/projectDetail.css">
<style type="text/css">

body, h1, h2, h3, h4, h5, h6, p, em, div {margin: 0; padding: 0; border: 0;}
body a {text-decoration: none; color: rgba(0, 0, 0, 0.84);}
a {text-decoration: none; outline: none; color: #676363;}
.RatingFaq_container__UmFxX {display: block; padding: 0 16px; letter-spacing: -.3px; color: #44484b;}
.RatingFaq_container__UmFxX {padding: 0;}
.RatingFaq_wrapper__22DMi {margin-bottom: 40px; font-size: 13px;}
.RatingFaq_wrapper__22DMi .RatingFaq_info__2yYzv {line-height: 24px; word-break: keep-all; color: #1d2129; font-size: 17px;}
.RatingFaq_wrapper__22DMi {margin-bottom: 40px; font-size: 13px;}
.RatingFaq_wrapper__22DMi .RatingFaq_explanation__2eyt1 {margin-bottom: 4px;}
.RatingFaq_wrapper__22DMi h2 {margin-bottom: 24px; color: rgba(0,0,0,.84); font-size: 19px;}
.RewardFaqList_faqList__3WVn4 .RewardFaqList_itemList__3fF3A {margin-bottom: 12px;}
.RewardFaqItem_faqItem__1QzuM {border-bottom: 1px solid rgba(0,0,0,.06);}
.RewardFaqItem_faqItem__1QzuM .RewardFaqItem_title__3LNEW {position: relative; cursor: pointer; padding: 11px 0;}
.RewardFaqItem_faqItem__1QzuM .RewardFaqItem_title__3LNEW .wz.icon {position: absolute; right: 0;}
.RewardFaqItem_faqItem__1QzuM .RewardFaqItem_content__34K-8 {display: none;}
.RewardFaqItem_faqItem__1QzuM.active .RewardFaqItem_content__34K-8 {display: block; width: 100%; overflow: hidden; line-height: 1.62;}
.RatingFaq_container__UmFxX .RatingFaq_messageBox__3S4na {background-color: #f5f7fa; padding: 16px; line-height: 1.38; color: rgba(0,0,0,.54); box-sizing: border-box;}
i.icon.expand-more::before, .icon-expand-more::before {content: "";}
i.wadizicon, i.icon::before, [class*="icon-"]::before {
    display: inline-block;
    margin-top: -.2em;
    vertical-align: middle;
    text-transform: none;
    line-height: 1;
    font-family: 'wadizicon' !important;
    font-weight: normal;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    font-style: normal;
    font-variant: normal;
    speak: none;
}
.CommentUserWrapper_container__2TCsu {position: relative; padding: 0 0 0 56px; padding-bottom: 0px;}
.RewardFaqHelpCenter_helpCenter__ia4ow {position: relative; border-bottom: 1px solid #dadce0; padding-bottom: 60px;}
.CommentUserWrapper_container__2TCsu .CommentUserWrapper_avatar__3LN-8 {position: absolute; top: 0; left: 0;}
.Avatar_wrap__1H4VB {display: inline-block; position: relative; border-radius: 50%; background: url() no-repeat 50%/cover; vertical-align: middle;}
.Avatar_wrap__1H4VB::before {
    position: absolute;
    top: 0;
    left: 0;
    transform: scale(.5);
    transform-origin: 0 0;
    border: 1px solid rgba(0,0,0,.1);
    border-radius: 50%;
    width: 200%;
    height: 200%;
    box-sizing: border-box;
}
.Avatar_profile{width:40px; height:40px; border-radius:50%; border:1px solid whitesmoke;}
.Avatar_wrap__1H4VB.Avatar_border__3FglJ::before {content: "";}
.Avatar_wrap__1H4VB .Avatar_picture__2CRnL {display: block; transition: opacity .15s ease-out; opacity: 0; border-radius: 50%; background: #fff no-repeat 50%/cover; background-image: none; width: 100%; height: 100%;}
.CommentUserWrapper_container__2TCsu .CommentUserWrapper_main__3QYIJ {position: relative;}
.RewardFaqHelpCenter_centerInfo__zXOmy {display: inline-block; margin-right: 70px;}
.RewardFaqHelpCenter_centerInfo__zXOmy p {line-height: 1.33; word-break: break-all; font-size: 15px;}
.RewardFaqHelpCenter_centerInfo__zXOmy p.RewardFaqHelpCenter_timeWrapper__uFTSR {color: rgba(0,0,0,.54); font-size: 13px;}
.RewardFaqHelpCenter_centerInfo__zXOmy p.RewardFaqHelpCenter_timeWrapper__uFTSR .RewardFaqHelpCenter_time__lRVuM {color: #00a2a2;}
.wz.button {
    transition-property: background-color, border-color, color, opacity;
    transition-duration: .2s;
    border: 1px solid rgba(0, 0, 0, 0.15);
        border-top-color: rgba(0, 0, 0, 0.15);
        border-right-color: rgba(0, 0, 0, 0.15);
        border-bottom-color: rgba(0, 0, 0, 0.15);
        border-left-color: rgba(0, 0, 0, 0.15);
    border-radius: 3px;
    background-color: #fff;
    cursor: pointer;
    padding: 0 1.41176em;
    height: 48px;
    vertical-align: middle;
    text-decoration: none;
    line-height: 1;
    color: rgba(0, 0, 0, 0.54);
    font-size: 17px;
    font-weight: 400;
    box-sizing: border-box !important;
    -webkit-appearance: none;
}
.wz.button {
    display: inline-block;
    padding-top: .07em;
    text-decoration: none;
}
.wz.button.dense {
    padding: 0 16px;
        padding-top: 0px;
        padding-bottom: 0px;
    height: 36px;
    line-height: 34px;
    font-size: 15px;
}
.wz.button.circular {
    border-radius: 3em;
    padding-top: 0;
    padding-bottom: 0;
}
.wz.button.primary, .wz.button.primary-outline {border-color: #00c4c4;}
.wz.button.primary-outline {color: #00c4c4; background-color: transparent;}
.RewardFaqHelpCenter_helpCenter__ia4ow .wz.button {position: absolute; top: 0; width: 160px;}
.RewardFaqHelpCenter_helpCenter__ia4ow .wz.button::before {display: inline; margin-right: 9px; vertical-align: top; font-family: wadizicon; font-size: 17px; content: "\E92E";}

.detail_Container{
	max-width: 100%;
}

.detail_header {

   display: block;
    position: relative;
    padding: 60px 0 55px;
    overflow: hidden;
    background: #001328 !important;

}

.detail_header .bg {

    display: block;
    position: absolute;
    top: -20px;
    right: -20px;
    bottom: -20px;
    left: -20px;
    z-index: 1;
    background-repeat: no-repeat;
    background-position: 50% 30%;
    background-size: cover;
    -webkit-filter: blur(10px);
}

.detail_header::before {
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    clear: both;
    z-index: 2;
    margin-bottom: 0;
    background: linear-gradient(0deg,rgba(0,0,0,.1),rgba(0,0,0,.4));
    width: 100%;
    height: 100%;
    content: "";
}

.detail_header .title-info {

    position: relative;
    z-index: 4;
    margin-bottom: 20px;
    text-align: center;
    line-height: 20px;
    color: #fff;
    font-size: 16px;
    font-weight: 400;

}

.detail_header .title {
    position: relative;
    z-index: 3;
    padding-right: 30px;
    padding-left: 30px;
    text-align: center;
    line-height: 42px;
    color: #fff;
    font-size: 36px;
    font-weight: 500;
}

.detail_Menu{
	background: #fff;
	cursor: pointer;
}

.detail_Menu > ul{
	display: flex;
	width: 1707.3px;
	height: 70px;
	justify-content: center;
	position: relative;
	z-index: 99;
	background: #fff;
	margin:0 auto;
	
}

.detail_Menu > ul > li{
	list-style: none;
	margin-right: 10px;
	padding: 20px;
	display: block;
	font-size: 12pt;
	font-weight: bold;
	background: #fff;
}

.detail_Menu > ul > li > a{
	text-decoration: none;
	color: rgb(0, 0, 0);
}

.detail_Menu{
	border-bottom: 1px solid rgba(178, 178, 178, 0.43);
	background: #fff;
}

.menuFixed{
	position: fixed;
	top: 0px;
}

.detail_Content{
	display: flex;
	max-width: 1000px;
	margin: 0 auto;
}

.detail_Contents{
	height: 1000px;
	margin-top: 40px;
}

.detail_Nav{
	width: 69%;
	margin-right: 30px;
}

.detail_Contents.info{
	width: 31%;
}

.info_project{
	width: 100%;
	margin-top: 20px;
	margin-bottom: 20px;
}

.info_project > p{
	margin-bottom: 15px;
	font-size: 26px;
	font-weight: bold;
}

.maker_qustion{
	margin-top: 20px;
}

.maker_info{
border: 1px solid rgba(178, 178, 178, 0.67);
}

.maker_qustion > div{
	height: 48px;
	width: 100%;
	border-radius: 8px;
	font-size: 15pt;
	font-weight: bold;
	text-align: center;
	line-height: 40px;
	cursor: pointer;
	border: 1px solid #ffb202;
}

.maker_qustion > div:hover{
	background: #ffb202;
	color: #fff;
}

.maker_declaration{
	margin-top: 20px;
}

.declaration{
	height: 48px;
	width: 100%;
	border-radius: 8px;
	font-size: 15pt;
	font-weight: bold;
	text-align: center;
	line-height: 40px;
	cursor: pointer;
	border: 1px solid #FF2424;
}

.declaration:hover{
	color: #fff;
	background: rgba(255, 36, 36, 0.76);
}

.rank{
	margin-top: 20px;
	border: 1px solid #ffb202;
	padding: 5px;
	border-radius: 6px;
}

.rank > h3{
	text-align: center;
	border-bottom: 1px solid rgba(178, 178, 178, 0.63);
	padding-bottom: 5px;
}

.rank_item{
	margin-bottom: 3px;
	font-size: 13pt;
}

.reward_select{
	width: 100%;
    position: fixed;
    bottom: 0;
    z-index: 50;
    max-height: 50%;
    display: flex;
    flex-direction: column;
    display: block;
}

.option{
	position: relative;
    right: -60vw;
    background: #ffb202;
    z-index: 10;
    width: 240px;
    min-width: 240px;
    height: 40px;
    color: #fff;
    text-align: center;
    letter-spacing: -.033em;
    font-size: 18px;
    line-height: 40px;
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    box-shadow: 0 0 4px 1px rgba(70, 70, 70, 0.5);
    cursor: pointer;

}

.option_list{
	width: 100%;
    height: 100%;
    overflow-y: auto;
    background: white;
    padding: 0px 18px;
    display: none;
    border-top: 2px solid rgba(178, 178, 178, 0.63);
    padding-top: 10px;
}

.option_item{
	width: 720px;
	margin: 0 auto;
}

.maker_button{
	display: block;
    padding: 0;
    margin: 0;
    width: 80px;
    height: 80px;
    background: no-repeat 0 0;
    background-size: cover;
    background-position: center;
    border: 1px solid #d6d7d8;
    border-radius: 50%;
}

.maker_info{
	display: flex;
	padding: 10px;
}

.maker_profile{
	margin-left: 20px;
	margin-top: 10px;
}

.maker_profile > p{

	margin-bottom: 7px;
	font-size: 16px;
    font-weight: 500;
    line-height: 20px;
    color: #555;
}

.maker_profile > a {
    display: block;
    width: 100%;
    font-size: 11px;
    line-height: 16px;
    word-wrap: break-word;
    word-break: break-all;
    text-decoration: none;
}

.option_iteminfo{
	border : 1px solid #ffb202;
	display: flex;
    width: 100%;
    border: solid 1px #cccccc;
    background-color: #f9f9f9;
    margin-bottom: 18px;
    padding: 16px 20px;
    font-size: 14px;
    letter-spacing: -0.3px;
    cursor: pointer !important;
}

.item_left{width: 23%;
    margin-right: 10px;
    position: relative;
}

.reward{font-size: 14px; letter-spacing: -0.3px;}
strong{font-weight: 700;}
.item_price{font-size: 18px; letter-spacing: -0.3px; line-height: 18px; font-weight: bold;}
.item_amount{margin-top: 5px !important;}
.item_content{width: 52%; margin-right: 10px; margin-top: -2px;}
.item_title{font-size: 16px; line-height: 21px; letter-spacing: -0.3px; font-weight: bold;}
.item_datail{line-height: 20px;}
.item_ddate{font-size: 14px; line-height: 14px; letter-spacing: -0.3px; margin-bottom: 13px;}
.ddate{margin-top: 10px;}

.target_gauge{ height: 4px; background-color: #e6eaed; position: relative; width: 100%; overflow: hidden; margin-bottom: 25px;}    
.gauge {background-color: #ffb202; height: 4px; display: block; vertical-align: baseline;}

.menu{display: none;}
.menu:first-child{display: block;}

.CommunityComment_container__hdKhk {display: block; padding: 0 16px; letter-spacing: -.3px; color: #44484b;}
.CommunityComment_container__hdKhk {padding: 0;}
.CommunityCommentTitle_commentTitle__srmGL {margin-bottom: 24px;}
.CommentTitle_container__3aa7m {position: relative; margin-bottom: 8px; line-height: 24px; color: rgba(0,0,0,.84); font-size: 19px; font-weight: 700;}
.CommentTitle_container__3aa7m > p {margin: 0;}
.CommentTitle_container__3aa7m .CommentTitle_count__3jfoJ {margin-left: 4px; color: #00b2b2; font-style: normal;}
.CommunityCommentTitle_commentTitle__srmGL p.CommunityCommentTitle_explanation__1fMjM {color: rgba(0,0,0,.54); font-size: 13px;}
.CommunityCommentWriteButton_button__1Ou6f {display: block; margin-bottom: 24px; width: 100%;}
.CommunityCommentWriteButton_button__1Ou6f {width: 343px;}
.wz.button.gray, .wz.button.gray-outline {border-color: #90949c;}
.wz.button.gray {background-color: #90949c; color: #fff;}
.CommunityCommentItem_container__13cs_ {position: relative; padding-top: 16px; padding-bottom: 16px; border-bottom: 1px solid lightgray;}
.CommentUserWrapper_container__2TCsu {position: relative; padding: 0 0 0 56px;}
.CommentUserWrapper_container__2TCsu .CommentUserWrapper_avatar__3LN-8 {position: absolute; top: 0; left: 0;}
.CommentUserWrapper_container__2TCsu .CommentUserWrapper_main__3QYIJ {position: relative;}
.CommentUserInfo_container__O9ACk {min-height: 44px; line-height: 36px; box-sizing: border-box;}
.CommentTextContent_container__3dH_P {line-height: 24px; color: #44484b; font-size: 15px;}
.CommentTextContent_container__3dH_P .CommentTextContent_contentBox__5dJa1 {word-break: break-all;}
.CommentTextContent_container__3dH_P a.CommentTextContent_link__1lkyb {display: inline; text-decoration: underline; word-break: break-all; color: #4d5256;}
.CommentUserInfo_container__O9ACk .CommentUserInfo_badge__3x37f {
    display: inline-block;
    padding: 0 4px;
    line-height: 18px;
    color: #fff;
    font-size: 10px;
    font-weight: 500;
}
.CommentUserInfo_container__O9ACk .CommentUserInfo_badge__3x37f.CommentUserInfo_supporter__MY651 {background: #557cf2;}

.likearea { height:40px; width:220px; display:flex;}
.likearea .likebutton {height:30px; width:30px;}
.likebtn {height:25px;width:30px;}
.likeinfo {margin-left:10px;height:30px; width:100px; font-size:16px; font-weight:bold;}
.likebtn { cursor:pointer;}

.memodiv{border:1px solid black;  border: 1px solid #FF9800; border-radius: 6px; text-align: center; height:230px;margin: 20px 0px 20px 0px;}
.memoh3{border-bottom:1px solid #FF9800; padding: 4px;}
.m_text{border:0; width:300px; height:150px}
.memosubmit{float:right;  padding: 5px; margin: 4px 10px; background: white;border: 1px solid #ff9800;}

#more_review{display:none; width:550px; height:auto; border:1px solid lightgray; padding:5px; overflow: auto; word-break:break-all}

</style>
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script>
	var itemFlag = true;
	
      $(function() {
        var menuOffset = $( '.detail_Menu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > menuOffset.top ) {
            $( '.detail_Menu' ).addClass( 'menuFixed' );
          }
          else {
            $( '.detail_Menu' ).removeClass( 'menuFixed' );
          }
        });
        
        $('.option').click(function(){
  		  $('.option_list').toggle('show');
  	  	});
        
        $.ajax({
        	url: "/RewardBook/p_pcajax",
        	type: "GET",
        	data: {p_no: <%= project.getP_no() %>},
        	dataType: "json",
        	success: function(data){
        		$('#personCount').html(data.count + "명 참여");
        	},
        	error: function(textStatus){
        		console.log("error : " + textStatus)
        	}
        });
        
      });
     
      function changeNav(s){
  		if(s == 'content'){
  			$('.detail_Nav').each(function(){
  				$('.menu').css('display', 'none');
  				$('.content').css('display', 'block');
  			});
  		}else if(s == 'funding_info'){
  			$('.menu').css('display', 'none');
  			$('.funding_info').css('display', 'block');
  		}else if(s == 'project_news'){
  			$('.menu').css('display', 'none');
  			$('.project_news').css('display', 'block');
  		}else if(s == 'community'){
  			$('.menu').css('display', 'none');
  			$('.community').css('display', 'block');
  		}else if(s == 'supporter'){
  			$('.menu').css('display', 'none');
  			$('.supporter').css('display', 'block');
  		}else if(s == 'review'){
  			$('.menu').css('display', 'none');
  			$('.review').css('display', 'block');
  		}
  	}  
      
</script>

</head>
<body>

<%@ include file="/views/common/header.jsp" %>
				<% if(loginMember != null) {%>
				<div id="inquryFormDiv">
						<button id="closeBtn" onclick="inqclose();">X</button>
						<form action="/RewardBook/osend" id="inqForm" method="post">
							<p class="inqTitle"><%= project.getU_name() %>님에게 문의하기</p>
							<p class="inqSub_Title">제목</p>
							<input type="text" name="inqtitle" id="inqtitle">
							<p class="inqSub_Title">내용</p>
							<textarea name="inqtext" id="inqtext"></textarea>
							<!--  답변 여부 'N'으로 넘김 -->
							<input type="hidden" value="N" name="yn">
							<!-- 작성자 회원번호 넘김 -->
							<input type="hidden" value="<%= loginMember.getuNo() %>" name="u_no">
							<!-- 메이커 회원번호 넘김 -->
							<input type="hidden" value="<%= project.getU_no() %>" name="maker_no">
							<div class="inqBtnArea"><input type="submit" value="문의하기"></div>				
							
						</form>
					</div>
					<div id="reportFormDiv">
						<button id="closeBtn" onclick="reportclose();">X</button>
						<form action="/RewardBook/reportsend" id="reportForm" method="post">
							<p class="inqTitle">메이커 신고하기</p>
							<p class="inqSub_Title">제목</p>
							<input type="text" name="reportTitle" id="reportTitle">
							<p class="inqSub_Title">내용</p>
							<textarea name="reportText" id="reportText"></textarea>
							<!-- 작성자 회원번호 넘김 -->
							<input type="hidden" value="<%= loginMember.getuNo() %>" name="u_no">
							<!-- 신고대상 회원번호 넘김 -->
							<input type="hidden" value="<%= project.getU_no() %>" name="maker_no">
							<div class="inqBtnArea"><input type="submit" value="신고하기"></div>				
						</form>
					</div>
			
				<div id="newsFormDiv">
						<button id="closeBtn" onclick="newsclose();">X</button>
						<form action="/RewardBook/p_news_insert" id="inqForm" method="post">
							<p class="inqTitle">새소식 등록하기</p>
							<p class="inqSub_Title">제목</p>
							<input type="text" name="pn_title" id="inqtitle">
							<p class="inqSub_Title">내용</p>
							<textarea name="pn_text" id="inqtext"></textarea>						
							<!-- 프로젝트번호 넘김 -->
							<input type="hidden" value="<%= project.getP_no() %>" name="p_no">
			
							<div class="inqBtnArea"><input type="submit" value="등록"></div>				
							
						</form>
					</div>
					
					<% } %>
					<script>
						function inquryModal(){
							
							$('#inquryFormDiv').css("display","block");
							
							
						}
						
						function inqclose(){
							
							$('#inquryFormDiv').css("display","none");
						}
						function reportModal(){
							
							$('#reportFormDiv').css("display","block");
							
							
						}
						
						function reportclose(){
							
							$('#reportFormDiv').css("display","none");
						}
						
						function loginFunction(){
							
							var confirms = confirm('회원로그인 후 이용가능합니다. 로그인하시겠습니까?');
							if(confirms == true){
								
								location.href='/RewardBook/views/member/mainLoginView.jsp';
							}else {
								
								return false;
							}
						}
					</script>			
<!-- detail Header영역 -->
<div class="detail_Container">
	<div class="detail_header">
		<div class="bg" style="background-image: url(/RewardBook/resources/images/bgimg.jpg)"></div>
		<p class="title-info">
			<%= project.getP_category() %> 
		</p>
		<h2 class="title"><%= project.getP_title() %></h2>
	</div>
	
	<!-- 메뉴 네비게이션 -->
	<div class="detail_Menu">
		<ul>
			<li><a onclick="changeNav('content');">스토리</a></li>
			<li><a onclick="changeNav('funding_info');">펀딩 안내</a></li>
			<li><a onclick="changeNav('project_news');">새소식</a></li>
			<li><a onclick="changeNav('community');">커뮤니티</a></li>
			<li><a onclick="changeNav('supporter');">서포터</a></li>
			<li><a onclick="changeNav('review');">리뷰</a></li>
		</ul>
	</div>
	<div class="detail_Content">
		<div class="detail_Nav">
			<div class="menu content"><%= project.getP_story() %></div>
			<div class="menu funding_info">펀딩안내</div>
			<div class="menu project_news">
				<div class="project_news"  id="project_news">
					<div class="newsspace"></div>
			<input type="hidden" id="pn_o" value="<%= project.getP_no() %>">
			
				</div>
			<script type="text/javascript">
			$(function(){
			
				$.ajax({
					url: "p_ajax_nlist",
					type: "get",
 					data : {pn_o: $("#pn_o").val()}, 
					dataType: "text",
					success: function(data){
						//1.문자를 객체로 변환 처리
						var obj = eval("("+data+")");
						//2.객체를  문자로 바꿈
						 var jsonStr = JSON.stringify(obj);
						//3. 문자를 배열(제이슨)로바꾼것 
						var json = JSON.parse(jsonStr);
						var values = "";
						
					
		
						for(var i in json.list){
						
							values += 
									"<li class='newsmain'>"					
									+"<p class='newstitle'>" + "<img src='/RewardBook/resources/images/project/projectNews/새소식아이콘.png' class='pNewsicon'>" +  decodeURIComponent(json.list[i].pn_title).replace(/\+/gi, " ") 
									+"</p>"
									+ "<br><p class='newstext'>" +  decodeURIComponent(json.list[i].pn_text).replace(/\+/gi, " ") + "</p>"
									+ "<p class='newsdate'>" + decodeURIComponent(json.list[i].pn_date).replace(/\+/gi, " ") + "</p>"
									+"</li>" 
					
						} //for in
						
						
						
						
						//테이블에 추가
						 $("#project_news").html($("#project_news").html() + values); 
					
						
					},
					error: function(jqXHR, textStatus, errorThrown){
						console.log("error : " + textStatus);
					}
					
				});  //ajax 
			
			
			});
			</script>
			<%if ( loginMember != null && loginMember.getuNo().equals( project.getU_no()  ) ){ %>
			<button id="newsinsert" class="newsbutton" onclick="newsinsert();">글쓰기</button>			
			<% } %>
			<script type="text/javascript">
			function newsinsert(){
				$('#newsFormDiv').css('display','block');				
			}
			
			function newsclose(){
			$('#newsFormDiv').css('display','none');		
			}
			</script>
			<div class="newsspace2"></div>
			</div><!-- //새소식 -->
			<div class="menu community">
				<div class="RewardCommunityPage_wrapper__28sk6">
					<div>
						<div class="RatingFaq_container__UmFxX">
							<div class="RatingFaq_wrapper__22DMi">
								<p class="RatingFaq_info__2yYzv">
									서포터님!<br>처음 <strong>메이커의 열정과 가치에 공감</strong>
									해주셨듯, 마지막까지 <strong>메이커를 응원</strong>해주세요.
								</p>
							</div>
							<div class="RatingFaq_wrapper__22DMi">
								<p class="RatingFaq_explanation__2eyt1">
									와디즈에서 펀딩하는 방법이 궁금하다면?
								</p>
								<h2>FAQ</h2>
							</div>
							<div class="RatingFaq_wrapper__22DMi">
								<div class="RewardFaqList_faqList__3WVn4">
									<div class="RewardFaqList_itemList__3fF3A">
										<div class="RewardFaqItem_faqItem__1QzuM">
											<div class="RewardFaqItem_title__3LNEW">
												펀딩 했어요. 결제는 언제, 어떻게 진행되나요?<i class="wz icon expand-more"></i>
											</div>
											<div class="RatingFaq_messageBox__3S4na RewardFaqItem_content__34K-8">
												펀딩기간 중에는 결제 예약 상태이며, 프로젝트 종료 후 다음 1영업일 5시에 결제가 진행됩니다. 
												이때, 결제 실패된 건에 한하여 종료일+4영업일동안 매일 5시에 결제가 진행됩니다. 
												(펀딩 종료일+4영업일 오후 5시 4차 최종 결제 진행)
											</div>
										</div>
										<div class="RewardFaqItem_faqItem__1QzuM">
											<div class="RewardFaqItem_title__3LNEW">
												결제 실패 알림을 받았어요. 어떻게 해야하나요?<i class="wz icon expand-more"></i>
											</div>
											<div class="RatingFaq_messageBox__3S4na RewardFaqItem_content__34K-8">
												카드 잔고 부족이나 한도 초과, 거래 정지된 카드인 경우 결제가 진행되지 않습니다. 
												최종 결제일 16시 30분 전까지 다른 카드로 결제 정보를 변경해주세요. 
												최종 결제일까지 매 영업일 5시마다 결제가 진행됩니다.
												・ 결제정보 변경은 로그인 - [나의 리워드] - [펀딩 내역] - [참여 프로젝트]에서 결제 정보를 변경할 수 있습니다.
												・ 반드시 참여한 프로젝트 펀딩 상세 내역 페이지에서 결제 정보를 변경해주세요. 
												나의 리워드 - 간편결제 정보 변경하면 해당 카드로 결제가 진행되지 않습니다!
											</div>
										</div>
										<div class="RewardFaqItem_faqItem__1QzuM">
											<div class="RewardFaqItem_title__3LNEW">
												카드 결제가 진행된 후, 다른 카드로 변경할 수 있나요?<i class="wz icon expand-more"></i>
											</div>
											<div class="RatingFaq_messageBox__3S4na RewardFaqItem_content__34K-8">
												결제 예약으로 진행되는 크라우드 펀딩 특성상 이미 종료된 프로젝트는 취소 후 재펀딩이 불가능하니, 
												결제 전 등록한 카드정보가 맞는지 확인해주세요.
											</div>
										</div>
										<div class="RewardFaqItem_faqItem__1QzuM">
											<div class="RewardFaqItem_title__3LNEW">
												배송지나 옵션을 변경하고 싶어요.<i class="wz icon expand-more"></i>
											</div>
											<div class="RatingFaq_messageBox__3S4na RewardFaqItem_content__34K-8">
												프로젝트 진행 중에는 [나의 리워드] - [펀딩내역]에서 직접 변경이 가능합니다.
												펀딩이 종료된 이후에는 직접 변경이 불가능하니, 아래 [메이커에게 문의하기]를 통해 문의해주세요.
											</div>
										</div>
										<div class="RewardFaqItem_faqItem__1QzuM">
											<div class="RewardFaqItem_title__3LNEW">
												리워드 배송은 언제되나요? 해외 배송도 가능한가요?<i class="wz icon expand-more"></i>
											</div>
											<div class="RatingFaq_messageBox__3S4na RewardFaqItem_content__34K-8">
												크라우드 펀딩은 프로젝트 종료 후 기재된 배송 예정일에 배송되며, 
												배송 예정일은 프로젝트 상세페이지에서 확인할 수 있습니다. 
												펀딩 참여 후에는 [나의 리워드] - [펀딩내역]에서 확인할 수 있습니다.
												결제 예약 시 국내 주소만 입력이 가능하니, 해외배송은 메이커에게 문의 후 진행해주세요.
											</div>
										</div>
										<div class="RewardFaqItem_faqItem__1QzuM">
											<div class="RewardFaqItem_title__3LNEW">
												교환/환불/AS는 어디로 문의해야하나요?<i class="wz icon expand-more"></i>
											</div>
											<div class="RatingFaq_messageBox__3S4na RewardFaqItem_content__34K-8">
												해당 프로젝트의 교환/환불/AS 기준은 프로젝트 상단 [펀딩안내]탭을 확인해주세요.
											</div>
										</div>
										<div class="RewardFaqItem_faqItem__1QzuM">
											<div class="RewardFaqItem_title__3LNEW">
												펀딩 취소는 어떻게 하나요? 부분 취소도 가능한가요?<i class="wz icon expand-more"></i>
											</div>
											<div class="RatingFaq_messageBox__3S4na RewardFaqItem_content__34K-8">
												프로젝트 종료 후에는 메이커가 서포터를 위해 리워드 제작을 시작한 상태입니다. 
												따라서 프로젝트 종료 이후에는 펀딩 취소가 불가하니, 종료 이전에 취소해주세요.
												프로젝트가 종료되기 이전에는 [나의 리워드]에서 펀딩 취소가 가능합니다.
												부분 취소는 여러 개의 리워드를 결제 예약한 경우 불가능합니다. 전체 취소 후 재펀딩해주세요.
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="RatingFaq_wrapper__22DMi">
								<p class="RatingFaq_explanation__2eyt1">
									리워드, 배송 등 펀딩에 대해 궁금한 사항이 있다면?
								</p>
								<h2>메이커에게 문의하기</h2>
								<div class="CommentUserWrapper_container__2TCsu RewardFaqHelpCenter_helpCenter__ia4ow">
									<div class="CommentUserWrapper_avatar__3LN-8">
										<a href="/web/wmypage/myprofile/fundinglist/undefined">
											<span style="width: 36px; height: 36px;" class="Avatar_wrap__1H4VB Avatar_border__3FglJ">
												<span class="Avatar_picture__2CRnL Avatar_visible__1GVUZ" style="background-image: url(&quot;https://cdn.wadiz.kr/wwwwadiz/green001/2019/0620/20190620172324274_21544.png/wadiz/format/jpg/quality/80/optimize&quot;);"></span>
											</span>
										</a>
									</div>
									<div class="CommentUserWrapper_main__3QYIJ">
										<div class="RewardFaqHelpCenter_centerInfo__zXOmy">
											<p class="RewardFaqHelpCenter_userName__3oJKL">해피밀리</p>
											<p class="RewardFaqHelpCenter_timeWrapper__uFTSR">
												평균 응답 시간 <span class="RewardFaqHelpCenter_time__lRVuM">2시간 이내</span>
											</p>
										</div>
										<button type="button" class="wz button circular primary-outline dense">문의하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="menu supporter">서포터</div>
			
			
			<div class="menu review">
			<!-- 리뷰  -->
			<div class="CommunityComment_container__hdKhk">
					<div class="CommunityCommentTitle_commentTitle__srmGL">
						<div class="CommentTitle_container__3aa7m">
							<p>리뷰<em class="CommentTitle_count__3jfoJ">8</em></p>
						</div>
						<p class="CommunityCommentTitle_explanation__1fMjM">펀딩 종료 후에 남긴 응원·의견입니다.</p>
					</div>
					<div>
						<div>
						<!-- 리뷰 작성 -->
						<% if(loginMember != null){ %>
							<button class="wz button gray CommunityCommentWriteButton_button__1Ou6f"  type="button" onclick="review_insert();">글남기기</button>
								<div id="review_insert_area" style="width:340px; height:450px; display:none; border-bottom:0.5px solid lightgray;margin-bottom:20px;">
									<div class="review_close" style="width:100%; height:30px; text-align:right;">
										<span class="review_close_button" style="font-size:15px; cursor:pointer; margin-right:10px;" onclick="review_insert_close();">close</span>
									</div>
									<div class="review_insert_title">
										제목<input type="text" id="review_title" placeholder="제목" style="width:100%;">
									</div>
									<div class="review_insert_text"style=" margin-top:10px;">
										내용<textarea id="review_text" placeholder="글을 작성해주세요." style="width:100%; height:200px;resize:none;"></textarea>
									</div>
									<div class="review_insert_grade"style="width:340px; height:50px;">
										평점<select style="width:100%;">
											<option value="1">1점</option>
											<option value="2">2점</option>
											<option value="3">3점</option>
											<option value="4">4점</option>
											<option value="5">5점</option>
										</select>
									</div>
									<div class="review_insert_img"style="width:100%; height:50px; margin-top:10px;">
										이미지<input type="file"  style="width:100%; height:30px;">
									</div>
								</div>
								
								<script>
									function review_insert(){
										$("#review_insert_area").show(800);
									};
									function review_insert_close(){
										$("#review_insert_area").hide(300);
									};
								</script>
						<% } %>
						<!-- 리뷰 작성 -->						
						</div>
					</div>
					<!--  -->
				<div class="review"></div>
				<script type="text/javascript">
	        		$(function(){
						$.ajax({
							url:"/RewardBook/rv_list",
							data:{p_no : "<%= project.getP_no() %>"},
							type:"get",
							dataType: "json",
							success: function(data){
								var jsonStr = JSON.stringify(data);
								//string => json 객체로 바꿈
								var json = JSON.parse(jsonStr);
								var after = null;
								var grade = null;
								var loginmember = "<%= loginMember.getuNo() %>";
								var reviewuser = null;
								var userprofile = null;
								var rv_img = null;
								if(json.list){
									for(var i in json.list){
										//리뷰 남긴 날짜 며칠 전 인지 (ex: 3일전)
										if(json.list[i].rv_after == 0){after = "오늘"}else{after = (json.list[i].rv_after + "일전")}
										//평점 에따른 별점으로의 변환
										if(json.list[i].rv_grade <= 1){
												grade = "★"	
											}else if(json.list[i].rv_grade <= 2){
												grade = "★★"
											}else if(json.list[i].rv_grade <= 3){
												grade = "★★★"
											}else if(json.list[i].rv_grade <= 4){
												grade = "★★★★"
											}else if(json.list[i].rv_grade <= 5){
												grade = "★★★★★"
											}
										if(json.list[i].u_profile == null){
											userprofile = "i.png"
										}else{
											userprofile = json.list[i].u_profile
										}
										//리뷰 남긴 유저가 로그인 사용자면 마이페이지  타 유저라면 유저프로필 페이지 서블릿으로
										if(json.list[i].u_no == loginmember){
											reviewuser = "/RewardBook/views/mypage/mypage.jsp"
										}else{
											reviewuser = ("/RewardBook/user_profile?u_no=" + json.list[i].u_no)
										}
										//리뷰 이미지가 있을경우
										if(json.list[i].rv_img == null){
											rv_img = ""
										}else{
											rv_img = ("<img style='width:270px; height:150px;' src='/RewardBook/resources/images/review/"+json.list[i].rv_img+"'>")
										}
										$(".review").html($(".review").html()
												+"<div class='CommunityCommentItem_container__13cs_'>"
												+"<div class='CommentUserWrapper_container__2TCsu CommunityCommentContent_container__2qU3A'>"
												+"<div class='CommentUserWrapper_avatar__3LN-8'>"
												+"<span class='Avatar_wrap__1H4VB Avatar_border__3FglJ' style='width: 36px; height: 36px;'>"
												//유저 프로필 이미지
												+"<img class='Avatar_profile' src='/RewardBook/resources/images/profileImg/"+userprofile+"'>"
												+"</span>"
												+"</div>"
												+"<div class='CommentUserWrapper_main__3QYIJ'>"
												+"<div class='CommentUserInfo_container__O9ACk'>"
												+"<span class='CommentUserInfo_name__2GoPA'>"
												//리뷰 남긴 유저가 로그인 사용자면 마이페이지  타 유저라면 유저프로필 페이지
												+"<a href='" + reviewuser + "'>"
												+"<strong>"
												//작성자 이름
												+ decodeURIComponent(json.list[i].u_name).replace(/\+/gi, " ")
												+"</strong>"
												+"</a>"
												+"</span>"
												+"<span class='CommentUserInfo_badge__3x37f CommentUserInfo_supporter__MY651'>펀딩 참여자</span>"
												+"<span class='CommentUserInfo_date__ccohg'>리뷰 | "
												//며칠전 리뷰인지
												+ after
												+" | 평점 "
												//평점 
												+ grade
												+"</span>"
												+"</div>"
												+"<div>"
												+"<div class='CommentTextContent_container__3dH_P'>"
												+"<div class='CommentTextContent_contentBox__5dJa1'>"
												//작성글
												+ decodeURIComponent(json.list[i].rv_title).replace(/\+/gi, " ")
												+"</div>"
												+"</div>"
												+"</div>"
												+"<span class='review_more' onclick='review_more();' style='color:gray;font-size:15px; cursor:pointer;'> 더보기..</span>"
												+"<div id='more_review'>"
												+"<p onclick='close_more();' style='font-size:20px; font-weight:bold; cursor:pointer;'>x</p>"
												+"<span class='more_area'>"
												+ decodeURIComponent(json.list[i].rv_text).replace(/\+/gi, " ")
												+"</span>"
												//리뷰 이미지 있을경우
												+"<div>"
												+rv_img
												+"</div>"
												+"</div>"
												+"</div>"
												+"</div>"
												+"</div>"
												);
									}
								}
								else if(json.result){
									$(".review").html($(".review").html()
											+"<div class='CommunityCommentItem_container__13cs_'>"
											+"<div class='CommentUserWrapper_container__2TCsu CommunityCommentContent_container__2qU3A'>"
											+"<div class='CommentUserWrapper_avatar__3LN-8'>"
											+"<a href='#'>"
											+"<span class='Avatar_wrap__1H4VB Avatar_border__3FglJ' style='width: 36px; height: 36px;'>"
											+"<span class='Avatar_picture__2CRnL Avatar_visible__1GVUZ' style='background-image: url();'></span>"
											+"</span>"
											+"</a>"
											+"</div>"
											+"<div class='CommentUserWrapper_main__3QYIJ'>"
											+"<div class='CommentUserInfo_container__O9ACk'>"
											+"<span class='CommentUserInfo_name__2GoPA'>"
											+"</span>"
											+"</div>"
											+"<div>"
											+"<div class='CommentTextContent_container__3dH_P'>"
											+"<div class='CommentTextContent_contentBox__5dJa1'>"
											//작성글
											+"<span>아직 남겨진 리뷰가 없습니다.</span>"
											+"<br><br>"
											+"</div>"
											+"</div>"
											+"</div>"
											+"</div>"
											+"</div>"
											+"</div>"
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
	        		
	        		<!-- 리뷰 더보기 눌렀을 경우 -->
	        		<script type="text/javascript">
	        			function review_more(){
	        				$("#more_review").show();
	        			};
	        			function close_more(){
	        				$("#more_review").hide();
	        			};
	        		</script>
	        		<!-- 리뷰 더보기 눌렀을 경우 -->
	        		
			<!-- 리뷰 -->
			</div>
				<!-- 리뷰 갯 수 -->
					<script type="text/javascript">
						//리뷰 갯 수 출력
						$(function(){
							$.ajax({
								url:"/RewardBook/review_count",
								data:{uNo : "<%= project.getU_no() %>"},
								type:"get",
								dataType: "json",
								success: function(data){
									$(".CommentTitle_count__3jfoJ").html($(".CommentTitle_count__3jfoJ").val() + data.listCount);
								},
								error: function(jqXHR, textStatus, errorThrown){
									console.log("error : " + textStatus);
								}
							});
						});
					</script>
				<!-- 리뷰 갯 수-->
			
		</div>
		
		<div class="detail_Contents info">
		
			<div class="info_project">
				<p><%= project.getP_rdate() %>일 남음</p>
				<p class="target_gauge"><em class="gauge" style="width:<%= percent %>%"></em></p>
				<p><%= percent %>% 달성</p>
				<p><%= project.getP_nprice() %> 원달성</p>
				<p id="personCount">참여</p>
			</div>
			
			
<!-- 로그인 정보가 있는경우 -->
			<% if(loginMember != null){ %>
			<!-- 좋아요  -->
			<div class="likearea">
				<div class="likebutton">
						<div id="like_pbutton"></div>
						<script type="text/javascript">
						//좋아요 상태 조회 에 따른 이미지 출력
						$(function(){
							$.ajax({
								url: "/RewardBook/like_pfind",
								data: {
									uNo: "<%= loginMember.getuNo() %>",
									p_no: "<%= project.getP_no() %>"
									},
								type: "get",
								dataType: "json",
								success: function(data){
									if(data.like_pfind == 0){
										//좋아요를 하지 않았을 경우 null하트
										$("#like_pbutton").html($("#like_pbutton").html()
												+ "<img class='likebtn' src='/RewardBook/resources/images/mypage/unlike2.png' onclick='likebtn()'>");
									}else{
										//좋아요를 했을 경우 not null 하트
										$("#like_pbutton").html($("#like_pbutton").html()
												+ "<img class='likebtn' src='/RewardBook/resources/images/mypage/like2.png' onclick='unlikebtn()'>");
									}
										
								},
								error: function(jqXHR, textStatus, errorThrown){
									console.log("error : " + textStatus);
								}
							});
						});
						</script>
				</div>
				
				<div class="likeinfo">
					<span class="like_p">좋아요 </span><span id="like_pcount" ></span><span class="like_p">명 </span>
					<script type="text/javascript">
						//좋아요 갯 수 출력
						$(function(){
							$.ajax({
								url:"/RewardBook/like_pcount",
								data:{p_no : "<%= project.getP_no() %>"},
								type:"get",
								dataType: "json",
								success: function(data){
									$("#like_pcount").html($("#like_pcount").val() + data.listCount);
									
								},
								error: function(jqXHR, textStatus, errorThrown){
									console.log("error : " + textStatus);
								}
							});
						});
					</script>
				</div>
				
				<script type="text/javascript">
					//좋아요 + (null 하트) 버튼 눌렀을 때
					function likebtn(){
						$(function(){
							$.ajax({
								url: "/RewardBook/like_pinsert",
								data: {
									uNo: "<%= loginMember.getuNo() %>",
									p_no: "<%= project.getP_no() %>"
									},
								type: "get",
								dataType: "json",
								success: function(data){
									if(data.like_pinsert == 1){
										/* alert("해당 리워드 상품을 좋아요 하였습니다!"); */
										if(data.like_pinsert == 1){
											$("#like_pbutton").html(
													"<img class='likebtn' src='/RewardBook/resources/images/mypage/like2.png' onclick='unlikebtn()'>");
										}else{
											$("#like_pbutton").html(
													"<img class='likebtn' src='/RewardBook/resources/images/mypage/unlike2.png' onclick='likebtn()'>");
										}
										//결과에 따른 총 좋아요 수 재출력
										$(function(){
											$.ajax({
												url:"/RewardBook/like_pcount",
												data:{p_no : "<%= project.getP_no() %>"},
												type:"get",
												dataType: "json",
												success: function(data){
												$("#like_pcount").html($("#like_pcount").val() + data.listCount);
									
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
					//좋아요 - (not null 하트) 버튼 눌렀을 때
					function unlikebtn(){
						$(function(){
							$.ajax({
								url: "/RewardBook/like_pdelete",
								data: {
									uNo: "<%= loginMember.getuNo() %>",
									p_no: "<%= project.getP_no() %>"
									},
								type: "get",
								dataType: "json",
								success: function(data){
									if(data.like_pdelete == 1){
										/* alert("해당 리워드 상품을 좋아요 취소 하였습니다."); */
										if(data.like_pdelete == 1){
											$("#like_pbutton").html(
													"<img class='likebtn' src='/RewardBook/resources/images/mypage/unlike2.png' onclick='likebtn()'>");
										}else{
											$("#like_pbutton").html(
													"<img class='likebtn' src='/RewardBook/resources/images/mypage/like2.png' onclick='unlikebtn()'>");
										}
										//결과에 따른 총 좋아요 수 재출력
										$(function(){
											$.ajax({
												url:"/RewardBook/like_pcount",
												data:{p_no : "<%= project.getP_no() %>"},
												type:"get",
												dataType: "json",
												success: function(data){
												$("#like_pcount").html($("#like_pcount").val() + data.listCount);
									
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
			</div>
				<!-- 좋아요 -->
			<% }else { %>
			<!-- 로그인 정보가 없을경우 -->
			<div class="likearea">
				<div class="likebutton">
						<div id="like_pbutton"> <!-- 로그인 정보 없을경우 null 하트 버튼 출력 -->
							<img class='likebtn' src='/RewardBook/resources/images/mypage/unlike2.png' onclick='beforelogin()'>
						</div>
						
				</div>
				
				<div class="likeinfo">
					<span class="like_p">좋아요 </span><span id="like_pcount" ></span><span class="like_p">명 </span>
					<script type="text/javascript">
						//총 좋아요 수 출력
						$(function(){
							$.ajax({
								url:"/RewardBook/like_pcount",
								data:{p_no : "<%= project.getP_no() %>"},
								type:"get",
								dataType: "json",
								success: function(data){
									$("#like_pcount").html($("#like_pcount").val() + data.listCount);
									
								},
								error: function(jqXHR, textStatus, errorThrown){
									console.log("error : " + textStatus);
								}
							});
						});
					</script>
				</div>
				
					<script type="text/javascript">
						//좋아요 + (null 하트) 버튼 눌렀을 때
						function beforelogin(){
							if (confirm("회원 로그인 후 이용가능합니다. \n로그인 페이지로 이동하시겠습니까?") == true){    //확인
   								location.href = "/RewardBook/views/member/mainLoginView.jsp"; //로그인페이지로 이동
							}else{   //취소
    							return;
							}
						}
					</script>
				</div>	
				<!-- 좋아요 -->
			<% } %>

			
			
			<h4 style="padding-bottom: 10px; margin-top: 20px;">메이커 정보</h4>
			<div class="maker_box">
				<div class="maker_info">
					<div class="maker_icon">
						<button class="maker_button"
						style="background-image: url(/RewardBook/resources/images/icons8-fashion-trend-48.png)"></button>
					</div>
					<div class="maker_profile">
						<p>메이커 명</p>
						<a href="#">메이커 홈페이지 주소</a>
					</div>
				</div>
				
				<div class="maker_qustion">
					<% if( loginMember != null ){%>
					<div><p onclick="inquryModal();">메이커에게 문의</p></div>
					<% }else { %>
					<div><p onclick="loginFunction();">메이커에게 문의</p></div>
					<% } %>
				</div>
				
			</div>
			
			<div class="maker_declaration">
				<% if( loginMember != null ){%>
					<div class="declaration"><p onclick="reportModal();">신고하기</p></div>
				<% }else{ %>
					<div class="declaration"><p onclick="loginFunction();">신고하기</p></div>
				<% } %>
			</div>
			
			<div class="rank">
				<h3>인기 프로젝트</h3>
				<div class="rank_item">1</div>
				<div class="rank_item">2</div>
				<div class="rank_item">3</div>
				<div class="rank_item">4</div>
				<div class="rank_item">5</div>
				<div class="rank_item">6</div>
				<div class="rank_item">7</div>
				<div class="rank_item">8</div>
				<div class="rank_item">9</div>
				<div class="rank_item">10</div>
			</div>		
				<% if(loginMember != null) { %>
			<div><form method="post" onsubmit="memoinsert();" name="memoInsertForm" >		
				<input type="hidden" id="u_no" name="u_no" value="<%= loginMember.getuNo() %>">		
				<input type="hidden" id="p_no" name="p_no" value="<%= project.getP_no() %>">			
				<div class="memodiv" id="memodiv">			
				<h3 class="memoh3">메모</h3>		
				<textarea class="m_text"name="m_text" id="m_text" required placeholder="메모를 입력해주세요"><%= (memo.getM_text() == null ? "" : memo.getM_text()) %></textarea> &nbsp;			
				<input class="memosubmit" type="submit" value="저장">			
				</div>			
				</form></div>	
		</div>
		<% } %>
		</div>
	<script>
	function memoinsert(){
	
	$.ajax({
		url: "/RewardBook/minsert",
		data: { u_no: $("#u_no").val(),
				p_no: $("#p_no").val(),
				m_text: $("#m_text").val()
				},
		type: "get",
		success: function(data){
			
	alert('메모가 저장되었습니다.');

		
		}
	});
	
	
}
	</script>
	
	
	</div>
</div>
<div class="reward_select">
	<div class="option" >리워드 선택</div>
	<div class="option_list">
		<div class="option_item">
			<% if(loginMember == null){ %>
				<% for(Reward reward : rewardList){ %>
			<div class="reward option_iteminfo" onclick="loginFunction();">
				<div class="reward item_left">
					<div class="reward item_price">
						<%= reward.getR_price() %> 원 펀딩
					</div>
					<div class="reward item_amount">
					<% if(reward.getR_amount().equals("무제한")){ %>
						<span><strong><%= reward.getR_amount() %></strong></span>
							<span style="opacity: 0.5;">  |  10개 펀딩</span>
					<%}else{ %>
						<strong><%= reward.getR_amount() %>개 남음</strong>
						<span style="opacity: 0.5;">  |  10개 펀딩</span>
					<% } %>
					</div>
				</div>
				<div class="reward item_content">
					<div class="reward item_title"><%= reward.getR_name() %></div>
					<div class="reward item_detail"><%= reward.getR_detail() %></div>
				</div>
				<div class="reward item_ddate">
					<span class="ddate"><strong>예상배송일</strong></span>
					<span> <%= project.getP_ddate() %></span>
					
				</div>
			</div>
			<% } %>
			
			<% }else{ %>
				<% for(Reward reward : rewardList){ %>
				<div class="reward option_iteminfo" onclick="javascript:location.href='/RewardBook/r_list?p_no=<%= project.getP_no() %>'">
				<div class="reward item_left">
					<div class="reward item_price">
						<%= reward.getR_price() %> 원 펀딩
					</div>
					<div class="reward item_amount">
					<% if(reward.getR_amount().equals("무제한")){ %>
						<span><strong><%= reward.getR_amount() %></strong></span>
							<span style="opacity: 0.5;">  |  10개 펀딩</span>
					<%}else{ %>
						<strong><%= reward.getR_amount() %>개 남음</strong>
						<span style="opacity: 0.5;">  |  10개 펀딩</span>
					<% } %>
					</div>
				</div>
				<div class="reward item_content">
					<div class="reward item_title"><%= reward.getR_name() %></div>
					<div class="reward item_detail"><%= reward.getR_detail() %></div>
				</div>
				<div class="reward item_ddate">
					<span class="ddate"><strong>예상배송일</strong></span>
					<span> <%= project.getP_ddate() %></span>
					
				</div>
			</div>
			<% } %>
			<% } %>
		</div>
	</div>
</div>



<%@ include file="/views/common/footer.jsp" %>

<script type="text/javascript">
	$('.RewardFaqItem_faqItem__1QzuM').click(function(){
	if (itemFlag) {
		$(this).addClass('active');
		itemFlag = false;
	} else {
		$(this).removeClass('active');
		itemFlag = true;
	}
});
</script>

</body>
</html>