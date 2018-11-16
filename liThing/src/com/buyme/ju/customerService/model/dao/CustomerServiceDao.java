package com.buyme.ju.customerService.model.dao;

import java.io.FileReader; 
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
				c.setCno(rset.getInt("cno"));
				
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

	public int updateCustomerService(Connection con, CustomerService c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateCustomerService");
		
		try{ 
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, c.getCtitle());
			pstmt.setString(2, c.getCcontent());
			pstmt.setInt(3, c.getCno());
			
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		
		} catch (SQLException e) {
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public CustomerService selectOne(Connection con, int cno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		CustomerService c = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
		
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				c = new CustomerService();
				
				c.setCno(cno);
				c.setCtitle(rset.getString("ctitle"));
				c.setCcontent(rset.getString("ccontent"));
				c.setUserid(rset.getString("USERNAME"));
				c.setCdate(rset.getDate("cdate"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}

	public int updateCustomerSerivce(Connection con, CustomerService c) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateCustomerService");
		
		try{ 
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, c.getCtitle());
			pstmt.setString(2, c.getCcontent());
			pstmt.setInt(3, c.getCno());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public int insertCustomerServicce(Connection con, CustomerService c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertCustomerService");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, c.getCtitle());
			pstmt.setString(2, "admin");
			pstmt.setString(3, c.getCcontent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}


