package board.faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.faq.model.service.FaqService;
import board.faq.model.vo.Faq;

/**
 * Servlet implementation class Faq_SearchServlet
 */
@WebServlet("/fsearch")
public class FAQ_SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQ_SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String faq_search = request.getParameter("faq_search");
		String searchbt = request.getParameter("searchtext");
		ArrayList<Faq> list = null;

		list = new FaqService().SearchFAQ1(faq_search,searchbt);

		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");
		if(list.size() > 0) {
			view = request.getRequestDispatcher("views/board/faq/faqSearchView.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);

		}else {
			view = request.getRequestDispatcher("views/board/faq/faqSearchNull.jsp");
			request.setAttribute("searchTitle", searchbt);
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
