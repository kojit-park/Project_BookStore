package bmember.model;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class BmemberEmailVerification {
	
	public String gmailSend(String mailAddr) {
		
		String randomNum = ((int)(Math.random()*1000)+1000)+"";
		final String user = "kwanriza03@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
	    final String password = "ProBook03";   // 패스워드
	    System.out.println("머라고 오길래"+mailAddr);
	    // SMTP 서버 정보를 설정한다.
	    Properties prop = new Properties();
	    prop.put("mail.smtp.host", "smtp.gmail.com"); 
	    prop.put("mail.smtp.port", 465); 
	    prop.put("mail.smtp.auth", "true"); 
	    prop.put("mail.smtp.ssl.enable", "true"); 
	    prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	    
	    Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(user, password);
	        }
	    });
	
	    try {
	        MimeMessage message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(user));
	
	        //수신자메일주소
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailAddr)); 
	
	        // Subject
	        message.setSubject("JB"); //메일 제목을 입력
	
	        // Text
	        message.setText("인증번호는-> "+randomNum+" <-입니다");    //메일 내용을 입력
	
	        // send the message
	        Transport.send(message); ////전송
	        System.out.println("message sent successfully...");
	        return randomNum;
	    } catch (AddressException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } catch (MessagingException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    return "0";
	}
}
