package com.buyme.seul.event.model.dao;

import static com.buyme.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Properties;

import com.buyme.seul.event.model.vo.Event;

public class EventDao {
	
	private Properties prop = new Properties();
	
	public EventDao(){
		String filePath = EventDao.class
				.getResource("/config/event-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Event> selectList(Connection con) {
		
		Statement stmt = null;
		ArrayList<Event> list = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			stmt= con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Event>();
			
			while(rset.next()){
				Event e = new Event();
				e.setEventallno(rset.getInt("EVENTALLNO"));
				e.setEtype(rset.getInt("ETYPE"));
				e.setEno(rset.getInt("ENO"));
				e.setUserid(rset.getString("USERID"));
				e.setEvtdate(rset.getDate("EVTDATE"));
				e.setEvtdateend(rset.getDate("EVTDATEEND"));
				e.setEvtcontent(rset.getString("EVTCONTENT"));
				e.setEvttitle(rset.getString("EVTTITLE"));
				e.setE_file(rset.getString("E_FILE"));
				e.setDelflag(rset.getString("DELFLAG"));
				e.setE_cname(rset.getString("E_CNAME"));
				e.setDday(rset.getInt("DDAY"));
				
				list.add(e);
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public ArrayList<Event> selectWinList(Connection con) {
		Statement stmt = null;
		ArrayList<Event> list = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWinList");
		
		try {
			
			stmt= con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Event>();
			
			while(rset.next()){
				Event e = new Event();
				e.setEventallno(rset.getInt("EVENTALLNO"));
				e.setEtype(rset.getInt("ETYPE"));
				e.setEno(rset.getInt("ENO"));
				e.setUserid(rset.getString("USERID"));
				e.setEvtdate(rset.getDate("EVTDATE"));
				e.setEvtcontent(rset.getString("EVTCONTENT"));
				e.setEvttitle(rset.getString("EVTTITLE"));
				e.setDelflag(rset.getString("DELFLAG"));
				
				list.add(e);
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	
	public int selectCurrentEno(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int eid = 0;
		
		String sql = prop.getProperty("selectCurrentEid");
		
		try {
			stmt = con.createStatement();
		
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				eid = rset.getInt(1); // "CURRVAL"
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return eid;
	}

	public int insertEvent(Connection con, Event e, ArrayList<Event> list) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertEvent");
		
		try{
			pstmt = con.prepareStatement(sql);
			
			for(int i = 0 ; i < list.size(); i++){
				 System.out.println("userid : " + e.getUserid());
				/*pstmt.setInt(1, list.get(i).getEventallno());				
				pstmt.setInt(2, list.get(i).getEno());	*/			
				pstmt.setString(1,e.getUserid());
				pstmt.setDate(2, (Date) e.getEvtdateend());
				pstmt.setString(3, e.getEvtcontent());
				pstmt.setString(4, e.getEvttitle());
				pstmt.setString(5, list.get(i).getE_file());
				
				int level = 0;
				if(i != 0 ) level = 1;
				
				pstmt.setInt(6, level);
				
				pstmt.setString(7, list.get(i).getE_oname());
				System.out.println("7: " + list.get(i).getE_oname());
				pstmt.setString(8, list.get(i).getE_cname());
				System.out.println("8: " + list.get(i).getE_cname());
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException ex) {
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public int insertEventWinner(Connection con, Event e) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertEventWinner");
		
		try {
				
				pstmt = con.prepareStatement(sql);	
				
				pstmt.setString(1, e.getUserid());
				pstmt.setDate(2, (Date)e.getEvtdateend());
				pstmt.setString(3, e.getEvtcontent());
				pstmt.setString(4, e.getEvttitle());
				pstmt.setString(5, e.getE_file());
				pstmt.setNull(6, Types.NULL);
				pstmt.setNull(7, Types.NULL);
				pstmt.setNull(8, Types.NULL);
				
				result += pstmt.executeUpdate();		
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public Event selectOne(Connection con, int eno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Event> list = null;
		Event e = null;
		
		String sql = prop.getProperty("selectEventOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eno);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				e = new Event();
				
				e.setEno(eno);
				e.setUserid(rset.getString("USERID"));
				e.setEvtdate(rset.getDate("EVTDATE"));
				e.setEvtdateend(rset.getDate("EVTDATEEND"));
				e.setEvtcontent(rset.getString("EVTCONTENT"));
				e.setEvttitle(rset.getString("EVTTITLE"));
				e.setE_cname(rset.getString("E_CNAME"));					
								
			}
			
		} catch (SQLException e1) {

			e1.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return e;
	}


	public Event selectWinOne(Connection con, int eno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Event e = null;
		
		String sql = prop.getProperty("selectWinOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, eno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				e = new Event();
				
				e.setEno(eno);
				e.setUserid(rset.getString("USERID"));
				e.setEvtdate(rset.getDate("EVTDATE"));
				e.setEvtcontent(rset.getString("EVTCONTENT"));
				e.setEvttitle(rset.getString("EVTTITLE"));
				
			}
			System.out.println("event 한 개 : " + e);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return e;
	}

	public int deleteEvent(Connection con, int eno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteEvent");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, eno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}




}
