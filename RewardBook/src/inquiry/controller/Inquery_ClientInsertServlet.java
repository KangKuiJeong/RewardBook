package inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.InquiryClientService;
import inquiry.model.vo.Inquiry;
import member.model.service.MemberService;

/**
 * Servlet implementation class Inquery_ClientInsertServlet
 */
@WebServlet("/iq_cinsert")
public class Inquery_ClientInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inquery_ClientInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트용 글 등록 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		Inquiry inq = new Inquiry();
		inq.setU_no(request.getParameter("u_no"));
		inq.setIq_title(request.getParameter("iq_inputTitle"));
		inq.setIq_text(request.getParameter("iq_inputText"));
		
		int result = new InquiryClientService().insertInquiry(inq);

		if (result > 0) {
			// 글등록 성공시
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('문의글 등록이 완료되었습니다.')");
			out.println("history.go(-2);");
			out.println();
			out.println("</script>");
			
			
		} else {
			// 실패시
			response.setContentType("text/html;charset=utf-8"); // 어떤 타입으로 출력할것인지 명시하였다.
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('관리자문의글 등록에 실패하였습니다.다시 시도해주세요.')");
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
