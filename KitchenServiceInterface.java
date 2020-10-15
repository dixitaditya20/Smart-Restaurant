package com.restaurant.service.kitchen;

import java.util.List;
import com.restaurant.model.KitchenModel;

public interface KitchenServiceInterface {
	
	public List<KitchenModel> readAll();
	
	public boolean changeStatus(String Status,int OrderNo);
}
