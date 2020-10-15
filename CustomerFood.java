package com.restaurant.model;

public class CustomerFood {
	private int foodId;
	private String foodName;
	private double price;
	private int tableNo;
	private int quantity;
	private double total;
	
	
	public int getTableNo() {
		return tableNo;
	}
	public double getTotal() {
		return (price*quantity);
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}
	public int getFoodId() {
		return foodId;
	}
	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "CustomerFood [foodId=" + foodId + ", foodName=" + foodName + ", price=" + price + ", tableNo=" + tableNo
				+ ", quantity=" + quantity + ", total=" + total + "]";
	}
	
	
}
