package project.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import payment.model.service.RewardService;
import payment.model.vo.Reward;
import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Project_InsertServlet
 */
@WebServlet("/p_insert")
public class Project_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = null;

		Project project = null;
		
		if (ServletFileUpload.isMultipartContent(request)) {
			
			project = new Project();

			int maxSize = 1024 * 1024 * 10;
			
			String filePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/project");
			MultipartRequest mrequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

			String no = mrequest.getParameter("no");
			String title = mrequest.getParameter("title");
			int tprice = Integer.parseInt(((String)mrequest.getParameter("tprice")).replace(",", ""));
			String category = mrequest.getParameter("category");
			Date sdate = Date.valueOf((String)mrequest.getParameter("sdate"));
			Date ddate = Date.valueOf((String)mrequest.getParameter("ddate"));
			String info = mrequest.getParameter("info");

			project.setU_no(no);
			project.setP_title(title);
			project.setP_tprice(tprice);
			project.setP_category(category);
			project.setP_sdate(sdate);
			project.setP_ddate(ddate);
			project.setP_info(info);
			
			Enumeration files = mrequest.getFileNames();
			while(files.hasMoreElements()){
			    String name = (String)files.nextElement();
			    String filename = mrequest.getFilesystemName(name);
			    
			    if (name.equals("story"))
					project.setP_story(filename);
			    else if (name.equals("thumbnail"))
					project.setP_img(filename);

			}
			
			int projectResult = new ProjectService().insertProject(project);
			
			int rewardCount = Integer.parseInt(mrequest.getParameter("rewardcount"));
			String projectno = mrequest.getParameter("projectno");
			int rewardResult = 0;
			
			RewardService rservice = new RewardService();
			
			for (int a = 1; a <= rewardCount; a++) {
				Reward reward = new Reward();
				
				String r_title = mrequest.getParameter("r_title[" + a + "]");
				String r_detail = mrequest.getParameter("r_detail[" + a + "]");
				int r_price = Integer.parseInt(((String)mrequest.getParameter("r_detail[" + a + "]")).replace(",", ""));
				String r_amount = mrequest.getParameter("r_amount[" + a + "]");
				
				if (r_title != null && !r_title.equals("") && r_detail != null && !r_detail.equals("") && r_price > 0) {

					reward.setP_no(projectno);
					reward.setR_name(r_title);
					reward.setR_detail(r_detail);
					reward.setR_amount(r_amount.equals("0") ? "무제한" : r_amount);
					reward.setR_price(r_price);
					
					rewardResult = rservice.insertReward(reward);
					
					if (rewardResult <= 0)
						break;
				}
				
			}
			
			if (projectResult > 0 && rewardResult > 0) {
				view = request.getRequestDispatcher("/views/project/projectOpenSuccess.jsp");
				view.forward(request, response);
			}

		} else {
			// 에러페이지
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
