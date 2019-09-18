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
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_LoginServlet
 */
@WebServlet("/login")
public class Member_LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인처리용 컨트롤러

				request.setCharacterEncoding("utf-8");
				String userId = request.getParameter("userid");
				String userPwd = request.getParameter("userpwd");
				
				String cryptPwd = null;
				try {
					
					MessageDigest md = MessageDigest.getInstance("SHA-512");
					byte[] pwdValues = userPwd.getBytes(Charset.forName("UTF-8"));
					md.update(pwdValues);
					cryptPwd = Base64.getEncoder().encodeToString(pwdValues);
					
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}

				Member loginMember = new MemberService().loginCheck(userId, cryptPwd);

				response.setContentType("text/html; charset=utf-8");

				if (loginMember != null) {
					// 로그인 성공시
					HttpSession session = request.getSession();
					
					//세션만료 시간 : 1시간
					session.setMaxInactiveInterval(60 * 100);
					session.setAttribute("loginMember", loginMember);
					response.sendRedirect("index.jsp");

				} else {
					
					//로그인 실패시 경고창 내보내고, 로그인창으로 돌아감.
					response.setContentType("text/html;charset=utf-8"); // 어떤 타입으로 출력할것인지 명시하였다.
					PrintWriter out= response.getWriter();
					out.println("<script>");
					out.println("alert('아이디 또는 비밀번호가 올바르지 않습니다.')");
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
