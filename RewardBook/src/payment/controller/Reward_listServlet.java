package payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.model.service.RewardService;
import payment.model.vo.Reward;
import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Reward_listServlet
 */
@WebServlet("/r_list")
public class Reward_listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reward_listServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p_no = request.getParameter("p_no");
		
		Project project = new ProjectService().selectProject(p_no);
		
		if(project !=null) {
			
			ArrayList<Reward> list = new RewardService().listReward(p_no);
			
			RequestDispatcher view = null;
			if(list.size() > 0) {
				view = request.getRequestDispatcher("views/payment/select_reward.jsp");
				request.setAttribute("project", project);
				request.setAttribute("list", list);
				view.forward(request, response);
			}else {
				view = request.getRequestDispatcher("views/p_sel?p_no=" + p_no);
				request.setAttribute("message", "프로젝트 메인 조회 실패!");
				view.forward(request, response);
			}
			
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
