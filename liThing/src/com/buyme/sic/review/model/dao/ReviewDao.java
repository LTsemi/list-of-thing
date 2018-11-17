package com.buyme.sic.review.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.buyme.sic.review.model.vo.Review;
import static com.buyme.common.JDBCTemplate.*;


public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		String filePath = ReviewDao.class.getResource("/config/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertReview(Connection con, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertReview");
		System.out.println(r);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, r.getPno());
			pstmt.setString(2, r.getUserid());
			pstmt.setString(3, r.getRcontent());
			pstmt.setInt(4, r.getRrank());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		
		return result;
	}

	public ArrayList<Review> reviewList(Connection con, String pno) {
		System.out.println("DAO들어옴");
		ArrayList<Review> rlist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectReview");
		System.out.println(pno);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pno);
			rset = pstmt.executeQuery();
			
			rlist = new ArrayList<Review>();
			
			while(rset.next()) {
				Review r = new Review();
				
				r.setRno(rset.getInt("R_NO"));
				r.setPno(pno);
				r.setUserid(rset.getString("USERID"));
				r.setRcontent(rset.getString("R_CONTENT"));
				r.setRdate(rset.getDate("R_DATE"));
				r.setRrank(rset.getInt("R_RANK"));
				
				rlist.add(r);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rlist;
	}

	public int updateReview(Connection con, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, r.getRcontent());
			pstmt.setInt(2, r.getRrank());
			pstmt.setInt(3, r.getRno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("DAO : " + result);
		return result;
	}

	public int deleteReview(Connection con, int rno) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Review> MyreviewList(Connection con, String userid) {
		ArrayList<Review> rlist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMyReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			
			rlist = new ArrayList<Review>();
			
			while(rset.next()) {
				Review r = new Review();
				
				r.setRno(rset.getInt("R_NO"));
				r.setPno(rset.getString("P_NO"));
				r.setUserid(userid);
				r.setRcontent(rset.getString("R_CONTENT"));
				r.setRdate(rset.getDate("R_DATE"));
				r.setRrank(rset.getInt("R_RANK"));
				r.setC_name(rset.getString("P_C_NAME"));
				
				rlist.add(r);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rlist;
	}

}
