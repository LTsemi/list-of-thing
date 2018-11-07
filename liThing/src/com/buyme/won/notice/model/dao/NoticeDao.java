package com.buyme.won.notice.model.dao;

import static com.buyme.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.buyme.won.notice.model.vo.Notice;

public class NoticeDao {
private Properties prop = null;

public NoticeDao(){
	prop = new Properties();
	
	String filePath = NoticeDao.class
			.getResource("/config/notice-query.properties").getPath();
	
	try {
	
		prop.load(new FileReader(filePath));
	
	} catch (IOException e) {

		e.printStackTrace();
	}
}

	
	
public ArrayList<Notice> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Notice>list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql= prop.getProperty("selectList");
		try {
			pstmt = con.prepareStatement(sql);
			
			//  1.물음표 :  마지막 행 번호
			//  2. 물음표 : 첫 행 번호
			
			int startRow = (currentPage -1)*limit +1; //1 -> 1, 2-> 11
			int endRow = startRow +limit -1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset= pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()){
				Notice n = new Notice();
				
				n.setNno(rset.getInt("NNO"));
				n.setNtitle(rset.getString("NTITLE"));
				n.setNcontent(rset.getString("NCONTENT"));
				n.setNwriter(rset.getString("NWRITER"));
				n.setNcount(rset.getInt("NCOUNT"));
				n.setNdate(rset.getDate("NDATE"));
				
				
				list.add(n);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
}
