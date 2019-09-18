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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class Member_PersonalEnrollServlet
 */
@WebServlet("/m_auth")
public class Member_PersonalAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	String mailId = "";
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setCharacterEncoding("utf-8");

			Member member = new Member();
			
			mailId = request.getParameter("userId");
			member.setId(mailId);
			String mail = member.getId();
			String authNum = MailSend(mail);
	    	//인증번호 암호화
	    	String cryptPwd = null;
	    	
	    	try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");

				byte[] pwdValues = authNum.getBytes(Charset.forName("UTF-8"));
				md.update(pwdValues);
				cryptPwd = Base64.getEncoder().encodeToString(pwdValues);

			} catch (NoSuchAlgorithmException e) {
				
				e.printStackTrace();
			}
			
			System.out.println(mail);
			System.out.println(authNum); 
			
			JSONObject jsonObject = new JSONObject();
			 
			PrintWriter out = null;
			 
			jsonObject.put("authNum",authNum);
			response.setContentType("application/x-json; charset=UTF-8"); //HttpServletResponse response
			out=response.getWriter();
			out.print(jsonObject);
			out.flush();
			
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
    	String authNum = RandomNum();
		
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
            msg.setSubject("RewardBook 이메일 인증 메일입니다", "UTF-8");            
            msg.setText("인증 번호는 "+ authNum + " 입니다. 정확히 입력해주세요", "UTF-8");            
            
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
    
    public String RandomNum() {
    	StringBuffer buffer = new StringBuffer();
    	for(int i = 0; i <= 6; i++) {
    		int n = (int) (Math.random() * 10);
    		buffer.append(n);
    	}
    	return buffer.toString();
    }
    
}
