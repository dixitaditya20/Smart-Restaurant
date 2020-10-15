package com.restaurant.dao.kitchen;
import java.sql.ResultSet;
import java.util.List;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.restaurant.model.Food;
import com.restaurant.model.KitchenModel;
import com.restaurant.model.Status;

@Repository
public class KitchenDao implements KitchenDaoInterface{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<KitchenModel> readAll() {
		String sql = "SELECT Orderno,Tableno,FoodId,Quantity,Status FROM ordertable where Status<4";
		List<KitchenModel> list = jdbcTemplate.query(sql,new RowMapper<KitchenModel>() {
			
			@Override
			public KitchenModel mapRow(ResultSet rs,int rowNum) throws SQLException{
				 
				KitchenModel kitchenProfile= new KitchenModel();
				kitchenProfile.setOrderNo(rs.getInt("Orderno"));
				kitchenProfile.setTableNo(rs.getInt("Tableno"));
				kitchenProfile.setFood(getFoodName(rs.getInt("FoodId")));
				kitchenProfile.setQuantity(rs.getString("Quantity"));
				kitchenProfile.setStatus(getStatusName(rs.getString("Status")));
				return kitchenProfile;
			}
		});
		return list;
	}
	
	public String getFoodName(int foodId)
	{
		String sql = "SELECT Foodname FROM Food where FoodId=?";
		List<Food> list = jdbcTemplate.query(sql,new PreparedStatementSetter() {
			@Override
			public void setValues(java.sql.PreparedStatement preparedStatement) throws SQLException {
				 preparedStatement.setInt(1, foodId);
				}
			},
				new RowMapper<Food>() {

				@Override
				public Food mapRow(ResultSet rs, int rowNum) throws SQLException {
					Food food = new Food();
					food.setFoodName(rs.getString("Foodname"));
					return food;
				}
			});  
			Food food=list.get(0);
			return food.getFoodName();
	}
	@Override
	public boolean changeStatus(String Status,int OrderNo)
	{
		String sql="UPDATE ordertable SET Status=? where Orderno=?";
		jdbcTemplate.update(sql, Status,OrderNo);
		return true;
	}
	
	public String getStatusName(String status)
	{
		String sql = "SELECT StatusName FROM StatusTable where StatusId=?";
		List<Status> list = jdbcTemplate.query(sql,new PreparedStatementSetter() {
			@Override
			public void setValues(java.sql.PreparedStatement preparedStatement) throws SQLException {
				 preparedStatement.setString(1, status);
				}
			},
				new RowMapper<Status>() {

				@Override
				public Status mapRow(ResultSet rs, int rowNum) throws SQLException {
					Status status = new Status();
					status.setStatusName(rs.getString("StatusName"));
					return status;
				}
			});  
		Status status1=list.get(0);
			return status1.getStatusName();
	}
}

