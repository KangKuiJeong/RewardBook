package inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class Oto_ReceiveDetailServlet
 */
@WebServlet("/ordetail")
public class Oto_ReceiveDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Oto_ReceiveDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내가 받은 글 보기용 컨트롤러
		// 내가 문의 한 글 상세보기 용 서블릿
				String oto_no = request.getParameter("oto_no");
						
				Oto oto = new OtoService().detailRecieveView(oto_no);
						
				RequestDispatcher view = null;
				response.setContentType("text/html; charset=utf-8");
						
					if(oto != null) {
							
						view = request.getRequestDispatcher("views/mypage/oto_receive_detail.jsp");
						request.setAttribute("oto", oto);
						view.forward(request, response);
							
					}else {
							
						response.setContentType("text/html;charset=utf-8"); // 어떤 타입으로 출력할것인지 명시하였다.
						PrintWriter out= response.getWriter();
						out.println("<script>");
						out.println("alert('문의받은 글 조회에 실패하였습니다.다시 시도해주세요.')");
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
