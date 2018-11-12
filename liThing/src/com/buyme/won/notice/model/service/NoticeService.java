package com.buyme.won.notice.model.service;

import static com.buyme.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.won.notice.model.dao.NoticeDao;
import com.buyme.won.notice.model.vo.Notice;

public class NoticeService {

	private NoticeDao nDao = new NoticeDao();
	
	// 전체 페이지 계산용 메소드
		public int getListCount(){
			
			Connection con = getConnection();
			
			int listCount = nDao.getListCount(con);
			
			close(con);
			
			return listCount;
		}
		
		public ArrayList<Notice> selectList(int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<Notice> list = nDao.selectList(con,currentPage,limit);
			close(con);
			return list;
			
		}

		public int insertNotice(Notice n) {
			int result = 0;
			
			Connection con = getConnection();
			
			result = nDao.insertNotice(con, n);
			
			if(result > 0) commit(con);
			
			else rollback(con);
			
			close(con);
			
			return result;
		}

		public Notice updateView(int nno) {
			Notice n = null;
			
			Connection con = getConnection();
			
			n = nDao.updateView(con, nno);
			
			return n;
		}
		
		public int updateNotice(Notice n) {
			Connection con = getConnection();
			
			int result = nDao.updateNotice(con, n);
			
			if( result > 0) commit(con);
			else rollback(con);
			
			return result;
		}

		public int deleteNotice(int nno) {
		
           int result = 0;
			
			Connection con = getConnection();
			
			result = nDao.deleteNotice(con, nno);
			
			if( result > 0) commit(con);
			else rollback(con);
			
			return result;
			
		}

		
	
	
	
}
