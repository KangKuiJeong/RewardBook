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

import project.model.service.ProjectIndexService;
import project.model.service.ProjectNewsService;
import project.model.vo.Project;
import project.model.vo.ProjectNews;

/**
 * Servlet implementation class ProjectNews_ListServlet
 */
@WebServlet("/p_ajax_nlist")
public class ProjectNews_ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectNews_ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p_no = request.getParameter("pn_o");
		ArrayList<ProjectNews> list = new ProjectNewsService().listProjectNews(p_no);
		// 전송할 json 객체 생성
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		// list 의 객체들을 하나씩 json 배열에 옮겨 저장 처리
		for (ProjectNews project : list) {
		
			// board 를 json 객체로 값 옮겨 저장
			JSONObject job = new JSONObject();
			job.put("pn_o", project.getP_no());
			job.put("pn_no", project.getPn_no());
			// json 에서 한글 깨짐 막으려면,
			// java.net.URLEncoder 의 encode() 로 인코딩함
			job.put("pn_title", URLEncoder.encode(project.getPn_title(), "UTF-8")); //문자는 인코딩
			job.put("pn_text", URLEncoder.encode(project.getPn_text(), "UTF-8"));
			job.put("pn_date", URLEncoder.encode(project.getPn_date()));
			jarr.add(job);

		}

		// 전송용 객체에 배열 저장
		sendJson.put("list", jarr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(sendJson.toJSONString());
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
