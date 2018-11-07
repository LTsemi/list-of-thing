package com.buyme.sic.ranking.model.service;

import static com.buyme.common.JDBCTemplate.*;

import java.sql.Connection;

import com.buyme.sic.ranking.model.dao.ProductDao;
import com.buyme.sic.ranking.model.vo.Product;

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

}
