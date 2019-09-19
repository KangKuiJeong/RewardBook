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
 * Servlet implementation class Notice_DetailServlet
 */
@WebServlet("/ndetail")
public class Notice_DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice_DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 상세보기 처리용 컨트롤러
				String nt_no = request.getParameter("nt_no");
				
				Notice notice = new NoticeService().selectNotice(nt_no);
				
				RequestDispatcher view = null;
				response.setContentType("text/html; charset=utf-8");
				if(notice != null) {
					view = request.getRequestDispatcher("views/board/notice/noticeDetailView.jsp");
					request.setAttribute("notice", notice);
					view.forward(request, response);
				}else {
					view = request.getRequestDispatcher("views/common/Error.jsp");
					request.setAttribute("message", nt_no + "번 공지글 상세조회 실패!");
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
