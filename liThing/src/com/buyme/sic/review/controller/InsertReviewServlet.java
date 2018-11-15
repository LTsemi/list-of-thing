package com.buyme.sic.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyme.sic.review.model.service.ReviewService;
import com.buyme.sic.review.model.vo.Review;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet("/review.rv")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String content = request.getParameter("content");
		String pno =request.getParameter("pno");
		int rank = Integer.parseInt(request.getParameter("rank"));
		
		Review r = new Review();
		r.setUserid(userid);
		r.setRcontent(content);
		r.setPno(pno);
		r.setRrank(rank);
		
		System.out.println(r);
		
		ReviewService rs = new ReviewService();
		int result = rs.insertReview(r);
		
		if(result > 0) {
			response.sendRedirect("selectOne.po?pno="+pno);
		}else {
			System.out.println("댓글작성실패");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
