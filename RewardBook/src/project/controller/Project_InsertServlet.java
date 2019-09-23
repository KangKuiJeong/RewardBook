package project.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Project_InsertServlet
 */
@WebServlet("/p_insert")
public class Project_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		try {

			String no = request.getParameter("no");
			String title = request.getParameter("title");
			int tprice = Integer.parseInt(request.getParameter("tprice"));
			String category = request.getParameter("category");
			Date sdate = Date.valueOf((String)request.getParameter("sdate"));
			Date ddate = Date.valueOf((String)request.getParameter("ddate"));
			String story = request.getParameter("story");
			String info = request.getParameter("info");

			Project project = new Project();
			
			project.setU_no(no);
			project.setP_title(title);
			project.setP_tprice(tprice);
			project.setP_category(category);
			project.setP_sdate(sdate);
			project.setP_ddate(ddate);
			project.setP_story(story);
			project.setP_info(info);
			
			int result = new ProjectService().insertProject(project);
			
		} catch (Exception e) {
			e.printStackTrace();
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
