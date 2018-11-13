package com.buyme.won.notice.model.dao;

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

import com.buyme.won.notice.model.vo.Notice;

import static com.buyme.common.JDBCTemplate.*;

public class NoticeDao {

	private Properties prop = new Properties();
	
	public NoticeDao(){
		
		String filePath = NoticeDao.class.getResource("/config/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
		
			e.printStackTrace();
		}
	
	}

	public int getListCount(Connection con) {
		
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
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

	public ArrayList<Notice> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage -1)*limit +1;
			int endRow = startRow +limit -1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			/*System.out.println("endRow : " +endRow);
			System.out.println("startRow : " +startRow);*/
			
			rset = pstmt.executeQuery();

			list = new ArrayList<Notice>();
			
			int i = 0;
			
			while(rset.next()){
				
				Notice n = new Notice();
				
				n.setNno(rset.getInt("NNO"));
				n.setNwriter(rset.getString("USERNAME"));
				n.setNtitle(rset.getString("NTITLE"));
				n.setNcontent(rset.getString("NCONTENT"));
				n.setNcount(rset.getInt("NCOUNT"));
				n.setNdate(rset.getDate("NDATE"));
				
				list.add(n);
				
				/*System.out.println("리스트값 : " +i +"번째" +list.get(i).toString());*/
				i++;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
		
	}

	public int insertNotice(Connection con, Notice n) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, n.getNwriter());
			pstmt.setString(2, n.getNtitle());
			pstmt.setString(3, n.getNcontent());
			pstmt.setDate(4, n.getNdate());
			
			System.out.println("작성자 : " +  n.getNwriter());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNotice(Connection con, Notice n) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, n.getNtitle());
			pstmt.setString(2, n.getNcontent());
			pstmt.setInt(3, n.getNno());
			
			result = pstmt.executeUpdate();
			
			System.out.println("result");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}finally {
			close(pstmt);
		}
		return result;
		

	}


	public Notice updateView(Connection con,int nno) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
		
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, nno);
			 
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				n = new Notice();
				
				n.setNwriter(rset.getString("NWRITER"));
				n.setNtitle(rset.getString("NTITLE"));
				n.setNcontent(rset.getString("NCONTENT"));
				n.setNdate(rset.getDate("NDATE"));
				n.setNno(rset.getInt("NNO"));
				
			}
			
			System.out.println("notice 한 개 : " + n);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
		
	}

	public int deleteNotice(Connection con, int nno) {
	
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public ArrayList<Notice> searchNotice(Connection con, String condition, String keyword) {
		
		ArrayList<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(condition) {
		case "writer" :
			sql = prop.getProperty("searchWriterNotice");
			break;
		case "title" :
			sql = prop.getProperty("searchTitleNotice");
			break;
		case "content" :
			sql = prop.getProperty("searchContentNotice");
			break;
		}
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()){
				
				Notice n = new Notice();
				
				n.setNno(rset.getInt("NNO"));
				n.setNtitle(rset.getString("NTITLE"));
				n.setNcontent(rset.getString("NCONTENT"));
				n.setNdate(rset.getDate("NDATE"));
				n.setNwriter(rset.getString("NAME"));
				
				list.add(n);
				
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		// 확인용 출력문
		for(Notice n : list) System.out.println(n);
		
		return list;
	}

	


	
	
	
}
