package com.buyme.sic.ranking.model.dao;

import static com.buyme.common.JDBCTemplate.close;

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

	public Product selectOne(Connection con, String pno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		System.out.println("selectOneDao들어옴");

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
		
		String sql = prop.getProperty("selectList");
		
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

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public String selectMainOne(Connection con, String pName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String pno = null;

		String sql = prop.getProperty("selectMainOne");
		
		try {
		
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, pName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				pno = rset.getString("P_NO");
			}

			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pno;
	}

	public int updateProduct(Connection con, Product p) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("updateProduct");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			/* P_NAME = ?, P_PRICE = ?, P_INGD = ?, BRAND = ?, P_CAP = ?, COUNT = ?, O_NAME = ?, C_NAME = ? WHERE P_NO = ?*/
			
	
			pstmt.setString(1, p.getPname());
			pstmt.setInt(2, p.getPprice());
			pstmt.setString(3, p.getPindg());
			pstmt.setString(4, p.getBrand());
			pstmt.setString(5, p.getPcap());
			pstmt.setInt(6, p.getCount());
			pstmt.setString(7, p.getOname());
			pstmt.setString(8, p.getCname());
			pstmt.setString(9, p.getPexp());
			
			pstmt.setString(10, p.getPno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("dao :" +result);
		return result;
	}

	public ArrayList<Product> selectList(Connection con, String pnn) {
		System.out.println("DAO들어옴");
		ArrayList<Product> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectProduct");
		System.out.println(pnn);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pnn);
			
			rset = pstmt.executeQuery();
			
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
				p.setRank(rset.getDouble("RANK"));
				p.setCname(rset.getString("C_NAME"));
				
				list.add(p);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Product> sortList(Connection con, String so, String pnn) {
		System.out.println("sortDAO들어옴");
		ArrayList<Product> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		switch (so) {
		case "GradeH":
			sql = prop.getProperty("sortGradeHProduct");
			System.out.println("GradeH");
			break;
		case "GradeR":
			sql = prop.getProperty("sortGradeRProduct");
			System.out.println("GradeR");
			break;
		case "ReviewM":
			sql = prop.getProperty("sortReviewMProduct");
			System.out.println("ReviewM");
			break;
		case "ReviewL":
			sql = prop.getProperty("sortReviewLProduct");
			System.out.println("ReviewL");
			break;
		case "PriceH":
			sql = prop.getProperty("sortPriceHProduct");
			System.out.println("PriceH");
			break;
		case "PriceL":
			sql = prop.getProperty("sortPriceLProduct");
			System.out.println("PriceL");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pnn);
			
			rset = pstmt.executeQuery();
			
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
				p.setRank(rset.getDouble("RANK"));
				p.setCname(rset.getString("C_NAME"));
				
				
				System.out.println("P : " + p);
				list.add(p);
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Product> selectMainList(Connection con, String pname) {
		ArrayList<Product> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectProductMain");

		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pname);
			
			rset = pstmt.executeQuery();
			
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
				p.setRank(rset.getDouble("RANK"));
				p.setCname(rset.getString("C_NAME"));
				
				list.add(p);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}



























