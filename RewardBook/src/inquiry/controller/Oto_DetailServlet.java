package inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.OtoService;
import inquiry.model.vo.Oto;


/**
 * Servlet implementation class Oto_DetailServlet
 */
@WebServlet("/odetail")
public class Oto_DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Oto_DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내가 문의 한 글 상세보기 용 서블릿
		String oto_no = request.getParameter("oto_no");
				
		Oto oto = new OtoService().detailView(oto_no);
				
		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");
				
			if(oto != null) {
					
				view = request.getRequestDispatcher("views/mypage/oto_detail.jsp");
				request.setAttribute("oto", oto);
				view.forward(request, response);
					
			}else {
					
				response.setContentType("text/html;charset=utf-8"); // 어떤 타입으로 출력할것인지 명시하였다.
				PrintWriter out= response.getWriter();
				out.println("<script>");
				out.println("alert('내가 문의한 글 조회에 실패하였습니다.다시 시도해주세요.')");
				out.println("history.back();");
				out.println();
				out.println("</script>");
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
