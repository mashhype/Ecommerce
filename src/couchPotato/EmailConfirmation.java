package couchPotato;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;


public class EmailConfirmation {
	
	public static void sendMail(String to, String from, String subject, String body, 
			boolean isBodyHTML) throws MessagingException
	{
		//1 - get the mail session
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtps");
		props.put("mail.smtps.host", "smtp.gmail.com");
		props.put("mail.smtps.port", 465);
		props.put("mail.smtps.auth", "true");
		props.put("mail.smtps.quitwait", "false");
		Session session = Session.getDefaultInstance(props);
		session.setDebug(true);
		
		//2 - create the message
		Message message = new MimeMessage(session);
		message.setSubject(subject);
		if (isBodyHTML)
			message.setContent(body, "text/html; charset=utf-8");
		else
			message.setText(body);
		
		//3 - address the message
		Address fromAddress = new InternetAddress(from);
		Address toAddress  = new InternetAddress(to);
		message.setFrom(fromAddress);
		message.setRecipient(Message.RecipientType.TO, toAddress);
		
		//4 - send the message
		Transport transport = session.getTransport();
		transport.connect("cs605782", "hopkins2134");
		transport.sendMessage(message, message.getAllRecipients());
		transport.close();
		
	}

}

