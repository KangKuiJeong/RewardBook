package Stats.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Stats.model.service.StatsService;
import member.model.vo.Member;

/**
 * Servlet implementation class Stats_Join_Count
 */
@WebServlet("/sjcount")
public class Stats_Join_Count extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stats_Join_Count() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int count = 0;
		count = new StatsService().joinCount(count);
		
		RequestDispatcher view = null;
			

			response.setContentType("text/html; charset=utf-8");
			view = request.getRequestDispatcher("views/stats/statsMain.jsp");
			request.setAttribute("count", count);
			view.forward(request, response);
			}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
