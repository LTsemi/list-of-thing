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

	public ArrayList<Product> selectList(Connection con, String userid, int currentPage, int limit) {
		ArrayList<Product> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage -1)*limit +1;
			int endRow = startRow +limit -1;

			pstmt.setString(1, userid);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);

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
				
				System.out.println("p : " + p);
				
				list.add(p);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println();
		return list;
	}

	public int getListCount(Connection con) {
		
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("WlistCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;
		
	}


	public int deleteWish(Connection con, String userid, String pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("DeleteWish");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pno);
			pstmt.setString(2, userid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}	
		
		return result;
	}

	public ArrayList<Product> selectOneList(Connection con, String userid) {
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
