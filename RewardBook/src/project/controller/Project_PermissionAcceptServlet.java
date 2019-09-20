package project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.service.ProjectService;

/**
 * Servlet implementation class Project_PermissionAcceptServlet
 */
@WebServlet("/pp_accept")
public class Project_PermissionAcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_PermissionAcceptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProjectService pservice = new ProjectService(); 

		request.setCharacterEncoding("utf-8");
		
		String page = (String)request.getParameter("page");
		String no = (String)request.getParameter("no");
		int result = pservice.permissionAccept(no);
		
		RequestDispatcher view = null;
		
		if (result > 0) {
			view = request.getRequestDispatcher("/pp_list?page=permission&movePage=1");
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
