package board.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.notice.model.service.NoticeService;

/**
 * Servlet implementation class Notice_DeleteServlet
 */
@WebServlet("/ndelete")
public class Notice_DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice_DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String nt_no = request.getParameter("nt_no");
		String nt_img = request.getParameter("nt_img");
		
		int result = new NoticeService().deleteNotice(nt_no);
			
		
	if(result > 0) {
			//공지사항 삭제 성공시 첨부로 저장된 파일 삭제
			new File(request.getSession()
					.getServletContext().getRealPath(
					"/resources/noticeimg") + "/" 
					+ nt_img).delete(); 
			
			//목록보기 내보냄
			request.getSession(false).setAttribute("result", nt_no + "번 공지 삭제 성공!");
			response.sendRedirect("/RewardBook/nlist");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", nt_no + "번 공지 삭제 실패!");
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
