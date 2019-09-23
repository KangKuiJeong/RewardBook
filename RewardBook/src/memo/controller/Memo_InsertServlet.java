package memo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.model.service.MemoService;
import memo.model.vo.Memo;

/**
 * Servlet implementation class Memo_InsertServlet
 */
@WebServlet("/minsert")
public class Memo_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Memo_InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = null;		
		request.setCharacterEncoding("utf-8");

		int result = 0;
	
		//전송온 값 꺼내서 변수 또는 객체에 저장하기
		Memo memo = new Memo();

		String p_no = request.getParameter("p_no");
		memo.setP_no(p_no);
		memo.setU_no(request.getParameter("u_no"));
		memo.setM_text(request.getParameter("m_text"));

		Memo memoCheck = new MemoService().selectMemo(p_no);
		
		if (memoCheck.getM_text() == null) {
			result = new MemoService().insertMemo(memo);
		} else {
			result = new MemoService().updateMemo(memo);
		}
		
		if(result > 0) {
	
			view = request.getRequestDispatcher("//p_sel?p_no"+ p_no);
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
