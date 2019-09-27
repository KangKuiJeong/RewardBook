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

import project.model.service.ProjectIndexService;
import project.model.vo.Project;

/**
 * Servlet implementation class BeautyTop3Servlet
 */
@WebServlet("/btTop3")
public class BeautyTop3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BeautyTop3Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인덱스 뷰티카테고리 top3 컨트롤러
		ArrayList<Project> list = new ProjectIndexService().BeautyTop3();
		// 전송할 json 객체 생성
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		int percent = 0;
		// list 의 객체들을 하나씩 json 배열에 옮겨 저장 처리
		for (Project project : list) {
			
			// board 를 json 객체로 값 옮겨 저장
			JSONObject job = new JSONObject();
			// json 에서 한글 깨짐 막으려면,
			// java.net.URLEncoder 의 encode() 로 인코딩함
			job.put("bt3_no", project.getP_no());
			job.put("bt3_title", URLEncoder.encode(project.getP_title(), "UTF-8"));
			job.put("bt3_category", URLEncoder.encode(project.getP_category(), "UTF-8"));
			job.put("bt3_nprice", project.getP_nprice());
			job.put("bt3_tprice", project.getP_tprice());
			percent = (int)((double)(project.getP_nprice()) / (double)(project.getP_tprice()) * 100);
			job.put("percent",percent);
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
