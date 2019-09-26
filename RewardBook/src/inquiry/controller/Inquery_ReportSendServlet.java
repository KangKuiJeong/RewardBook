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

/**
 * Servlet implementation class Inquery_ReportSendServlet
 */
@WebServlet("/reportsend")
public class Inquery_ReportSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inquery_ReportSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 메이커 신고하기 용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		Inquiry inq = new Inquiry();
		inq.setU_no(request.getParameter("u_no"));
		inq.setIq_title(request.getParameter("reportTitle"));
		inq.setIq_text(request.getParameter("reportText"));
		inq.setIq_target(request.getParameter("maker_no"));
		int result = new InquiryClientService().insertReportInquiry(inq);

		if (result > 0) {
			// 글등록 성공시
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('문의글 등록이 완료되었습니다.')");
			out.println("history.go(-1);");
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
