<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link rel="stylesheet" href="/RewardBook/resources/css/payment/payment.css">
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>

<%@ include file="/views/common/header.jsp" %>

<div id="paymentWrap">
	<div class="payment-wrap">
		<form name="paymentForm" id="purchaseForm" method="post">
            <input type="hidden" id="campaignId" name="campaignId" value="43983">
            <input type="hidden" id="presenteeName" name="presenteeName">
            <input type="hidden" id="contactNumber" name="contactNumber">
            <input type="hidden" id="zipCode" name="zipCode">
            <input type="hidden" id="address" name="address">
            <input type="hidden" id="addressDetails" name="addressDetails">
            <input type="hidden" id="applyPoint" name="applyPoint" value="0">
            <input type="hidden" id="email" name="email" value="osj901@naver.com">
            <input type="hidden" id="addDonation" name="addDonation" value="0">
            <input type="hidden" id="dontShowNameYn" name="dontShowNameYn" value="">
            <input type="hidden" id="dontShowAmountYn" name="dontShowAmountYn" value="">
            <input type="hidden" name="secureStateBagKey" value="ZTAwNmU1YjQtNGE0NS00ZGEwLWIxNDMtNzFlYmMxYWI2ZDA0Wmpjek4yRXlNVFl0TXpkbE5DMDBObVpoTFdJeU1UQXRaV0l5TXpWbE1ERTVaR1k0">
            <input type="hidden" id="inputCouponKey" name="couponKey" value="">
            <input type="hidden" id="inputCouponDiscountAmount" name="couponDiscountAmount" value="0">
            
            <div class="rbform-order">
              <div class="order-list" data-choiced-legnth="1">
                <ul>
                  
                  <li>
                    <p class="title">[얼리버드] 우산 3개 SET</p>
                    <p class="text">다다익선! 그 만큼 가격혜택도 커요.
(무료배송)</p>
                    <div class="info">
                      
                      <p class="sum"><em>수량 : 1개</em>43,000원</p>
                    </div>
                  </li>
                  <input type="hidden" name="choiceRewards[0].rewardId" value="104508">
                  <input type="hidden" name="choiceRewards[0].rewardName" value="다다익선! 그 만큼 가격혜택도 커요.(무료배송)">
                  <input type="hidden" name="choiceRewards[0].qty" value="1">
                  <input type="hidden" name="choiceRewards[0].sumAmount" value="43000">
                  <input type="hidden" name="choiceRewards[0].memo" value="">
                  
                </ul>
              </div>
              <div class="order-addinfo">
                <dl>
                  <dt>추가 후원금</dt>
                  <dd>0원</dd>
                </dl>
                <dl>
                  <dt>배송비</dt>
                  <dd>0원</dd>
                </dl>
                <div class="point">
                  <dl>
                    <dt>포인트 사용<a class="link" href="https://www.wadiz.kr/web/fthelpCenter/detail/159" target="_blank">포인트 자세히 알아보기</a></dt>
                    <dd>
                      <label class="wz checkbox">
                        <input type="checkbox" id="ckptAll"><span>모두 사용 (보유 포인트 <span id="usablePoint">0</span>P)</span>
                      </label>
                    <input type="text" id="pointInput" class="numOnly pointInput" maxlength="8" style="ime-mode: disabled;" disabled="disabled"></dd>
                  </dl>
                  <input type="hidden" id="limitPoint" value="0">
                  

                </div>
              </div>
              <div class="order-suminfo">
                <dl>
                  <dt>펀딩금액</dt>
                  <dd>
                    <span id="fundingPrice">
                      43,000
                    </span>원
                  </dd>
                </dl>
                <dl>
                  <dt>포인트 차감금액</dt>
                  <dd class="minus"><em id="pointPrice">-</em></dd>
                </dl>
                <dl>
                  <dt>추가 후원금</dt>
                  <dd>0원</dd>
                </dl>
                <dl>
                  <dt>배송비</dt>
                  <dd>0원</dd>
                </dl>
                <dl class="total">
                  <dt>최종결제금액</dt>
                  <dd><input type="hidden" id="totalPrice" value="43000">
                  <em id="totalPriceView">43,000</em>원</dd>
                </dl>
              </div>
            </div>
            <div class="wpurchase-delivery-wrap">
              
              <div class="wpurchase-supporter-info">
                <h3><em>펀딩 서포터</em></h3>
                <div class="wpurchase-input-box">
                  <dl>
                    <dt>이름</dt>
                    <dd>하쵸</dd>
                  </dl>
                  <dl>
                    <dt>이메일</dt>
                    <dd>osj901@naver.com</dd>
                  </dl>
                  <dl class="supporter-phone-number">
                    <dt>휴대폰 번호</dt>
                    <dd>01077058069</dd>
                  </dl>
                </div>
              </div>
              <div class="wpurchase-delivery">
                <h3><em>리워드 배송지</em></h3>
                <button type="button" class="show-list"><i class="wadizicon wa-expand-more" aria-hidden="true"></i>최근 배송지 보기</button>
                <div class="delivery-list">
                    <dl>
                      <dt>
                        <label class="wz radio">
                          <input type="radio" id="rddv1" name="delivery" value="1">
                          <span></span>
                        </label>
                      </dt>
                      <dd>
                        <label for="rddv1">
                          <p>최근 배송지</p>
                          <p><strong>오세준 010-7705-8069</strong></p>
                          <p>[16943] 경기 용인시 수지구 광교마을로 90 (상현동, 광교마을휴먼시아41단지) 4101동2102호</p>
                        </label>
                      </dd>
                    </dl>
                    <input type="hidden" id="presenteeName1" value="오세준">
                    <input type="hidden" id="contactNumber1" value="010-7705-8069">
                    <input type="hidden" id="zipCode1" value="16943">
                    <input type="hidden" id="address1" value="[16943] 경기 용인시 수지구 광교마을로 90 (상현동, 광교마을휴먼시아41단지)">
                    <input type="hidden" id="addressDetails1" value="4101동2102호">
                </div>
                <div class="deliver-new">
                  <dl>
                    <dt>
                      <label class="wz radio">
                        <input type="radio" id="rddvNew" name="delivery">
                        <span></span>
                      </label>
                    </dt>
                    <dd>
                      <label for="rddvNew">
                        <p><strong>새로입력</strong></p>
                      </label>
                    </dd>
                  </dl>
                <div class="input-area">
                  <p class="title">이름</p>
                  <input type="text" id="newPresenteeName">
                  <p class="title">휴대폰 번호</p>
                  <input type="tel" id="newContactNumber" maxlength="13">
                  <em class="error-message" id="errorPhoneNum">휴대폰 번호를 정확히 입력해주세요.</em>
                  <p class="title">주소</p>
                  <button type="button" onclick="findPostCode()">우편번호 검색</button>
                  <p class="text" id="newAddress"></p>
                  <input type="text" maxlength="96" id="newAddressDetails" placeholder="상세주소">
                  <input type="hidden" id="newZipCode">
                </div>
                </div>
                <div class="delivery-shippingMemo">
                  <div class="input-area">
                  <p class="title">배송 시 요청사항 (선택)</p>
                  <input type="text" id="shippingMemo" name="shippingMemo" maxlength="50" placeholder="ex) 부재시 경비실에 보관해주세요.">
                  <p class="subtext">해당 요청사항은 배송에 관련된 내용만 적어주세요.</p>
                  </div>
                </div>
              </div>
            </div>
          </form>
		<div class="wpurchase-terms wpurchase-terms-section">
            <h3><em>약관 동의</em></h3>
            <div class="terms-notice-box">
              <label class="wz checkbox circular doing-all-agree">
                <input id="acceptAllCheckBox" class="notice-confirm-checkbox" type="checkbox" name="check1" value="Y" autocomplete="off" onchange="acceptAllChanged(this)">
                <span>전체 동의하기</span>
              </label>
              <div id="eachTermsNoticeWrap">
                <div class="term-checkbox-wrap">
                  <label class="wz checkbox circular">
                    <input id="personalInfoAgreementForThirdPartiesCheckBox" class="notice-confirm-checkbox" type="checkbox" name="check1" value="Y" autocomplete="off" onchange="eachTermsChanged()">
                    <span>제 3자에 대한 개인정보 제공 동의</span>
                  </label>
                  <span class="show-term" onclick="showLyPop('personalInfoAgreementForThirdParties');">보기</span>
                  <div id="personalInfoAgreementForThirdPartiesLypop" class="agree-popup" style="display:none;">
                    <div class="agree-popup-header">
                      <h4>제 3자에 대한 개인정보 제공 동의</h4>
                    </div>
                    <div class="agree-popup-body">
                      <p>
                        '펀딩하기'를 통한 결제 및 리워드 전달 서비스를 제공하기 위해, 이용자의 사전 동의 아래 제3자(프로젝트 메이커)에게 제공합니다.<br>
                        메이커에게 전달되는 개인 정보는 기재된 목적 달성 후 파기에 대한 책임이 메이커에게 있으며, 파기하지 않아 생기는 문제에 대한 법적 책임은 메이커에게 있습니다.<br>
                        아래 내용에 대하여 동의를 거부하실 수 있으며, 거부 시 서비스 이용이 제한됩니다. <br><br>
                      </p>
                      <p class="bold">개인 정보 이용 내역</p>
                      <table class="">
                        <colgroup>
                          <col width="30%">
                          <col width="70%">
                        </colgroup>
                        <tbody><tr>
                          <th>제공받는자</th>
                          <td>
                              선티크
                            
                          </td>
                        </tr>
                        <tr>
                          <th>목적</th>
                          <td>리워드 펀딩 정보 확인 및 발송, 리워드 발송과 관련된 공지 및 민원처리</td>
                        </tr>
                        <tr>
                          <th>항목</th>
                          <td>서포터 정보(이름, 이메일, 휴대폰 번호), 수취인 정보(이름, 휴대폰 번호, 주소, 배송 시 요청사항)</td>
                        </tr>
                      </tbody></table>
                    </div>
                    <div class="agree-popup-footer">
                      <button type="button" class="wz button less primary" onclick="closeAgreePopup('personalInfoAgreementForThirdParties');">확인</button>
                    </div>
                  </div>
                </div>
                <div class="term-checkbox-wrap">
                  <label class="wz checkbox circular">
                    <input id="AcceptanceOfLiabilityCheckBox" class="notice-confirm-checkbox" type="checkbox" name="check1" value="Y" autocomplete="off" onchange="eachTermsChanged()">
                    <span>책임 규정에 대한 동의</span>
                  </label>
                  <span class="show-term" onclick="showLyPop('AcceptanceOfLiability');">보기</span>
                  <div id="AcceptanceOfLiabilityLypop" class="agree-popup" style="display:none;">
                    <div class="agree-popup-header">
                      <h4>책임 규정에 대한 동의</h4>
                    </div>
                    <div class="agree-popup-body">
                      <p>
                        와디즈는 플랫폼을 제공하는 중개자로 크라우드펀딩을 받는 당사자가 아닙니다.
                        보상품 제공 등에 관한 지연, 제품의 하자 등으로 인한 일체의 법적책임은 펀딩을 받는 프로젝트 개설자가 부담합니다.
                        하지만, 와디즈는 프로젝트 진행자와 후원자간의 원활한 의사소통을 위해 최선의 노력을 다하고 있습니다.
                      </p>
                    </div>
                    <div class="agree-popup-footer">
                      <button type="button" class="wz button less primary" onclick="closeAgreePopup('AcceptanceOfLiability');">확인</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="btn-wrap">
            <button type="button" id="btn-submit" onclick="purchaseReservation()" class="wz primary button">결제 예약하기</button>
          </div>
		
		
		
		<button onclick="payTest();">결제</button>
	</div>
</div>





<%@ include file="/views/common/footer.jsp" %>

<script type="text/javascript">
<%-- IMP.init('imp06847691');

function payTest(){
	IMP.request_pay({
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '최초인증결제',
		amount : 0, // 빌링키 발급만 진행하며 결제승인을 하지 않습니다.
		customer_uid : '<%= loginMember.getId() %>', //customer_uid 파라메터가 있어야 빌링키 발급이 정상적으로 이뤄집니다.
		buyer_email : 'iamport@siot.do',
		buyer_name : '아임포트',
		buyer_tel : '02-1234-1234'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	console.log(rsp);
	    	jQuery.ajax({
	    		url: "/RewardBook/pm_comp", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'post',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid,
		    		merchant_uid : rsp.merchant_uid
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
} --%>

$('.show-list').click(function(){
    $('.delivery-list').toggle();
  });

$('input[name=delivery]').change(function(){
    if($('#rddvNew').is(':checked')){
      $('.show-list').css('display','block');
      $('.delivery-list').hide();
      $('.deliver-new').addClass('active');
    }else{
      $('.show-list').hide();
      $('.delivery-list').show();
      $('.deliver-new').removeClass('active');
    }
  });
  
/* 배송지 새로입력시 휴대폰 번호 유효성 추가  */
var $contactNumber = $('#newContactNumber');
$contactNumber.inputTelFormat(); // 전화번호 포맷 적용
$contactNumber.on('blur', function(e){
  var $thisInput = $(this); // 새로운 배송지 휴대폰번호 입력창
  var value = $thisInput.val(); // 입력값

  // 휴대폰 번호가 아닐 경우, 에러 표시
  var isValid = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/.test(value); // 휴대폰번호 패턴(숫자만)
  isValid ? $thisInput.removeClass('error') : $thisInput.addClass('error');
});

/*숫자 타입에서 쓸 수 있도록 format() 함수 추가*/
Number.prototype.format = function(){
    if(this==0) return 0;
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
    return n;
};

/* 문자열 타입에서 쓸 수 있도록 format() 함수 추가*/
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
    return num.format();
};

/* 제 3자에 대한 개인정보 제공 동의 팝업, 책임 규정에 대한 동의 팝업 닫기 함수 */
function closeAgreePopup(popupId) {
  var popupElId = '#' + popupId + 'CheckBox';
  closeLyPop(popupId);
  if (!$(popupElId).is(":checked")) {
    $(popupElId).prop("checked", true);
  }
  eachTermsChanged();
}

function acceptAllChanged(el) {
  var childInputs = $('#eachTermsNoticeWrap').find('input');
  if ($(el).is(':checked')) {
    childInputs.prop("checked", true);
  } else {
    childInputs.prop("checked", false);
  }
}

function eachTermsChanged() {
  var childInputs = $('#eachTermsNoticeWrap').find('input');
  var values = $(childInputs)
    .map(function() {
      return $(this).is(":checked");})
    .get();
  var result = values.every(function(bool) {
    return bool;
  });
  if (result) {
    $('#acceptAllCheckBox').prop("checked", true);
  } else {
    $('#acceptAllCheckBox').prop("checked", false);
  }
}


</script>
</body>
</html>