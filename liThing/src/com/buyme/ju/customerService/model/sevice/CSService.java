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

	public int insertCustomerService(CustomerService c) {
		int result = 0;
		
		Connection con = getConnection();
		
		result = cDao.insertCustomerServicce(con, c);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int updateCustomerService(CustomerService c) {

		Connection con = getConnection();
		
		int result = cDao.updateCustomerService(con, c);
		
		if( result > 0) commit(con);
		else rollback(con);
		
		return result;
	}

	public CustomerService updateView(int cno) {
		CustomerService c = null;
		
		Connection con = getConnection();
		
		c = cDao.selectOne(con, cno);
		
		return c;
	}

	public int updateCustomerSerivce(CustomerService c) {
		Connection con = getConnection();
		
		int result = cDao.updateCustomerSerivce(con, c);
		
		if( result > 0) commit(con);
		else rollback(con);
		
		return result;
	}

	public int deleteCustomerService(int cno) {
		
		Connection con = getConnection();
		
		int result = cDao.deleteCustomerService(con, cno);
		
		close(con);
		
		return result;
	}

}
