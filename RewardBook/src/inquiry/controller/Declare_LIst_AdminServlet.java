package inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.InquiryService;
import inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class Declare_LIst_AdminServlet
 */
@WebServlet("/dc_list_a")
public class Declare_LIst_AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Declare_LIst_AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int limit = 10;
		
		InquiryService iqservice = new InquiryService();

		request.setCharacterEncoding("utf-8");
		
		int movePage = Integer.parseInt(request.getParameter("movePage") == null ? "1" : request.getParameter("movePage"));
		String check1 = request.getParameter("s1check1") == null ? "false" : ((String)request.getParameter("s1check1")).equals("on") ? "true" : (String)request.getParameter("s1check1");
		String check2 = request.getParameter("s1check2") == null ? "false" : ((String)request.getParameter("s1check2")).equals("on") ? "true" : (String)request.getParameter("s1check2");
		String check3 = request.getParameter("s1check3") == null ? "false" : ((String)request.getParameter("s1check3")).equals("on") ? "true" : (String)request.getParameter("s1check3");
		String check4 = request.getParameter("s1check4") == null ? "false" : ((String)request.getParameter("s1check4")).equals("on") ? "true" : (String)request.getParameter("s1check4");
		String select1 = request.getParameter("s2select1") == null ? "" : (String)request.getParameter("s2select1");
		String text1 = request.getParameter("s2text1") == null ? "" : (String)request.getParameter("s2text1");
		ArrayList<Inquiry> list = iqservice.pageSelect_D(movePage, limit, check1, check2, check3, check4, select1, text1);
		int pageCount = iqservice.pageCount_D(check1, check2, check3, check4, select1, text1);
		int maxPage = (int)(Math.ceil((double)pageCount / limit));
		String page = request.getParameter("page") == null ? "" : (String)request.getParameter("page");

		RequestDispatcher view = null;
		
		response.setContentType("text/html; charset=utf-8");
		view = request.getRequestDispatcher("/views/admin/adminDeclareList.jsp");
		request.setAttribute("list", list);
		request.setAttribute("currentPage", movePage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("s1check1", check1);
		request.setAttribute("s1check2", check2);
		request.setAttribute("s1check3", check3);
		request.setAttribute("s1check4", check4);
		request.setAttribute("s2select1", select1);
		request.setAttribute("s2text1", text1);
		request.setAttribute("page", page);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
