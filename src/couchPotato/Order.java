package couchPotato;

public class Order {
	private int quantity;
	private String portion;
	private double price;
	private String name;
	private double total;
	private String image;
	
	public Order() {
		
	}
	
	public Order(int quantity, String portion, double price, String name, double total, String image) {
		this.quantity = quantity;
		this.portion = portion;
		this.price = price;
		this.name = name;
		this.total = total;
		this.image = image;
	}
		
	public Integer getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getPortion() {
		return portion;
	}
	
	public void setPortion(String portion) {
		this.portion = portion;
	}
		
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		if (portion.equals("large"))
			price = price + 1;
		
		this.price = price;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public double getTotal() {
		return total;
	}
	
	public void setTotal(int quantity) {
		this.total = this.price * quantity;
		
	}
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
}
