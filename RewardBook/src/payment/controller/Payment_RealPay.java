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
import project.model.service.ProjectService;
import project.model.vo.Project;

public class Payment_RealPay implements Job {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		
		System.out.println("결제 시작");
		
		BootpayApi bootpay = new BootpayApi("5d5a6ed20627a800303d1954", "/5Qc/8x1aqIjmW0DoloUMMr1SNvoPYNN9K0dT7Lh9nI=");
		SubscribeBilling bill = new SubscribeBilling();
		
		ArrayList<Project> payCount = new ProjectService().payList();
		ArrayList<Payment> realpay = new ArrayList<Payment>();
		
		if(payCount.size()> 0) {
			
			for(Project p : payCount) {
				ArrayList<Payment> paylist = new PaymentService().selectPay(p.getP_no());
				for(Payment payment : paylist) {
					Payment pay = new Payment();
					
					pay.setPm_no(payment.getPm_no());
					pay.setU_no(payment.getU_no());
					pay.setP_no(payment.getP_no());
					pay.setR_no(payment.getR_no());
					pay.setPm_option(payment.getPm_option());
					pay.setPm_price(payment.getPm_price());
					pay.setPm_price_plus(payment.getPm_price_plus());
					pay.setPm_mileage(payment.getPm_mileage());
					pay.setPm_nopen(payment.getPm_nopen());
					pay.setPm_popen(payment.getPm_popen());
					pay.setPm_oid(payment.getPm_oid());
					pay.setPm_quantity(payment.getPm_quantity());
					pay.setPm_success(payment.getPm_success());
					
					realpay.add(pay);
				}
			}
		}
		
		if(realpay.size() > 0) {
			
			for(Payment p : realpay) {
				
				Member mb = new MemberService().selectOne(p.getU_no());
				
				if(mb.getP_billing() != null) {
					bill.billing_key = mb.getP_billing();
					bill.order_id = p.getPm_oid();
					bill.price = p.getPm_price();
					bill.pg = "danal";
					bill.item_name = "예약결제";
					
					if(bill.order_id != null && bill.price != 0 && bill.item_name != null) {
						try {
							bootpay.getAccessToken();
							bootpay.subscribe_billing(bill);
							
							int result = new PaymentService().SuccessPay(p.getPm_no());
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
		
		
	}

	
}
