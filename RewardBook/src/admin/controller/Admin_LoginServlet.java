package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;
import admin.model.vo.Admin;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/a_login")
public class Admin_LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//관리자 로그인용 컨트롤러
		
		String userId = request.getParameter("adminId");
		String userPwd = request.getParameter("adminPwd");
	
		Admin loginAdmin = 
			new AdminService().loginCheck(userId, userPwd);

		response.setContentType("text/html; charset=utf-8");
		
		if(loginAdmin != null) {  
		
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(60 * 200);	//세션만료 : 2시간
			session.setAttribute("loginAdmin", loginAdmin);
			response.sendRedirect("views/admin/adminMain.jsp");
			
			
		}else {
			
			response.setContentType("text/html;charset=utf-8"); // 어떤 타입으로 출력할것인지 명시하였다.
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호가 올바르지 않거나 관리자가 아닙니다.')");
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
