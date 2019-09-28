package project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Project_Detail_AdminServlet
 */
@WebServlet("/p_detail_a")
public class Project_Detail_AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_Detail_AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ProjectService pservice = new ProjectService();
		
		String p_no = request.getParameter("p_no");
		
		Project project = pservice.detailProject(p_no);
		
		RequestDispatcher view = null;
		view = request.getRequestDispatcher("/views/admin/adminProjectDetail.jsp");
		
		request.setAttribute("project", project);
		
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
