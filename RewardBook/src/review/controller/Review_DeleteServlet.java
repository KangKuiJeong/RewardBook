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
 * Servlet implementation class Review_DeleteServlet
 */
@WebServlet("/rv_delete")
public class Review_DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review_DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String u_no = request.getParameter("u_no");
		String p_no = request.getParameter("p_no");
		
		ReviewService reviewservice = new ReviewService();
		
		int result = reviewservice.reviewDelete(u_no, p_no);
		
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
