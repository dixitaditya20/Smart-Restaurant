package com.restaurant.dao.kitchen;
import java.util.List;

import com.restaurant.model.KitchenModel;


public interface KitchenDaoInterface {
	public List<KitchenModel> readAll();
	public boolean changeStatus(String Status,int OrderNo);
}
