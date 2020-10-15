package com.restaurant.service.menu;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.restaurant.dao.menu.ReadMenuDao;
import com.restaurant.model.CustomerFood;
import com.restaurant.model.Food;


@Service
public class ReadMenuImplService implements ReadMenuService {

	@Autowired
	private ReadMenuDao menu;
	
	@Override
	public List<Food> readVegMenu(Integer CID) {
		return menu.readVegMenu(CID);
	}
	
	@Override
	public boolean AddToCart( int foodId,  String foodName,  double price,String email) {
		return menu.AddToCart(foodId, foodName, price,email);
	}

	@Override
	public List<CustomerFood> readCart(String email){
		return menu.readCart(email);
	}
	@Override
	public boolean changeOrder(int foodId,String foodName,double price,int quantity) {
		return menu.changeOrder(foodId,foodName,price,quantity);
	}
	
	@Override
	public boolean placeOrder(int confirm,String email) {
		return menu.placeOrder(confirm,email);
	}
	@Override
	public List<CustomerFood> readAll(String email){
		return menu.readAll( email);
	}
}
