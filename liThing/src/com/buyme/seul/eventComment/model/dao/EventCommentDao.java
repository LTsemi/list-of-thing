package com.buyme.seul.eventComment.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.buyme.seul.eventComment.model.vo.EventComment;

public class EventCommentDao {

	public ArrayList<EventComment> selectList(Connection con, int eno) {
		ArrayList<EventComment> clist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		return null;
	}

	public int insertComment(Connection con, EventComment eco) {
		// TODO Auto-generated method stub
		return 0;
	}

}
