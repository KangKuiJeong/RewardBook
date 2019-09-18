package board.faq.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.faq.model.service.FaqService;
import board.faq.model.vo.Faq;

/**
 * Servlet implementation class FAQ_UpdateViewServlet
 */
@WebServlet("/fvupdate")
public class FAQ_UpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQ_UpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*	String faq_no = request.getParameter("faq_no");

		
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		
		if(faq != null) {
			view = request.getRequestDispatcher(
					"views/board/faq/faqUpdateView.jsp");
			request.setAttribute("faq", faq);		
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", faq_no
					+ "번 게시글 수정페이지 출력 처리 실패!");
			view.forward(request, response);
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
