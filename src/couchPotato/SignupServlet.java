package couchPotato;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignupServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get request parameters
		String firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String checkoutType = request.getParameter("checkoutType");
		
		//create the User object
		User user = new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(email);
		user.setPassword(password);
		
		//Create the cart object
		Map<String, List<String>> userCart = new HashMap<String, List<String>>();
		
		String url = "";
		String dataValMessage = "";
		String signupMessage = "";
		String loggedInMessage = "";
		String discountMessage = "";
		
		//create session object
		HttpSession session = request.getSession();
		
		//get the session cart object
		userCart = (Map) session.getAttribute("userCart");
		
		//here we handle the Step 1 section of Checkout.jsp
		if (checkoutType != null) {
			
			if (checkoutType.equalsIgnoreCase("register")) {
				
				session.setAttribute("checkoutType", checkoutType);
				url = "/Signup.jsp";
			}
			
			else if (checkoutType.equalsIgnoreCase("guest")) {
				
				loggedInMessage = "Logged in as: Guest";
				session.setAttribute("loggedInMessage", loggedInMessage);
				session.setAttribute("checkoutType", checkoutType);
				session.setAttribute("discountMessage", discountMessage);
				url = "/Checkout.jsp";
				
			}
		}
		
		//they are at Signup.jsp and forgot to fill in field
		else if (firstName == null | firstName == "" | lastName == null | lastName == "" | 
				email == null | email == "" | password == null | password == "") {
			
			dataValMessage = "Please complete all of the fields required.";
			session.setAttribute("dataValMessage", dataValMessage);
			url = "/Signup.jsp";
			
		}
		//we check to see if the email exists or not...
		else if (UserDB.emailExists(user.getEmail())) {
			
			signupMessage = "This email address already exists.  Please enter another email address.";
			session.setAttribute("signupMessage", signupMessage);
			url = "/Signup.jsp";
		
		} 
		
		//if we got here then all data was validated.  
		//only thing left is to decide whether to take user to checkout.jsp or 
		//MenuOrder.jsp based on if they have items in the cart of not
		else {
			
			UserDB.insert(user);
			loggedInMessage = "Logged in as " + user.getEmail();
			session.setAttribute("loggedInMessage", loggedInMessage);
			signupMessage = "";
			session.setAttribute("signupMessage", signupMessage);
			session.setAttribute("discountMessage", discountMessage);
			
			if (userCart.size() != 0) 
				url = "/Checkout.jsp";
			
			else			
				url = "/MenuOrder.jsp";
			
		} 
		
		session.setAttribute("user", user);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
