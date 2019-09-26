package memo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.model.service.MemoService;

/**
 * Servlet implementation class Memo_deleteServlet
 */
@WebServlet("/mdelete")
public class Memo_deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Memo_deleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String u_no = request.getParameter("u_no");
		String p_no = request.getParameter("p_no");
	
		int result = new MemoService().deleteMemo(p_no);
		
		if(result > 0) {
			response.sendRedirect("/RewardBook/mlist" + "?u_no=" + u_no);
			
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/Error.jsp");
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
