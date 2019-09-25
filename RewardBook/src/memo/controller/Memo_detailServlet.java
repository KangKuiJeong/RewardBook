package memo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import memo.model.service.MemoService;
import memo.model.vo.Memo;

/**
 * Servlet implementation class Memo_detailServlet
 */
@WebServlet("/mdetail")
public class Memo_detailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Memo_detailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String p_no = request.getParameter("p_no");
		String u_no = ((Member)session.getAttribute("loginMember")).getuNo();
	
		 Memo memo = new MemoService().selectMemo(p_no, u_no);

			RequestDispatcher view = null;
			response.setContentType("text/html; charset=utf-8");
			if(memo != null) {
				view = request.getRequestDispatcher("views/memo/memoDetail.jsp");
				request.setAttribute("memo", memo);
				view.forward(request, response);
			
			}else {
				view = request.getRequestDispatcher("views/common/Error.jsp");
				request.setAttribute("message","상세조회 실패!");
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
