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
 * Servlet implementation class Project_categoryAjaxServlet
 */
@WebServlet("/p_cajax")
public class Project_categoryAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_categoryAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		
		ArrayList<Project> list = new ProjectService().listProject(category);
		
		System.out.println(list.size());
		if(list.size() > 0) {
			JSONObject sendJSON = new JSONObject();
			
			JSONArray jarr = new JSONArray();
			
			for(Project project : list) {
				//객체 저장용 json 객체 생성
				JSONObject job = new JSONObject();
				
				job.put("no", project.getP_no());
				job.put("title", URLEncoder.encode(project.getP_title(), "UTF-8"));
				job.put("category", URLEncoder.encode(project.getP_category(), "UTF-8"));
				job.put("img", project.getP_img());
				job.put("content", URLEncoder.encode(project.getP_story(), "UTF-8"));
				job.put("rdate", project.getP_rdate());
				job.put("nprice", project.getP_nprice());
				job.put("tprice", project.getP_tprice());
				job.put("name", URLEncoder.encode(project.getU_name(), "UTF-8"));
				
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
