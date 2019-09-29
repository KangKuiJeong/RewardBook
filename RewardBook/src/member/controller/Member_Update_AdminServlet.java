package member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_Update_AdminServlet
 */
@WebServlet("/m_update_a")
public class Member_Update_AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_Update_AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberService mservice = new MemberService();

		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;
			
			String filePath = request.getSession().getServletContext().getRealPath("/resources/images/profileImg");
			MultipartRequest mrequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

			String page = mrequest.getParameter("page") == null ? "" : (String)mrequest.getParameter("page");
			String no = (((String)mrequest.getParameter("no")).equals("") || ((String)mrequest.getParameter("no")).equals("-") ? "" : (String)mrequest.getParameter("no"));
			String bno = (((String)mrequest.getParameter("bno")).equals("") || ((String)mrequest.getParameter("bno")).equals("-") ? "" : (String)mrequest.getParameter("bno"));
			String name = (((String)mrequest.getParameter("name")).equals("") || ((String)mrequest.getParameter("name")).equals("-") ? "" : (String)mrequest.getParameter("name"));
			String id = (((String)mrequest.getParameter("id")).equals("") || ((String)mrequest.getParameter("id")).equals("-") ? "" : (String)mrequest.getParameter("id"));
			String phone = (((String)mrequest.getParameter("phone")).equals("") || ((String)mrequest.getParameter("phone")).equals("-") ? "" : (String)mrequest.getParameter("phone"));
			String post = (((String)mrequest.getParameter("post")).equals("") || ((String)mrequest.getParameter("post")).equals("-") ? "" : (String)mrequest.getParameter("post"));
			String address = (((String)mrequest.getParameter("address")).equals("") || ((String)mrequest.getParameter("address")).equals("-") ? "" : (String)mrequest.getParameter("address"));
			String bank = (((String)mrequest.getParameter("bank")).equals("") || ((String)mrequest.getParameter("bank")).equals("-") ? "" : (String)mrequest.getParameter("bank"));
			String bankAccount = (((String)mrequest.getParameter("bankAccount")).equals("") || ((String)mrequest.getParameter("bankAccount")).equals("-") ? "" : (String)mrequest.getParameter("bankAccount"));
			int mileage = Integer.parseInt(mrequest.getParameter("mileage"));
			String homepage = (((String)mrequest.getParameter("homepage")).equals("") || ((String)mrequest.getParameter("homepage")).equals("-") ? "" : (String)mrequest.getParameter("homepage"));
			String category = (((String)mrequest.getParameter("category")).equals("") || ((String)mrequest.getParameter("category")).equals("-") ? "" : (String)mrequest.getParameter("category"));
			String intro = (((String)mrequest.getParameter("intro")).equals("") || ((String)mrequest.getParameter("intro")).equals("-") ? "" : (String)mrequest.getParameter("intro"));

			String fileChangeName = mrequest.getFilesystemName("profile");
			
			Member member = new Member();
			member.setuNo(no);
			member.setuBno(bno);
			member.setName(name);
			member.setId(id);
			member.setPhone(phone);
			member.setPost(post);
			member.setAddress(address);
			member.setBank(bank);
			member.setBankAccount(bankAccount);
			member.setMileage(mileage);
			member.setHomepage(homepage);
			member.setCategory(category);
			member.setIntro(intro);

			String fileChange = (String)mrequest.getParameter("fileChange");
			if (fileChange.equals("")) {
				File deleteFile = new File(filePath + "\\" + fileChange);
				deleteFile.delete();
			} else if (fileChangeName != null) {
				member.setProfileImg(fileChangeName);
			}
			
			int result = mservice.updateMember_A(member);

			RequestDispatcher view = null;
			
			if (result > 0) {
				view = request.getRequestDispatcher("/views/admin/adminMemberDetail.jsp");
				request.setAttribute("member", mservice.selectOne(no));
				request.setAttribute("page", "member");
				request.setAttribute("alert", "회원 정보가 정상적으로 수정되었습니다.");
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
