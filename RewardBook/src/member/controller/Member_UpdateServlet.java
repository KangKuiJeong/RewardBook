package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_UpdateServlet
 */
@WebServlet("/m_update")
public class Member_UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService mservice = new MemberService();
		
		request.setCharacterEncoding("utf-8");
		
		Member member = new Member();
		
		member.setuNo(request.getParameter("no"));
		member.setuBno(request.getParameter("bno").equals("-") ? null : request.getParameter("bno"));
		member.setId(request.getParameter("id"));
		member.setName(request.getParameter("name").equals("-") ? null : request.getParameter("name"));
		member.setPw(request.getParameter("pw").equals("-") ? null : request.getParameter("pw"));
		member.setPhone(request.getParameter("phone").equals("-") ? null : request.getParameter("phone"));
		member.setProfileImg(request.getParameter("profile").equals("-") ? null : request.getParameter("profile"));
		member.setIntro(request.getParameter("intro").equals("-") ? null : request.getParameter("intro"));
		member.setAddress(request.getParameter("address").equals("-") ? null : request.getParameter("address"));
		member.setPost(request.getParameter("post").equals("-") ? null : request.getParameter("post"));
		member.setMileage(Integer.parseInt(request.getParameter("mileage")));
		member.setBank(request.getParameter("bank").equals("-") ? null : request.getParameter("bank"));
		member.setBankAccount(request.getParameter("bankAccount").equals("-") ? null : request.getParameter("bankAccount"));
		member.setHomepage(request.getParameter("homepage").equals("-") ? null : request.getParameter("homepage"));
		member.setCategory(request.getParameter("category").equals("-") ? null : request.getParameter("category"));
		
		mservice.updateMember(member);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
