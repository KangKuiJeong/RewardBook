package review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import review.model.service.ReviewService;

/**
 * Servlet implementation class Review_UpdateServlet
 */
@WebServlet("/rv_update")
public class Review_UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review_UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String u_no = request.getParameter("u_no");
		String p_no = request.getParameter("p_no");
		String rv_title = request.getParameter("rv_title");
		String rv_text = request.getParameter("rv_text");
		int rv_grade = Integer.parseInt(request.getParameter("rv_grade"));
		
		ReviewService reviewservice = new ReviewService();
		
		int result = reviewservice.reviewUpdate(u_no, p_no, rv_title, rv_text, rv_grade);
		
			JSONObject sendJSON = new JSONObject();
			sendJSON.put("result", result);
			
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
