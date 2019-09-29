package Stats.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import Stats.model.service.StatsService;

/**
 * Servlet implementation class Stats_UserCountServlet
 */
@WebServlet("/s_ucount")
public class Stats_UserCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stats_UserCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Calendar now = Calendar.getInstance();
		
		String date = String.valueOf(now.get(Calendar.YEAR)) + String.format("%02d", now.get(Calendar.MONTH) + 1) + String.format("%02d", now.get(Calendar.DATE));
		
		int result = new StatsService().getUserCount(date);
		
		JSONObject sendJson = new JSONObject();

		sendJson.put("userCount", result);
		
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
