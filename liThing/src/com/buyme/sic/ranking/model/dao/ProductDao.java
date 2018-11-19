package com.buyme.sic.ranking.model.dao;

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
import com.buyme.sic.review.model.vo.Review;

import static com.buyme.common.JDBCTemplate.*;

public class ProductDao {
	private Properties prop = new Properties();
	
	public ProductDao() {
		String filePath = ProductDao.class.getResource("/config/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int insertProduct(Connection con, Product p) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p.getPnn());
			pstmt.setString(2, p.getKno());
			pstmt.setString(3, p.getPname());
			pstmt.setInt(4, p.getPprice());
			pstmt.setString(5, p.getPindg());
			pstmt.setString(6, p.getBrand());
			pstmt.setString(7, p.getPcap());
			pstmt.setInt(8, p.getCount());
			pstmt.setString(9, p.getPimg());
			pstmt.setString(10, p.getOname());
			pstmt.setString(11, p.getCname());
			pstmt.setString(12, p.getPexp());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

/*	P_NO
	P_NAME
	P_PRICE
	BRAND
	RANK
	C_NAME
	*/
	public ArrayList<Product> selectList(Connection con) {
		System.out.println("select DAO 들어옴");
		ArrayList<Product> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
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
			close(stmt);
		}
		
		return list;
	}

	public Product selectOne(Connection con, String pno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;

		String sql = prop.getProperty("selectOneList");
		
		try {
		
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, pno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				p = new Product();
				
				p.setPno(rset.getString("P_NO"));
				p.setPnn(rset.getString("P_NN"));
				p.setKno(rset.getString("K_NO"));
				p.setPname(rset.getString("P_NAME"));
				p.setPprice(rset.getInt("P_PRICE"));
				p.setPindg(rset.getString("P_INGD"));
				p.setBrand(rset.getString("BRAND"));
				p.setPcap(rset.getString("P_CAP"));
				p.setRank(rset.getDouble("RANK"));
				p.setCount(rset.getInt("COUNT"));
				p.setPimg(rset.getString("P_IMG"));
				p.setOname(rset.getString("O_NAME"));
				p.setCname(rset.getString("C_NAME"));
				p.setPexp(rset.getString("P_EXP"));
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	public ArrayList<Product> mselectList(Connection con) {
		System.out.println("mselect DAO 들어옴");
		ArrayList<Product> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProduct");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setPno(rset.getString("P_NO"));
				p.setPnn(rset.getString("P_NN"));
				p.setKno(rset.getString("K_NO"));
				
				p.setPname(rset.getString("P_NAME"));
				p.setPprice(rset.getInt("P_PRICE"));
				p.setPindg(rset.getString("P_INGD"));
				
				p.setBrand(rset.getString("BRAND"));
				p.setPcap(rset.getString("P_CAP"));
				p.setRank(rset.getDouble("RANK"));
				p.setCount(rset.getInt("COUNT"));
				// p.setCname(rset.getString("C_NAME"));
				
				list.add(p);
				
				System.out.println(list);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int updateReview(Connection con, String pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteProduct");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("DAO : " + result);
		return result;
	}

	public ArrayList<String> selectSearchList(Connection con, String keyword) {
		ArrayList<String> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// String sql = prop.getProperty("selectList");
		String sql = "SELECT P_NAME FROM PRODUCT WHERE P_NAME LIKE CONCAT('%', CONCAT(?, '%'))";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<String>();
			
			while(rset.next()) {
				list.add(rset.getString(1));
			}

			System.out.println(list.get(0));
			
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



























