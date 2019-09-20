package inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.OtoService;
import inquiry.model.vo.Oto;

/**
 * Servlet implementation class Oto_ReceiveListServlet
 */
@WebServlet("/orlist")
public class Oto_ReceiveListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Oto_ReceiveListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내가 받은 1:1문의용 컨트롤러
		String u_no = request.getParameter("u_no");
		
		ArrayList<Oto> rlist = new OtoService().selectReceiveSendList(u_no);
		
		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");
	
		if(rlist.size() > 0) {
			
			view = request.getRequestDispatcher("views/mypage/oto_rlist.jsp");
			request.setAttribute("rlist", rlist);
			view.forward(request, response);

		}else {
			
			view = request.getRequestDispatcher("views/mypage/oto_rlist.jsp");
			request.setAttribute("message", "받은 1:1문의 내역이 없습니다.");
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
