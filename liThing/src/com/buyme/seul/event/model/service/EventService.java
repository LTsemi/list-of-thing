package com.buyme.seul.event.model.service;

import static com.buyme.common.JDBCTemplate.close;
import static com.buyme.common.JDBCTemplate.commit;
import static com.buyme.common.JDBCTemplate.getConnection;
import static com.buyme.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.seul.event.model.dao.EventDao;
import com.buyme.seul.event.model.vo.Event;

public class EventService {
	
	private EventDao eDao = new EventDao();
	
	public ArrayList<Event> selectEventList() {
		Connection con = getConnection();
		
		ArrayList<Event> list = eDao.selectList(con);
		
		close(con);
		
		return list;
	}

	

	public ArrayList<Event> selectEventWinnerList() {
		Connection con = getConnection();
		
		ArrayList<Event> list = eDao.selectWinList(con);
		
		close(con);
		
		return list;
	}

	
	

	public int insertEvent(Event e, ArrayList<Event> list) {
		Connection con = getConnection();
		
		int result = eDao.insertEvent(con, e, list);
		
		if( result > 0 ) {
			commit(con);
			
		} else rollback(con);
		
		close(con);
		
		return result;
	}



	public int insertEventWinner(Event e) {
		int result = 0;
		
		Connection con = getConnection();
		
		result = eDao.insertEventWinner(con, e);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}



	public Event selectEvent(int eno) {
		Connection con = getConnection();
		
		Event e = eDao.selectOne(con, eno);
		
		close(con);
		
		return e;
	}



	public Event selectWinOne(int eno) {
		Connection con = getConnection();
		
		
		Event e = eDao.selectWinOne(con, eno);
		
		
		close(con);
		
		return e;
	}



	public int deleteWinner(int eno) {
		Connection con = getConnection();
		
		int result = 0, result1 = 0;
		
		result1 = eDao.deleteWinner(con, eno);
		
		if( result1 > 0 ) {
			commit(con);
			result = 1;
			
		} else rollback(con);
		
		close(con);
		
		return result;
	}



	public Event updateWinView(int eno) {
		Event e = null;
		Connection con = getConnection();
		
		e = eDao.selectWinOne(con, eno);
		
		return e;
	}



	public int updateWinner(Event e) {
		Connection con = getConnection();
		
		int result = eDao.updateWinner(con, e);
		
		if( result > 0) commit(con);
		else rollback(con);
		
		return result;
	}





}
