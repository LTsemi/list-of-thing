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


}
