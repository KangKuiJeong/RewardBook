package board.notice.controller;

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

import board.notice.model.service.NoticeService;
import board.notice.model.vo.Notice;

/**
 * Servlet implementation class Notice_UpdateServlet
 */
@WebServlet("/nupdate")
public class Notice_UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice_UpdateServlet() {
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
		int maxSize = 1024 * 1024 * 10;
		//2. 업로드되는 파일의 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("/resources/noticeimg");
		//System.out.println(savePath);
		
		//request 를 MultipartRequest 로 변환함
		MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "UTF-8", 
				new DefaultFileRenamePolicy());
		
		//전송온 값 꺼내서 변수 또는 객체에 저장하기
		Notice notice = new Notice();
		
		notice.setNt_no(mrequest.getParameter("nt_no"));
		notice.setNt_title(mrequest.getParameter("nt_title"));
		notice.setNt_text(mrequest.getParameter("nt_text"));	
		String nt_oc = mrequest.getParameter("nt_oc");
		String nt_ntevent = mrequest.getParameter("nt_ntevent");
		
		//삭제여부값 추출
		String delflag = mrequest.getParameter("delflag");
		
				//원래 이전 첨부파일명 추출
				String originPath = mrequest.getParameter("nt_img");						
				// 업로드된 새로운 파일명 추출
				String nt_img = mrequest.getFilesystemName("nt_img");
				//업로드된 파일의 File 객체 만들기
				File newOriginFile = new File(savePath + "/" +  nt_img );
				
				if(nt_img != null){
					notice.setNt_img(nt_img);
					// 새로운 첨부 파일이 있다면 파일명 바꾸기함
					// 같은 이름의 파일이 있을 경우를 대비하기 위함.
			
					}
				
		int result = new NoticeService().updateNotice(notice, nt_oc, nt_ntevent);
		
		if(result > 0 ) {
			
			response.sendRedirect("/RewardBook/nlist");
		
		}else {
			view = request.getRequestDispatcher("views/common/Error.jsp");
			request.setAttribute("message", "notice수정 등록 실패!");
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
