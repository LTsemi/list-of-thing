package com.buyme.ju.themaDetail.model.dao;

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

import com.buyme.ju.themaDetail.model.vo.ThemaProduct;
import com.buyme.sic.ranking.model.vo.Product;

public class ThemaDetailDao {
	
	Properties prop = new Properties();
	
	public ThemaDetailDao() {
		prop = new Properties();
		
		String filePath = ThemaDetailDao.class
				.getResource("/config/themaDetail-query.properties").getPath();
		
		try {
		
			prop.load(new FileReader(filePath));
		
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public ArrayList<ThemaProduct> selectList(Connection con, int tno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ThemaProduct> list = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, tno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ThemaProduct>();		
			
			while(rset.next()){
				ThemaProduct tp = new ThemaProduct();
					
				tp.setPno(rset.getString("p_no"));
				tp.setPnn(rset.getString("p_nn"));
				tp.setProd_no(rset.getString("p_no"));
				tp.setThema_no(rset.getInt("tno"));
				tp.setPname(rset.getString("p_name"));
				tp.setRank(rset.getDouble("rank"));
				tp.setBrand(rset.getString("brand"));
				tp.setCname(rset.getString("c_name"));
				
				list.add(tp);
				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ThemaProduct selectOne(Connection con, int tno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ThemaProduct tp = null;
		
		String sql = prop.getProperty("selectList");	
		
		try {
		
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, tno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				tp = new ThemaProduct();
				
				tp.setThema_no(tno);
				tp.setProd_no(rset.getString("p_no"));
				tp.setPno(rset.getString("p_no"));
				tp.setPnn(rset.getString("p_nn"));
				tp.setBrand(rset.getString("brand"));
				tp.setPname(rset.getString("p_name"));
				tp.setRank(rset.getDouble("rank"));
				tp.setCount(rset.getInt("count"));
				tp.setKno(rset.getString("k_no"));
				tp.setPcap(rset.getString("p_cap"));
				tp.setPimg(rset.getString("p_img"));
				tp.setPindg(rset.getString("p_ingd"));
				tp.setPprice(rset.getInt("p_price"));
				tp.setOname(rset.getString("o_name"));
				tp.setCname(rset.getString("c_name"));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}

		return tp;
	}

	public int insertThemaProduct(Connection con, int tno, String pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("insertThemaProduct");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, tno);
			pstmt.setString(2, pno);
					
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int deleteThemaProduct(Connection con, String pno, int tno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteThemaProduct");
		
		try {
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, tno);
			pstmt.setString(2, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Product> selectProduct(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = new ArrayList<Product>();
		
		String sql = prop.getProperty("selectProduct");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()){
				
				Product p = new Product();
					
				p.setPno(rset.getString("p_no"));
				p.setPnn(rset.getString("p_nn"));
				p.setPname(rset.getString("p_name"));
				p.setRank(rset.getDouble("rank"));
				p.setBrand(rset.getString("brand"));
				p.setCname(rset.getString("c_name"));
				
				list.add(p);
				
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
