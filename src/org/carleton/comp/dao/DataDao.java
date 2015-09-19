package org.carleton.comp.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.carleton.comp.util.DBUtil;
import org.carleton.comp.model.Data;
public class DataDao {
	private Connection connection;
	public DataDao(){
		connection =DBUtil.getConnection();
	}
	public List<Data> getAllData(){
		List<Data> datas=new ArrayList<Data>();
		try{
			Statement statement=connection.createStatement();
			ResultSet rs=statement.executeQuery("select * from cd");
			while(rs.next()){
				Data data=new Data();
				data.setCdid(rs.getString("cdid"));
				data.setTitle(rs.getString("title"));
				data.setPrice(rs.getInt("price"));
				data.setCategory(rs.getString("category"));
				datas.add(data);
			}
		}
		catch(SQLException e){
		e.printStackTrace();	
		}
		System.out.println(datas);
		return datas;
		
	}	 
	}