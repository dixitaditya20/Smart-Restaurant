package com.restaurant.dao.customer;
import java.util.List;

import com.restaurant.model.Customer;
public interface CustomerDao {
	public boolean addToDatabase(Customer model);
	public List<Customer> readAll();
}
