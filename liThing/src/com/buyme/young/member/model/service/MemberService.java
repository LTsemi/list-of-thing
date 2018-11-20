package com.buyme.young.member.model.service;

import static com.buyme.common.JDBCTemplate.close;
import static com.buyme.common.JDBCTemplate.commit;
import static com.buyme.common.JDBCTemplate.getConnection;
import static com.buyme.common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.young.member.exception.MemberException;
import com.buyme.young.member.model.dao.MemberDao;
import com.buyme.young.member.model.vo.Member;


public class MemberService {

	private MemberDao mDao = new MemberDao();
	
	
	public int insertMember(Member m) throws MemberException {
		
		Connection con = getConnection();
		
		int result = mDao.insertMember(con, m);
		
		if(result > 0) commit(con);
		else  rollback(con);
		
		close(con);
		
		return result;
	}


	public Member selectMember(Member m) throws MemberException {
		
		Connection con = getConnection();
		
		Member result = mDao.selectMember(con, m);
		
		close(con);
		
		if(result == null) throw new MemberException("아이디나 비밀번호가 일치하는 회원 없음");
		
		return result;
	}


	public int updateMember(Member m) throws MemberException {
		Connection con = getConnection();
		
		int result = mDao.updateMember(con, m);
		
		if(result > 0) commit(con);
		else  rollback(con);
		
		close(con);
		
		return result;
	}


	public int deleteMember(String userId) {
		Connection con = getConnection();
		
		int result = mDao.deleteMember(con, userId);
		
		if(result > 0) commit(con);
		else  rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int idDupCheck(String id) {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		
		int result = mDao.idDupCheck(con, id);
				
		close(con);
		
		return result;
	}


	public Member idCheck(String name, String email) {
		// TODO Auto-generated method stub
		
		Connection con = getConnection();
		
		Member result = mDao.idCheck(con, name, email);
				
		close(con);
		
		return result;
		
	}


	public ArrayList<Member> selectAllMember() {
		// TODO Auto-generated method stub
		ArrayList<Member> list = null;
		Connection con = getConnection();
		
		list = mDao.selectList(con);
		
		close(con);
		
		return list;
		
	}
	
}












