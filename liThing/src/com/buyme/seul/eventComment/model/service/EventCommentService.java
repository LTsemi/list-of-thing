package com.buyme.seul.eventComment.model.service;

import static com.buyme.common.JDBCTemplate.close;
import static com.buyme.common.JDBCTemplate.commit;
import static com.buyme.common.JDBCTemplate.getConnection;
import static com.buyme.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

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

}