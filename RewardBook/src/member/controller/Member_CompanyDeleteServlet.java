package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;

/**
 * Servlet implementation class Member_CompanyDeleteServlet
 */
@WebServlet("/m_cdel")
public class Member_CompanyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_CompanyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//기업 회원 탈퇴용 컨트롤러
		String userNo = request.getParameter("userNo");
		
		MemberService mservice = new MemberService();
		int result = mservice.deleteMember(userNo);
		
		if(result > 0) {
			//회원정보 수정 성공시
			
			response.setContentType("text/html;charset=utf-8");
			HttpSession session = request.getSession(false);
			if(session != null) {
				session.invalidate();	//세션 무효화시킴
				response.sendRedirect("/RewardBook/views/member/deleteComplete.jsp");
				
			}
			
			
		}else {
			//회원정보 수정 실패시
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('탈퇴에 실패하였습니다.')");
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
