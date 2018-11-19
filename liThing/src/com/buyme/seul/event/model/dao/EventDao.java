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
				e.setWinner_cnt(rset.getInt("WINNER_CNT"));
				e.setDday(rset.getInt("DDAY"));
				e.setUserCnt(rset.getInt("USERCNT"));
				
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
	
	public ArrayList<Event> selectWinList(Connection con, int currentPage, int limit) {
		ArrayList<Event> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWinList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			// 1, 마지막 행 번호
			// 2, 첫 행 번호
			
			int startRow = (currentPage -1) * limit + 1; // 1 -> 1, 2 -> 11
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
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
				e.setEvtEno(rset.getInt("EVTENO"));
				/*e.setWinner_cnt(rset.getInt("WINNER_CNT"));*/
				list.add(e);
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
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

	public int insertEvent(Connection con, Event e) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertEvent");
		
		try{
			pstmt = con.prepareStatement(sql);
			
			System.out.println("userid : " + e.getUserid());
				
			pstmt.setString(1,e.getUserid());				
			pstmt.setDate(2, (Date) e.getEvtdate());
			pstmt.setDate(3, (Date) e.getEvtdateend());
			pstmt.setString(4, e.getEvttitle());
			pstmt.setString(5, e.getE_file());				
			pstmt.setString(6, e.getE_oname());
			pstmt.setString(7, e.getE_cname());
			pstmt.setString(8, e.getE_dtl_oname());
			pstmt.setString(9, e.getE_dtl_cname());
			pstmt.setInt(10,  e.getWinner_cnt());
				
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException ex) {
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public int insertEventWinner(Connection con, Event e) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertWinEvent");
		
		try {
				
				pstmt = con.prepareStatement(sql);	
				
				pstmt.setString(1, e.getUserid());
				pstmt.setDate(2, (Date)e.getEvtdate());
				pstmt.setString(3, e.getEvtcontent());
				pstmt.setString(4, e.getEvttitle());
				pstmt.setNull(5, Types.NULL);
				pstmt.setNull(6, Types.NULL);
				pstmt.setNull(7, Types.NULL);
				pstmt.setNull(8, Types.NULL);
				pstmt.setNull(9, Types.NULL);
				pstmt.setInt(10,  e.getEvtEno());
				
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
			e.setE_dtl_cname(rset.getString("E_DTL_CNAME"));	
			e.setWinner_cnt(rset.getInt("WINNER_CNT"));
								
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
				e.setWinner_cnt(rset.getInt("WINNER_CNT"));
				e.setEvtEno(rset.getInt("EVTENO"));
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

	public int deleteWinner(Connection con, int eno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteWinner");
		
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

	public int updateWinner(Connection con, Event e) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateWinner");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setDate(1, (Date) e.getEvtdate());
			pstmt.setString(2, e.getEvttitle());
			pstmt.setString(3, e.getEvtcontent());
			pstmt.setInt(4, e.getEno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
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

	public int updateEvent(Connection con, Event e) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateEvent");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, e.getEvttitle());
			pstmt.setDate(2, (Date) e.getEvtdate());
			pstmt.setDate(3, (Date) e.getEvtdateend());
			pstmt.setString(4, e.getE_file());				
			pstmt.setString(5, e.getE_oname());
			pstmt.setString(6, e.getE_cname());
			pstmt.setString(7, e.getE_dtl_oname());
			pstmt.setString(8, e.getE_dtl_cname());
			pstmt.setInt(9, e.getWinner_cnt());
			pstmt.setInt(10, e.getEno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
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
			
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	
}
