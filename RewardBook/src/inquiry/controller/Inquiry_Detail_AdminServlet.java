package inquiry.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.InquiryService;
import inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class Inquiry_Detail_AdminServlet
 */
@WebServlet("/iq_detail_a")
public class Inquiry_Detail_AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inquiry_Detail_AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		InquiryService iqservice = new InquiryService();

		String no = (String)request.getParameter("iq_no");
		String page = (String)request.getParameter("page");
		
		Inquiry inquiry = iqservice.detailInquiry(no);
		iqservice.updateOC(no);
		
		if (inquiry != null) {
			
			RequestDispatcher views = null;
			
			views = request.getRequestDispatcher("/views/admin/adminInquiryDetail.jsp");
			
			request.setAttribute("inquiry", inquiry);
			request.setAttribute("page", page);
			
			views.forward(request, response);
			
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
