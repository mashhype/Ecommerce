package couchPotato;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
	private Map<String, List<String>> shoppingCart = new HashMap<String, List<String>>();
	
	public Cart() {
	
	}
	
	public Cart(Map<String, List<String>> shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
	
	public Map<String, List<String>> getCart() {
		return shoppingCart;
	}

	public void setCart(Map<String, List<String>> shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
	
}
