package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.model.service.ProjectSearchService;
import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class ProjectSearch
 */
@WebServlet("/indexSearch")
public class ProjectSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 헤더부분 검색 컨트롤러 */
		request.setCharacterEncoding("utf-8");
		String searchText = request.getParameter("searchText");
		
		ProjectSearchService pservice = new ProjectSearchService();
		int count = new ProjectSearchService().countProject();
		ArrayList<Project> result = pservice.searchProject(searchText);
		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");
		
		if(result.size() > 0) {
			
			view = request.getRequestDispatcher("views/project/projectSearch.jsp");
			request.setAttribute("list", result);
			request.setAttribute("count", count);
			request.setAttribute("searchText", searchText);
			
			view.forward(request, response);
			
		}else {
			
			view = request.getRequestDispatcher("views/project/projectSearchNull.jsp");
			request.setAttribute("searchText", searchText);
			
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

