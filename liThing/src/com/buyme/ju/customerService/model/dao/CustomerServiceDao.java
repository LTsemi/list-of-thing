package com.buyme.ju.customerService.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.buyme.common.JDBCTemplate.*;
import com.buyme.ju.customerService.model.vo.CustomerService;

public class CustomerServiceDao {
	
	private Properties prop = null;
	
	public CustomerServiceDao(){
		prop = new Properties();
		
		String filePath = CustomerServiceDao.class
				.getResource("/config/customerSerivce-query.properties").getPath();
		
		try {
		
			prop.load(new FileReader(filePath));
		
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public ArrayList<CustomerService> selectList(Connection con) {
		
		ArrayList<CustomerService> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<CustomerService>();	
			
			while(rset.next()){
				
				CustomerService c = new CustomerService();
				c.setCtitle(rset.getString("ctitle"));
				c.setCcontent(rset.getString("ccontent"));
				/*c.setCno(rset.getInt("cno"));
				c.setUserid(rset.getString("name"));
				c.setCdate(rset.getDate("cdate"));*/
				
				list.add(c);
						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

}
