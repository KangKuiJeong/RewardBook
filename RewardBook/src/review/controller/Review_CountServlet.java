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
 * Servlet implementation class Review_CountServlet
 */
@WebServlet("/review_count")
public class Review_CountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review_CountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uNo = request.getParameter("uNo");
		ReviewService reviewservice = new ReviewService();
		
		int listCount = reviewservice.ReviewCount(uNo);
		/*System.out.println(listCount);*/
		
		JSONObject sendJSON = new JSONObject();
		sendJSON.put("listCount", listCount);
		
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
