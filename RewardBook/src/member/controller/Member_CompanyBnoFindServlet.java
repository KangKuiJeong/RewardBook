package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_CompanyBnoFindServlet
 */
@WebServlet("/m_findBnum")
public class Member_CompanyBnoFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_CompanyBnoFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사업자등록번호 중복확인용 컨트롤러
		
		  request.setCharacterEncoding("utf-8");
		  String bNo = request.getParameter("bnumber");
		  Member findeBno = new MemberService().findBno(bNo);
		  
		  JSONObject jsonObject = new JSONObject();
		  PrintWriter out = null;
		  RequestDispatcher view = null;
		  
		  if(findeBno.getuBno()==null) {
			  
				view = request.getRequestDispatcher("/views/member/emailJoinCompanyView.jsp");
//				request.setAttribute("message", "가입이 가능한 사업자입니다.");
//				view.forward(request, response);
				jsonObject.put("message", "가입이 가능한 사업자입니다.");
				
		  }else { 
			  
			  	view = request.getRequestDispatcher("/views/member/emailJoinCompanyView.jsp");
//				request.setAttribute("message", "이미 가입되어 있습니다.");
//				view.forward(request, response);
			  	jsonObject.put("message", "이미 가입되어 있습니다.");
		  }
		  
		  response.setContentType("application/x-json; charset=UTF-8"); //HttpServletResponse response
	      out=response.getWriter();
	      out.print(jsonObject);
	      out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
