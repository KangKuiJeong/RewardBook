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
 * Servlet implementation class Member_CompanyUpdateServlet
 */
@WebServlet("/m_cupdate")
public class Member_CompanyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_CompanyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//기업 회원정보 수정용 컨트롤러
		
		request.setCharacterEncoding("utf-8");
		
		//이름 변수에 저장
		String name = request.getParameter("userName");
		String uNo = request.getParameter("userNo");
		String pwd = request.getParameter("userPWd");
		Member member = new Member();
		member.setuNo(uNo);
		member.setName(name);
		member.setPhone(request.getParameter("phone"));
		member.setPost(request.getParameter("post"));
		member.setAddress(request.getParameter("address"));
		member.setAddress_detail(request.getParameter("detailAddress"));
		member.setCategory(String.join(",", request.getParameterValues("category")));
		member.setIntro(request.getParameter("intro"));
		
		String cryptPwd = null;
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");

			byte[] pwdValues = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(pwdValues);
			cryptPwd = Base64.getEncoder().encodeToString(pwdValues);

		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
	
		member.setPw(cryptPwd);
		
		MemberService mservice = new MemberService();
		int result = mservice.updateMemberCompany(member);

		if(result > 0) {
			//회원정보 수정 성공시
			
			//현재 내정보보기 기능이 session 의 정보를 출력하므로 session 에 기록된 정보를 바꾸는 것으로 처리함
			HttpSession session = request.getSession(false);
			session.setAttribute("loginMember", mservice.selectOne(uNo));
			//메인으로 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			response.sendRedirect("index.jsp");
			
		}else {
			//회원정보 수정 실패시
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패. 다시 시도해주세요.')");
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
