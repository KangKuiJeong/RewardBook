package memo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.model.service.MemoService;
import memo.model.vo.Memo;
import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Memo_listServlet
 */
@WebServlet("/mlist")
public class Memo_listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Memo_listServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = null;
		request.setCharacterEncoding("utf-8");
		String u_no = request.getParameter("u_no");

		int result = new MemoService().countMemo();

		if (result > 0) {

			ArrayList<Memo> list = new MemoService().listMemo(u_no);

			if (list.size() > 0) {
				view = request.getRequestDispatcher("views/memo/memoList.jsp");			
				request.setAttribute("listm", list);
				request.setAttribute("result", result);
				view.forward(request, response);
			} else {
				view = request.getRequestDispatcher("views/common/error.jsp");
				request.setAttribute("message", "프로젝트 메인 조회 실패!");
				view.forward(request, response);
			}

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
