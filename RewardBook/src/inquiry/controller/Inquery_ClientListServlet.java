package inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.InquiryClientService;
import inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class Inquery_ClientListServlet
 */
@WebServlet("/iq_clist")
public class Inquery_ClientListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inquery_ClientListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트용 관리자문의 리스트
		String u_no = request.getParameter("u_no");
		
		ArrayList<Inquiry> list = new InquiryClientService().selectList(u_no);
		
		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");
	
		if(list.size() > 0) {
			
			view = request.getRequestDispatcher("views/mypage/inquiry_admin.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);

		}else {
			
			view = request.getRequestDispatcher("views/mypage/inquiry_admin_null.jsp");
			request.setAttribute("message", "관리자문의 내역이 없습니다.");
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
