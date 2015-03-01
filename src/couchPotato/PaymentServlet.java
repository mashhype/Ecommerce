package couchPotato;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	//Global Variables
	String url = "";
	String emptyCartMessage = "";
	String discountMessage = "";
	String invalidPromoMessage = "";
	String dataValMessage;
	String paymentValMessage;
	String confirmationMessage;
	String loggedInMessage = "";
	String checkoutTypeMessage = "";
	
	double subTotal = 0;
	double discount = 0;
	double grandTotal = 0;
	double tax = 0;
	
	//Global objects
	WorkerBean wb = new WorkerBean();
	Map<String, List<String>> userCart = new HashMap<String, List<String>>();
	User user = new User();
	
	//format variables
	DecimalFormat df = new DecimalFormat("#####.00");
	String subTotalFormatted;
	String taxFormatted;
	String grandTotalFormatted;
    
    public PaymentServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//create session object
		HttpSession session = request.getSession();
		
		//Request parameters
		String cardType = request.getParameter("cardType");
		String cardNumber = request.getParameter("ccNum");
		String cardExpMonth = request.getParameter("expMonth");
		String cardExpYear = request.getParameter("expYear");
		String cvc = request.getParameter("cvc");
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		
		Calendar currentDate = Calendar.getInstance();
		
		/*List<String> paymentData = new ArrayList<String>();
		paymentData.add(cardType);
		paymentData.add(cardNumber);
		paymentData.add(cardExpMonth);
		paymentData.add(cardExpYear);
		paymentData.add(cvc);
		System.out.println("Payment Info: " + paymentData);*/
		
		//get session objects
		userCart = (Map) session.getAttribute("userCart");
		String checkoutType = (String) session.getAttribute("checkoutType");
		String checkoutLogin = (String) session.getAttribute("checkoutLogin");
		System.out.println("checkoutType: " + checkoutType);
		System.out.println("current month: " + currentDate.get(Calendar.MONTH));
		//Create global objects
		Map<String, List<String>> userCart = new HashMap<String, List<String>>();
		WorkerBean ccDateValidator = new WorkerBean();
		User user = new User();
		
		//go here if the user forgot to fill in at least 1 field	
		if (cardNumber.equalsIgnoreCase("") | cardNumber == null | cvc == null | cvc.equalsIgnoreCase("") 
				| fname == null | fname.equalsIgnoreCase("")| lname == null | lname.equalsIgnoreCase("")) {
			
			paymentValMessage = "Please fill out all of the text boxes.";
			url = "/Checkout.jsp";
			session.setAttribute("paymentValMessage", paymentValMessage);
		}
		
		else if (cvc == null | cvc.equalsIgnoreCase("") | cvc.length() != 3) {
			
			paymentValMessage = "Please enter 3 numeric digits for the CVC code.";
			url = "/Checkout.jsp";
			session.setAttribute("paymentValMessage", paymentValMessage);
		}
		
		//send the data through our validator function to make sure they provide numeric data and not text
		else if (!(ccDateValidator.isNumeric(cardExpYear)) | !(ccDateValidator.isNumeric(cardExpMonth)) 
				| !(ccDateValidator.isNumeric(cardNumber)) | cardNumber.length() != 16) {
			
			paymentValMessage = "Please enter 16 digits (numeric values) only for the card number.";
			url = "/Checkout.jsp";
			session.setAttribute("paymentValMessage", paymentValMessage);
		}
		
		else if(Integer.parseInt(cardExpMonth) < (currentDate.get(Calendar.MONTH) + 1)) {
			
			paymentValMessage = "The month of your credit card must be equal to or greater than the current month.";
			url = "/Checkout.jsp";
			session.setAttribute("paymentValMessage", paymentValMessage);
			
		}
		
		else if ((checkoutType == null) && (checkoutLogin == null)) {
			
			checkoutTypeMessage = "Please select a checkout option or sign in.";
			url = "/Checkout.jsp";
			session.setAttribute("checkoutTypeMessage", checkoutTypeMessage);
			
		}
		
		else if (checkoutType != null) {
			user.setFirstName(fname);
			user.setLastName(lname);
			
			//at this point the transaction is complete so we reset all of our messages that may show up on JSPs
			//this includes the userCart jsp tag as well so that the cart is back to empty in the nav bar
			
			paymentValMessage = "";
			session.setAttribute("paymentValMessage", paymentValMessage);
			
			discountMessage = "";
			session.setAttribute("discountMessage", discountMessage);
			
			loggedInMessage = "";
			session.setAttribute("loggedInMessage", loggedInMessage);
			
			confirmationMessage = "Thank you for your order " + user.getFirstName() +".  We hope to see you soon!";
			session.setAttribute("confirmationMessage", confirmationMessage);
			
			checkoutTypeMessage = "";
			session.setAttribute("checkoutTypeMessage", checkoutTypeMessage);
			
			url = "/Confirmation.jsp";
			
		}
		
		else if (checkoutLogin != null) {
			
			if (checkoutLogin.equalsIgnoreCase("loggedin")) {
			
				user = (User) session.getAttribute("user");
				user.setFirstName(fname);
				user.setLastName(lname);
				
				userCart = (Map) session.getAttribute("userCart");
				System.out.println("email: " + user.getEmail());
								
				StringBuilder builder = new StringBuilder();
				for (String key : userCart.keySet()) {
					builder.append("Item Name: " + key + "\n");
				    builder.append("Item Price : $ " + userCart.get(key).get(1) + "\n");
				    builder.append("Item Portion: " + userCart.get(key).get(2) + "\n");
				    builder.append("Item Qty: " + userCart.get(key).get(3) + "\n");
				    builder.append("Item Subtotal : $ " + userCart.get(key).get(5) + "\n\n");
				}
				
				String to = user.getEmail();
				String from = "mashhype@gmail.com";
				String subject = "Your email confirmation for couchPotato";
				String text = builder.toString();
				String grandTotal = (String) session.getAttribute("grandTotalFormatted");
				String body = 
						"Thank you for your business.\n" + 
						"***********************************************\n" + 
						"Your grand total is $ " + grandTotal + "\n" +
						"***********************************************\n" + text;
						
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
					
				//at this point the transaction is complete so we reset all of our messages that may show up on JSPs
				//this includes the userCart jsp tag as well so that the cart is back to empty in the nav bar
				paymentValMessage = "";
				session.setAttribute("paymentValMessage", paymentValMessage);
				
				discountMessage = "";
				session.setAttribute("discountMessage", discountMessage);
				
				loggedInMessage = "";
				session.setAttribute("loggedInMessage", loggedInMessage);
				
				confirmationMessage = "Thank you for your order " + user.getFirstName() +".  We hope to see you soon!";
				session.setAttribute("confirmationMessage", confirmationMessage);
				
				checkoutTypeMessage = "";
				session.setAttribute("checkoutTypeMessage", checkoutTypeMessage);
				
				url = "/Confirmation.jsp";
			}
			
		}
				
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
		//response.sendRedirect("/couchPotato" + url);
		
		}

	}


