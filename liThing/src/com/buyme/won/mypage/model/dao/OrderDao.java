package com.buyme.won.mypage.model.dao;

import static com.buyme.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.buyme.won.mypage.model.vo.OrderLT;
import com.buyme.young.member.model.dao.MemberDao;


public class OrderDao {
	
	private Properties prop;
	
	public OrderDao(){
		prop = new Properties();
		
		String filePath = MemberDao.class.getResource("/config/order-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertOrder(Connection con, OrderLT o) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrder");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, o.getUserid());
			pstmt.setInt(2, o.getPrice());
			pstmt.setString(3, o.getUseraddress());
			pstmt.setInt(4, (int)((Math.random()*8) +1));
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public OrderLT selectOne(Connection con, String userid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		OrderLT o = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				
				o = new OrderLT();
				
				o.setOrdernum(rset.getInt("ORDERNUM"));
				o.setUserid(userid);
				o.setOrderdate(rset.getDate("ORDERDATE"));
				o.setPrice(rset.getInt("price"));
				o.setUseraddress(rset.getString("useraddress"));
				o.setTracking_num(rset.getInt("TRACKING_NUM"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return o;
	}

}
