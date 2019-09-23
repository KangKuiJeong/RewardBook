package inquiry.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.InquiryService;

/**
 * Servlet implementation class Inquiry_Reply_AdminServlet
 */
@WebServlet("/iq_reply_a")
public class Inquiry_Reply_AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inquiry_Reply_AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");

		String page = (String)request.getParameter("page");
		String no = (String)request.getParameter("no");
		String ano = (String)request.getParameter("ano");
		String reply = (String)request.getParameter("reply");
		
		int result = new InquiryService().replyInquiry_A(no, ano, reply);
		
		if (result > 0) {
			response.sendRedirect("/RewardBook/" + (page.equals("inquiry") ? "iq" : "dc") + "_list_a?page=" + page + "&movePage=1");
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
