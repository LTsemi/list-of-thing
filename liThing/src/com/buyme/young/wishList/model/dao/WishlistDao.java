package com.buyme.young.wishList.model.dao;

import static com.buyme.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.buyme.sic.ranking.model.vo.Product;
import com.buyme.young.wishList.model.vo.Wishlist;


public class WishlistDao {
	
	private Properties prop = new Properties();
	
	public WishlistDao() {
		
		String filePath = WishlistDao.class.getResource("/config/wishlist-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertWish(Connection con, Wishlist w) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertWishlist");
		
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, w.getPno());
			pstmt.setString(2, w.getUserid());

			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		
		return result;

	}

	public ArrayList<Product> selectList(Connection con, String userid) {
		ArrayList<Product> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setPno(rset.getString("P_NO"));
				p.setPname(rset.getString("P_NAME"));
				p.setPprice(rset.getInt("P_PRICE"));
				p.setBrand(rset.getString("BRAND"));
				p.setRank(rset.getDouble("RANK"));
				p.setCname(rset.getString("C_NAME"));
				
				list.add(p);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



}
