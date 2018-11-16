package com.buyme.ju.themaDetail.model.service;

import java.sql.Connection;

import java.util.ArrayList;

import com.buyme.ju.themaDetail.model.dao.ThemaDetailDao;
import com.buyme.ju.themaDetail.model.vo.ThemaProduct;
import static com.buyme.common.JDBCTemplate.*;

public class ThemaDetailService {
	
	ThemaDetailDao tdDao = new ThemaDetailDao();

	public ArrayList<ThemaProduct> selectList(int tno) {

		Connection con = getConnection();
		
		ArrayList<ThemaProduct> list = tdDao.selectList(con, tno);
		
		close(con);
		
		return list;
		
	}

	public ThemaProduct updateView(int tno) {

		Connection con = getConnection();
		
		ThemaProduct tp = tdDao.selectOne(con, tno);
		
		System.out.println("tp2 : " + tp);
		
		return tp;
	}

	public int insertThemaProduct(ThemaProduct tp) {
		
		Connection con = getConnection();
		int result = tdDao.insertThemaProduct(con, tp);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteThemaProduct(String pno, int tno) {
		Connection con = getConnection();
		
		int result = tdDao.deleteThemaProduct(con, pno, tno);
		
		close(con);
		
		return result;
	}

}
