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
 * Servlet implementation class Member_CompanyEnrollServlet
 */
@WebServlet("/m_cenroll")
public class Member_CompanyEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_CompanyEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//기업회원가입용 컨트롤러
		request.setCharacterEncoding("utf-8");

		Member member = new Member();

		member.setId(request.getParameter("userId"));
		member.setName(request.getParameter("bName"));
		member.setuBno(request.getParameter("bnumber"));
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

		int result = new MemberService().insertCompanyMember(member);

		if (result > 0) {
			// 회원가입 성공시
			response.sendRedirect("/RewardBook/views/member/joinOK.jsp");
			
		} else {
			// 회원가입 실패시
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('기업회원가입실패.다시 시도해주세요.')");
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
