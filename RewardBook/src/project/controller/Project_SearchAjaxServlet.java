package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

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
 * Servlet implementation class Project_SearchAjaxServlet
 */
@WebServlet("/p_sh")
public class Project_SearchAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_SearchAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyward = request.getParameter("keyward");
		
		ArrayList<Project> list = new ProjectService().searchKeyward(keyward);
		
		JSONObject sendJSON = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(Project project : list) {
			//객체 저장용 json 객체 생성
			JSONObject job = new JSONObject();
			System.out.println(project.getP_title());
			job.put("title", URLEncoder.encode(project.getP_title(), "UTF-8"));
			
			//배열에 저장
			jarr.add(job);
		}
		
		sendJSON.put("list", jarr);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(sendJSON.toJSONString());
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
