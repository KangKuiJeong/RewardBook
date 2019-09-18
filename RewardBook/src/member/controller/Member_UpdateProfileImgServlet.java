package member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.dao.MemberDao;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_UpdateProfileImgServlet
 */
@WebServlet("/m_profileImg")
public class Member_UpdateProfileImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_UpdateProfileImgServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 프로필사진 저장용 컨트롤러
		RequestDispatcher view = null;
		if (!ServletFileUpload.isMultipartContent(request)) {
				
		}

		int maxSize = 1024 * 1024 * 10;

		String savePath = request.getSession().getServletContext().getRealPath("/resources/images/profileImg");

		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
						new DefaultFileRenamePolicy());

		Member member = new Member();

		String userNo = mrequest.getParameter("userNo");
		String FileName = mrequest.getFilesystemName("profileImg");
		MemberService mservice = new MemberService();
		int result = mservice.updateMemberProfile(userNo, FileName);

		if (result > 0) {
			
		
			HttpSession session = request.getSession(false);
			session.setAttribute("loginMember", mservice.selectOne(userNo));
			//메인으로 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			/* response.sendRedirect("index.jsp"); */
			out.println("<script>");
			out.println("alert('변경되었습니다.')");
			out.println("self.close();");	//변경후 창닫기
			out.println();
			out.println("</script>");
			
			
		} else {
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패. 다시 시도해주세요.')");
			out.println("history.back();");
			out.println();
			out.println("</script>");
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
