package com.buyme.seul.event.model.dao;

import static com.buyme.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.buyme.seul.event.model.vo.Event;
import com.buyme.seul.event.model.vo.EventWinner;
import com.buyme.seul.eventComment.model.vo.EventComment;

public class EventWinnerDao {
	
	private Properties prop = new Properties();
	
	public EventWinnerDao(){
		String filePath = EventWinnerDao.class
				.getResource("/config/event-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	public int insertEventWinner(Connection con, int eno, int winner_cut) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertEventWinner");
		System.out.println("eno : " + eno);
		
		try{
			pstmt = con.prepareStatement(sql);
							
			pstmt.setInt(1,eno);
			pstmt.setInt(2,eno);
			pstmt.setInt(3, winner_cut);
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<EventWinner> SelectWinnerList(Connection con, int eno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<EventWinner> ewlist = null;
		System.out.println(eno);
		String sql = prop.getProperty("selectWinnerList");
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, eno);
			
			rset = pstmt.executeQuery();
			
			ewlist = new ArrayList<EventWinner>();
			
			while(rset.next()){
				EventWinner ewin = new EventWinner();
				
				ewin.setEno(rset.getInt("ENO"));
				ewin.setCwriter(rset.getString("CWRITER"));
				ewin.setUserName(rset.getString("USERNAME"));
				ewin.setEvtEno(rset.getInt("ENO"));
				
				ewlist.add(ewin);
				
				
				System.out.println("ewin : " + ewin);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return ewlist;
	}


	public ArrayList<EventWinner> SelectWinnerOneList(Connection con, int evtEno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<EventWinner> ewlist = null;
		System.out.println(evtEno);
		String sql = prop.getProperty("selectWinnerList");
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, evtEno);
			
			rset = pstmt.executeQuery();
			
			ewlist = new ArrayList<EventWinner>();
			
			while(rset.next()){
				EventWinner ewin = new EventWinner();
				
				ewin.setEno(rset.getInt("ENO"));
				ewin.setCwriter(rset.getString("CWRITER"));
				ewin.setUserName(rset.getString("USERNAME"));
				ewin.setEvtEno(rset.getInt("ENO"));
				
				ewlist.add(ewin);
				
				
				System.out.println("ewin : " + ewin);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return ewlist;
	}
	
	

}
