package com.buyme.ju.thema.model.dao;

import static com.buyme.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.buyme.ju.thema.model.vo.Thema;

public class ThemaDao {

	Properties prop = new Properties();
	
	
	public ThemaDao(){
		String filePath = ThemaDao.class
				.getResource("/config/thema-query.properties").getPath();
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}		
		
	}

	public ArrayList<Thema> selectList(Connection con) {
		ArrayList<Thema> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Thema>();	
			
			while(rset.next()){
				
				Thema t = new Thema();
				t.setTtitle(rset.getString("ttitle"));
				t.setTcontent(rset.getString("tcontent"));
				t.setTno(rset.getInt("tno"));
				t.setUserid(rset.getString("userid"));
				t.setTimage(rset.getString("timage"));
				
				list.add(t);	
						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public Thema selectOne(Connection con, int tno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Thema t = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
		
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, tno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				t = new Thema();
				
				t.setTno(tno);
				t.setTtitle(rset.getString("ttitle"));
				t.setTcontent(rset.getString("tcontent"));
				t.setUserid(rset.getString("USERNAME"));
				t.setTimage(rset.getString("timage"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return t;
	}

	public int updateThema(Connection con, Thema t) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateThema");
		
		try {
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, t.getTtitle());
			pstmt.setString(2, t.getTcontent());
			pstmt.setString(3, t.getTimage());
			pstmt.setInt(4, t.getTno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int insertThema(Connection con, Thema t) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertThema");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, t.getTtitle());
			pstmt.setString(2, t.getTcontent());
			pstmt.setString(3, t.getTimage());
			 
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int deleteThema(Connection con, int tno) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String delTProd = prop.getProperty("delTProd"); 
		String delThema = prop.getProperty("delThema");
		
		try {
			
			pstmt = con.prepareStatement(delTProd);
			pstmt.setInt(1, tno);
			
			result = pstmt.executeUpdate();
			System.out.println("themaProduct del : " + result);
			
			if(result > 0) {
				pstmt = con.prepareStatement(delThema);
				
				pstmt.setInt(1, tno);
				
				result = pstmt.executeUpdate();
				System.out.println("thema del : " + result);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
