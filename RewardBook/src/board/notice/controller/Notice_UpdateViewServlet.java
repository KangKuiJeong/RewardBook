package board.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.notice.model.service.NoticeService;
import board.notice.model.vo.Notice;

/**
 * Servlet implementation class Notice_UpdateViewServlet
 */
@WebServlet("/nupdatev")
public class Notice_UpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice_UpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Notice notice = new NoticeService().selectNotice(request.getParameter("nt_no"));
	
		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");
	
		if(notice != null) {
			view = request.getRequestDispatcher(
					"views/board/notice/noticeUpdateView.jsp");
			
			request.setAttribute("list", notice);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher(
					"views/common/Error.jsp");
			request.setAttribute("message", "공지글 수정페이지 이동 실패!");
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
