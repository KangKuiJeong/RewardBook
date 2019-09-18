package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_PersonalEnrollServlet
 */
@WebServlet("/m_penroll")
public class Member_PersonalEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_PersonalEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
			request.setCharacterEncoding("utf-8");

			Member member = new Member();

			member.setId(request.getParameter("userId"));
			member.setName(request.getParameter("userName"));
			
			String userPwd = request.getParameter("userPWd");
			String cryptPwd = null;
			
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");

				byte[] pwdValues = userPwd.getBytes(Charset.forName("UTF-8"));
				md.update(pwdValues);
				cryptPwd = Base64.getEncoder().encodeToString(pwdValues);

			} catch (NoSuchAlgorithmException e) {			
				e.printStackTrace();
			}
		
			member.setPw(cryptPwd);

			int result = new MemberService().insertMember(member);

			if (result > 0) {
				// 회원가입 성공시
				response.sendRedirect("/RewardBook/views/member/joinOK.jsp");
				
			} else {
				// 회원가입 실패시
				response.setContentType("text/html;charset=utf-8"); // 어떤 타입으로 출력할것인지 명시하였다.
				PrintWriter out= response.getWriter();
				out.println("<script>");
				out.println("alert('개인회원가입실패.다시 시도해주세요.')");
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
