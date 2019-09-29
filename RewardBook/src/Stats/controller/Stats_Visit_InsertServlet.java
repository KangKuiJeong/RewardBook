package Stats.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Stats.model.service.StatsService;

/**
 * Servlet implementation class Visit_InsertServlet
 */
@WebServlet("/s_insert")
public class Stats_Visit_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stats_Visit_InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		StatsService sservice = new StatsService();
		
		Calendar now = Calendar.getInstance();
		
		String date = String.valueOf(now.get(Calendar.YEAR)) + String.format("%02d", now.get(Calendar.MONTH) + 1) + String.format("%02d", now.get(Calendar.DATE)) + String.format("%02d", now.get(Calendar.HOUR_OF_DAY)) + String.format("%02d", now.get(Calendar.MINUTE));
		
		if (sservice.checkVisit(date) > 0) {
			sservice.updateVisit(date);
		} else {
			sservice.insertVisit(date);
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
