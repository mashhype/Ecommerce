package couchPotato;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
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

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Global Variables
		String url = "";
		String dataValMessage = "";
		DecimalFormat df = new DecimalFormat("#####.00");
		double subTotal = 0;
		String subTotalFormatted;
		double itemTotal;
		String totalFormatted;
		
		//create session object
		HttpSession session = request.getSession();
		
		//Global Objects
		Map<String, List<String>> userCart = (Map) session.getAttribute("userCart");
		Order originalOrder = (Order) session.getAttribute("order");
		WorkerBean wb = new WorkerBean();
		
		//get request parameters
		String itemName = request.getParameter("itemName");
		String itemPrice = request.getParameter("itemPrice");
		String portion = request.getParameter("portion");
		String quantity = request.getParameter("quantity");
		String imageUrl = request.getParameter("imageUrl");
		String remove = request.getParameter("remove");
		String chefSpecial = request.getParameter("chefSpecial");
		String startOver = request.getParameter("startOver");
				
		//go here if the user forgot to fill in at least 1 field	
		if (portion == null | quantity == null && remove == null && chefSpecial == null && startOver == null) {
			
			dataValMessage = "It looks like you forgot to select a portion and/or a quantity.";
			session.setAttribute("dataValMessage", dataValMessage);
			url = "/MenuOrder.jsp";
			dataValMessage = "";
		}
		
		//this means they placed an order and came from Confirmation.jsp to place another order
		//so we will clear the cart
		else if (startOver !=null) {
			
			userCart = (Map) session.getAttribute("userCart");
			if (userCart != null) {
				
				userCart.clear();
				subTotalFormatted = (String) session.getAttribute("subTotalFormatted");
				subTotal = 0;
				subTotal = wb.subTotalCalculation(userCart);
				subTotalFormatted = df.format(subTotal);
				session.setAttribute("userCart", userCart);
				session.setAttribute("subTotalFormatted", subTotalFormatted);
				
				url = "/MenuOrder.jsp";
			}
			
			else
				url = "/MenuOrder.jsp";
		}
		
		//if its the first time to MenuOrder.jsp go here
		else if ((userCart == null) && (remove == null)) {
			
			//you create these regardless of which branch you take
			userCart = new HashMap<String, List<String>>();
			Order chefsOrder = new Order();
			originalOrder = new Order();
			
			if (chefSpecial != null) {
				
				chefsOrder.setName(itemName);
				chefsOrder.setPortion(portion);
				chefsOrder.setPrice(Double.parseDouble(itemPrice));
				chefsOrder.setQuantity(Integer.parseInt(quantity));
				chefsOrder.setTotal(Integer.parseInt(quantity));
				chefsOrder.setImage(imageUrl);
				
				//Now we take those values and put them in our ArrayList
				List<String> userChefsOrder = new ArrayList<String>(); 
				userChefsOrder.add(chefsOrder.getName());
				userChefsOrder.add(Double.toString(chefsOrder.getPrice()));
				userChefsOrder.add(chefsOrder.getPortion());
				userChefsOrder.add(Integer.toString(chefsOrder.getQuantity()));
				userChefsOrder.add(chefsOrder.getImage());
				
				//format the total amount
				itemTotal = chefsOrder.getTotal();
				totalFormatted = df.format(itemTotal);
				userChefsOrder.add(totalFormatted);
				
				//place the order into a HashMap with 1 key (the menu item) and 
				//multiple values (the name, price, quantity, portion size, image url)
				userCart.put(itemName, userChefsOrder);
				
				subTotal = wb.subTotalCalculation(userCart);
			    subTotalFormatted = df.format(subTotal);
						
				//set session attributes
			    session.setAttribute("dataValMessage", dataValMessage);
			    session.setAttribute("subTotalFormatted", subTotalFormatted);
				session.setAttribute("userCart", userCart);
				
				url = "/ShoppingCart.jsp";
				
			}
			
			else {
				
				//first order of business is to set all the values in our order object (no pun intended)
				originalOrder.setName(itemName);
				originalOrder.setPortion(portion);
				originalOrder.setPrice(Double.parseDouble(itemPrice));
				originalOrder.setQuantity(Integer.parseInt(quantity));
				originalOrder.setTotal(Integer.parseInt(quantity));
				originalOrder.setImage(imageUrl);
				
				//Now we take those values and put them in our ArrayList
				List<String> userOrder = new ArrayList<String>(); 
				userOrder.add(originalOrder.getName());
				userOrder.add(Double.toString(originalOrder.getPrice()));
				userOrder.add(originalOrder.getPortion());
				userOrder.add(Integer.toString(originalOrder.getQuantity()));
				userOrder.add(originalOrder.getImage());
				
				//format the total amount
				itemTotal = originalOrder.getTotal();
				totalFormatted = df.format(itemTotal);
				userOrder.add(totalFormatted);
				
				//place the order into a HashMap with 1 key (the menu item) and 
				//multiple values (the name, price, quantity, portion size, image url)
				userCart.put(itemName, userOrder);
				
				subTotal = wb.subTotalCalculation(userCart);
			    subTotalFormatted = df.format(subTotal);
						
				//set session attributes
			    session.setAttribute("subTotalFormatted", subTotalFormatted);
				session.setAttribute("userCart", userCart);
				session.setAttribute("dataValMessage", dataValMessage);
				
				url = "/ShoppingCart.jsp";
			}
			
			
		} 
		
		//to delete the menuItem from the cart we go here
		else if (remove != null) {
			
			//get the session attributes and put it in the global HashMap named "userCart"
			userCart = (Map) session.getAttribute("userCart");
			subTotalFormatted = (String) session.getAttribute("subTotalFormatted");
			//remove the key that is equal to the menuItem
			userCart.remove(remove);
			
			//update the subTotal value since we are removing a key
			subTotal = wb.subTotalCalculation(userCart);
			
		    System.out.println("userCart k,v (in remove):" + userCart.values());
		    //format the subTotal to two decimal places
		    subTotalFormatted = df.format(subTotal);
		    
			//set the session attribute
		    session.setAttribute("subTotalFormatted", subTotalFormatted);
			session.setAttribute("userCart", userCart);
			session.setAttribute("dataValMessage", dataValMessage);
			
			url = "/ShoppingCart.jsp";
		}
		
		//its not our first time to MenuOrder.jsp.  If we get here its b/c we are adding to our order
		else {
			
			//since we are adding to our existing order we need to set the order object values again.
			Order orderAdditional = new Order();
			orderAdditional.setName(itemName);
			orderAdditional.setPortion(portion);
			orderAdditional.setPrice(Double.parseDouble(itemPrice));
			orderAdditional.setQuantity(Integer.parseInt(quantity));
			orderAdditional.setTotal(Integer.parseInt(quantity));
			orderAdditional.setImage(imageUrl);
			
			//Now we take those values and put them in a new ArrayList
			List<String> userOrderAdd = new ArrayList<String>(); 
			userOrderAdd.add(orderAdditional.getName());
			userOrderAdd.add(Double.toString(orderAdditional.getPrice()));
			userOrderAdd.add(orderAdditional.getPortion());
			userOrderAdd.add(Integer.toString(orderAdditional.getQuantity()));
			userOrderAdd.add(orderAdditional.getImage());
			
			//format the itemTotal to two decimal places
			itemTotal = orderAdditional.getTotal();
			totalFormatted = df.format(itemTotal);
			userOrderAdd.add(totalFormatted);
			
			//get the cart from session 
			userCart = (Map) session.getAttribute("userCart");
			
			//put the key (itemName) and values (ArrayList named userOrderAdd) back into userCart
			userCart.put(itemName, userOrderAdd);
			
			//this iterator allows us to see the values for each key and it also calculates the 
			//subTotal by accessing the 5th element in the values for each key.
			subTotal = wb.subTotalCalculation(userCart);
			
		    //format the subTotal to two decimal places
		    subTotalFormatted = df.format(subTotal);
		    
			//set session attributes
		    session.setAttribute("subTotalFormatted", subTotalFormatted);
			session.setAttribute("userCart", userCart);
			session.setAttribute("dataValMessage", dataValMessage);
			
			url = "/ShoppingCart.jsp";
			
			System.out.println("userCart k,v :" + userCart.values());
			System.out.println(userCart.get(itemName).get(5));
			
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
