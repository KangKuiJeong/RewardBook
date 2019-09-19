package board.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.notice.model.service.NoticeService;
import board.notice.model.vo.Notice;

/**
 * Servlet implementation class Faq_SearchServlet
 */
@WebServlet("/nsearch")
public class Notice_SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice_SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String nt_search = request.getParameter("nt_search");
		String searchbt = request.getParameter("searchtext");
		ArrayList<Notice> list = null;

		list = new NoticeService().SearchNT(searchbt, nt_search);
		System.out.println(searchbt + nt_search);
		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");

		if(list.size() > 0) {
			view = request.getRequestDispatcher("views/board/notice/noticeSearchView.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);

		}else {
			
			view = request.getRequestDispatcher("views/board/notice/noticeSearchNull.jsp");
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
