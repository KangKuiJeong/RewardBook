<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="payment.model.vo.Reward, java.util.ArrayList" %>
<% ArrayList<Reward>	list = (ArrayList<Reward>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select_reward</title>
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.reward-check').change(function(){
			if($(this).is(':checked')){
				$(this).closest('dl').css("background", "rgba(255, 178, 2, 0.82)");
				$(this).closest('dl').find('dd .checked-area').css("display", "block");
				
			}else{
				$(this).closest('dl').find('dd .checked-area').css("display", "none");
				$(this).closest('dl').css("background", "rgba(0, 0, 0, 0.06)");
			}
		});

		
	})
	
</script>
<style type="text/css">

*{vertical-align: baseline;}

#reward_container{
	padding: 0;
	margin: 0 auto;
	width: 860px;
}

.select-container{margin-bottom: 42px;}
.select-container h3 em{display: inline-block; color: rgba(0, 0, 0, 0.84); font-size: 24px; font-weight: bold;}
.reward-box {
	border-radius: 5px;
	background: rgba(0, 0, 0, 0.06);
	margin-bottom: 15px;
}

.reward-list > ul{
	list-style: none;
	padding: 0;
}

.reward-check > input{
	width: 20px;
}

.checked-area{
	display: none;
}
.top-area h3 em{font-size: 18px;}
.top-area{
	margin-bottom: 20px;
	display: flex;
}

.top-area > h3 {margin-bottom: 10px; margin-right: 10px;}
.top-area > p{padding: 0 5px; font-size: 14px; font-weight: 500; line-height: 18px;}

.reward-box::after{
	content: "";
	clear: both;
	display: block;
}

.reward-box dt{
	float: left;
    text-align: center;
    width: 100px;
    padding-top: 50px;
}

.reward-box dt input{
	position: absolute;
    left: -99999px;
    opacity: 0;
}

.rb-checkbox span{
	display: inline-block;
	position: relative;
	cursor: pointer;
	padding-left: 24px;
	vertical-align: top;
}

.rb-checkbox > span::before{
	position: absolute;
	top: 2px;
	left: 0;
	transition: .25s;
	border: 1px solid rgba(0, 0, 0, 0.15);
	background-color: #fff;
	cursor: pointer;
	width: 16px;
	height: 16px;
	content: '';
}

.rb-checkbox > span::after{
	display: inline-block;
	margin-top: -.2em;
	vertical-align: middle;
	text-transform: none;
	line-height: 1;
	font-style: normal;
	font-variant: normal;
	content: "";
	position: absolute;
	top: 6px;
	left: 2px;
	width: 16px;
	height: 16px;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
}

.reward-box dd {
	float: left;
    padding: 20px 10px;
    width: 740px;
    cursor: pointer;
    margin-inline-start: 40px;
    margin: 0;
}

.reward-donation{margin-bottom: 42px;}
.reward-donation h3{float: left; text-align: left; width: 200px;}
.reward-donation h3{font-size: 16px;}

.donation-content{float: left; width: 660px;}
.donation-content::after{content: ""; clear: both; display: block;}
.donation-content .subtext{display: inline-block; margin-bottom: 0px;     padding: 0 5px; font-size: 14px; font-weight: 500; line-height: 18px;}
.input-area{padding: 15px 0 0 20px;}
.donation-input{width: text-align:right; display: inline-block; position: relative; font-size: 17px;}
.donation-input > input{
	text-align:right; 
	height: 48px;
	line-height: 1.2em;
	font-size: 17px;
	font-weight: 300;
	transition-property: border-color, height, padding-right, color;
	transition-duration: 0.2s, 0s;
	outline: none;
	border: 1px solid rgba(0, 0, 0, 0.15);
	background: #fff;
	padding: 0 0.94118em;
	width: 100%;
	vertical-align: middle;
	color: rgba(0, 0, 0, 0.84);
	font-family: Roboto, "Noto Sans KR", -apple-system, Dotum, sans-serif;
}
.donation-input::after{
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
	content: "";
	position: absolute;
	top: 0;
	right: 0;
	transform: scale(0);
	transition-property: transform, opacity;
	transition-duration: .2s;
	opacity: 0;
	margin-top: 0;
	width: auto;
	height: auto;
	box-sizing: border-box;
	pointer-events: none;
	color: #00c4c4;
	font-size: 1.41176em;
}
</style>
</head>
<body>

<%@ include file="/views/common/header.jsp" %>

<div id="reward_container">
	<form action="/pm_insert" method="post">
		<div class="select-container">
		<div class="top-area">
					<h3><em>리워드 선택</em></h3>
					<p class="text">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
		</div>
		<div class="reward-list">
			<ul>
				<li>
					<dl class="reward-box" data-rid="103380">
						<dt>
							<label class="rb-checkbox"> 
								<input type="checkbox" id="ckrw103380" class="reward-check" name="rewardId" value="103380" /> 
								<span></span>
							</label>
						</dt>
						<dd>
							<input type="hidden" id="amountRw103380" value="34900" /> <input
								type="hidden" id="remainCnt103380" class="remain-cnt"
								value="302" /> <input type="hidden" id="limitCnt103380"
								class="limit-cnt" value="600" /> 
							<label for="ckrw103380">
								<p class="sum">34,900원 펀딩합니다.</p>
								<p class="number">
									[슈퍼얼리버드] 스카이 15W 차량용 무선충전기 <em class="remains">(302개 남음)</em>

								</p>
								<p class="text">
									* 와디즈에서만 가능한 30% 혜택<br>스카이 15W 차량용 무선충전기 본체 1개<br>QC3.0
									36W 고속충전 듀얼포트 시거잭 1개<br>대시보드 브라켓 1개<br>송풍구형 클립 1개<br>전용
									충전 케이블 1개
								</p>

								<p class="date">
									배송비 2,500원 | 리워드 제공 예상일 : <em>2019년 08월</em> <em>말
									(21~말일) 예정</em>
								</p>

							</label>
							<div class="checked-area">
								<div class="amount">
									<p class="title">수량</p>
									<p class="input-area">
										<button type="button" onclick="changeQty('minus', 103380)"
													class="icon-remove-box-o"></button>
										<input type="text" id="qty103380" class="reward-qty"
													value="0" />
										<button type="button" onclick="changeQty('plus', 103380)"
													class="icon-add-box-o"></button>
									</p>
								</div>

							</div>
						</dd>
					</dl>
				</li>

			</ul>
		</div>
	</div>
	
	<div class="reward-donation">
		<h3><em>후원금 더하기<span>(선택)</span></em></h3>
		<div class="donation-content">
			<p class="subtext">후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</p>
			<p class="input-area"><input type="hidden" id="addDonation" name="addDonation" value="0"></p>
			<div class="donation-input">
				<input type="text" id="addDonationTmp" name="addDonationTmp" class="wz input numOnly" maxlength="8" value="0" style="ime-mode: disabled;">
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원을 추가로 후원합니다.
			<p/>
		</div>
	</div>
	
	</form>
</div>
</body>
</html>









