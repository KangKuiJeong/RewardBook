package project.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Project_UpdateServlet
 */
@WebServlet("/p_update")
public class Project_UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ProjectService pservice = new ProjectService();

		request.setCharacterEncoding("utf-8");

		String page = request.getParameter("page") == null ? "" : (String)request.getParameter("page");
		String no = (String)request.getParameter("no");
		String title = URLDecoder.decode((String)request.getParameter("title"), "UTF-8");
		title = title.equals("") || title.equals("-") ? "" : title;
		String category = (((String)request.getParameter("category")).equals("") || ((String)request.getParameter("category")).equals("-") ? "" : (String)request.getParameter("category"));
		int tprice = Integer.parseInt(request.getParameter("tprice"));
		Date edate = Date.valueOf((String)request.getParameter("edate"));
		Date ddate = Date.valueOf((String)request.getParameter("ddate"));
		String story = (((String)request.getParameter("story")).equals("") || ((String)request.getParameter("story")).equals("-") ? "" : (String)request.getParameter("story"));
		String info = (((String)request.getParameter("info")).equals("") || ((String)request.getParameter("info")).equals("-") ? "" : (String)request.getParameter("info"));

		Project project = new Project();

		project.setP_no(no);
		project.setP_title(title);
		project.setP_category(category);
		project.setP_tprice(tprice);
		project.setP_edate(edate);
		project.setP_ddate(ddate);
		project.setP_story(story);
		project.setP_info(info);
		
		int result = pservice.updateProject(project);

		RequestDispatcher view = null;
		
		if (result > 0) {
			view = request.getRequestDispatcher("/views/admin/adminProjectDetail.jsp");
			request.setAttribute("project", project);
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
