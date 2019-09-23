package mypage.controller;

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

import member.model.vo.Member;
import mypage.model.service.MypageService;
import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Mypage_ListServlet
 */
@WebServlet("/mp_list")
public class Mypage_ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mypage_ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//마이페이지 프로젝트 리스트용 서블릿
		String uNo = request.getParameter("uNo");
		MypageService mypageservice = new MypageService();
	         
	         ArrayList<Project> list = mypageservice.myprojectList(uNo);
	    
	         JSONObject sendJSON = new JSONObject();
	         if(list.size() == 0) {
	        	 sendJSON.put("result", "펀딩한 프로젝트가 없습니다.");
	        	 
	        	 response.setContentType("application/json");
		         PrintWriter out = response.getWriter();
		         out.print(sendJSON.toJSONString());
		         out.flush();
		         out.close();
	         }else {
	        	 
		         JSONArray jarr = new JSONArray();
		         
		         for(Project project : list) {
		            JSONObject job = new JSONObject();
		            
		            job.put("no", project.getP_no());
					job.put("title", URLEncoder.encode(project.getP_title(), "UTF-8"));
					job.put("category", URLEncoder.encode(project.getP_category(), "UTF-8"));
					job.put("content", URLEncoder.encode(project.getP_story(), "UTF-8"));
					job.put("rdate", project.getP_rdate());
					job.put("nprice", project.getP_nprice());
					job.put("tprice", project.getP_tprice());
					job.put("name", URLEncoder.encode( project.getU_name(), "UTF-8"));

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
