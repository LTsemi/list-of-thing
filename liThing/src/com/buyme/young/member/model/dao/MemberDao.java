package com.buyme.young.member.model.dao;

import static com.buyme.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.buyme.young.member.exception.MemberException;
import com.buyme.young.member.model.vo.Member;

public class MemberDao {
	private Properties prop;
	
	public MemberDao(){
		prop = new Properties();
		
		String filePath = MemberDao.class.getResource("/config/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection con, Member m) throws MemberException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getGender());
			pstmt.setDate(5, m.getBirth());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getAddress());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			throw new MemberException(e.getMessage());
			// e.printStackTrace();
		
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public Member selectMember(Connection con, Member m) throws MemberException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member result = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getPassword());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Member();
				
				result.setUserId(rset.getString(1));
				result.setPassword(rset.getString(2));
				result.setUserName(rset.getString(3));
				
				result.setGender(rset.getString("GENDER"));
				result.setBirth(rset.getDate("birth"));
				result.setEmail(rset.getString("email"));
				result.setPhone(rset.getString("phone"));
				result.setAddress(rset.getString("address"));
				result.setEnrollDate(rset.getDate("ENROLLDATE"));
			}
			
		} catch (SQLException e) {
			
			// e.printStackTrace();
			throw new MemberException(e.getMessage());
			
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int updateMember(Connection con, Member m) throws MemberException {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getPassword());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getUserId());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
		
			//e.printStackTrace();
			throw new MemberException(e.getMessage());
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}
	
	public int deleteMember(Connection con, String userId){

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
		
			e.printStackTrace();

		} finally {
			
			close(pstmt);
			
		}

		return result;
	}
	
	public int idDupCheck(Connection con, String id) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("idDupCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) result = rset.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	public Member idCheck(Connection con, String name, String email) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member();
				
				m.setUserId(rset.getString(1));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public ArrayList<Member> selectList(Connection con) {
		// TODO Auto-generated method stub
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListMember");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Member>();
			
			while(rset.next()){
				Member m = new Member();
				
				m.setUserId(rset.getString(1));
				m.setUserName(rset.getString(3));
				m.setGender(rset.getString("GENDER"));
				m.setBirth(rset.getDate("birth"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setAddress(rset.getString("address"));
				m.setEnrollDate(rset.getDate("ENROLLDATE"));
				
				list.add(m);
			}
			
			System.out.println(list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public int selectChkMember(Connection con, String userid, String code) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateChkMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, code);
			pstmt.setString(2, userid);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();

			
		} finally {

			close(pstmt);
		}

		return result;
	}

	public Member selectPwMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member result = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getPassword());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Member();
				
				result.setUserId(rset.getString(1));
				result.setPassword(rset.getString(2));
				result.setUserName(rset.getString(3));
				
				result.setGender(rset.getString("GENDER"));
				result.setBirth(rset.getDate("birth"));
				result.setEmail(rset.getString("email"));
				result.setPhone(rset.getString("phone"));
				result.setAddress(rset.getString("address"));
				result.setEnrollDate(rset.getDate("ENROLLDATE"));
			}
			
		} catch (SQLException e) {
			
			 e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("result 멤버 : "  +result);
		return result;
	}
	
}
