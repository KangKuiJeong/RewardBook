package project.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Project_PermissionListServlet
 */
@WebServlet("/pp_list")
public class Project_PermissionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_PermissionListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int limit = 10;
		
		ProjectService pservice = new ProjectService();

		request.setCharacterEncoding("utf-8");
		
		int movePage = Integer.parseInt(request.getParameter("movePage") == null ? "1" : request.getParameter("movePage"));
		String select1 = request.getParameter("s2select1") == null ? "" : (String)request.getParameter("s2select1");
		String text1 = request.getParameter("s2text1") == null ? "" : (String)request.getParameter("s2text1");
		ArrayList<Project> list = pservice.pageSelect_P(movePage, limit, select1, text1);
		int pageCount = pservice.pageCount_P(select1, text1);
		int maxPage = (int)(Math.ceil((double)pageCount / limit));
		String page = request.getParameter("page") == null ? "" : (String)request.getParameter("page");

		RequestDispatcher view = null;
		
		response.setContentType("text/html; charset=utf-8");
		view = request.getRequestDispatcher("/views/admin/adminPermissionList.jsp");
		request.setAttribute("list", list);
		request.setAttribute("currentPage", movePage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("s2select1", select1);
		request.setAttribute("s2text1", text1);
		request.setAttribute("page", page);
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
