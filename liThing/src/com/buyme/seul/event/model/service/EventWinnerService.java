package com.buyme.seul.event.model.service;

import static com.buyme.common.JDBCTemplate.close;
import static com.buyme.common.JDBCTemplate.commit;
import static com.buyme.common.JDBCTemplate.getConnection;
import static com.buyme.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.seul.event.model.dao.EventWinnerDao;
import com.buyme.seul.event.model.vo.EventWinner;
import com.buyme.seul.eventComment.model.vo.EventComment;

public class EventWinnerService {
	
	private EventWinnerDao ewDao = new EventWinnerDao();




	public int insertWinner(int eno, int winner_cut) {
		Connection con = getConnection();
		int result = ewDao.insertEventWinner(con, eno, winner_cut);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}




	public ArrayList<EventWinner> SelectWinnerList(int eno) {
		Connection con = getConnection();
		
		ArrayList<EventWinner> ewlist = ewDao.SelectWinnerList(con, eno);
		
		close(con);
		
		return ewlist;
	}




	public ArrayList<EventWinner> SelectWinnerOneList(int evtEno) {
Connection con = getConnection();
		
		ArrayList<EventWinner> ewlist = ewDao.SelectWinnerOneList(con, evtEno);
		
		close(con);
		
		return ewlist;
	}
	
	

	
}
