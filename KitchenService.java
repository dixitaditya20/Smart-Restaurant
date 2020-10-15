package com.restaurant.service.kitchen;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.restaurant.model.KitchenModel;


@Service
public class KitchenService implements KitchenServiceInterface {
	@Autowired
	private com.restaurant.dao.kitchen.KitchenDao kitchenDao;
	
	@Override
	public List<KitchenModel> readAll(){
		return kitchenDao.readAll();
	}
	
	@Override
	public boolean changeStatus(String Status,int OrderNo){
		return kitchenDao.changeStatus(Status, OrderNo);
	}
}
