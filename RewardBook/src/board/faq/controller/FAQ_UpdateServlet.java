package board.faq.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.faq.model.service.FaqService;
import board.faq.model.vo.Faq;

/**
 * Servlet implementation class FAQ_UpdateServlet
 */
@WebServlet("/fupdate")
public class FAQ_UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQ_UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = null;		
		request.setCharacterEncoding("utf-8");

	
		//전송온 값 꺼내서 변수 또는 객체에 저장하기
		Faq faq = new Faq();
		/* int faqno = Integer.parseInt(faq_no);*/
		faq.setfaq_no(request.getParameter("faq_no"));
		faq.setfaq_title(request.getParameter("faq_title"));
		faq.setFaq_text(request.getParameter("faq_text"));
		faq.setFaq_oc(request.getParameter("faq_oc"));

		int result = new FaqService().updateFAQ(faq);
		if(result > 0) {
	
			view = request.getRequestDispatcher("views/board/faq/faqUpdateView.jsp");
			request.setAttribute("list", faq);
			view.forward(request, response);

		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "Faq 수정 등록 실패!");
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
