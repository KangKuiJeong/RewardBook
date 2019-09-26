package payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bootpay.javaApache.BootpayApi;
import kr.co.bootpay.javaApache.model.request.SubscribeBilling;
import member.model.service.MemberService;
import member.model.vo.Member;
import payment.model.service.PaymentService;
import payment.model.vo.Payment;

/**
 * Servlet implementation class Payment_RealPayServlet
 */
@WebServlet("/pm_rp")
public class Payment_RealPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment_RealPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		BootpayApi pay = new BootpayApi("5d5a6ed20627a800303d1954", "/5Qc/8x1aqIjmW0DoloUMMr1SNvoPYNN9K0dT7Lh9nI=");
		SubscribeBilling bill = new SubscribeBilling();
		
		Member mb = new MemberService().selectOne("A0000106");
		Payment pm = new PaymentService().selectPayment("A0000106");
		
		bill.billing_key = mb.getP_billing();
		bill.order_id = "order_id_1A0000106";
		bill.price = (pm.getPm_price());
		bill.pg = "danal";
		bill.item_name = "예약결제";
		
		try {
			pay.getAccessToken();
			pay.subscribe_billing(bill);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("결제성공");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
