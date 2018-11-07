package com.buyme.sic.ranking.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.buyme.sic.ranking.model.vo.Product;
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
			pstmt.setString(1, p.getPno());
			pstmt.setString(2, p.getKno());
			pstmt.setString(3, p.getPname());
			pstmt.setInt(4, p.getPprice());
			pstmt.setString(5, p.getPindg());
			pstmt.setString(6, p.getBrand());
			pstmt.setString(7, p.getPcap());
			pstmt.setString(8, p.getPimg());
			pstmt.setString(9, p.getOname());
			pstmt.setString(10, p.getCname());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
