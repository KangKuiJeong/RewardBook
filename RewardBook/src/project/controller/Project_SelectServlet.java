package project.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.model.service.MemoService;
import memo.model.vo.Memo;
import payment.model.service.RewardService;
import payment.model.vo.Reward;
import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Project_SelectServlet
 */
@WebServlet("/p_sel")
public class Project_SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_SelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p_no = request.getParameter("p_no");
		
		ArrayList<Reward> list = new RewardService().listReward(p_no);
		if(list.size() > 0) {
			request.setAttribute("rewardList", list);
		}
		
		Memo memo = new MemoService().selectMemo(p_no);
	
		request.setAttribute("memo", memo);
		
		Project project = new ProjectService().selectProject(p_no);
		RequestDispatcher view = null;
		if(project != null) {
			view = request.getRequestDispatcher("views/project/projectDetail.jsp");
			request.setAttribute("project", project);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("error", "페이지 조회 실패");
			view.forward(request, response);
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
