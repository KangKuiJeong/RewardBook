package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.controller.Member_PersonalAuthServlet.MailAuth;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_FindPwServlet
 */
@WebServlet("/m_findpw")
public class Member_FindPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_FindPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    String mailId = "";
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비밀번호 전송용 컨트롤러
		request.setCharacterEncoding("utf-8");

		Member member = new Member();
		
		mailId = request.getParameter("findPwd");
		member = new MemberService().findId(mailId);
		RequestDispatcher view = null;
		 
		if(member.getId() != null) {
			
			String mail = member.getId();
			String authNum = MailSend(mail);
			System.out.println(authNum);
			String cryptPwd = null;
			
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");
	
				byte[] pwdValues = authNum.getBytes(Charset.forName("UTF-8"));
				md.update(pwdValues);
				cryptPwd = Base64.getEncoder().encodeToString(pwdValues);
	
			} catch (NoSuchAlgorithmException e) {
				
				e.printStackTrace();
			}
			
			MemberService mservice = new MemberService();
			mservice.updateFindPwd(cryptPwd, mailId);
			view = request.getRequestDispatcher("views/member/findPwView.jsp");
			request.setAttribute("message", "해당 메일로 임시비밀번호를 전송하였습니다. 임시비밀번호로 로그인해주세요.");
			view.forward(request, response);
			
		
		}else {	//해당계정이없을 때
			
			view = request.getRequestDispatcher("views/member/findPwView.jsp");
			request.setAttribute("message", "해당계정이 존재하지 않습니다. 아이디찾기를 먼저 진행해주세요.");
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
	
	 public String MailSend(String mail) {
	    	
	    	// 인증번호 생성
	    	String authNum = RandomPwd();
	    	
	        Properties prop = System.getProperties();
	        prop.put("mail.smtp.starttls.enable", "true");
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.port", "587");
	        
	        Authenticator auth = new MailAuth();
	        
	        Session session = Session.getDefaultInstance(prop, auth);
	        
	        MimeMessage msg = new MimeMessage(session);
	    
	        try {
	            
	            msg.setFrom(new InternetAddress("shxorld@gmail.com", "RewardBook"));
	            InternetAddress to = new InternetAddress(mailId);         
	            msg.setRecipient(Message.RecipientType.TO, to);            
	            msg.setSubject("RewardBook 회원님의 임시비밀번호입니다.", "UTF-8");            
	            msg.setText("임시비밀번호는 "+ authNum + " 입니다. 임시비밀번호로 로그인하신 뒤 회원정보수정에서 비밀번호를 변경해주세요.", "UTF-8");            
	            
	            Transport.send(msg);
	            
	        } catch(AddressException ae) {            
	            System.out.println("AddressException : " + ae.getMessage());           
	        } catch(MessagingException me) {            
	            System.out.println("MessagingException : " + me.getMessage());
	        } catch(UnsupportedEncodingException e) {
	            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
	        }
	        
			return authNum;
	                
	    }
	    
	    public class MailAuth extends Authenticator{
	        
	        PasswordAuthentication pa;
	        
	        public MailAuth() {
	            String mail_id = "kudong12777@gmail.com";
	            String mail_pw = "rewardbook12^^";
	            
	            pa = new PasswordAuthentication(mail_id, mail_pw);
	        }
	        
	        public PasswordAuthentication getPasswordAuthentication() {
	            return pa;
	        }
	    }
	    
	    //임시 비밀번호 만들기
	    public String RandomPwd() {
	    	String newPassward = "";
	    	String[] Character = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","X",
	    							"P","Q","R","T","U","Z","S","X","Y","!","@", "#", "$", "%", "^", "&", "*",
	    							"0","1","2","3","4","5","6","7","8","9"};

	    	for(int i = 0; i <= 8; i++) {
	    		
	    		int n = (int)(Math.random() * 41);

		    	newPassward += Character[n];		    	
	    	}
	    	
	    		return newPassward;
	    }

}
