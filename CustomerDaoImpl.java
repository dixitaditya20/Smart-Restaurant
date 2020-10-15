package com.restaurant.dao.customer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.restaurant.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public boolean addToDatabase(Customer model) {
		
		String query = "insert into CustomerDetails(CustomerEmailId,Name) values(?,?)";
		int row=jdbcTemplate.update(query,model.getCustomerEmailId(),model.getName());
		System.out.println(model.getCustomerEmailId());
		System.out.println(model.getName());
		
		if(row>0)
			return true;
		else 
			return false;
	}
	@Override
	public List<Customer> readAll() {
		String sql = "SELECT Name, Feedback FROM CustomerDetails where CustomerID=1";
		List<Customer> list = jdbcTemplate.query(sql,new RowMapper<Customer>() {
			
			@Override
			public Customer mapRow(ResultSet rs,int rowNum) throws SQLException{
				 
				Customer feedbackProfile= new Customer();
				feedbackProfile.setName(rs.getString("Name"));
				feedbackProfile.setFeedback(rs.getString("Feedback"));
				
				return feedbackProfile;
			}
		});
		return list;
	}
}
