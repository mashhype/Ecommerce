package couchPotato;

public class Payment {
	private String cardType;
	private int cardNumber;
	private int expMonth;
	private int expYear;
	private Invoice invoice;
	
	public Payment() {
		
	}
	
	public Payment(String cardType, int cardNumber, int expMonth, int expYear, Invoice invoice) {
		this.cardType = cardType;
		this.cardNumber = cardNumber;
		this.expMonth = expMonth;
		this.expYear = expYear;
		this.invoice = invoice;
	}
	
	public String getCardType() {
		return cardType;
	}
	
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	
	public int getCardNumber() {
		return cardNumber;
	}
	
	public void setCardNumber(int cardNumber) {
		this.cardNumber = cardNumber;
	}
	
	public int getExpMonth() {
		return expMonth;
	}
	
	public void setExpMonth(int expMonth) {
		this.expMonth = expMonth;
	}
	
	public int getExpYear() {
		return expYear;
	}
	
	public void setExpYear(int expYear) {
		this.expYear = expYear;
	}
	
	public Invoice getInvoice() {
		return invoice;
	}
	
	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}
	
	
	
	
	
}
