<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="payment.model.vo.Reward, java.util.ArrayList, project.model.vo.Project" %>
<% 
	ArrayList<Reward> list = (ArrayList<Reward>)request.getAttribute("list");
	Project project = (Project)request.getAttribute("project");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select_reward</title>

<!-- css 연결 -->
<link href="/RewardBook/resources/css/project/reward_select.css"  rel="stylesheet">
<!-- jQuery 연결 -->
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	$('.reward-qty').focusout(function() {
		  var newQty = $(this).val() * 1;
		  if (newQty < 1) {
		    alert('1개 이하로 수량을 선택할 수 없습니다.');
		    $(this).val(1);
		    return;
		  }

		  var rewardId = $(this).prop("id").replace("qty", "");
		  var remainCnt = $("#remainCnt" + rewardId).val() * 1;
		  var limitCnt = $("#limitCnt" + rewardId).val() * 1;
		  var $label = $("#memo" + rewardId).parent();
		  var optionSize = $label.parent().find(".reward-options-label").size();
		  if (newQty > remainCnt) {
		   	alert('잔여수량 내에서 수량을 선택해주세요.');
		    $(this).val(remainCnt);
		    _repeatSelectableUi(remainCnt - optionSize, rewardId);
		    calculateTotal();
		    return;
		  }
		  if (limitCnt === 0 && newQty > 500) {
		    $(this).val(500);
		    return;
		  }
		  if (limitCnt > 0 && optionSize > 0) {
		    var diff = newQty - optionSize;
		    _repeatSelectableUi(diff, rewardId);
		    calculateTotal();
		  }
		});
	
	
	function changeQty(type, rewardId){
		var currentVal = $('#qty'+rewardId).val();
		var remainCnt = $('#remainCnt'+rewardId).val();
		var limitCnt = $('#limitCnt'+rewardId).val();
		if (type === 'minus') {
			if(currentVal > 1){
				$('#qty'+rewardId).val(currentVal*1-1);
				selectableUI("ADD", rewardId);
			}else{
				alert('1개 이하로 수량을 선택할 수 없습니다.');
			}
		}else if (type === 'plus') {
		  if(limitCnt !== 0) {
				if (currentVal < remainCnt*1) {
					$('#qty'+rewardId).val(currentVal*1+1);
				} else {
					alert('잔여수량 내에서 수량을 선택해주세요.');
				}
		  }else {
	      if (currentVal < 500) {
	        $('#qty'+rewardId).val(currentVal*1+1);
	      }
	    }
		}
		calculateTotal();
	}

	$(function(){
		$('.reward-check').change(function(){
			if($(this).is(':checked')){
				$(this).closest('dl').css("background", "rgba(255, 178, 2, 0.82)");
				$(this).closest('dl').find('dd .checked-area').css("display", "block");
				
			}else{
				$(this).closest('dl').find('dd .checked-area').css("display", "none");
				$(this).closest('dl').css("background", "rgba(0, 0, 0, 0.06)");
				$('#qty')
			}
		});

		
	})
	
</script>


</head>
<body>

<%@ include file="/views/common/header.jsp"  %>

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
					<% for(Reward reward : list){ %>
					<dl class="reward-box" data-rid="<%= reward.getR_no() %>">
						<dt>
							<label class="rb-checkbox">
								<input type="checkbox" id="ckrw103382" class="reward-check" name="rewardId" value="<%= reward.getR_no() %>" /> 
								<span></span>
							</label>
						</dt>
						<dd>
							<input type="hidden" id="amount<%= reward.getR_no() %>" value="<%= reward.getR_price() %>" /> 
							<input type="hidden" id="remainCnt<%= reward.getR_no() %>" class="remain-cnt" value="<%= reward.getR_amount() %>" /> 
							<input type="hidden" id="limitCnt<%= reward.getR_no() %>" class="limit-cnt" value="800" /> 
							<label for="ckrw103382">
								<p class="sum"><%= reward.getR_price() %>	원 펀딩합니다.</p>
								<p class="number">
									<%= reward.getR_name() %> <em class="remains">(<%= reward.getR_amount() %>개 남음)</em>
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
										<button type="button" onclick="changeQty('minus', '<%= reward.getR_no() %>')" class="icon-remove-box-o"></button>
										<input type="text" id="qty<%= reward.getR_no() %>" class="reward-qty" value="1" />
										<button type="button" onclick="changeQty('plus', '<%= reward.getR_no() %>')" class="icon-add-box-o"></button>
									</p>
								</div>

							</div>
						</dd>
					</dl>
					<% } %>
				</li>

			</ul>
		</div>
	</div>
	
	<div class="reward-donation">
		<h3><em>후원금 더하기<span>(선택)</span></em></h3>
		<div class="donation-content">
			<p class="sub-text">후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</p>
			<p class="input-area"><input type="hidden" id="addDonation" name="addDonation" value="0"></p>
			<div class="donation-input">
				<input type="text" id="addDonationTmp" name="addDonationTmp" class="wz input numOnly" maxlength="8" value="0" style="ime-mode: disabled;">
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원을 추가로 후원합니다.
			<p/>
		</div>
	</div>

	<div class="viewyn-wrap">
		<h3><em>공개여부<span>(선택)</span></em></h3>
		<div class="opencheck">
			<p class="sub-text">서포터 목록에 서포터 이름과 펀딩 금액이 공개됩니다. 조용히 펀딩하고 싶으시다면, 비공개로 선택해주세요.</p>
			<p class="notice-text">커뮤니티, 새소식 댓글 작성 시에는 비공개 여부와 상관없이 펀딩 참여자 표시가 노출됩니다.</p>
			<div class="inner-wrap">
				<p class="check-area">
					<label class="rb checkbox">
						<input type="checkbox" id="dontShowNameYn" name="dontShowNameYn" value="N">
						<span class="nickview">이름 비공개</span>
					</label>
					<label class="rb checkbox">
						<input type="checkbox" id="dontShowAmountYn" name="dontShowAmountYn" value="N">
						<span class="nickview">금액 비공개</span>
					</label>
				</p>
				<ul class="example">
		    		<li>
		    			<p class="title">이름/금액 공개 예시</p>
		    			<dl>
		    				<dt><em style="background-image:url(/RewardBook/resources/images/icons8-fashion-trend-48.png)"></em></dt>
		    				<dd>홍길동님<br>105,000원 참여하셨습니다.</dd>
		    			</dl>
		    		</li>
		    		<li>
		    			<p class="title">이름/금액 비공개 예시</p>
		    			<dl>
		    				<dt><em style="background-image:url(/RewardBook/resources/images/icons8-fashion-trend-48.png)"></em></dt>
		    				<dd>익명의 서포터<br>펀딩으로 참여하셨습니다.</dd>
		    			</dl>
		    		</li>
		    	</ul>
			</div>
		</div>
	</div>	
	</form>
	<div class="btn-wrap">
    	<p class="confirm"><%= project.getP_title() %>에 <em id="sumTotalNum">29,000</em> 원을 펀딩합니다.</p>
    	<button class="rb button primary" onclick="purchaseNextStep();">다음 단계로 <i class="icon chevron-right"></i></button>
    </div>
</div>

</body>
</html>












