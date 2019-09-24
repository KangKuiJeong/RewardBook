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
 * Servlet implementation class FAQ_listServlet
 */
@WebServlet("/flist")
public class FAQ_listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQ_listServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Faq> list = new FaqService().listFAQ();
		
		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");
	
		if(list.size() > 0) {
			view = request.getRequestDispatcher("views/board/faq/faqMain.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);

		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "공지사항 전체 목록 조회 실패!");
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
