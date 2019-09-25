package payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.model.service.PaymentService;
import payment.model.vo.Payment;
import payment.model.vo.Reward;

/**
 * Servlet implementation class Payment_PageServlet
 */
@WebServlet("/pm_page")
public class Payment_PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment_PageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String u_no = request.getParameter("u_no");
		int totalSelected = Integer.parseInt(request.getParameter("totalSelected")); 
		int fundingPrice = Integer.parseInt(request.getParameter("fundingPrice"));
		int donation = Integer.parseInt(request.getParameter("addDonation"));
		
		ArrayList<Reward> list = new ArrayList<Reward>();
		for(int i =0; i < totalSelected; i++) {
			Reward reward = new Reward();
			
			reward.setR_no(request.getParameter("choiceRewards["+ i +"].rewardId"));
  			reward.setR_name(request.getParameter("choiceRewards["+ i +"].rewardName"));
  			reward.setR_detail(request.getParameter("choiceRewards["+ i +"].detail"));
  			reward.setR_amount(request.getParameter("choiceRewards["+ i +"].qty"));
  			reward.setR_price(Integer.parseInt(request.getParameter("choiceRewards["+ i +"].price")));
  			
  			list.add(reward);
		}
		
		Payment pay = new PaymentService().selectPayment(u_no);
		
		RequestDispatcher view = null;
			view = request.getRequestDispatcher("/views/payment/payment.jsp");
			request.setAttribute("list", list);
			request.setAttribute("fundingPrice", fundingPrice);
			request.setAttribute("donation", donation);
			request.setAttribute("pay", pay);
			view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
