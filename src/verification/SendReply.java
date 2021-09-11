
package verification;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import querySet.QuerySet;
import registration.UserRegDao;
public class SendReply{


	
	   public void SendEmail(String reply,String email)  {    
		 boolean state = false;
		 QuerySet qs=new QuerySet();
		final  String username = "punemastermetro@gmail.com";//replace to hostel email
		final String password = "admin@1234";//sender email password
		 Properties props = new Properties();
		 props.put("mail.smtp.auth", "true");
		 props.put("mail.smtp.starttls.enable","true");
		 props.put("mail.smtp.host","smtp.gmail.com");
		 props.put("mail.smtp.port", "587");
		 Session session = Session.getInstance(props,new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			} 
		 });
		 try {
			 Message message = new MimeMessage(session);
			 message.setFrom(new InternetAddress(username));
			 String to=email;
			 if (to != null && to.length() > 0 && to.charAt(to.length() - 1) == ',') {
			        to = to.substring(0, to.length() - 1);
		     }
			 InternetAddress[] add = InternetAddress.parse(to,true);
			 message.setRecipient(Message.RecipientType.TO,new InternetAddress(to));
			 message.setSubject("Reply From Admin,Pune Metro");
			 message.setContent(reply,"text/html");
			 Transport.send(message);
			 System.out.println("done");
			 state = true;
			 }catch (Exception e) {
			
				 
			// TODO: handle exception
			 System.out.println(e);
		}
	 }
}
/*
public class SendEmail{
	public static void main(String[] argc) {
		
	}
}*/
