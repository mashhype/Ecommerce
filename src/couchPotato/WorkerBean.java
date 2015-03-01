package couchPotato;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class WorkerBean {
	
	double tax;
	double taxRate = .06;
	double subTotal;
	double promo;
	double discount = .90;
	double grandTotal;
	
	List<String> printStuff = new ArrayList<String>();
	
	public WorkerBean() {
		
	}

	public boolean isNumeric(String str) {
		try {
			long i = Long.parseLong(str);
			} 
		catch(NumberFormatException nfe) {
			return false;
		}
		return true;
	}
	
	public double getTax() {
		return tax;
	}
	
	public void setTax(double tax) {
		this.tax = tax;
	}
	
	public double taxCalculation(String sessionSubTotal) {
		
		subTotal = Double.parseDouble(sessionSubTotal);
		tax = taxRate * subTotal;
		return tax;
	}
	
	public double subTotalCalculation(Map<String, List<String>> userCart) {
		subTotal = 0;
		Iterator userCartIterator = userCart.entrySet().iterator();
	    while (userCartIterator.hasNext()) {
	        Map.Entry userCartEntry = (Map.Entry) userCartIterator.next();
	        subTotal = subTotal + Double.parseDouble(userCart.get(userCartEntry.getKey()).get(5));
	    }
	    return subTotal;
	}
	
	public double promoCalculation(String sessionSubTotal) {
		
		subTotal = Double.parseDouble(sessionSubTotal);
		promo = subTotal * discount;
		subTotal = promo;
		return subTotal;
	}
	
	public double grandTotalCalculation(double tax, String sessionSubTotal) {
		subTotal = Double.parseDouble(sessionSubTotal);
		grandTotal = subTotal + tax;
		return grandTotal;
	}
	
	public List<String> printUserOrder(Map<String, List<String>> cart) {
		
		for (String key : cart.keySet()) {
			printStuff.add(key);
		    printStuff.add(cart.get(key).get(1));
		    printStuff.add(cart.get(key).get(2));
		    printStuff.add(cart.get(key).get(3));
		    printStuff.add(cart.get(key).get(5));
		}
		
		return printStuff;
	}
}
