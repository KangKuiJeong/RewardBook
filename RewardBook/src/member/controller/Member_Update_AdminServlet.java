package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_Update_AdminServlet
 */
@WebServlet("/m_update_a")
public class Member_Update_AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_Update_AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberService mservice = new MemberService();

		request.setCharacterEncoding("utf-8");

		String page = request.getParameter("page") == null ? "" : (String)request.getParameter("page");
		String no = (((String)request.getParameter("no")).equals("") || ((String)request.getParameter("no")).equals("-") ? "" : (String)request.getParameter("no"));
		String bno = (((String)request.getParameter("bno")).equals("") || ((String)request.getParameter("bno")).equals("-") ? "" : (String)request.getParameter("bno"));
		String name = (((String)request.getParameter("name")).equals("") || ((String)request.getParameter("name")).equals("-") ? "" : (String)request.getParameter("name"));
		String id = (((String)request.getParameter("id")).equals("") || ((String)request.getParameter("id")).equals("-") ? "" : (String)request.getParameter("id"));
		String pw = (((String)request.getParameter("pw")).equals("") || ((String)request.getParameter("pw")).equals("-") ? "" : (String)request.getParameter("pw"));
		String phone = (((String)request.getParameter("phone")).equals("") || ((String)request.getParameter("phone")).equals("-") ? "" : (String)request.getParameter("phone"));
		String post = (((String)request.getParameter("post")).equals("") || ((String)request.getParameter("post")).equals("-") ? "" : (String)request.getParameter("post"));
		String address = (((String)request.getParameter("address")).equals("") || ((String)request.getParameter("address")).equals("-") ? "" : (String)request.getParameter("address"));
		String bank = (((String)request.getParameter("bank")).equals("") || ((String)request.getParameter("bank")).equals("-") ? "" : (String)request.getParameter("bank"));
		String bankAccount = (((String)request.getParameter("bankAccount")).equals("") || ((String)request.getParameter("bankAccount")).equals("-") ? "" : (String)request.getParameter("bankAccount"));
		int mileage = Integer.parseInt(request.getParameter("mileage"));
		String homepage = (((String)request.getParameter("homepage")).equals("") || ((String)request.getParameter("homepage")).equals("-") ? "" : (String)request.getParameter("homepage"));
		String category = (((String)request.getParameter("category")).equals("") || ((String)request.getParameter("category")).equals("-") ? "" : (String)request.getParameter("category"));
		String intro = (((String)request.getParameter("intro")).equals("") || ((String)request.getParameter("intro")).equals("-") ? "" : (String)request.getParameter("intro"));

		Member member = new Member();
		member.setuNo(no);
		member.setuBno(bno);
		member.setName(name);
		member.setId(id);
		member.setPw(pw);
		member.setPhone(phone);
		member.setPost(post);
		member.setAddress(address);
		member.setBank(bank);
		member.setBankAccount(bankAccount);
		member.setMileage(mileage);
		member.setHomepage(homepage);
		member.setCategory(category);
		member.setIntro(intro);
		
		int result = mservice.updateMember_A(member);

		RequestDispatcher view = null;
		
		if (result > 0) {
			view = request.getRequestDispatcher("/views/admin/adminMemberDetail.jsp");
			request.setAttribute("member", member);
			request.setAttribute("page", page);
			view.forward(request, response);
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
