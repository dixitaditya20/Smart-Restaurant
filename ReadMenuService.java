package com.restaurant.service.menu;

import java.util.List;

import com.restaurant.model.CustomerFood;
import com.restaurant.model.Food;


public interface ReadMenuService {
	public List<Food> readVegMenu(Integer CID);
	public boolean AddToCart( int foodId,  String foodName,  double price,String email);
	public List<CustomerFood> readCart(String email);
	public boolean changeOrder(int foodId,String foodName,double price,int quantity);
	public boolean placeOrder(int confirm,String email);
	public List<CustomerFood> readAll(String email);
}
