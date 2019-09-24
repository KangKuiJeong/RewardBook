package board.faq.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.faq.model.service.FaqService;
import board.faq.model.vo.Faq;

/**
 * Servlet implementation class FAQ_InsertServlet
 */
@WebServlet("/finsert")
public class FAQ_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQ_InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지사항 새 글 등록 처리용 컨트롤러

				RequestDispatcher view = null;		
				request.setCharacterEncoding("utf-8");
			
				//전송온 값 꺼내서 변수 또는 객체에 저장하기
				Faq faq = new Faq();
			
				faq.setA_no(request.getParameter("a_no"));
				faq.setfaq_title(request.getParameter("faq_title"));
				faq.setFaq_text(request.getParameter("faq_text"));
				String faq_oc = request.getParameter("faq_oc");
	
				int result = new FaqService().insertFAQ(faq,faq_oc);
				
				if(result > 0) {
					response.sendRedirect("/RewardBook/flist");
				}else {
					view = request.getRequestDispatcher("views/common/Error.jsp");
					request.setAttribute("message", "새 faq 등록 실패!");
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
