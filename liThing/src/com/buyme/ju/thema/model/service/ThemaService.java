package com.buyme.ju.thema.model.service;

import static com.buyme.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.ju.thema.model.dao.ThemaDao;
import com.buyme.ju.thema.model.vo.Thema;

public class ThemaService {
	
	ThemaDao tDao = new ThemaDao();

	public ArrayList<Thema> selectList() {
		Connection con = getConnection();	
		ArrayList<Thema> list = new ArrayList<Thema>();
		
		list = tDao.selectList(con);
		
		close(con);

		return list;
	}

	public Thema updateView(int tno) {
		Thema t = null;
		
		Connection con = getConnection();
		
		t = tDao.selectOne(con, tno);
		
		return t;
	}

	public Thema selectOne(int tno) {
		Connection con = getConnection();
		
		Thema t = tDao.selectOne(con, tno);
		
		close(con);
		
		return t;
	}

	public int updateThema(Thema t) {
		Connection con = getConnection();
		
		int result = tDao.updateThema(con, t);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int insertThema(Thema t) {
		Connection con = getConnection();
		
		int result = tDao.insertThema(con, t);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteThema(int tno) {

		Connection con = getConnection();
		int result = tDao.deleteThema(con, tno);
		
		close(con);
		
		return result;
	}

}
