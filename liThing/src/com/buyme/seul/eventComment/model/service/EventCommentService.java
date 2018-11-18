package com.buyme.seul.eventComment.model.service;

import static com.buyme.common.JDBCTemplate.close;
import static com.buyme.common.JDBCTemplate.commit;
import static com.buyme.common.JDBCTemplate.getConnection;
import static com.buyme.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.seul.event.model.vo.Event;
import com.buyme.seul.eventComment.model.dao.EventCommentDao;
import com.buyme.seul.eventComment.model.vo.EventComment;

public class EventCommentService {
	
	private EventCommentDao ecDao = new EventCommentDao();
	
	public ArrayList<EventComment> selectList(int eno){

		Connection con = getConnection();
		
		ArrayList<EventComment> clist = ecDao.selectList(con, eno);
		
		close(con);
		
		return clist;
		
	}

	public int insertComment(EventComment eco) {
		Connection con = getConnection();
		
		int result = ecDao.insertComment(con, eco);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteComment(int cno) {
		Connection con = getConnection();
		
		int result = ecDao.deleteComment(con, cno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int updateComment(EventComment eco) {
		Connection con = getConnection();
		
		int result = ecDao.updateComment(con, eco);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<EventComment> allSelectList() {
		Connection con = getConnection();
		
		ArrayList<EventComment> clist = ecDao.allSelectList(con);
		
		close(con);
		
		return clist;
	}

	public ArrayList<EventComment> userSelectList(int eno, int winner_cut) {
		Connection con = getConnection();
		
		ArrayList<EventComment> clist = ecDao.userSelectList(con, eno, winner_cut);
		
		close(con);
		
		return clist;
	}

	public ArrayList<EventComment> winnerSelectList(int eno, int winner_cut) {
		Connection con = getConnection();
		
		ArrayList<EventComment> clist = ecDao.winnerSelectList(con, eno, winner_cut);
		
		close(con);
		
		return clist;
	}



}
