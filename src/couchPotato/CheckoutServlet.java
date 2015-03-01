package couchPotato;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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


@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
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
	
	public CheckoutServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Request Parameters
		String confirmCheckout = request.getParameter("confirmCheckout");
		String promo = request.getParameter("promo");
		String checkout = request.getParameter("checkout");
		
		//create session object
		HttpSession session = request.getSession();
		
		//get session attributes
		userCart = (Map) session.getAttribute("userCart");
		user = (User) session.getAttribute("user");
		
		//if we get here then the user clicked on the checkout button 
		//and there were no items in the cart
		if ((checkout != null) && (userCart.size() == 0)) {
			
			emptyCartMessage = "**Please add items to your shopping cart in order to checkout.**";
			session.setAttribute("emptyCartMessage", emptyCartMessage);
			url = "/ShoppingCart.jsp";
		}
		
		//they have items in the cart and we 
		//send them to the Checkout.jsp page
		else if (checkout != null) {
			//get session objects as usual...
			subTotalFormatted = (String) session.getAttribute("subTotalFormatted");
			userCart = (Map) session.getAttribute("userCart");
			
			subTotal = wb.subTotalCalculation(userCart);
			subTotalFormatted = df.format(subTotal);
			
			tax = wb.taxCalculation(subTotalFormatted);
			taxFormatted = df.format(tax);
			
			grandTotal = wb.grandTotalCalculation(tax, subTotalFormatted);
			grandTotalFormatted = df.format(grandTotal);
			
			session.setAttribute("discountMessage", discountMessage);
			session.setAttribute("subTotalFormatted", subTotalFormatted);
			session.setAttribute("taxFormatted", taxFormatted);
			session.setAttribute("grandTotalFormatted", grandTotalFormatted);
			url = "/Checkout.jsp";
		}
		
		//we are now at Checkout.jsp evaluating the promotion code in Step 2: Order Details
		//they entered a promo code but have not yet hit the confirm button on Checkout.jsp
		else if (promo != null && confirmCheckout == null) {
			
			if (promo.equals("123")) {
				
				//we will want to apply a discount of some type (i.e. 10% off total bill)
				subTotalFormatted = (String) session.getAttribute("subTotalFormatted");
				
				discount = wb.promoCalculation(subTotalFormatted);
				subTotalFormatted = df.format(discount);
				
				tax = wb.taxCalculation(subTotalFormatted);
				taxFormatted = df.format(tax);
				
				grandTotal = wb.grandTotalCalculation(tax, subTotalFormatted);
				grandTotalFormatted = df.format(grandTotal);
				
				discountMessage = "**Your discount has been applied**";
				session.setAttribute("discountMessage", discountMessage);
				session.setAttribute("subTotalFormatted", subTotalFormatted);
				session.setAttribute("taxFormatted", taxFormatted);
				session.setAttribute("grandTotalFormatted", grandTotalFormatted);
				url = "/Checkout.jsp";
				
				//we change the value of promo to keep the user hitting refresh on the browser
				//and applying the discount repeatedly.
				promo = "redeemed";
				
			}
			
			//they entered a invalid code
			else {
				
				discountMessage = "Please enter a valid promo code.";
				session.setAttribute("discountMessage", discountMessage);
				url = "/Checkout.jsp";	
			}
		}
		
		//they have already put in the promo code and they hit the confirm button
		//they 
		else {
			
			discountMessage = "";
			session.setAttribute("discountMessage", discountMessage);
			url = "/Checkout.jsp";
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
