package com.buyme.sic.review.model.service;

import static com.buyme.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.buyme.sic.review.model.dao.ReviewDao;
import com.buyme.sic.review.model.vo.Review;

public class ReviewService {
	ReviewDao rDao = new ReviewDao();

	public int insertReview(Review r) {
		Connection con = getConnection();

		int result = rDao.insertReview(con, r);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public ArrayList<Review> reviewList(String pno) {
		System.out.println("서비스들어옴");
		Connection con = getConnection();

		ArrayList<Review> rlist = rDao.reviewList(con, pno);

		close(con);

		return rlist;
	}

	public int updateReview(Review r) {
		Connection con = getConnection();
		
		int result = rDao.updateReview(con, r);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		System.out.println("Service : " + result);
		return result;
	}

	public int deleteReview(int rno) {
		Connection con = getConnection();
		
		int result = rDao.deleteReview(con, rno);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<Review> MyreviewList(String userid) {
		Connection con = getConnection();

		ArrayList<Review> rlist = rDao.MyreviewList(con, userid);

		close(con);

		return rlist;
	}
}
