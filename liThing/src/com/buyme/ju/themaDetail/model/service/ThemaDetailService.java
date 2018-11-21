package com.buyme.ju.themaDetail.model.service;

import java.sql.Connection;

import java.util.ArrayList;

import com.buyme.ju.themaDetail.model.dao.ThemaDetailDao;
import com.buyme.ju.themaDetail.model.vo.ThemaProduct;
import com.buyme.sic.ranking.model.vo.Product;

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
		
		return tp;
	}

	public int insertThemaProduct(int tno, String pno) {
		
		Connection con = getConnection();
		int result = tdDao.insertThemaProduct(con, tno, pno);
		
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

	public ArrayList<Product> selectProduct() {
		
		Connection con = getConnection();
		
		ArrayList<Product> list = tdDao.selectProduct(con);
		
		close(con);
		
		return list;
	}

}
