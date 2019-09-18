<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<style type="text/css">

body{
	width: 1690px;
	
}


#payment {
	margin: 0 auto;
}

#pay1 {
	
	width: 50%;
	height: 470px;
	text-align: center;
	margin: 0 auto;
	
}

#pay2 {
	background: gray;
	width: 50%;
	height: 70px;
	text-align: center;
	margin: 0 auto;
}

#pay3 {
	background: violet;
	width: 50%;
	height: 200px;
	text-align: center;
	margin: 0 auto;
}

#pay4 {
	background: coral;
	width: 50%;
	height: 400px;
	text-align: center;
	margin: 0 auto;
}

#pay5 {
	background: orange;
	width: 50%;
	height: 180px;
	text-align: center;
	margin: 0 auto;
}

#btn {
	margin: 0 auto;
	width: 11%;
}

#btn1 {
	background: #ffb202;
	width: 150px;
	height: 50px;
	border-radius: 6px;
	font-size: 20pt;
	font-weight: bold;
	color: white;
	text-shadow: 1px 1px 2px gray;
	text-align: center;
}

.pay1n {
	border-bottom: 1px solid rgba(178, 178, 178, 0.7);
}

</style>
<script type="text/javascript" src="/RewardBook/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
IMP.init('imp06847691');

function payTest(){
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 14000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		url: "/pm_comp", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'post',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid
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
}

</script>
</head>
<body>

<%@ include file="/views/common/header.jsp" %>

<hr style="margin: 0 auto; width: 50%;">
<br>
<div id="payment_All">
<div id="pay1">
	<div class="pay1n" >
		<ul style="list-style: none; border-top: 0.5px solid black;">
			<li style="text-align: left;">결제할 아이템</li> 
			<p>
			<li style="text-align: right;">수량 : ?개   ?원</li>
		</ul>
	</div>

	<div class="pay1n" >
		<dl>
			<dt style="float:left;">추가 후원금</dt>
			<dd style="text-align:right;">?원</dd>
		</dl>
	</div>

	<div class="pay1n" >
		<dl>
			<dt style="float:left;">배송비</dt>
			<dd style="text-align:right;">?원</dd>
		</dl>
	</div>

	<div class="pay1n" >
		<dl>
			<dt style="float:left;">포인트 사용</dt>
			<dd style="text-align:right;">?원</dd>
			<dd style="text-align:right;"><input type="text" name="point"  readonly style="width: 70px; text-align:right;"></dd>
		</dl>
	</div>

	<div class="pay1n" >
		<dl>
			<dt style="float:left;">펀딩금액</dt>
			<dd style="text-align:right;">?원</dd>
			<dt style="float:left;">포인트 차감</dt>
			<dd style="text-align:right;">?원</dd>
			<dt style="float:left;">추가 후원금</dt>
			<dd style="text-align:right;">?원</dd>
			<dt style="float:left;">배송비</dt>
			<dd style="text-align:right;">?원</dd>
			<p>
			<dt style="float:left; font-size: 20pt;">총 결제 금액</dt>
			<dd style="text-align:right; font-size: 20pt;">?원</dd>
		</dl>
	</div>
</div>
<div id="pay2">
서포터 정보
</div>
<br>
<div id="pay3">
배송지 입력(우편API)
</div>
<br>
<div id="pay4">
	
</div>
<br>

<div id="btn">
<form action="#" method="post">
<input type="button" value="결제 예약" id="btn1" onclick="payTest();">
</form>
</div>
<br><br><br><br><br><br><br><br>
</div>

<%@ include file="/views/common/footer.jsp" %>


</body>
</html>