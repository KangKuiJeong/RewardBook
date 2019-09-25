package payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import payment.model.service.PaymentService;
import payment.model.service.RewardService;
import payment.model.vo.Payment;

/**
 * Servlet implementation class Payment_InsertServlet
 */
@WebServlet("/Payment_InsertServlet")
public class Payment_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment_InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String u_no = request.getParameter("u_no");
		String p_no = request.getParameter("p_no");
		String r_no = request.getParameter("r_no");
		String r_price = request.getParameter("r_price");
		String r_amount = request.getParameter("r_amount");
		String donation = request.getParameter("donation");
		String nopen = request.getParameter("nopen");
		String popen = request.getParameter("popen");
		String order_id = request.getParameter("order_id");
		
		String[] rarr = r_no.split(",");
		String[] aarr = r_amount.split(",");
		String[] parr = r_price.split(",");
		
		int result1 = 0;
		for(int i = 0; i < rarr.length; i++) {
			result1 = new RewardService().updateReward(rarr[i], aarr[i]);
		}
		
		int price= 0;
		for(int i = 0; i < parr.length; i++) {
			price += (Integer.parseInt(parr[i]) * Integer.parseInt(aarr[i]));
		}
		
		price += Integer.parseInt(donation);
		
		Payment pay = null;
		int result2 = 0;
		
			pay = new Payment();
			
			pay.setP_no(p_no);
			pay.setR_no(r_no);
			pay.setU_no(u_no);
			pay.setPm_price(price);
			pay.setPm_quantity(r_amount);
			pay.setPm_price_plus(Integer.parseInt(donation));
			pay.setPm_nopen(nopen);
			pay.setPm_popen(popen);
			pay.setPm_oid(order_id);
			
			result2 = new PaymentService().insertPayment(pay);
			
			if(result2 <= 0) {
				RequestDispatcher view = request.getRequestDispatcher("/p_sel?p_no="+p_no);
				view.forward(request, response);
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
