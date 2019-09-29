package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Project_ListServlet
 */
@WebServlet("/p_list")
public class Project_ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String category = request.getParameter("category");
		
		if(category == null) {

			int result = new ProjectService().countProject();
			
			if(result > 0) {
				ArrayList<Project> list = new ProjectService().listProject();
			
				RequestDispatcher view = null;
				
					view = request.getRequestDispatcher("views/project/projectMain.jsp");
					request.setAttribute("list", list);
					request.setAttribute("result", result);
					view.forward(request, response);
				
			
			}
		}else {
			System.out.println(category);
			int result = new ProjectService().countProject();
			
			if(result > 0) {
				ArrayList<Project> list = new ProjectService().listProject(category);
				System.out.println(list.size());
				RequestDispatcher view = null;
				
					view = request.getRequestDispatcher("views/project/category/"+category+".jsp");
					request.setAttribute("list", list);
					request.setAttribute("result", result);
					view.forward(request, response);
				
			
			}
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
