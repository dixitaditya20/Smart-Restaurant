package com.restaurant.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.restaurant.dao.menu.ReadMenuDao;
import com.restaurant.model.Customer;
import com.restaurant.model.CustomerFood;
import com.restaurant.model.Food;
import com.restaurant.service.customer.CustomerService;


@Controller
public class CustomerController {
	
	@Autowired
	private ReadMenuDao ReadMenuService;
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping
	@RequestMapping("/")
	public String login(Model model,HttpServletRequest req, HttpServletResponse res) {
		Customer profile = new Customer();
		model.addAttribute("login",profile );
		return "login";
	}
	
	@RequestMapping ( value = "/redirect",method = RequestMethod.GET )
	public String homePage() {
		return "home";
	}
	
	@RequestMapping( value="/loginaction" )
	public String gotToHomePage(Model model, HttpSession session, @ModelAttribute("login") Customer customerProfile ) {
		model.addAttribute("login", customerProfile);
		
		if(customerProfile.getCustomerEmailId() == null || customerProfile.getName() == null) {
			return "login";
		}
		
		if(customerProfile.getCustomerEmailId().equals(null) || customerProfile.getCustomerEmailId()=="" ||
				customerProfile.getName().equals(null)|| customerProfile.getName()=="") {
			return "login";
		} else {
			if(customerService.addToDatabase(customerProfile)) {
				session.setAttribute("email", customerProfile.getCustomerEmailId());
				return "home";
			}	
			else {
				return "login";
			}
		}
	}
	
	@GetMapping
	@RequestMapping("/menu")
	public ModelAndView menu1(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView ref=new ModelAndView();
		System.out.println(req.getParameter("v"));
		ref.setViewName("menu");
		return ref;
	}
	
	
	
	@GetMapping
	@RequestMapping("/otp")
	public String otpByCustomer(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView ref=new ModelAndView();
		ref.setViewName("otp");
		return "home";
	}
	

	@GetMapping
	@RequestMapping("/home")
	public String welcomeController(Model model) {
		
		
		return "home";
	}
	
	
	@RequestMapping(value="/vegmenu",method=RequestMethod.GET)
	public String vegBody(@RequestParam("v") String veg, Model model ) {	
		Integer CID=Integer.parseInt(veg);
		List<Food> list=ReadMenuService.readVegMenu(CID);
		model.addAttribute("vegmenu", list);
		return "Veg";
	}
	
	
	
	@RequestMapping(value="/nonvegmenu",method=RequestMethod.GET)
	public String nonveg(@RequestParam(value="n") String nonveg,Model model) {
		Integer CID=Integer.parseInt(nonveg);
		List<Food> list=ReadMenuService.readVegMenu(CID);
		model.addAttribute("nonvegmenu", list);
		return "Non-veg";
	}
	
	@GetMapping
	@RequestMapping(value="startermenu",method=RequestMethod.GET)
	public String menu(@RequestParam(value="str") String starter,Model model) {
		Integer CID=Integer.parseInt(starter);
		List<Food> list2=ReadMenuService.readVegMenu(CID);
		model.addAttribute("startermenu", list2);
		return "Starter";
	}
	
		@RequestMapping ( value = "/rest",method = RequestMethod.GET )
		public String restPage() {
			return "rest";
		}
		

		@RequestMapping( method= RequestMethod.GET,value = "/cart/{Fname}")
		public ModelAndView getAttr( @PathVariable(value="Fname" ) String fname ) {
		System.out.println("fname : "+fname);
		ModelAndView ref = new ModelAndView();
		ref.setViewName("Veg");
		return ref;
	}
	
		@RequestMapping(value="vegmenu", method=RequestMethod.POST)
		public String AddToCart(Model model,@ModelAttribute("order") Food food,HttpSession session){
			//System.out.println(food);
			String email=(String)session.getAttribute("email");
			int foodId= food.getFoodId();
			String foodName=food.getFoodName();
			double price=food.getPrice();
			ReadMenuService.AddToCart(foodId, foodName, price,email);
			String v="2";
			vegBody(v,model);
			return "Veg";
			
		}
		
		@RequestMapping(value="nonvegmenu", method=RequestMethod.POST)
		public String AddToCart1(Model model,@ModelAttribute("order") Food food,HttpSession session){
			//System.out.println(food);
			String email=(String)session.getAttribute("email");
			int foodId= food.getFoodId();
			String foodName=food.getFoodName();
			double price=food.getPrice();
			ReadMenuService.AddToCart(foodId, foodName, price,email);
			String n="3";
			nonveg(n,model);
			return "Non-veg";
			
		}
		
		@RequestMapping(value="startermenu", method=RequestMethod.POST)
		public String AddToCart2(Model model,@ModelAttribute("order") Food food,HttpSession session){
			//System.out.println(food);
			String email=(String)session.getAttribute("email");
			int foodId= food.getFoodId();
			String foodName=food.getFoodName();
			double price=food.getPrice();
			ReadMenuService.AddToCart(foodId, foodName, price,email);
			String s="1";
			menu(s,model);
			return "Starter";
			
		}
		
		
		@RequestMapping(value="cart",method= RequestMethod.GET)
		public String showKitchen(Model model,HttpSession session) {
			 	String email=(String) session.getAttribute("email");
				List<CustomerFood> orderList = ReadMenuService.readCart(email);
				model.addAttribute("orderList", orderList);
				return "myCart";
		}

		@RequestMapping(value="cart", method=RequestMethod.POST)
		public String ChangeOrder(Model model,@ModelAttribute("change") CustomerFood food,HttpSession session){
			System.out.println(food);
			int foodId= food.getFoodId();
			String foodName=food.getFoodName();
			double price=food.getPrice();
			int quantity=food.getQuantity();
			ReadMenuService.changeOrder(foodId, foodName, price,quantity);
			showKitchen( model,session);
			return "myCart";
			
		}
		
		@RequestMapping(value="placeorder", method=RequestMethod.GET)
		public String PlaceOrder(Model model,HttpSession session){
			String email=(String) session.getAttribute("email");
			int confirm=1;
			ReadMenuService.placeOrder(confirm,email);
			return "menu";
			
		}
		
		@RequestMapping(value="/bill",method= RequestMethod.GET)
		public String ShowBill(Model model,HttpSession session) {
				String email=(String) session.getAttribute("email");
				List<CustomerFood> billList = ReadMenuService.readAll(email);
				model.addAttribute("billList", billList);
				return "Bill";
		}
		
		@RequestMapping( value="/logout", method={ RequestMethod.POST, RequestMethod.GET } ) 
		public String logout( Model model, HttpSession session ) {
			String email = (String)session.getAttribute("email");
			if( email != null ) {
				session.invalidate();
				model.addAttribute("login", new Customer());
				return"login";
		} else
			model.addAttribute("login", new Customer());
			return"login";
		}
}
