/*package verification;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class SendEmail {

   public void SendEmail(String email,int otp)  {    
      // Recipient's email ID needs to be mentioned.
      String to = "shindeshubham923@gmail.com";

      // Sender's email ID needs to be mentioned
      String from = "punemastermetro@gmail.com";

      // Assuming you are sending email from localhost
      Properties properties=new Properties();
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.starttls.enable", "true");
      properties.put("mail.smtp.host", "smtp.gmail.com");
      properties.put("mail.smtp.port", "true");
      
      
      // Get the default Session object.
      Session session = Session.getDefaultInstance(properties,new javax.mail.Authenticator()
      {
    	  protected PasswordAuthentication getPasswordAuthentication()
    	  {
    		  return new PasswordAuthentication("punemastermetro@gmail.com","admin@1234");
    	  }
    	  
   	  }

    		  );

      try {
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));

         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

         // Set Subject: header field
         message.setSubject("OTP VERIFICATION PUNE METRO!");

         // Now set the actual message
         message.setText("Welcome To Pune Metro. Your OTP is::"+otp);

         // Send message
         Transport.send(message);
         System.out.println("Sent message successfully....");
      } catch (MessagingException mex) {
         mex.printStackTrace();
      }
   }
}
*/

package verification;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;
public class SendEmail {  


	
	   public int SendEmail(String email,int otp)  {    
		   System.out.println(email);
		 boolean state = false;
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
			 message.setSubject("Pune Metro OTP Verification");
			 message.setContent("OTP for Pune Metro Smart Card "+otp,"text/html");
			 Transport.send(message);
			 System.out.println("done");
			 state = true;
			 return 1;
			 }catch (Exception e) {
				
			// TODO: handle exception
			 System.out.println(e);
			 return 0;
		}
	 }
}
/*
public class SendEmail{
	public static void main(String[] argc) {
		
	}
}*/
