package project.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import project.model.service.ProjectService;
import project.model.vo.Project;

/**
 * Servlet implementation class Project_UpdateServlet
 */
@WebServlet("/p_update")
public class Project_UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ProjectService pservice = new ProjectService();

		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;
			
			String filePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/project");
			MultipartRequest mrequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

			String page = mrequest.getParameter("page") == null ? "" : (String)mrequest.getParameter("page");
			String no = (String)mrequest.getParameter("no");
			String title = URLDecoder.decode((String)mrequest.getParameter("title"), "UTF-8");
			title = title.equals("") || title.equals("-") ? "" : title;
			String category = (((String)mrequest.getParameter("category")).equals("") || ((String)mrequest.getParameter("category")).equals("-") ? "" : (String)mrequest.getParameter("category"));
			int tprice = Integer.parseInt(mrequest.getParameter("tprice"));
			Date edate = Date.valueOf((String)mrequest.getParameter("edate"));
			Date ddate = Date.valueOf((String)mrequest.getParameter("ddate"));
			String info = (((String)mrequest.getParameter("info")).equals("") || ((String)mrequest.getParameter("info")).equals("-") ? "" : (String)mrequest.getParameter("info"));
			String thumnailChangeName = mrequest.getFilesystemName("thumnail");
			String storyChangeName = mrequest.getFilesystemName("story");
			
			Project project = new Project();

			project.setP_no(no);
			project.setP_title(title);
			project.setP_category(category);
			project.setP_tprice(tprice);
			project.setP_edate(edate);
			project.setP_ddate(ddate);
			project.setP_info(info);

			String thumnailChange = (String)mrequest.getParameter("thumnailChange");
			if (thumnailChange.equals("")) {
				File deleteFile = new File(filePath + "\\" + thumnailChange);
				deleteFile.delete();
			} else if (thumnailChangeName != null) {
				project.setP_img(thumnailChangeName);
			}

			String storyChange = (String)mrequest.getParameter("storyChange");
			if (storyChange.equals("")) {
				File deleteFile = new File(filePath + "\\" + storyChange);
				deleteFile.delete();
			} else if (storyChangeName != null) {
				project.setP_story(storyChangeName);
			}
			
			int result = pservice.updateProject(project);

			RequestDispatcher view = null;
			
			if (result > 0) {
				view = request.getRequestDispatcher("/views/admin/adminProjectDetail.jsp");
				request.setAttribute("project", project);
				request.setAttribute("page", page);
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
