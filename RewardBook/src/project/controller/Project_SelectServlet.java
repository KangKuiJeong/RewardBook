package project.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import memo.model.service.MemoService;
import memo.model.vo.Memo;
import payment.model.service.RewardService;
import payment.model.vo.Reward;
import project.model.service.ProjectService;
import project.model.vo.Project;
import review.model.service.ReviewService;
import review.model.vo.Review;

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
		
		HttpSession session = request.getSession();

		String p_no = request.getParameter("p_no");
		
		if(session.getAttribute("loginMember") != null) {

			String u_no = ((Member)session.getAttribute("loginMember")).getuNo();
			Memo memo = new MemoService().selectMemo(p_no, u_no);
			request.setAttribute("memo", memo);
			
			Review review = new ReviewService().selectReview(p_no, u_no);
				request.setAttribute("review", review);
		}
		
		ArrayList<Reward> list = new RewardService().listReward(p_no);
		if(list.size() > 0) {
			request.setAttribute("rewardList", list);
		}
		
		Project project = new ProjectService().selectProject(p_no);
		
		//조회수 1증가 처리용
		int result = new ProjectService().projectCount(p_no);
		
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