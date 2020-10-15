package com.restaurant.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.restaurant.model.KitchenModel;


@Controller
@RequestMapping("/")
public class KitchenController {
	
	@Autowired
	private com.restaurant.service.kitchen.KitchenService kitchenService;
	
	@RequestMapping(value="/kitchen",method= RequestMethod.GET)
	public String ShowKitchen(Model model) {
			List<KitchenModel> menuList = kitchenService.readAll();
			model.addAttribute("menuList", menuList);
			return "kitchentable";
	}
	
	
	@RequestMapping(value="/kitchen", method=RequestMethod.POST)
	public String changeStatus(Model model,@ModelAttribute("order") KitchenModel kitchenModel)throws ClassNotFoundException, SQLException {
		System.out.println(kitchenModel);
		String Status= kitchenModel.getStatus();
		int OrderNo=kitchenModel.getOrderNo();
		System.out.println(Status+"   "+OrderNo);
		Status=Status+1;
		kitchenService.changeStatus(Status, OrderNo);
		ShowKitchen(model);
		return "kitchentable";
		
		//int status= kitchenService.readAll().get(0).getStatus();
	}
}


