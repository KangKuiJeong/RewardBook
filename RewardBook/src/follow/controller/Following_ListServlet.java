package follow.controller;

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

import follow.model.service.FollowService;
import member.model.vo.Member;

/**
 * Servlet implementation class Following_ListServlet
 */
@WebServlet("/flwing_list")
public class Following_ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Following_ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FollowService fservice = new FollowService();
		String uNo = request.getParameter("uNo");
		
		ArrayList<Member> result = fservice.followingList(uNo);
		
		
		
		JSONObject sendJSON = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Member member : result) {
			JSONObject job = new JSONObject();
			job.put("u_no",member.getuNo());
			job.put("name", URLEncoder.encode(member.getName(), "UTF-8"));
			job.put("u_profile", member.getProfileImg());

			jarr.add(job);
		}
		
		sendJSON.put("result", jarr);
		
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
