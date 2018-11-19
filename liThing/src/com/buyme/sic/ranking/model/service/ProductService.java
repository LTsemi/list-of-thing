package com.buyme.sic.ranking.model.service;

import static com.buyme.common.JDBCTemplate.close;
import static com.buyme.common.JDBCTemplate.commit;
import static com.buyme.common.JDBCTemplate.getConnection;
import static com.buyme.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.sic.ranking.model.dao.ProductDao;
import com.buyme.sic.ranking.model.vo.Product;
import com.buyme.sic.review.model.vo.Review;

public class ProductService {
	private ProductDao pDao = new ProductDao();

	public int insertProduct(Product p) {
		Connection con = getConnection();
		
		int result = pDao.insertProduct(con, p);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public ArrayList<Product> selectList() {
		System.out.println("select Service 들어옴");
		ArrayList<Product> list = null;
		
		Connection con = getConnection();
		
		list = pDao.selectList(con);
		
		close(con);
		
		return list;
	}

	public Product selectOneList(String pno) {
		Connection con = getConnection();
		
		int result = 0;
		
		System.out.println(pno);
		Product p = pDao.selectOne(con, pno);
		
		if( p != null ){
			/*result = pDao.updateCount(con, pno);*/
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return p;
	}

	public ArrayList<Product> mselectList() {
		System.out.println("mselect Service 들어옴");
		ArrayList<Product> list = null;
		
		Connection con = getConnection();
		
		list = pDao.mselectList(con);
		
		close(con);
		
		return list;
	}

	public int deleteProduct(String pno) {
		Connection con = getConnection();
		
		int result = pDao.updateReview(con, pno);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		System.out.println("Service : " + result);
		return result;
	}
	
	public ArrayList<String> selectSearchList(String keyword) {
		ArrayList<String> list = null;
		
		Connection con = getConnection();
		
		list = pDao.selectSearchList(con, keyword);
		
		close(con);
		
		return list;
	}

	public Product mselectOneList(String pno) {
		Connection con = getConnection();
		
		int result = 0;
		
		Product p = pDao.selectOne(con, pno);
		
		if( p != null ){
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return p;
	}


}
