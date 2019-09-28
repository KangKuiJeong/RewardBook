package review.controller;

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

import project.model.vo.Project;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class Review_ListServlet
 */
@WebServlet("/rv_list")
public class Review_ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review_ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReviewService reviewservice = new ReviewService();
		String p_no = request.getParameter("p_no");
		
		ArrayList<Review> list = reviewservice.reviewList(p_no);
   
        JSONObject sendJSON = new JSONObject();
        JSONArray jarr = new JSONArray();
        if(list.size() == 0) {
       	 sendJSON.put("result", "펀딩한 프로젝트가 없습니다.");
       	 
       	 response.setContentType("application/json");
	         PrintWriter out = response.getWriter();
	         out.print(sendJSON.toJSONString());
	         out.flush();
	         out.close();
        }else {
	         
	         for(Review review : list) {
	            JSONObject job = new JSONObject();
	            
	            job.put("rv_no", review.getRv_no());
	            job.put("p_no", review.getP_no());
	            job.put("u_no", review.getU_no());
				job.put("rv_title", URLEncoder.encode(review.getRv_title(), "UTF-8"));
				job.put("rv_text", URLEncoder.encode(review.getRv_text(), "UTF-8"));
				job.put("rv_date", review.getRv_date().toString());
				job.put("rv_grade", review.getRv_grade());
				job.put("rv_img", review.getRv_img());
				job.put("u_name", URLEncoder.encode(review.getU_name(), "UTF-8"));
				job.put("rv_after", review.getRv_after());
				job.put("u_profile", review.getU_profile());

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
