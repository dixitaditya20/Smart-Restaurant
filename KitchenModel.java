package com.restaurant.model;

public class KitchenModel {

	private int orderNo;
	private int tableNo ;
	private String food;
	private String quantity;
	private int customerId;
	private String Status;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderno) {
		orderNo = orderno;
	}
	public int getTableNo() {
		return tableNo;
	}
	public void setTableNo(int tableno) {
		tableNo = tableno;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		this.Status = status;
	}
	@Override
	public String toString() {
		return "KitchenModel [orderNo=" + orderNo + ", tableNo=" + tableNo + ", food=" + food + ", quantity=" + quantity
				+ ", customerId=" + customerId + ", status=" + Status + "]";
	}
	
	
	
	

}
