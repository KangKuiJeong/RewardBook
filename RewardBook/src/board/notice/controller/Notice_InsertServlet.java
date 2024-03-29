package board.notice.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.notice.model.service.NoticeService;
import board.notice.model.vo.Notice;

/**
 * Servlet implementation class Notice_InsertServlet
 */
@WebServlet("/ninsert")
public class Notice_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice_InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "form 의 enctype 속성 누락됨.");
			view.forward(request, response);
		}
		
		//1. 업로드할 파일의 용량 제한 : 10Mbyte 로 제한한다면
		int maxSize = 1024 * 1024 * 10;
		//2. 업로드되는 파일의 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("/resources/noticeimg");

		//request 를 MultipartRequest 로 변환함
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//전송온 값 꺼내서 변수 또는 객체에 저장하기
		Notice notice = new Notice();
		notice.setNt_title(mrequest.getParameter("nt_title"));
		notice.setNt_text(mrequest.getParameter("nt_text"));	
		String nt_oc = mrequest.getParameter("nt_oc");
		String nt_ntevent = mrequest.getParameter("nt_ntevent");
		notice.setA_no(mrequest.getParameter("a_no"));
		
		//업로드된 원래 파일명 추출
		String nt_img = mrequest.getOriginalFileName("nt_img");
		// 실제 서버에 업로드 된 파일시스템 네임

		int result = new NoticeService().insertNotice(notice, nt_img, nt_ntevent);
		
		if(result > 0) {
			response.sendRedirect("/RewardBook/nlist");
		}else {
			//에러페이지
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
