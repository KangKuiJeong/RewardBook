package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_FindIdServlet
 */
@WebServlet("/m_findid")
public class Member_FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_FindIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디 중복체크용 컨트롤러
		
		
		  String userId = request.getParameter("findEmail");
		  
		  response.setContentType("text/html; charset=utf-8");
		  
		  Member finderMember = new MemberService().findId(userId);
		
		/* PrintWriter out= response.getWriter(); */
		  RequestDispatcher view = null;
		  if(finderMember.getId()!=null) { //아이디가 없을 경우
			  	
			  	//이름의 두번째 문자 가리기처리.
			  	String name =  finderMember.getName();
			  	if(name != null) {
			  		
			  		name = name.substring(0,1)+"*"+name.substring(2);
			  		
			  	}else { name = "이름이 등록되지 않았습니다."; }
			  	
			  	
				view = request.getRequestDispatcher("views/member/findIdView.jsp");
				request.setAttribute("message", "가입된 계정입니다. " +
									  name +"님으로 가입되어있습니다."+ "<br>");
				view.forward(request, response);
				
		  
		  }else { //아이디가 존재할경우
			  
			  	view = request.getRequestDispatcher("views/member/findIdView.jsp");
				request.setAttribute("message", "해당 아이디가 존재하지 않습니다.");
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
