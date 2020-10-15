package com.restaurant.service.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.restaurant.model.Customer;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private com.restaurant.dao.customer.CustomerDao customerDao;
	
	@Override
	public boolean addToDatabase(Customer customerProfile) {
		customerDao.addToDatabase(customerProfile);
		return true;
			
	}
	@Override
	public List<Customer> readAll()
	{
		return customerDao.readAll();
	}
	
}
