package memo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import memo.model.service.MemoService;
import memo.model.vo.Memo;
import project.model.vo.ProjectNews;

/**
 * Servlet implementation class MemoUpdateServlet
 */
@WebServlet("/meupdate")
public class MemoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p_no = request.getParameter("p_no");
		String u_no = request.getParameter("u_no");
		ArrayList<Memo> memo = new MemoService().listmMemo(p_no,u_no);
		// 전송할 json 객체 생성
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		// list 의 객체들을 하나씩 json 배열에 옮겨 저장 처리
		for (Memo m : memo) {
		
			// board 를 json 객체로 값 옮겨 저장
			JSONObject job = new JSONObject();
			
			job.put("p_no", m.getP_no() );
			job.put("m_no", m.getM_no());
			job.put("u_no", m.getU_no());
			// json 에서 한글 깨짐 막으려면,
			// java.net.URLEncoder 의 encode() 로 인코딩함
			job.put("m_text", URLEncoder.encode(m.getM_text(), "UTF-8")); //문자는 인코딩
			job.put("m_date", m.getM_date());
	
			jarr.add(job);

		}

		// 전송용 객체에 배열 저장
		sendJson.put("listm", jarr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
