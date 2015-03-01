package couchPotato;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get request parameters
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String checkoutLogin = request.getParameter("checkoutLogin");
		String discountMessage = "";
		
		//create the User object
		User user = new User();
		Map<String, List<String>> userCart = new HashMap<String, List<String>>();
		
		user.setEmail(email);
		user.setPassword(password);
		
		String url = "";
		String dataValMessage = "";
		String signupMessage = "";
		String loggedInMessage = "";
		
		
		//create session object
		HttpSession session = request.getSession();
		
		//get the cart from the session
		userCart = (Map) session.getAttribute("userCart");
		
		//if they submit the form without an empty field..
		if (email == null | email == "" | password == null | password == "") {
			
			dataValMessage = "Please complete all of the fields required.";
			session.setAttribute("dataValMessage", dataValMessage);
			url = "/Login.jsp";
			
		}
		
		//we check to see if the email exists or not.  If yes, we see if p/w matches email.
		//if no, we send them the Login.jsp to try again.  This code services both
		//the Checkout.jsp login form as well as the Login.jsp form
		else if (UserDB.emailExists(user.getEmail())) {
			
			if (UserDB.passwordMatch(user.getEmail(), user.getPassword())) {
				
				loggedInMessage = "Logged in as " + user.getEmail();
				session.setAttribute("loggedInMessage", loggedInMessage);
				dataValMessage = "";
				session.setAttribute("dataValMessage", dataValMessage);
				session.setAttribute("discountMessage", discountMessage);
				checkoutLogin = "loggedin";
				session.setAttribute("checkoutLogin", checkoutLogin);
				
				if (userCart == null)
					url = "/MenuOrder.jsp";
				
				else
					url = "/Checkout.jsp";
			}
			else {
				
				dataValMessage = "The email and p/w dont match.  Please try again.";
				session.setAttribute("dataValMessage", dataValMessage);
				url = "/Login.jsp";
			}
		
		} 
		
		//if the email does not exist go here
		else if (!(UserDB.emailExists(user.getEmail()))) {
			
			dataValMessage = "We didnt find the email address.  Please create a new account by clicking the link below.";
			session.setAttribute("dataValMessage", dataValMessage);
			url = "/Login.jsp";
			
		}
		
		session.setAttribute("user", user);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
