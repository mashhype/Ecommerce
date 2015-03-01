package couchPotato;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContactServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Get the request parameters
		String name = request.getParameter("nameContact");
		String email = request.getParameter("emailContact");
		String message = request.getParameter("messageContact");
		
		//Create the session object
		HttpSession session = request.getSession();
		
		//Global Variables
		String url = "";
		String contactValMessage; 
		
		//go here if the user forgot to fill in at least 1 field	
		if (name == null | email == null && message == null | name == "" | email == "" | message == "") {
			
			contactValMessage = "It looks like you forgot to fill in a field.";
			session.setAttribute("contactValMessage", contactValMessage);
			url = "/Contact.jsp";
			
		}
		
		else {
			
			String to = email;
			String from = "mashhype@gmail.com";
			String subject = "Your Message to couchPotato";
			String body = "Dear " + name + ",\n\n" + "We have received your email.  Taking care of our customers needs is of the utmost " +
			"importance to us.  We usually respond to emails within 12 hours.  Free free to call us if your issue requires more " +
			"urgency.  Thank you and have a wonderful day.\n\n" + "The couchPotato Team";
			
			boolean isBodyHTML = false;
			
			try {
				EmailConfirmation.sendMail(to, from, subject, body, isBodyHTML);
			}
			catch (MessagingException e) {
				String errorMessage = 
						"ERROR: Unable to send email. " +
								"Check Tomcat logs for details.<br>" +
						"NOTE:  You may need to configure your system " +
								"as described in chapter 15.<br>" +
						"ERROR MESSAGE: " + e.getMessage();
				request.setAttribute("errorMessage", errorMessage);
				this.log("Unable to send email. \n" + 
						 "Here is the email you tried to send: \n" +
						"======================================\n" +
						"TO: " + to + "\n" + 
						"FROM: " + from + "\n" + 
						"SUBJECT: " + subject + "\n" +
						"\n" +
						body + "\n\n" );
			}
			
			contactValMessage = (String) session.getAttribute("contactValMessage");
			contactValMessage = "Message successfully sent.";
			session.setAttribute("contactValMessage", contactValMessage);
			url = "/Contact.jsp";
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
