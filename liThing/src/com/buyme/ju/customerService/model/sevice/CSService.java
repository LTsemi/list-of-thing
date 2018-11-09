package com.buyme.ju.customerService.model.sevice;

import java.sql.Connection;
import java.util.ArrayList;
import static com.buyme.common.JDBCTemplate.*;

import com.buyme.ju.customerService.model.dao.CustomerServiceDao;
import com.buyme.ju.customerService.model.vo.CustomerService;

public class CSService {
	
	private CustomerServiceDao cDao = new CustomerServiceDao();

	public ArrayList<CustomerService> selectList() {
		
		Connection con = getConnection();	
		ArrayList<CustomerService> list = new ArrayList<CustomerService>();
		
		list = cDao.selectList(con);
		
		close(con);

		return list;
	}

}
