package payment.controller;

import java.util.ArrayList;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import kr.co.bootpay.javaApache.BootpayApi;
import kr.co.bootpay.javaApache.model.request.SubscribeBilling;
import member.model.service.MemberService;
import member.model.vo.Member;
import payment.model.service.PaymentService;
import payment.model.vo.Payment;

public class Payment_RealPay implements Job {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		/*BootpayApi pay = new BootpayApi("5d5a6ed20627a800303d1954", "/5Qc/8x1aqIjmW0DoloUMMr1SNvoPYNN9K0dT7Lh9nI=");
		SubscribeBilling bill = new SubscribeBilling();
		
		ArrayList<Payment> payCount = new PaymentService().selectPay();
		
		if(payCount.size() > 0) {
			
			for(Payment p : payCount) {
				Member mb = new MemberService().selectOne(p.getU_no());
				
				if(mb.getP_billing() != null) {
					bill.billing_key = mb.getP_billing();
					bill.order_id = p.getPm_oid();
					bill.price = p.getPm_price();
					bill.pg = "danal";
					bill.item_name = "예약결제";
					
					if(bill.order_id != null && bill.price != 0 && bill.item_name != null) {
						try {
							pay.getAccessToken();
							pay.subscribe_billing(bill);
							
							int result = new PaymentService().SuccessPay(p.getPm_no());
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
		}*/
		
		System.out.println("Quartz test");
		
	}

	
}
