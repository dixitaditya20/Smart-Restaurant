package com.restaurant.service.customer;

import java.util.List;

import com.restaurant.model.Customer;

public interface CustomerService {
	public boolean addToDatabase(Customer login);
	public List<Customer> readAll();
}
