package com.buyme.young.wishList.model.service;

import static com.buyme.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.sic.ranking.model.vo.Product;
import com.buyme.won.notice.model.vo.Notice;
import com.buyme.young.wishList.model.dao.WishlistDao;
import com.buyme.young.wishList.model.vo.Wishlist;

public class WishlistService {
	private WishlistDao wDao = new WishlistDao();

	public int insertWish(Wishlist w) {

		Connection con = getConnection();
		
		int result = wDao.insertWish(con, w);
		
		if(result > 0) commit(con);
		else  rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Product> selectWish(String userid, int currentPage, int limit) {
		ArrayList<Product> list = null;
		
		Connection con = getConnection();
		
		list = wDao.selectList(con, userid, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int getListCount() {
		
		Connection con = getConnection();
		
		int listCount = wDao.getListCount(con);
		
		close(con);
		
		return listCount;                                                                                                                                                                            

	
	
	
	}

	public int deleteWish(String userid, String pno) {
		Connection con = getConnection();
		
		int result = wDao.deleteWish(con, userid, pno);
		
		close(con);
		
		return result;
	}

	public ArrayList<Product> selectOneWish(String userid) {
		ArrayList<Product> list = null;
		
		Connection con = getConnection();
		
		list = wDao.selectOneList(con, userid);
		
		close(con);
		
		return list;
		
	}
}
