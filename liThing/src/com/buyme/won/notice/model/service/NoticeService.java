package com.buyme.won.notice.model.service;



import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.won.notice.model.dao.NoticeDao;


public class NoticeService {

private NoticeDao bDao = new NoticeDao();
	
	// 전체 페이지 계산용 메소드
	public int getListCount(){
		Connection con = getConnection();
		
		int listCount = nDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Notice> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Notice> list = nDao.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	
}