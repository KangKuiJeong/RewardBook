<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				$(this).closest('dl').css("background", "#ffb202");
				$(this).closest('dl').find('dd .checked-area').css("display", "block");
				
			}else{
				$(this).closest('dl').find('dd .checked-area').css("display", "none");
				$(this).closest('dl').css("background", "rgba(178, 178, 178, 0.3)");
			}
		});

		
	})
	
</script>
<style type="text/css">

#reward_container{
	width: 860px;
	height: 2000px;
	margin: 0 auto;
}

.reward-box {
	border-radius: 5px;
	background: rgba(178, 178, 178, 0.3);
	display: block;
	margin-bottom: 15px;
}

.reward-list > ul{
	list-style: none;
	padding: 0;
}

.reward-box > dt{
	float: left;
    text-align: center;
    width: 100px;
    padding-top: 50px;
    margin-bottom: 15px;
    display: block;
}



.reward-check > input{
	width: 20px;
}

.checked-area{
	display: none;
}

.top-area{
	margin-bottom: 20px;
	display: flex;
}

.top-area > h3 {
	margin-bottom: 10px;
	margin-right: 10px;
}

.reward-box > dd {
	float: left;
    padding: 20px 10px;
    width: 740px;
    cursor: pointer;
    margin-inline-start: 40px;
    margin: 0;
}


</style>
</head>
<body>

<%@ include file="/views/common/header.jsp" %>

<div id="reward_container">
	<div class="select-container">
		<div class="top-area">
					<h3>
						<em>리워드 선택</em>
					</h3>
					<p class="text">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
				</div>
		<div class="reward-list">
			<ul>
				<li>
					<div class="reward-box" data-rid="103378">
						<div>
							<label class="rb-checkbox"> <input type="checkbox"
								id="ckrw103378" class="reward-check" name="rewardId"
								value="103378" disabled="disabled" /> <span></span>
							</label>
						</div>
						<div>
							<input type="hidden" id="amountRw103378" value="32900" /> <input
								type="hidden" id="remainCnt103378" class="remain-cnt"
								value="0" /> <input type="hidden" id="limitCnt103378"
								class="limit-cnt" value="200" /> 
							<label for="ckrw103378">
								<p class="sum">32,900원 펀딩합니다.</p>
								<p class="number">
									[울트라얼리버드] 스카이 15W 차량용 무선충전기 <em class="soldout">(마감)</em>
								</p>
								<p class="text">
									* 와디즈에서만 가능한 34% 혜택<br>스카이 15W 차량용 무선충전기 본체 1개<br>QC3.0
									36W 고속충전 듀얼포트 시거잭 1개<br>대시보드 브라켓 1개<br>송풍구형 클립 1개<br>전용
									충전 케이블 1개<br>
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
										<button type="button" onclick="changeQty('minus', 103378)"
											class="icon-remove-box-o"></button>
										<input type="text" id="qty103378" class="reward-qty"
											value="0" />
										<button type="button" onclick="changeQty('plus', 103378)"
											class="icon-add-box-o"></button>
									</p>
								</div>

							</div>
						</div>
					</div>
				</li>

				<li>
					<dl class="reward-box" data-rid="103380">
						<dt>
							<label class="rb-checkbox"> <input type="checkbox"
								id="ckrw103380" class="reward-check" name="rewardId"
								value="103380" /> <span></span>
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

				<li>
					<dl class="reward-box" data-rid="103382">
						<dt>
							<label class="rb-checkbox"> <input type="checkbox"
								id="ckrw103382" class="reward-check" name="rewardId"
								value="103382" /> <span></span>
							</label>
						</dt>
						<dd>
							<input type="hidden" id="amountRw103382" value="36900" /> <input
								type="hidden" id="remainCnt103382" class="remain-cnt"
								value="799" /> <input type="hidden" id="limitCnt103382"
								class="limit-cnt" value="800" /> 
							<label for="ckrw103382">
								<p class="sum">36,900원 펀딩합니다.</p>
								<p class="number">
									[얼리버드] 스카이 15W 차량용 무선충전기 <em class="remains">(799개 남음)</em>

								</p>
								<p class="text">
									* 와디즈에서만 가능한 26% 혜택<br>스카이 15W 차량용 무선충전기 본체 1개<br>QC3.0
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
										<button type="button" onclick="changeQty('minus', 103382)"
											class="icon-remove-box-o"></button>
										<input type="text" id="qty103382" class="reward-qty"
											value="0" />
										<button type="button" onclick="changeQty('plus', 103382)"
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
		
</div>

</body>
</html>