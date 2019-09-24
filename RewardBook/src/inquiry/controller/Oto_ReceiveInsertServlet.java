package inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.OtoService;
import inquiry.model.vo.Oto;

/**
 * Servlet implementation class Oto_ReceiveInsertServlet
 */
@WebServlet("/oreceive")
public class Oto_ReceiveInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Oto_ReceiveInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1대1문의 답변용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		Oto oto = new Oto();
		oto.setOto_no(request.getParameter("oto_no"));
		oto.setU_no(request.getParameter("u_no"));
		oto.setU_no_answer(request.getParameter("answer_no"));
		oto.setOto_atitle(request.getParameter("receiveTitleInput"));
		oto.setOto_atext(request.getParameter("receiveTextInput"));
		oto.setOto_yn(request.getParameter("yn"));
		System.out.println(oto.toString());
		int result = new OtoService().receiveInsertOto(oto);

		if (result > 0) {
			// 글등록 성공시
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('답변 등록이 완료되었습니다.')");
			out.println("history.go(-2);");
			out.println();
			out.println("</script>");
			
			
		} else {
			// 실패시
			response.setContentType("text/html;charset=utf-8"); // 어떤 타입으로 출력할것인지 명시하였다.
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('답변하기에 실패하였습니다.다시 시도해주세요.')");
			out.println("self.close();");
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
