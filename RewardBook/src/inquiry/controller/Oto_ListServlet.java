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
 * Servlet implementation class Oto_ListServlet
 */
@WebServlet("/olist")
public class Oto_ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Oto_ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1대1문의 내가문의한글 보기 컨트롤러
		String u_no = request.getParameter("u_no");
		
		ArrayList<Oto> list = new OtoService().selectSendList(u_no);
		
		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");
	
		if(list.size() > 0) {
			
			view = request.getRequestDispatcher("views/mypage/oto_list.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);

		}else {
			
			view = request.getRequestDispatcher("views/mypage/oto_list.jsp");
			request.setAttribute("message", "보낸 1:1문의 내역이 없습니다.");
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
