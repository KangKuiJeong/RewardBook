<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.model.vo.Project, payment.model.vo.Reward, java.util.ArrayList" %>
<%@ page import="memo.model.vo.Memo" %>
<%
	Project project = (Project)request.getAttribute("project"); 
	Memo memo = (Memo)request.getAttribute("memo");
	ArrayList<Reward> rewardList = (ArrayList<Reward>)request.getAttribute("rewardList");
	int percent = (int)((double)(project.getP_nprice()) / (double)(project.getP_tprice()) * 100);
	String message = (String)request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.detail_Container{
	max-width: 1707.33px;
}

.detail_Header{
	height: 100px;
	padding: 50px 0 37px;
	
}

.bg {
	height:250px;
	position: absolute;
    top: 5px;
    right: -20px;
    bottom: -20px;
    left: -20px;
    z-index: 1;
    background-repeat: no-repeat;
    background-position: 50% 30%;
    background-size: cover;
}

.detail_Header > p {
	position: relative;
    z-index: 4;
    margin-bottom: 20px;
    text-align: center;
    line-height: 20px;
    color: #fff;
    font-size: 16px;
    font-weight: 400;
}

.detail_Header > h2{
	position: relative;
    z-index: 3;
    padding-right: 30px;
    padding-left: 30px;
    text-align: center;
    line-height: 42px;
    font-size: 36px;
    font-weight: 500;
}

.detail_Menu > ul{
	display: flex;
	width: 1707.3px;
	height: 70px;
	justify-content: center;
}

.detail_Menu > ul > li{
	list-style: none;
	margin-right: 10px;
	padding: 20px;
	display: block;
	font-size: 12pt;
	font-weight: bold;
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

.detail_Contents.content{
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
/*memo*/
.memodiv{border:1px solid black;  border: 1px solid #FF9800; border-radius: 6px; text-align: center; height:230px;margin: 20px 0px 20px 0px;}
.memoh3{border-bottom:1px solid #FF9800; padding: 4px;}
.m_text{border:0; width:300px; height:150px}
.memosubmit{float:right;  padding: 5px; margin: 4px 10px; background: white;border: 1px solid #ff9800;}
 /*//memo*/
</style>
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script>
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
     
      $(function(){
    	  
    	  
    	  
      });
      
      
</script>

</head>
<body>

<%@ include file="/views/common/header.jsp" %>

<!-- detail Header영역 -->
<div class="detail_Container">
	<div class="detail_Header">
		<div class="bg" style="background-image: url(/RewardBook/resources/images/bgimg.jpg)"></div>
		<p>
			<%= project.getP_category() %> 
		</p>
		<h2><%= project.getP_title() %></h2>
	</div>
	
	<!-- 메뉴 네비게이션 -->
	<div class="detail_Menu">
		<ul>
			<li><a href="/RewardBook/p_sel?p_no=<%= project.getP_no() %>">스토리</a></li>
			<li><a href="#">펀딩 안내</a></li>
			<li><a href="#">새소식</a></li>
			<li><a href="#">커뮤니티</a></li>
			<li><a href="#">서포터</a></li>
			<li><a href="#">리뷰</a></li>
		</ul>
	</div>
	<div class="detail_Content">
		
		<div class="detail_Contents content"><%= project.getP_story() %></div>
	
		<div class="detail_Contents info">
		
			<div class="info_project">
				<p><%= project.getP_rdate() %>일 남음</p>
				<p class="target_gauge"><em class="gauge" style="width:<%= percent %>%"></em></p>
				<p><%= percent %>% 달성</p>
				<p><%= project.getP_nprice() %> 원달성</p>
				<p id="personCount">참여</p>
			</div>
			
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
					<div>메이커에게 문의</div>
				</div>
			</div>
			<div class="maker_declaration">
				<div class="declaration">신고하기</div>
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
				<textarea class="m_text"name="m_text" id="m_text" placeholder="메모하세요"><%= (memo.getM_text() == null ? "" : memo.getM_text()) %></textarea> &nbsp;			
				<input class="memosubmit" type="submit" value="저장">			
				</div>			
				</form></div>	
		</div>
		<% } %>
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
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp" %>

</body>
</html>