package com.buyme.young.wishList.model.service;

import static com.buyme.common.JDBCTemplate.close;
import static com.buyme.common.JDBCTemplate.commit;
import static com.buyme.common.JDBCTemplate.getConnection;
import static com.buyme.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.sic.ranking.model.vo.Product;
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

	public ArrayList<Product> selectWish(String userid) {
		ArrayList<Product> list = null;
		
		Connection con = getConnection();
		
		list = wDao.selectList(con, userid);
		
		close(con);
		
		return list;
	}
	
	
	
}
