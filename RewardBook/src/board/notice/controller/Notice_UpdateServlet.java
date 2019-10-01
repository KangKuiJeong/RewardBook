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
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      RequestDispatcher view = null;
      if (!ServletFileUpload.isMultipartContent(request)) {
         view = request.getRequestDispatcher("views/common/Error.jsp");
         request.setAttribute("message", "form 의 enctype 속성 누락됨.");
         view.forward(request, response);
      }
      
      int maxSize = 1024 * 1024 * 10;
      // 2. 업로드되는 파일의 저장 폴더 지정하기
      String savePath = request.getSession().getServletContext().getRealPath("/resources/noticeimg");
      MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

      // 전송온 값 꺼내서 변수 또는 객체에 저장하기
      Notice notice = new Notice();

      notice.setNt_no(mrequest.getParameter("nt_no"));
      notice.setNt_title(mrequest.getParameter("nt_title"));
      notice.setNt_text(mrequest.getParameter("nt_text"));
      String nt_ntevent = mrequest.getParameter("nt_ntevent");

      // 삭제여부값 추출
//      String delflag = mrequest.getParameter("delflag");
      // 원래 이전 첨부파일명 추출
      // 업로드된 새로운 파일명 추출
      String nt_img = mrequest.getFilesystemName("nt_img");
      String img = mrequest.getParameter("img");
      String newimg = mrequest.getParameter("newimg");
      // 업로드된 파일의 File 객체 만들기

      if (img != null && !newimg.equals("") ) { //예전 이미지가 들어있지 않을때는
         if (newimg.equals("C:\\fakepath\\" + img)) { // 이미지가 예전이미지랑 같을때
            File deleteFile = new File(savePath + "/" + nt_img);
            deleteFile.delete();
            notice.setNt_img(img);
      
         } else {
            notice.setNt_img(nt_img);
      
         }
      } else {

         notice.setNt_img(img);
    
      }

      int result = new NoticeService().updateNotice(notice, nt_ntevent);

      if (result > 0) {
         response.sendRedirect("/RewardBook/nlist");
      } else {
         //에러페이지
      }
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}