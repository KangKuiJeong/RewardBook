package inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.InquiryClientService;
import inquiry.model.vo.Inquiry;


/**
 * Servlet implementation class Inquiry_ClientDetailServlet
 */
@WebServlet("/iq_cdetail")
public class Inquery_ClientDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inquery_ClientDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트용 관리자문의 글 보기
		String iq_no = request.getParameter("iq_no");
		
		Inquiry inq = new InquiryClientService().detailView(iq_no);
		
		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");
		
		if(inq != null) {
			
			view = request.getRequestDispatcher("views/mypage/inquiry_admin_detail.jsp");
			request.setAttribute("inq", inq);
			view.forward(request, response);
			
		}else {
			
			response.setContentType("text/html;charset=utf-8"); // 어떤 타입으로 출력할것인지 명시하였다.
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('관리자문의글 조회에 실패하였습니다.다시 시도해주세요.')");
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
