<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="payment.model.vo.Payment, java.util.ArrayList, payment.model.vo.Reward" %>
<% 
	Payment pay = (Payment)request.getAttribute("pay");
	ArrayList<Reward> list = (ArrayList<Reward>)request.getAttribute("list");
	int fundingPrice = Integer.parseInt(request.getParameter("fundingPrice"));
	int donation = Integer.parseInt(request.getParameter("addDonation"));
	int sumPrice = fundingPrice + donation;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link rel="stylesheet" href="/RewardBook/resources/css/payment/payment.css">
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.4.min.js" type="application/javascript"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function findPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('newZipCode').value = data.zonecode;
            document.getElementById("newAddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("newAddressDetails").focus();
        }
    }).open();
}
</script>
</head>
<body>

<%@ include file="/views/common/header.jsp" %>

<div id="paymentWrap">
	<div class="payment-wrap">
		<form name="paymentForm" id="purchaseForm" method="post">
            <input type="hidden" name="u_no" value="<%= loginMember.getuNo() %>">
            
            <div class="rbform-order">
              <div class="order-list" data-choiced-legnth="1">
                <ul>
                  
                  <li>
                  	<% for(Reward reward : list){ %>
                  		
                    <p class="title"><%= reward.getR_name() %></p>
                    <p class="text"><%= reward.getR_detail() %></p>
                    <div class="info">
                      
                      <p class="sum"><em>수량 : <%= reward.getR_amount() %>개</em><%= reward.getR_price() %>원</p>
                    </div>
                    <% } %>
                  </li>
                  <% for(int i = 0; i < list.size(); i++){ %>
                  <input type="hidden" name="choiceRewards[<%= i %>].rewardId" value="<%= list.get(i).getR_no() %>">
                  <input type="hidden" name="choiceRewards[<%= i %>].rewardName" value="<%= list.get(i).getR_name() %>">
                  <input type="hidden" name="choiceRewards[<%= i %>].qty" valu="<%= list.get(i).getR_amount() %>">
                  <input type="hidden" name="choiceRewards[<%= i %>].sumAmount" value="<%= list.get(i).getR_price() %>">
                  <% } %>
                </ul>
              </div>
              <div class="order-addinfo">
                <dl>
                  <dt>추가 후원금</dt>
                  <dd><%= donation %>원</dd>
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
                      <%= fundingPrice %>
                    </span>원
                  </dd>
                </dl>
                <dl>
                  <dt>포인트 차감금액</dt>
                  <dd class="minus"><em id="pointPrice">-</em></dd>
                </dl>
                <dl>
                  <dt>추가 후원금</dt>
                  <dd><%= donation %>원</dd>
                </dl>
                <dl class="total">
                  <dt>최종결제금액</dt>
                  <dd><input type="hidden" id="totalPrice" value="43000">
                  <em id="totalPriceView">
                  
                  </em><%= sumPrice %>원</dd>
                </dl>
              </div>
            </div>
            <div class="wpurchase-delivery-wrap">
              
              <div class="wpurchase-supporter-info">
                <h3><em>펀딩 서포터</em></h3>
                <div class="wpurchase-input-box">
                  <dl>
                    <dt>이름</dt>
                    <dd><%= loginMember.getName() %></dd>
                  </dl>
                  <dl>
                    <dt>이메일</dt>
                    <dd><%= loginMember.getId() %></dd>
                  </dl>
                  <dl class="supporter-phone-number">
                    <dt>휴대폰 번호</dt>
                    <dd><%= loginMember.getPhone() %></dd>
                  </dl>
                </div>
              </div>
              <% if(loginMember.getAddress() != null){ %>
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
                          <p><strong><%= loginMember.getName() %> <%= loginMember.getPhone() %></strong></p>
                          <p><%= loginMember.getAddress() %> <%= loginMember.getAddress_detail() %></p>
                        </label>
                      </dd>
                    </dl>
                    <input type="hidden" id="presenteeName1" value="<%= loginMember.getName() %>">
                    <input type="hidden" id="contactNumber1" value="<%= loginMember.getPhone() %>">
                    <input type="hidden" id="zipCode1" value="<%= loginMember.getPost() %>">
                    <input type="hidden" id="address1" value="<%= loginMember.getAddress() %>">
                    <input type="hidden" id="addressDetails1" value="<%= loginMember.getAddress_detail() %>">
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
                  <input type="text" maxlength="96" id="newAddress" placeholder="주소">
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
              <% }else{ %>
				<div class="wpurchase-delivery">
                <h3><em>리워드 배송지</em></h3>
                <button type="button" class="show-list"><i class="wadizicon wa-expand-more" aria-hidden="true"></i>최근 배송지 보기</button>
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
                  <p class="text" id="newAddresses"></p>
                  <input type="text" maxlength="96" id="newAddress"  placeholder="주소">
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
              <%	} %>
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
          <% if(loginMember.getP_billing() == null){ %>
          	<button type="button" id="btn-submit"  onclick="isbilling()" class="wz primary button">결제 예약하기</button>
          <% }else{ %>
            <button type="button" id="btn-submit" onclick="payTest()" class="wz primary button">결제 예약하기</button>
          <% } %> 
         
          </div>
		
	</div>
</div>

<%@ include file="/views/common/footer.jsp" %>

<script type="text/javascript">

function payTest(){
	var d = new Date;
	
	BootPay.request({
		price: 0, // 0으로 해야 한다.
		application_id: "5d5a6ed20627a800303d1951",
		name: '정기적인 결제', //결제창에서 보여질 이름
		pg: 'danal',
		method: 'card_rebill', // 빌링키를 받기 위한 결제 수단
		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		user_info: {
			username: '<%= loginMember.getName() %>',
			email: '<%= loginMember.getId() %>',
			addr: '<%= loginMember.getAddress() %>',
			phone: '<%= loginMember.getPhone() %>'
		},
		order_id: 'order_id_'+ d.getTime() + '<%= loginMember.getuNo() %>', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
	}).error(function (data) {
		//결제 진행시 에러가 발생하면 수행됩니다.
		console.log(data);
	}).cancel(function (data) {
		//결제가 취소되면 수행됩니다.
		console.log(data);
	}).done(function (data) {
		// 빌링키를 정상적으로 가져오면 해당 데이터를 불러옵니다.
		var r_no = "";
		<% for(int i = 0; i < list.size(); i++){ %>
			<% if(i == (list.size()-1)){ %>
				r_no += "<%= list.get(i).getR_no() %>"
			<% }else{ %>
				r_no += ",<%= list.get(i).getR_no() %>"
			<% } %>
		<% } %>
		
		var r_price = "";
		<% for(int i = 0; i < list.size(); i++){ %>
			<% if(i == (list.size()-1)){ %>
				r_price += "<%= list.get(i).getR_price() %>"
			<% }else{ %>
				r_price += ",<%= list.get(i).getR_price() %>"
			<% } %>
		<% } %>
		
		var r_amount = "";
		<% for(int i = 0; i < list.size(); i++){ %>
			<% if(i == (list.size()-1)){ %>
				r_amount += "<%= list.get(i).getR_amount() %>"
			<% }else{ %>
				r_amount += ",<%= list.get(i).getR_amount() %>"
			<% } %>
		<% } %>
		
		
		$.ajax({
			url: '/RewardBook/pm_comp',
			data: {
				billing_key : data.billing_key,
				order_id : 'order_id_'+'<%= pay.getP_no() %>' + '<%= loginMember.getuNo() %>',
				p_no : "<%= request.getParameter("p_no") %>",
				u_no : "<%= loginMember.getuNo() %>",
				r_no : r_no,
				r_price : r_price,
				r_amount : r_amount,
				donation : "<%= donation %>",
				nopen : "<%= request.getParameter("dontShowNameYn") %>",
				popen : <%= request.getParameter("dontShowAmountYn") %>
			},
			type: 'POST',
			success: function(){
				var presenteeName = "";
				var contactNumber = "";
				var zipCode = "";
				var address = "";
				var addressDetail = "";
				
				if($('#presenteeName1').val() == null){
					presenteeName = $('#newPresenteeName').val();
				}else{
					presenteeName= $('#presenteeName1').val();
				}
				
				if($('#contactNumber1').val() == null){
					contactNumber = $('#newContactNumber').val();
				}else{
					contactNumber = $('#contactNumber1').val();
				}
				
				if($('#zipCode1').val() == null){
					zipCode = $('#newZipCode').val();
				}else{
					zipCode = $('#zipCode1').val();
				}
				
				if($('#address1').val() == null){
					address = $('#newAddress').val();
				}else{
					address = $('#address1').val();
				}
				
				if($('#addressDetails1').val() == null){
					addressDetail = $('#newAddressDetails').val();
				}else{
					addressDetail = $('#addressDetails1').val();
				}
				
				$('#purchaseForm').append('<input type="hidden" name="presenteeName" value="'+presenteeName+'" />');
				$('#purchaseForm').append('<input type="hidden" name="contactNumber" value="'+contactNumber+'" />');
				$('#purchaseForm').append('<input type="hidden" name="zipcode" value="'+zipCode+'" />');
				$('#purchaseForm').append('<input type="hidden" name="address" value="'+address+'" />');
				$('#purchaseForm').append('<input type="hidden" name="addressDetail" value="'+addressDetail+'" />');
				$('#purchaseForm').attr('action', '/RewardBook/postInsert');
				$('#purchaseForm').submit();
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error : " + textStatus);
			},
		});
	});
}

function isbilling(){
	var d = new Date;
	
	var r_no = "";
	<% for(int i = 0; i < list.size(); i++){ %>
		<% if(i == (list.size()-1)){ %>
			r_no += "<%= list.get(i).getR_no() %>"
		<% }else{ %>
			r_no += ",<%= list.get(i).getR_no() %>"
		<% } %>
	<% } %>
	
	var r_price = "";
	<% for(int i = 0; i < list.size(); i++){ %>
		<% if(i == (list.size()-1)){ %>
			r_price += "<%= list.get(i).getR_price() %>"
		<% }else{ %>
			r_price += ",<%= list.get(i).getR_price() %>"
		<% } %>
	<% } %>
	
	var r_amount = "";
	<% for(int i = 0; i < list.size(); i++){ %>
		<% if(i == (list.size()-1)){ %>
			r_amount += "<%= list.get(i).getR_amount() %>"
		<% }else{ %>
			r_amount += ",<%= list.get(i).getR_amount() %>"
		<% } %>
	<% } %>
	
	
	$.ajax({
		url: '/RewardBook/pm_ins',
		data: {
			order_id : 'order_id_'+ d.getTime() + '<%= loginMember.getuNo() %>',
			p_no : "<%= request.getParameter("p_no") %>",
			u_no : "<%= loginMember.getuNo() %>",
			r_no : r_no,
			r_price : r_price,
			r_amount : r_amount,
			donation : "<%= donation %>",
			nopen : "<%= request.getParameter("dontShowNameYn") %>",
			popen : <%= request.getParameter("dontShowAmountYn") %>
		},
		type: 'POST',
		success: function(){
			var presenteeName = "";
			var contactNumber = "";
			var zipCode = "";
			var address = "";
			var addressDetail = "";
			
			if($('#presenteeName1').val() == null){
				presenteeName = $('#newPresenteeName').val();
			}else{
				presenteeName= $('#presenteeName1').val();
			}
			
			if($('#contactNumber1').val() == null){
				contactNumber = $('#newContactNumber').val();
			}else{
				contactNumber = $('#contactNumber1').val();
			}
			
			if($('#zipCode1').val() == null){
				zipCode = $('#newZipCode').val();
			}else{
				zipCode = $('#zipCode1').val();
			}
			
			if($('#address1').val() == null){
				address = $('#newAddress').val();
			}else{
				address = $('#address1').val();
			}
			
			if($('#addressDetails1').val() == null){
				addressDetail = $('#newAddressDetails').val();
			}else{
				addressDetail = $('#addressDetails1').val();
			}
			
			$('#purchaseForm').append('<input type="hidden" name="presenteeName" value="'+presenteeName+'" />');
			$('#purchaseForm').append('<input type="hidden" name="contactNumber" value="'+contactNumber+'" />');
			$('#purchaseForm').append('<input type="hidden" name="zipcode" value="'+zipCode+'" />');
			$('#purchaseForm').append('<input type="hidden" name="address" value="'+address+'" />');
			$('#purchaseForm').append('<input type="hidden" name="addressDetail" value="'+addressDetail+'" />');
			$('#purchaseForm').attr('action', '/RewardBook/postInsert');
			$('#purchaseForm').submit();
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + textStatus);
		},
	});
}


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