package com.restaurant.dao.menu;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import org.springframework.jdbc.core.RowMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.restaurant.model.Customer;
import com.restaurant.model.CustomerFood;
import com.restaurant.model.Food;


@Repository
public class ReadMenuImplDao implements ReadMenuDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Food> readVegMenu(Integer CID) {
	
		String sql="SELECT * FROM Food where CategoryId=? ";
		
		List<Food> list=jdbcTemplate.query(sql,new PreparedStatementSetter() {
			@Override
			public void setValues(java.sql.PreparedStatement preparedStatement) throws SQLException {
				 preparedStatement.setInt(1, CID);
			}
        },
		new RowMapper<Food>() {

			@Override
			public Food mapRow(ResultSet rs, int rowNum) throws SQLException {
				Food food = new Food();
				food.setFoodName(rs.getString("Foodname"));
	            food.setPrice(rs.getDouble("Price"));
	            food.setFoodId(rs.getInt("FoodId"));
	            food.setImage(rs.getString("Image"));
	            System.out.println(rs.getString("Foodname"));
	            System.out.println(rs.getDouble("Price"));
	            System.out.println(rs.getInt("FoodId"));
	            System.out.println(rs.getString("Image"));
				return food;
			}
		});  

		return list;
		/*List<Food> list=jdbcTemplate.query(sql, new RowMapper<Food>() {
			@Override
	        public Food mapRow(ResultSet rs, int rowNum) throws SQLException {
				Food food = new Food();
				food.setFoodName(rs.getString("Foodname"));
	            food.setPrice(rs.getDouble("Price"));
	            food.setFoodId(rs.getInt("FoodId"));
	            System.out.println(rs.getString("Foodname"));
	            System.out.println(rs.getDouble("Price"));
	            System.out.println(rs.getInt("FoodId"));
	            return food;
	        }
		});
		return list;*/
	}
	
	public Customer getCustomerDetails(String email){
		
		Customer cust=new Customer();
		String sql="SELECT * FROM CustomerDetails where CustomerEmailId=?";
		
		List<Customer> customer=jdbcTemplate.query(sql,new PreparedStatementSetter() {
			@Override
			public void setValues(java.sql.PreparedStatement preparedStatement) throws SQLException {
				 preparedStatement.setString(1, email);
			}
        },
		new RowMapper<Customer>() {

			@Override
			public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
				cust.setCustomerId(rs.getInt("CustomerID"));
				cust.setTableNo(rs.getInt("TableNo"));
				cust.setName(rs.getString("Name"));
				return cust;
			}
		});  
		return cust;
	}
	
	public boolean AddToCart( int foodId,String foodName,double price,String email) {
		
		Customer cust=getCustomerDetails(email);
		int  tableno=cust.getTableNo();
		int customerId=cust.getCustomerId();
		int quantity=1;
		int status=0;
		int confirm=0;
		String sql="INSERT INTO ordertable(tableNo,foodId,quantity,customerId,Status,Confirm) values (?,?,?,?,?,?)";
		jdbcTemplate.update(sql,tableno,foodId,quantity,customerId,status,confirm);
		return true;
	}

	
	public int getCustomerId(String email)
	{
		String sql = "SELECT CustomerID FROM CustomerDetails where CustomerEmailId=?";
		List<Customer> list = jdbcTemplate.query(sql,new PreparedStatementSetter() {
			@Override
			public void setValues(java.sql.PreparedStatement preparedStatement) throws SQLException {
				 preparedStatement.setString(1, email);
				}
			},
				new RowMapper<Customer>() {

				@Override
				public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
					Customer cust = new Customer();
					cust.setCustomerId(rs.getInt("CustomerID"));
					return cust;
				}
			});  
			Customer cust=list.get(0);
			return cust.getCustomerId();
	}
	public List<CustomerFood> readCart(String email)
	{
		int customer = getCustomerId(email);
		String sql = "SELECT FoodId,Quantity FROM ordertable where customerId=?";
		List<CustomerFood> list = jdbcTemplate.query(sql,new PreparedStatementSetter() {
			@Override
			public void setValues(java.sql.PreparedStatement preparedStatement) throws SQLException {
				 preparedStatement.setInt(1, customer);
				}
			},
			new RowMapper<CustomerFood>() {
			@Override
			public CustomerFood mapRow(ResultSet rs,int rowNum) throws SQLException{
				 
				CustomerFood food= new CustomerFood();
				food.setFoodId(rs.getInt("FoodId"));
				food.setQuantity(rs.getInt("Quantity"));
				int foodId=food.getFoodId();
				String sql1 = "SELECT FoodName,Price FROM food where FoodId=?";
				List<CustomerFood> list1 = jdbcTemplate.query(sql1,new PreparedStatementSetter() {
					@Override
					public void setValues(java.sql.PreparedStatement preparedStatement) throws SQLException {
						 preparedStatement.setInt(1, foodId);
						}
					},new RowMapper<CustomerFood>() {
					
					@Override
					public CustomerFood mapRow(ResultSet rs,int rowNum) throws SQLException{
						food.setFoodName(rs.getString("FoodName"));
						food.setPrice(rs.getDouble("Price"));
						return food;
					}
				});
				System.out.println("readorder== "+food);
				return food;
			}
		});
		return list;
	}

	public boolean changeOrder(int foodId,String foodName,double price,int quantity) {
		if(quantity<=0)
		{
			String sql="DELETE FROM ordertable WHERE FoodId=?";
			jdbcTemplate.update(sql,foodId);
		}
		else
		{
		//price=price*Double.parseDouble(quantity);
			
		
		String sql="UPDATE ordertable SET Quantity=? where FoodId=?";
		jdbcTemplate.update(sql, quantity,foodId);
		}
		return true;
	}
	
	public boolean placeOrder(int confirm, String email) {
	
		int custId = getCustomerId(email);	
		String sql="UPDATE ordertable SET Confirm=? where CustomerId=?";
		jdbcTemplate.update(sql,confirm,custId);
		return true;
	}

	@Override
	public List<CustomerFood> readAll(String email) {
		
		return readCart(email);
	}
}
