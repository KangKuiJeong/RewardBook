package project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.faq.model.service.FaqService;
import project.model.service.ProjectNewsService;
import project.model.vo.ProjectNews;

/**
 * Servlet implementation class ProjectNews_insertServlet
 */
@WebServlet("/p_news_insert")
public class ProjectNews_insertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectNews_insertServlet() {
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
		ProjectNews pn = new ProjectNews();

		String p_no = (request.getParameter("p_no"));
		pn.setP_no(p_no);
		String pn_title = (request.getParameter("pn_title"));
		pn.setPn_title(pn_title);
		String pn_text = (request.getParameter("pn_text"));
		pn.setPn_text(pn_text);
		
		int result = new ProjectNewsService().insertProjectNews(pn);

	
		
		if(result > 0) {
			response.sendRedirect("/RewardBook//p_sel?p_no=" + p_no);
		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "새 faq 등록 실패!");
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
