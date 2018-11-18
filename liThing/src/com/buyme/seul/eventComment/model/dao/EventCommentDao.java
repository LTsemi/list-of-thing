package com.buyme.seul.eventComment.model.dao;

import static com.buyme.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.buyme.seul.event.model.vo.Event;
import com.buyme.seul.eventComment.model.vo.EventComment;

public class EventCommentDao {
	private Properties prop = new Properties();
	
	public EventCommentDao(){
		String filePath = EventCommentDao.class
				.getResource("/config/comment-query.properties").getPath();
		try {
		
			prop.load(new FileReader(filePath));
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
	}
	
	public int insertComment(Connection con, EventComment eco) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertComment");
		System.out.println(eco);
		try {
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, eco.getEno());
			pstmt.setString(2, eco.getCcontent());
			pstmt.setString(3, eco.getCwriter());
			
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}
	
	public ArrayList<EventComment> selectList(Connection con, int eno) {
		ArrayList<EventComment> clist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, eno);
			
			rset = pstmt.executeQuery();
			
			clist = new ArrayList<EventComment>();
			
			while(rset.next()) {
				EventComment comment = new EventComment();
				
				comment.setCno(rset.getInt("CNO"));
				comment.setEno(eno);
				comment.setCcontent(rset.getString("CCONTENT"));
				comment.setCwriter(rset.getString("USERNAME"));
				comment.setCdate(rset.getDate("CDATE"));
				comment.setUserCnt(rset.getInt("USERCNT"));
				
				clist.add(comment);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return clist;
	}

	public int deleteComment(Connection con, int cno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteComment");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int updateComment(Connection con, EventComment eco) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateComment");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, eco.getCcontent());
			pstmt.setInt(2, eco.getCno());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public ArrayList<EventComment> allSelectList(Connection con) {
		ArrayList<EventComment> clist = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("allSelectList");
		
		try {
			
			stmt = con.createStatement();
			
			
			rset = stmt.executeQuery(sql);
			
			clist = new ArrayList<EventComment>();
			
			while(rset.next()) {
				EventComment comment = new EventComment();
				
				comment.setCno(rset.getInt("CNO"));
				comment.setEno(rset.getInt("ENO"));
				comment.setCcontent(rset.getString("CCONTENT"));
				comment.setCwriter(rset.getString("USERNAME"));
				comment.setCdate(rset.getDate("CDATE"));
				
				clist.add(comment);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return clist;
	}

	public ArrayList<EventComment> userSelectList(Connection con, int eno, int winner_cut) {
		ArrayList<EventComment> clist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserList");
		
try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, eno);
			
			rset = pstmt.executeQuery();
			
			clist = new ArrayList<EventComment>();
			
			while(rset.next()){
				EventComment ec = new EventComment();
				
				ec.setEno(rset.getInt("ENO"));
				ec.setCwriter(rset.getString("CWRITER"));
				ec.setUserName(rset.getString("USERNAME"));
				ec.setUserCnt(rset.getInt("USERCNT"));
				clist.add(ec);
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return clist;
	}

	public ArrayList<EventComment> winnerSelectList(Connection con, int eno, int winner_cut) {
		ArrayList<EventComment> clist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("drawWinList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, eno);
			pstmt.setInt(2, winner_cut);
			
			rset = pstmt.executeQuery();
			
			clist = new ArrayList<EventComment>();
			
			while(rset.next()){
				EventComment ec = new EventComment();
				
				ec.setEno(rset.getInt("ENO"));
				ec.setCwriter(rset.getString("CWRITER"));
				ec.setUserName(rset.getString("USERNAME"));
				clist.add(ec);
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return clist;
	}


	
	
}
