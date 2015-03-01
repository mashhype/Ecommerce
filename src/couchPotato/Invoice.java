package couchPotato;

public class Invoice {
	private double total;
	private double taxRate = .06;
	private double tax;
	private Order order;
	
	public Invoice() {
		
	}
	
	public Invoice(double total, double taxRate, double tax, Order order) {
		this.total = total;
		this.tax = tax;
		this.order = order;
		
	}
	
	public double getTotal() {
		return total;
	}
	
	public void setTotal(double total) {
		this.total = total;
	}
	
	public double getTax() {
		return tax;
	}
	
	public void setTax(double tax) {
		this.tax = tax;
	}
	
	public double calculateTotal(Order order) {
		//calculate the total for the order
		//portion + price * quantity * taxRate = tax
		//tax + portion + price * quantity = total
		return total;
	}
}
