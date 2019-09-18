package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_LIstServlet
 */
@WebServlet("/m_list")
public class Member_ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int limit = 10;
		
		MemberService mservice = new MemberService();

		request.setCharacterEncoding("utf-8");
		
		int movePage = Integer.parseInt(request.getParameter("movePage") == null ? "1" : request.getParameter("movePage"));
		String check1 = request.getParameter("s1check1") == null ? "false" : ((String)request.getParameter("s1check1")).equals("on") ? "true" : (String)request.getParameter("s1check1");
		String check2 = request.getParameter("s1check2") == null ? "false" : ((String)request.getParameter("s1check2")).equals("on") ? "true" : (String)request.getParameter("s1check2");
		String select1 = request.getParameter("s2select1") == null ? "" : (String)request.getParameter("s2select1");
		String text1 = request.getParameter("s2text1") == null ? "" : (String)request.getParameter("s2text1");
		ArrayList<Member> list = mservice.pageSelect(movePage, limit, check1, check2, select1, text1);
		int pageCount = mservice.pageCount(check1, check2, select1, text1);
		int maxPage = (int)(Math.ceil((double)pageCount / limit));
		String page = request.getParameter("page") == null ? "" : (String)request.getParameter("page");

		RequestDispatcher view = null;
		
		response.setContentType("text/html; charset=utf-8");
		view = request.getRequestDispatcher("/views/admin/adminMemberList.jsp");
		request.setAttribute("list", list);
		request.setAttribute("currentPage", movePage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("s1check1", check1);
		request.setAttribute("s1check2", check2);
		request.setAttribute("s2select1", select1);
		request.setAttribute("s2text1", text1);
		request.setAttribute("page", page);
		view.forward(request, response);
		
		// 승진 2019-09-10 13:17 수정
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
