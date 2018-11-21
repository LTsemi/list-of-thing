package com.buyme.won.mypage.model.service;

import com.buyme.sic.ranking.model.vo.Product;
import com.buyme.won.mypage.model.dao.OrderDao;
import com.buyme.won.mypage.model.vo.OrderLT;

import static com.buyme.common.JDBCTemplate.*;

import java.sql.Connection;

public class OrderService {
	
	private OrderDao oDao = new OrderDao();

	public int insertOrder(OrderLT o) {
		Connection con = getConnection();
		
		int result = oDao.insertOrder(con, o);
		
		if(result > 0) commit(con);
		else  rollback(con);
		
		close(con);
		
		return result;
		
	}

	public OrderLT selectOneList(String userid) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		
		OrderLT o = oDao.selectOne(con, userid);
		
		close(con);
		
		return o;
	}

	public int updateDelf(String userid) {
		Connection con = getConnection();
		
		int result = oDao.updateDelf(con, userid);
		
		if(result > 0) commit(con);
		else  rollback(con);
		
		close(con);
		
		return result;
	}

}
